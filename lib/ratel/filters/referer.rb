# coding: UTF-8
module Ratel
  module Filter
    extend ActiveSupport::Concern

    SEARCH_QUERY_PARAM = {
      "google.com"   => 'q',
      "google.co.jp" => 'q',
      "bing.com"     => 'q',
      "yahoo.co.jp"  => 'p',
      "yahoo.com"    => 'p'
    }

    def self.included(base)
      define_method :store_referer do
        return unless request
        referer        = URI::parse(request.referer) if not request.referer.blank?
        referer_domain = referer.host                if referer and not request.host == referer.host
        referer_params = CGI::parse(referer.query)   if referer and not referer.query.blank?
        referer_query  = search_query referer_domain, referer_params

        key = :mkt
        return if cookies.signed[key]
        mkt = {}
        mkt[Ratel.config.ref_code]   = params[Ratel.config.ref_code] if params[Ratel.config.ref_code]
        mkt[Ratel.config.ref_domain] = referer_domain                if referer_domain
        mkt[Ratel.config.ref_query]  = referer_query                 if not referer_query.blank?
        return if mkt.empty?
        mkt[:srv_time] = Time.now.to_i
        cookies.signed[key] = {
          :value => ActiveSupport::JSON.encode(mkt),
          :expires => 60.days.from_now
        }
      end
    end

    def search_query domain, params
      return if not domain or (params||{}).empty?
      name = SEARCH_QUERY_PARAM[domain]
      ns = domain.split('.')
      unless name
        if ns.size >= 3
          key = ns[-3..-1].join('.')
          name = SEARCH_QUERY_PARAM[key]
        end
      end
      unless name
        if ns.size >= 2
          key = ns[-2..-1].join('.')
          name = SEARCH_QUERY_PARAM[key]
        end
      end
      normalize CGI::unescape(params[name].join(' ')) if params[name]
    end

    def normalize str, options = { alphabets: true, numbers: true, symbols: true, space: true }
      s = str.dup
      s = s.tr('Ａ-Ｚ', 'A-Z').tr('ａ-ｚ', 'a-z') if options[:alphabets]
      s = s.tr('０-９', '0-9') if options[:numbers]
      s = s.tr('！”＃＄％＆’＝＜＞＠，．／？', '!"#$%&\'=<>@,./?').gsub(/（）/, { '（'=>' (', '）'=>') ' }) if options[:symbols]
      s = s.gsub(/[\s　]+/, ' ') if options[:space]
      return s
    end

  end
end
