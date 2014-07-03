Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFDA665CD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 06:45:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s636jNoH017864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jul 2014 23:45:23 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 23:45:23 -0700
Message-ID: <53B4FC01.4060906@windriver.com>
Date: Thu, 3 Jul 2014 14:45:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1404294734.S.4360.22202.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gUmVnYXJkaW5nIHJwLXBwcG9lIHBhY2thZ2U_.RU.rfs209,
	rfs209, 241,
	539.f4-235-92.old.1404297506.17851@webmail.rediffmail.com>
In-Reply-To: <1404294734.S.4360.22202.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gUmVnYXJkaW5nIHJwLXBwcG9lIHBhY2thZ2U_.RU.rfs209,
	rfs209, 241,
	539.f4-235-92.old.1404297506.17851@webmail.rediffmail.com>
Subject: Re: [bitbake-devel] Regarding rp-pppoe package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 06:45:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I can't see the detailed errors from this log, maybe you should check the
log.do_configure or config.log.

// Robert

On 07/02/2014 06:38 PM, Himanshu Pandey wrote:
> Hi,
>
> Here is the log:
>
> | ## ----------------- ##
> | ## Output variables. ##
> | ## ----------------- ##
> |
> | ACLOCAL='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing
> --run aclocal-1.12'
> | AMTAR='$${TAR-tar}'
> | AUTOCONF='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing
> --run autoconf'
> | AUTOHEADER='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing
> --run autoheader'
> | AUTOMAKE='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing
> --run automake-1.12'
> | AWK='gawk'
> | CYGPATH_W='echo'
> | DEFS='-DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
> -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\"
> -DPACKAGE=\"rp-pppoe\" -DVERSION=\"3.8\"'
> | ECHO_C=''
> | ECHO_N='-n'
> | ECHO_T=''
> | INSTALL_DATA='${INSTALL} -m 644'
> | INSTALL_PROGRAM='${INSTALL}'
> | INSTALL_SCRIPT='${INSTALL}'
> | INSTALL_STRIP_PROGRAM='$(install_sh) -c -s'
> | LIBOBJS=''
> | LIBS=''
> | LTLIBOBJS=''
> | MAKEINFO='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/missing
> --run makeinfo'
> | MKDIR_P='/bin/mkdir -p'
> | PACKAGE='rp-pppoe'
> | PACKAGE_BUGREPORT=''
> | PACKAGE_NAME=''
> | PACKAGE_STRING=''
> | PACKAGE_TARNAME=''
> | PACKAGE_URL=''
> | PACKAGE_VERSION=''
> | PATH_SEPARATOR=':'
> | SET_MAKE=''
> | SHELL='/bin/sh'
> | STRIP='x86_64-poky-linux-strip'
> | VERSION='3.8'
> | am__isrc=''
> | am__leading_dot='.'
> | am__tar='$${TAR-tar} chof - "$$tardir"'
> | am__untar='$${TAR-tar} xf -'
> | bindir='/usr/bin'
> | build_alias='x86_64-linux'
> | datadir='/usr/share'
> | datarootdir='${prefix}/share'
> | docdir='${datarootdir}/doc/${PACKAGE}'
> | dvidir='${docdir}'
> | exec_prefix='/usr'
> | host_alias='x86_64-poky-linux'
> | htmldir='${docdir}'
> | includedir='/usr/include'
> | infodir='/usr/share/info'
> | install_sh='${SHELL}
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/rp-pppoe/3.8-r10/rp-pppoe-3.8/install-sh'
> | libdir='/usr/lib'
> | libexecdir='/usr/lib/rp-pppoe'
> | localedir='${datarootdir}/locale'
> | localstatedir='/var'
> | mandir='/usr/share/man'
> | mkdir_p='$(MKDIR_P)'
> | oldincludedir='/usr/include'
> | pdfdir='${docdir}'
> | prefix='/usr'
> | program_transform_name='s,x,x,'
> | psdir='${docdir}'
> | sbindir='/usr/sbin'
> | sharedstatedir='/com'
> | subdirs=' src'
> | sysconfdir='/etc'
> | target_alias='x86_64-poky-linux'
> |
> | configure: exit 1
> | ERROR: oe_runconf failed
>
> Thanks in Advance.
>
> Regards,
> Himanshu
>
>
> From: Robert Yang <liezhi.yang@windriver.com>
> Sent: Wed, 02 Jul 2014 15:22:14
> To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
> "openembedded-devel@lists.openembedded.org"
> <openembedded-devel@lists.openembedded.org>
> Subject: Re: [bitbake-devel] Regarding rp-pppoe package
>
>
> On 07/02/2014 05:49 PM, Himanshu Pandey wrote:
>  > Hi,
>  >
>  > I am getting following error when I tried to add and compile rp-pppoe pacakage:
>  >
>
> Please add the full error log, thanks.
>
> Btw, I will go to have dinner now, may reply tomorrow.
>
> // Robert
>
>  > ERROR: oe_runconf failed
>  >
>  > Please help.
>  >
>  > Regards,
>  > Himanshu
>  >
>  >
>  >
>  >
>  > From: Robert Yang <liezhi.yang@windriver.com>
>  > Sent: Wed, 02 Jul 2014 13:16:17
>  > To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
>  > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
>  > Subject: Re: [bitbake-devel] Regarding Net-Snmp package
>  >
>  > I think that this email should go into oe-devel (see the cc) since
>  > the net-snmp is from the meta-networking layer, please see:
>  >
>  > meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
>  >
>  > PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static
> ${PN}-libs \
>  >              ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd
>  > ${PN}-server-snmptrapd"
>  >
>  > There is no net-snmp in the PACKAGES, I think that you need use
>  > net-snmp-client or net-snmp-server.
>  >
>  > // Robert
>  >
>  >
>  >
>  >
>  > On 07/02/2014 03:36 PM, Himanshu Pandey wrote:
>  >  > Hi,
>  >  >
>  >  > I am getting following errors:
>  >  >
>  >  > Error: net-snmp not found in the base feeds (genericx86_64 x86_64 noarch any
>  > all).
>  >  >
>  >  > sed: can't read
>  >  >
>  >
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/5.7.2-r1/image/usr/bin/net-snmp-config:
>  >  > No such file or directory
>  >  >
>  >  > Please help.
>  >  >
>  >  > Regards,
>  >  > Himanshu
>  >  >
>  >  >
>  >  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  >  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
>  > email.
>  >  >    *Know More >*
>  >  >
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >  >
>  >  >
>  >  >
>  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
> email.
>  >    *Know More >*
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>

