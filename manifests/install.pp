class megaraid_sm::install {
# Installing : sas_snmp-12.05-0200.x86_64                                   3/6 
#Non-fatal POSTIN scriptlet failure in rpm package sas_snmp-12.05-0200.x86_64
#Can not find snmptrap in /usr/bin
#Can not continue installation of LSI SAS Agent
#Please install the net-snmp agent
#warning: %post(sas_snmp-12.05-0200.x86_64) scriptlet failed, exit status 1
# Installing : MegaCli-8.04.07-1.noarch                                     4/6 
# Installing : sas_ir_snmp-12.05-0201.x86_64                                5/6 
#Non-fatal POSTIN scriptlet failure in rpm package sas_ir_snmp-12.05-0201.x86_64
#Can not find snmptrap in /usr/bin
#Can not continue installation of LSI SAS-IR Agent
#Please install the net-snmp agent
#warning: %post(sas_ir_snmp-12.05-0201.x86_64) scriptlet failed, exit status 1

  package { 'net-snmp-utils':
    ensure  => present,
  }

  package { [
    'Lib_Utils',
    'Lib_Utils2',
    'MegaCli',
    'MegaRAID_Storage_Manager',
    'sas_ir_snmp',
    'sas_snmp'
  ]:
    ensure  => present,
    require => Package['net-snmp-utils'],
  }
}
