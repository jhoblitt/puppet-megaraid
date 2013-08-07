require 'spec_helper'

describe 'megaraid' do
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
      should include_class('megaraid')
      should include_class('megaraid::msm')
      should include_class('megaraid::megacli')
      should include_class('megaraid::lsiget')
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
        should include_class('megaraid') 
      }.to raise_error(Puppet::Error, /^Module megaraid is not supported on armv7/)
    end
  end

  context 'Debian' do
    let(:title) { 'Debian' }
    let(:facts) { { :osfamily=> 'Debian', :operatingsystem => 'Debian' } }

    it do
      expect {
        should include_class('megaraid') 
      }.to raise_error(Puppet::Error, /^Module megaraid is not supported on Debian/)
    end
  end
end
