require 'spec_helper'

describe 'snd' do
  let(:title) { 'snd' }

  context 'with default values for all parameters' do
  	it { is_expected.to compile }
		it { is_expected.to compile.with_all_deps }
    it { should contain_class('snd') }
  end

	context 'with wrong variable type' do
		let(:params) { {
		  :search_items => 'some string',	
    } }
    it { should compile.and_raise_error(/expects a Hash value, got String/) }
	end

  context 'with valid param' do
    let(:params) {
      {
        'search_items' => {
				  '/tmp/foo' => {
					  'search_str'   => '^then_im_sorry$',
            'display_only' => true
          }
        }
      }
    }
  	  it { is_expected.to compile }
		  it { is_expected.to compile.with_all_deps }
  end
end
