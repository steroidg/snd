require 'spec_helper'
describe 'snd' do
  context 'with default values for all parameters' do
    it { should contain_class('snd') }
  end
end
