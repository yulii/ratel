# coding: UTF-8
require 'spec_helper'

include Ratel::ActionViewExtension
describe Ratel::ActionViewExtension do

  before do
    visit "/"
    puts page.html
  end

  subject { page }
  it { should have_content "TEST" }
end
