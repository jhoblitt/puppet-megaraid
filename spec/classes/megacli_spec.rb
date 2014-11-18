require 'spec_helper'

describe 'megaraid::megacli' do
  context 'RedHat x86_64' do
    let(:facts) do
      {
        :osfamily             => 'RedHat',
        :lsbmajordistrelease  => 6,
        :architecture         => 'x86_64',
      }  
    end
    it do
      should contain_class('megaraid::megacli')
      should contain_package('MegaCli').with_ensure('present')
      should contain_exec('alternatives --install /usr/bin/MegaCli MegaCli /opt/MegaRAID/MegaCli/MegaCli64 1')
      should contain_exec('alternatives --set MegaCli /opt/MegaRAID/MegaCli/MegaCli64')
    end
  end

  context 'RedHat i386' do
    let(:facts) do
      {
        :osfamily             => 'RedHat',
        :lsbmajordistrelease  => 6,
        :architecture         => 'i386',
      }  
    end
    it do
      should contain_class('megaraid::megacli')
      should contain_package('MegaCli').with_ensure('present')
      should contain_exec('alternatives --install /usr/bin/MegaCli MegaCli /opt/MegaRAID/MegaCli/MegaCli 1')
      should contain_exec('alternatives --set MegaCli /opt/MegaRAID/MegaCli/MegaCli')
    end
  end

  context 'RedHat armv7' do
    let(:facts) do
      {
        :osfamily             => 'RedHat',
        :lsbmajordistrelease  => 6,
        :architecture         => 'armv7',
      }  
    end

    it do
      expect {
        should contain_class('megaraid::megacli')
      }.to raise_error(Puppet::Error, /^Module megaraid is not supported on armv7/)
    end
  end

  context 'Debian' do
    let(:title) { 'Debian' }
    let(:facts) { { :osfamily=> 'Debian', :operatingsystem => 'Debian' } }

    it do
      expect {
        should contain_class('megaraid::megalci')
      }.to raise_error(Puppet::Error, /^Module megaraid is not supported on Debian/)
    end
  end
end
