require 'spec_helper'

describe 'megaraid_sm::lsiget' do
  let(:title) { 'redhat' }
  let(:facts) { { :osfamily=> 'RedHat', :lsbmajordistrelease => 6 } }

  it do
    should include_class('wget')
    should include_class('megaraid_sm::lsiget')
    should contain_file('/opt/lsi').with({
      'ensure' => 'directory',
    })
    should contain_wget__fetch('lsigetlinux_062012.tgz')
    should contain_exec('tar -xf lsigetlinux_062012.tgz').with({
      'cwd' => '/opt/lsi',
    })
  end 

end
