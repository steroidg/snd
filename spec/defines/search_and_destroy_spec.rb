require 'spec_helper'

describe 'snd::search_and_destroy' do
  let(:title) { 'snd::search_and_destroy' }

  context 'with no param' do
    it { should compile.and_raise_error(/expects a value for parameter 'search_str'/) }
  end

  context 'with invalid display_only param' do
    let(:params) {
      {
        'search_str'   => '^then_im_sorry$',
        'file_name'    => '/tmp/foo',
        'display_only' => 'true'
      }
    }
    it { should compile.and_raise_error(/parameter 'display_only' expects a Boolean value/) }
  end

  context 'with invalid search_str param' do
    let(:params) {
      {
        'search_str'   => ['foo', 'bar'],
        'file_name'    => '/tmp/foo',
        'display_only' => true
      }
    }
    it { should compile.and_raise_error(/parameter 'search_str' expects a String value/) }
  end

  context 'with invalid file_name param' do
    let(:params) {
      {
        'search_str'   => '^then_im_sorry$',
        'file_name'    => ['/tmp', '/foo'],
        'display_only' => true
      }
    }
    it { should compile.and_raise_error(/parameter 'file_name' expects a String value/) }
  end

  context 'with valid param for display' do
    let(:params) {
      {
        'search_str'   => '^then_im_sorry$',
        'file_name'    => '/tmp/foo',
        'display_only' => true
      }
    }

    it {
      is_expected.to contain_exec('snd /tmp/foo').with({
        'command' => 'echo /tmp/foo',
        'path'    => '/bin:/sbin:/usr/bin:/usr/sbin',
        'onlyif'  => '[ -s /tmp/foo ] && grep "^then_im_sorry$" /tmp/foo'
      })
    }
  end

  context 'with valid param for delete' do
    let(:params) {
      {
        'search_str'   => '^then_im_sorry$',
        'file_name'    => '/tmp/foo',
        'display_only' => false
      }
    }

    it {
      is_expected.to contain_exec('snd /tmp/foo').with({
        'command' => 'rm /tmp/foo',
        'path'    => '/bin:/sbin:/usr/bin:/usr/sbin',
        'onlyif'  => '[ -s /tmp/foo ] && grep "^then_im_sorry$" /tmp/foo'
      })
    }
  end

end
