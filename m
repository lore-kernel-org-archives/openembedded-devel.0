Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>)
	id 1UASvq-0004d1-8Y; Tue, 26 Feb 2013 23:23:39 +0100
Received: from mail86-am1-R.bigfish.com (10.3.201.240) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 21:37:04 +0000
Received: from mail86-am1 (localhost [127.0.0.1])	by mail86-am1-R.bigfish.com
	(Postfix) with ESMTP id BB3D3402B1;
	Tue, 26 Feb 2013 21:37:04 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch177df4h17326ah8275dh8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail86-am1 (localhost.localdomain [127.0.0.1]) by mail86-am1
	(MessageSwitch) id 1361914623458619_5312;
	Tue, 26 Feb 2013 21:37:03 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.230])	by
	mail86-am1.bigfish.com (Postfix) with ESMTP id 632D448008D;
	Tue, 26 Feb 2013 21:37:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 21:36:59 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.221]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Tue, 26 Feb 2013 21:36:48 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-commits] Matthew McClintock : libpfm4_4.3.0.bb: add
	libpfm4 recipe needed by oprofile for ppc
Thread-Index: AQHOBMInBLxZ3T/8w0uVgcP3CsaQB5humF0AgBx2YQCAAbpxgA==
Date: Tue, 26 Feb 2013 21:36:47 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A891815@039-SN1MPN1-001.039d.mgd.msft.net>
References: <20130206093803.C4B3920AB@opal> <20130206212207.GD3271@jama>
	<70CC66F5C30A414DADDA6973E4CA391A86ECAB@039-SN1MPN1-002.039d.mgd.msft.net>
	<20130225191302.GB3239@jama>
In-Reply-To: <20130225191302.GB3239@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
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
X-List-Received-Date: Tue, 26 Feb 2013 22:23:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <52A6A8D530C22A4691B25B609E8AA6D2@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 25, 2013 at 1:13 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Feb 07, 2013 at 04:34:27PM +0000, McClintock Matthew-B29882 wrote=
:
>> On Wed, Feb 6, 2013 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Wed, Feb 06, 2013 at 09:38:03AM +0000, git@git.openembedded.org wro=
te:
>> >> Module: openembedded-core.git
>> >> Branch: master
>> >> Commit: 52c94978992d9084d685d4999064a8cee35220d1
>> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D52c94978992d9084d685d4999064a8cee35220d1
>> >>
>> >> Author: Matthew McClintock <msm@freescale.com>
>> >> Date:   Tue Feb  5 11:46:46 2013 -0600
>> >>
>> >> libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
>> >
>> > This is pulled to world build on arm too and fails there:
>> >
>>
>> I'll take a look at this next week once I'm back in the office.
>
> Any update on this one?

Was waiting on another upstream fix from oprofile which has just been
sent to me, I will fix both at the same time soon.

-M

>
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork =
  --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroo=
ts/qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -W=
extra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/i=
nclude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -We=
xtra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/li=
b/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I=
. -DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_=
nhm.c
>> > | pfmlib_amd64.c: In function 'pfm_amd64_detect':
>> > | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
>> > | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
>> > | pfmlib_intel_x86.c: In function 'pfm_intel_x86_detect':
>> > | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
>> > | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
>> > | pfmlib_intel_x86_arch.c: In function 'pfm_intel_x86_arch_init':
>> > | pfmlib_intel_x86_arch.c:55:3: error: impossible constraint in 'asm'
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork =
  --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroo=
ts/qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -W=
extra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/i=
nclude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -We=
xtra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/li=
b/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I=
. -DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_=
wsm.c
>> > | make[1]: *** [pfmlib_intel_x86_arch.o] Error 1
>> > | make[1]: *** Waiting for unfinished jobs....
>> > | make[1]: *** [pfmlib_amd64.o] Error 1
>> > | make[1]: *** [pfmlib_intel_x86.o] Error 1
>> >
>> >> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> >>
>> >> ---
>> >>
>> >>  meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |   26 +++++++++++++++++=
+++++++++
>> >>  1 files changed, 26 insertions(+), 0 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recip=
es-kernel/libpfm/libpfm4_4.3.0.bb
>> >> new file mode 100644
>> >> index 0000000..460029f
>> >> --- /dev/null
>> >> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
>> >> @@ -0,0 +1,26 @@
>> >> +SUMMARY =3D "Monitoring tools exploiting the performance monitoring =
events"
>> >> +DESCRIPTION =3D "This package provides a library, called libpfm4 whi=
ch is used to develop \
>> >> +monitoring tools exploiting the performance monitoring events such a=
s those \
>> >> +provided by the Performance Monitoring Unit (PMU) of modern processo=
rs."
>> >> +HOMEPAGE =3D "http://perfmon2.sourceforge.net/"
>> >> +BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D144822&at=
id=3D759953&source=3Dnavbar"
>> >> +
>> >> +LICENSE =3D "MIT"
>> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de488f3bd4424e308e2e399c=
b99c788"
>> >> +
>> >> +SECTION =3D "devel"
>> >> +
>> >> +SRC_URI =3D "http://downloads.sourceforge.net/project/perfmon2/libpf=
m4/libpfm-4.3.0.tar.gz"
>> >> +
>> >> +SRC_URI[md5sum] =3D "0ab272dbdbb759b852ba8bd06db030ef"
>> >> +SRC_URI[sha256sum] =3D "a23eb9affbff279e13563a39317c0ad71c4de28908d4=
243c8bc109138430cc3b"
>> >> +
>> >> +EXTRA_OEMAKE =3D "DESTDIR=3D\"${D}\" PREFIX=3D\"${prefix}\" LIBDIR=
=3D\"${libdir}\" LDCONFIG=3D\"true\""
>> >> +EXTRA_OEMAKE_append_powerpc =3D " ARCH=3D\"powerpc\""
>> >> +EXTRA_OEMAKE_append_powerpc64 =3D " ARCH=3D\"powerpc\" BITMODE=3D\"6=
4\""
>> >> +
>> >> +S =3D "${WORKDIR}/libpfm-${PV}"
>> >> +
>> >> +do_install () {
>> >> +     oe_runmake install
>> >> +}
>> >>
>> >>
>> >> _______________________________________________
>> >> Openembedded-commits mailing list
>> >> Openembedded-commits@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-comm=
its
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=



