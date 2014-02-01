# Fact:
#   has_megaraid
#
# Purpose:
#   Return true if a known LSI MegaRAID controller is found in the system.
#
# Resolution:
#   On physical hosts with the lspci binary, parse the output for known MegaRAID
#   strings.
#
Facter.add("has_megaraid") do
  confine :kernel => :linux
  confine :is_virtual => "false"

  setcode do
    haslspci = Facter::Util::Resolution.exec('which lspci')
    if haslspci.nil?
      # no lspci on this system
    else
      output = Facter::Util::Resolution.exec("#{haslspci}")
      if output.match(/MegaRAID SAS 1078|MegaSAS 9260|MegaRAID SAS 9240|MegaRAID SAS 2208|MegaRAID SAS 2008/) then
        true
      else
        false
      end
    end
  end
end
