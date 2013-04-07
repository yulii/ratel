# coding: UTF-8
require 'spec_helper'

# auto-define class
describe Ratel::Initializer do

  before do
    Ratel.configure do |config|
      config.tracking = tracking
    end
  end

  context "implemented tracking system" do
    let(:tracking) { :google_analytics }
    before { Ratel::Initializer.execute }

    it "expects to be called `push` method" do
      expect(Ratel::Tracking::Event.methods.include? :push).to be_true
    end
  end

  context "NOT implemented tracking system" do
    let(:tracking) { :unknown }

    it "expects to raise NotImplementedError" do
      expect { Ratel::Initializer.execute }.to raise_error NotImplementedError
    end
  end
end
