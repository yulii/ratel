# coding: UTF-8
require 'spec_helper'

describe Ratel::Tracking::GoogleAnalytics do

  let(:object) do
    Class.new do
      extend Ratel::Tracking::GoogleAnalytics
    end
  end

  describe "conversion's method `push`" do
    it "expects to be called" do
      expect(object.methods.include? :push).to be_true
    end

    context "call `push` method" do
      let(:result) { object.push category: "A/B Testing", action: "click", label: "button" }

      it "expects to return same results" do
        expect(object.push "A/B Testing", :click, :button).to eq(result) 
      end
    end
  end

end
