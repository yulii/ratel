# coding: UTF-8
require 'spec_helper'

describe Ratel::Tracking::Event do

  before do
    Ratel.configure do |config|
      config.tracking = tracking
    end
  end

  context "implemented tracking system" do
    let(:tracking) { :google_analytics }

    it "expects to be called `_push` method" do
      expect { Ratel::Tracking::Event.methods.include?(:_push) }.to be_true
    end
  end

  context "NOT implemented tracking system" do
    let(:tracking) { :unknown }

    it "expects to raise NotImplementedError" do
      expect { Ratel::Tracking::Event.push :category, :action, :label }.to raise_error(NotImplementedError)
    end
  end
end
