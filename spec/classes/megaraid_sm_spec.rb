require 'spec_helper'

describe 'megaraid_sm' do
  let(:facts) do
    {
      :osfamily             => 'RedHat',
      :lsbmajordistrelease  => 6,
      :architecture         => 'x86_64',
    }  
  end

  context 'RedHat x86_64' do
    let(:title) { 'redhat' }
    it do
      should include_class('megaraid_sm')
      should include_class('megaraid_sm::install')
      should include_class('megaraid_sm::service')
      should contain_package('MegaRAID_Storage_Manager').with_ensure('present')
      should contain_package('MegaCli').with_ensure('present')
      should contain_service('vivaldiframeworkd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
      should contain_exec('alternatives --install /usr/bin/MegaCli MegaCli /opt/MegaRAID/MegaCli/MegaCli64 1')
      should contain_exec('alternatives --set MegaCli /opt/MegaRAID/MegaCli/MegaCli64')
    end
  end

  context 'RedHat armv7' do
    let(:title) { 'redhat' }
    let(:facts) do
      {
        :osfamily             => 'RedHat',
        :lsbmajordistrelease  => 6,
        :architecture         => 'armv7',
      }  
    end

    it do
      expect {
        should include_class('megaraid_sm') 
      }.to raise_error(Puppet::Error, /^Module megaraid_sm is not supported on armv7/)
    end
  end

  context 'Debian' do
    let(:title) { 'Debian' }
    let(:facts) { { :osfamily=> 'Debian', :operatingsystem => 'Debian' } }

    it do
      expect {
        should include_class('megaraid_sm') 
      }.to raise_error(Puppet::Error, /^Module megaraid_sm is not supported on Debian/)
    end
  end
end
