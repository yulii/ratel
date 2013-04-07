# coding: UTF-8
require 'spec_helper'

describe Ratel::ActionViewExtension do

  before do
    Ratel.configure do |config|
      config.tracking = tracking
    end
    Ratel::Initializer.execute
  end

  let(:tracking) { :google_analytics }

  before do
    visit "/index"
  end

  subject { page }
  it { should have_content "TEST" }
end
