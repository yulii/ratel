# coding: UTF-8
require 'spec_helper'

describe Ratel::Tracking::GoogleAnalytics do

  let(:object) do
    Class.new do
      include Ratel::Tracking::GoogleAnalytics
    end
  end

  describe "conversion's method `_push`" do
    it "should be called" do
      expect { object.methods.include?(:_push) }.to be_true
    end
  end

end
