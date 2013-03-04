require 'spec_helper'

describe 'megaraid_sm' do
  let(:title) { 'redhat' }
  let(:facts) { { :osfamily=> 'RedHat', :lsbmajordistrelease => 6 } }

  it { should include_class('megaraid_sm') }
  it { should include_class('megaraid_sm::install') }
  it { should include_class('megaraid_sm::service') }
  it { should contain_package('MegaRAID_Storage_Manager').with_ensure('present') }
  it { should contain_package('MegaCli').with_ensure('present') }

  it do should contain_service('vivaldiframeworkd').with(
    'ensure' => 'running',
    'enable' => 'true'
  ) end
end

describe 'megaraid_sm' do
  let(:title) { 'Debian' }
  let(:facts) { { :osfamily=> 'Debian' } }

  it do
    expect {
      should include_class('megaraid_sm') 
    }.to raise_error(Puppet::Error, /^Module megaraid_sm is not supported/)
  end
end
