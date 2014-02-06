require 'spec_helper'

describe 'has_megaraid', :type => :fact do
  before(:each) { Facter.clear }

  context 'on linux' do
    context 'on physical hardware' do
      context 'lspci not in path' do
        it do
          Facter.fact(:kernel).stubs(:value).returns('Linux')
          Facter.fact(:is_virtual).stubs(:value).returns(false)
          Facter::Util::Resolution.stubs(:exec).with('which lspci').returns(nil)

          Facter.fact(:has_megaraid).value.should be_nil
        end
      end

      context 'output does not match' do
        it do
          Facter.fact(:kernel).stubs(:value).returns('Linux')
          Facter.fact(:is_virtual).stubs(:value).returns(false)
          Facter::Util::Resolution.stubs(:exec).with('which lspci').
            returns('/usr/sbin/lspci')
          Facter::Util::Resolution.stubs(:exec).with('/usr/sbin/lspci').
            returns(File.read(fixtures('facts', 'lspci_no_match')))

          Facter.fact(:has_megaraid).value.should be_false
        end
      end

      context 'output does match' do
        it do
          Facter.fact(:kernel).stubs(:value).returns('Linux')
          Facter.fact(:is_virtual).stubs(:value).returns(false)
          Facter::Util::Resolution.stubs(:exec).with('which lspci').
            returns('/sbin/lspci')
          Facter::Util::Resolution.stubs(:exec).with('/sbin/lspci').
            returns(File.read(fixtures('facts', 'lspci_match')))

          Facter.fact(:has_megaraid).value.should be_true
        end
      end
    end

    context 'on virtual hardware' do
      it do
        Facter.fact(:kernel).stubs(:value).returns('Linux')
        Facter.fact(:is_virtual).stubs(:value).returns(true)

        Facter.fact(:has_megaraid).value.should be_nil
      end
    end

  end # on linux

  context 'not on linux' do
    it do
      Facter.fact(:kernel).stubs(:value).returns('Solaris')

      Facter.fact(:has_megaraid).value.should be_nil
    end
  end # not on linux

end
