Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>)
	id 1U3YuC-0006sg-R8; Thu, 07 Feb 2013 22:21:42 +0100
Received: from mail137-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Thu, 7 Feb 2013 16:34:32 +0000
Received: from mail137-ch1 (localhost [127.0.0.1])	by
	mail137-ch1-R.bigfish.com (Postfix) with ESMTP id 4ECC54002E2;
	Thu,  7 Feb 2013 16:34:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch177df4h17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail137-ch1 (localhost.localdomain [127.0.0.1]) by mail137-ch1
	(MessageSwitch) id 1360254869606581_7522;
	Thu,  7 Feb 2013 16:34:29 +0000 (UTC)
Received: from CH1EHSMHS037.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail137-ch1.bigfish.com (Postfix) with ESMTP id
	7CE8C4A0068;	Thu,  7 Feb 2013 16:34:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS037.bigfish.com
	(10.43.69.246) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 7 Feb 2013 16:34:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Thu, 7 Feb 2013 16:34:27 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe-commits] Matthew McClintock : libpfm4_4.3.0.bb: add
	libpfm4 recipe needed by oprofile for ppc
Thread-Index: AQHOBMInBLxZ3T/8w0uVgcP3CsaQB5humF0A
Date: Thu, 7 Feb 2013 16:34:27 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A86ECAB@039-SN1MPN1-002.039d.mgd.msft.net>
References: <20130206093803.C4B3920AB@opal> <20130206212207.GD3271@jama>
In-Reply-To: <20130206212207.GD3271@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Matthew McClintock : libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 21:24:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <00D9BBAAD41E2C4393C60579E408A80C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Feb 06, 2013 at 09:38:03AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 52c94978992d9084d685d4999064a8cee35220d1
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommi=
t;h=3D52c94978992d9084d685d4999064a8cee35220d1
>>
>> Author: Matthew McClintock <msm@freescale.com>
>> Date:   Tue Feb  5 11:46:46 2013 -0600
>>
>> libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
>
> This is pulled to world build on arm too and fails there:
>

I'll take a look at this next week once I'm back in the office.

-M

> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -Wext=
ra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/incl=
ude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wextr=
a -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib/.=
./include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I. -=
DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_nhm=
.c
> | pfmlib_amd64.c: In function 'pfm_amd64_detect':
> | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
> | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
> | pfmlib_intel_x86.c: In function 'pfm_intel_x86_detect':
> | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
> | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
> | pfmlib_intel_x86_arch.c: In function 'pfm_intel_x86_arch_init':
> | pfmlib_intel_x86_arch.c:55:3: error: impossible constraint in 'asm'
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -Wext=
ra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/incl=
ude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wextr=
a -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib/.=
./include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I. -=
DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_wsm=
.c
> | make[1]: *** [pfmlib_intel_x86_arch.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: *** [pfmlib_amd64.o] Error 1
> | make[1]: *** [pfmlib_intel_x86.o] Error 1
>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>  meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |   26 ++++++++++++++++++++=
++++++
>>  1 files changed, 26 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-=
kernel/libpfm/libpfm4_4.3.0.bb
>> new file mode 100644
>> index 0000000..460029f
>> --- /dev/null
>> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY =3D "Monitoring tools exploiting the performance monitoring eve=
nts"
>> +DESCRIPTION =3D "This package provides a library, called libpfm4 which =
is used to develop \
>> +monitoring tools exploiting the performance monitoring events such as t=
hose \
>> +provided by the Performance Monitoring Unit (PMU) of modern processors.=
"
>> +HOMEPAGE =3D "http://perfmon2.sourceforge.net/"
>> +BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D144822&atid=
=3D759953&source=3Dnavbar"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de488f3bd4424e308e2e399cb99=
c788"
>> +
>> +SECTION =3D "devel"
>> +
>> +SRC_URI =3D "http://downloads.sourceforge.net/project/perfmon2/libpfm4/=
libpfm-4.3.0.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "0ab272dbdbb759b852ba8bd06db030ef"
>> +SRC_URI[sha256sum] =3D "a23eb9affbff279e13563a39317c0ad71c4de28908d4243=
c8bc109138430cc3b"
>> +
>> +EXTRA_OEMAKE =3D "DESTDIR=3D\"${D}\" PREFIX=3D\"${prefix}\" LIBDIR=3D\"=
${libdir}\" LDCONFIG=3D\"true\""
>> +EXTRA_OEMAKE_append_powerpc =3D " ARCH=3D\"powerpc\""
>> +EXTRA_OEMAKE_append_powerpc64 =3D " ARCH=3D\"powerpc\" BITMODE=3D\"64\"=
"
>> +
>> +S =3D "${WORKDIR}/libpfm-${PV}"
>> +
>> +do_install () {
>> +     oe_runmake install
>> +}
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=



