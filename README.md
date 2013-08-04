Puppet megaraid Module
=========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-megaraid.png)](https://travis-ci.org/jhoblitt/puppet-megaraid)

Description
-----------

Installs the LSI MegaRAID Storage Manager and MegaCLI RAID controller
management software.

It has been tested on:

 - el6.x

This module is intended to directly install the RPMs LSI packages up with their
own Linux installer, without using the provided install scripts.  It is assumed
that these RPMs have been extracted and made available as a Yum repo.


Obtaining the RPMs
------------------

The Storage Manager and CLI packages are provided via the [LSI](http://www.lsi.com/) website.


Here is a guided example starting at the [9285-8e](http://www.lsi.com/products/storagecomponents/Pages/MegaRAIDSAS9285-8e.aspx) product page.

  * click on the SUPPORT & DOWNLOADS tab
  * expand the MANAGEMENT SOFTWARE AND TOOLS section
  * download [MegaRAID Storage Manager - Linux 64 bit - 5.4](http://www.lsi.com/downloads/Public/MegaRAID%20Common%20Files/12.08.03.03_Linux_x64_MSM.tar.gz)
  * download [MegaCLI - 5.3 ](http://www.lsi.com/downloads/Public/MegaRAID%20Common%20Files/8.04.07_MegaCLI.zip)

Note that both of those direct links redirect to a page that requires you to
accept an EULA.

    $ tar -xf 12.08.03.03_Linux_x64_MSM.tar.gz 
    $ ls
    12.08.03.03_Linux_x64_MSM.tar.gz  disk
    $ cd disk
    $ ls *.rpm
    Lib_Utils-1.00-09.noarch.rpm
    Lib_Utils2-1.00-04.noarch.rpm
    MegaRAID_Storage_Manager-12.08.03-03.noarch.rpm
    sas_ir_snmp-12.08-0303.x86_64.rpm
    sas_snmp-12.08-0303.x86_64.rpm

    $ unzip 8.04.07_MegaCLI.zip 
    Archive:  8.04.07_MegaCLI.zip
     extracting: Win_CliKL_8.04.07.zip   
      inflating: 8.04.07_MegaCLI.txt     
     extracting: CLI_DOS_8.04.07.zip     
     extracting: CLI_FreeBSD_8.04.07.zip  
     extracting: CLI_Lin_8.04.07.zip     
     extracting: CLI_Solaris_8.04.07.zip  
     extracting: CLI_VMWare_8.04.07.zip  
     extracting: CLI_VMWare_MN_8.04.07.zip  
     extracting: CLI_Win_8.04.07.zip     
     extracting: Lin_CliKL_8.04.07.zip   
    $ unzip CLI_Lin_8.04.07.zip
    Archive:  CLI_Lin_8.04.07.zip
     extracting: MegaCliLin.zip          
      inflating: readme.txt              
    $ unzip MegaCliLin.zip 
    Archive:  MegaCliLin.zip
      inflating: Lib_Utils-1.00-09.noarch.rpm  
      inflating: MegaCli-8.04.07-1.noarch.rpm  
    $ ls *.rpm
    Lib_Utils-1.00-09.noarch.rpm  MegaCli-8.04.07-1.noarch.rpm

All of those RPMs should be copied into a repo and that yum is configured to
install from.  Here is an example [Yum repo
skeleton](https://github.com/jhoblitt/yum-repo-skel) on github.

Examples
--------

    class{ 'megaraid: }


Support
-------

Please log tickets and issues at [github](https://github.com/jhoblitt/puppet-megaraid/issues)


Copyright
---------

Copyright (C) 2012-2013 Joshua Hoblitt <jhoblitt@cpan.org>

