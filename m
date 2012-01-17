Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RmzZQ-0003I4-Uq
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 04:18:49 +0100
Received: from mail130-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 17 Jan 2012 03:11:07 +0000
Received: from mail130-tx2 (localhost [127.0.0.1])	by
	mail130-tx2-R.bigfish.com (Postfix) with ESMTP id 733D9440146	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2012 03:11:08 +0000 (UTC)
X-SpamScore: -38
X-BigFish: VS-38(z98bRz154cP9371I1803M936eK146fK542M1432Nzz1202hzz8275fh8275bh8275dhz2dhc1ahc1bh2a8h668h839h8e2h8e3h944hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail130-tx2 (localhost.localdomain [127.0.0.1]) by mail130-tx2
	(MessageSwitch) id 1326769867877664_8201;
	Tue, 17 Jan 2012 03:11:07 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.236])	by
	mail130-tx2.bigfish.com (Postfix) with ESMTP id C5E986E01D7	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2012 03:11:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 17 Jan 2012 03:11:03 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Mon, 16 Jan 2012 21:11:07 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v2 meta-oe] netperf: add version 2.4.4
Thread-Index: AQHMxTqFkGWIj6thEEWkdUUpvTvbFpYO2XyggACCngCAAKQcIA==
Date: Tue, 17 Jan 2012 03:11:07 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010CE52C@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325061063-26942-1-git-send-email-b19537@freescale.com>
	<CA452391058F6D4E9715FB2C29D9312A010CE056@039-SN2MPN1-023.039d.mgd.msft.net>
	<jf117m$jek$1@dough.gmane.org>
In-Reply-To: <jf117m$jek$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.239]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 meta-oe] netperf: add version 2.4.4
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
X-List-Received-Date: Tue, 17 Jan 2012 03:18:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Koen,

May I know what's the issue of this patch? I can apply the patch in HEAD of=
 meta-oe tree successfully.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Monday, January 16, 2012 7:21 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH v2 meta-oe] netperf: add version 2.4.4
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-01-12 10:34, Luo Zhenhua-B19537 schreef:
> > Hello,
> >
> > Any comment on it?
>=20
> No, please rebase and resend
>=20
> >
> >
> > Best Regards,
> >
> > Zhenhua
> >
> >
> >> -----Original Message----- From: Luo Zhenhua-B19537 Sent: Wednesday,
> >> December 28, 2011 4:31 PM To:
> >> openembedded-devel@lists.openembedded.org Cc: Luo Zhenhua-B19537
> >> Subject: [PATCH v2 meta-oe] netperf: add version 2.4.4
> >>
> >> From: Zhenhua Luo <b19537@freescale.com>
> >>
> >> Signed-off-by: Zhenhua Luo <b19537@freescale.com> ---
> >> .../recipes-benchmark/netperf/files/cpu_set.patch  |   24 +++++++++
> >> meta-oe/recipes-benchmark/netperf/files/init       |   51
> >> ++++++++++++++++++++ .../recipes-benchmark/netperf/files/vfork.patch
> >> |   26 ++++++++++ meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
> >> | |
> >> 46 ++++++++++++++++++ 4 files changed, 147 insertions(+), 0
> >> deletions(-)  create mode 100644 meta-
> >> oe/recipes-benchmark/netperf/files/cpu_set.patch create mode 100644
> >> meta-oe/recipes-benchmark/netperf/files/init create mode 100644
> >> meta-oe/recipes-benchmark/netperf/files/vfork.patch create mode
> >> 100644 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
> >>
> >> diff --git a/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
> >> b/meta- oe/recipes-benchmark/netperf/files/cpu_set.patch new file
> >> mode
> >> 100644 index 0000000..b2b95c7 --- /dev/null +++
> >> b/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch @@ -0,0 +1,24
> >> @@ +Index: netperf-2.4.4/src/netlib.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- netperf-2.4.4.orig/src/netlib.c	2007-10-17 23:16:02.000000000
> >> +0200 ++++ netperf-2.4.4/src/netlib.c	2008-12-03 17:56:32.000000000
> >> +0100 +@@ -1988,10 +1988,15 @@ +      fall-back on what we had before,
> >> which is to use just the size of +      an unsigned long. raj
> >> 2006-09-14 */ + +-#if defined(__CPU_SETSIZE) +-#define
> >> NETPERF_CPU_SETSIZE __CPU_SETSIZE -#define +NETPERF_CPU_SET(cpu,
> >> cpusetp)  __CPU_SET(cpu, cpusetp) +-#define NETPERF_CPU_ZERO(cpusetp)
> >> __CPU_ZERO (cpusetp) ++#if defined(CPU_SETSIZE) ++#define
> >> NETPERF_CPU_SETSIZE CPU_SETSIZE #define NETPERF_CPU_SET(cpu, ++cpusetp=
)
> >> CPU_SET(cpu, cpusetp) ++#define NETPERF_CPU_ZERO(cpusetp)      CPU_ZER=
O
> >> (cpusetp) ++  typedef cpu_set_t netperf_cpu_set_t; #elif
> >> defined(__CPU_SETSIZE) ++#define NETPERF_CPU_SETSIZE __CPU_SETSIZE
> >> #define NETPERF_CPU_SET(cpu, ++cpusetp)  __CPU_SET (cpu, cpusetp)
> >> ++#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp) +
> >> typedef cpu_set_t netperf_cpu_set_t; #else #define +
> >> NETPERF_CPU_SETSIZE sizeof(unsigned long) diff --git
> >> a/meta-oe/recipes-benchmark/netperf/files/init b/meta-oe/recipes-
> >> benchmark/netperf/files/init new file mode 100644 index
> >> 0000000..7cc053a --- /dev/null +++
> >> b/meta-oe/recipes-benchmark/netperf/files/init @@ -0,0 +1,51 @@
> >> +#!/bin/sh +# +# +# Written by Miquel van Smoorenburg
> >> <miquels@cistron.nl>. +# Modified for Debian GNU/Linux by Ian Murdock
> >> <imurdock@gnu.org>. +# Modified for Debian by Christoph Lameter
> >> <clameter@debian.org> # +Modified for openembedded by Bruno Randolf
> >> +<bruno.randolf@4g-systems.biz> + +PATH=3D/bin:/usr/bin:/sbin:/usr/sbi=
n
> >> +DAEMON=3D/usr/sbin/netserver + +test -f $DAEMON || exit 0 + +case "$1=
"
> >> in +  start) +		echo -n "Starting network benchmark server: netserver"
> >> +    start-stop-daemon -S -x $DAEMON > /dev/null 2>&1 +		echo "." +
> >> ;; +  stop) +		echo -n "Stopping network benchmark server: netserver"
> +
> >> start-stop-daemon -K -x $DAEMON +		echo "." +    ;; +  #reload) +
> #
> >> +    # If the daemon can reload its config files on the fly +    # for
> >> example by sending it SIGHUP, do it here. +    # +    # If the daemon
> >> responds to changes in its config file +    # directly anyway, make
> >> this a do-nothing entry. +    # +    # start-stop-daemon --stop
> >> --signal 1 --verbose --exec $DAEMON +    # ;; +  restart|force-reload)
> >> +  # +  # If the "reload" option is implemented, move the
> >> "force-reload" +  # option to the "reload" entry above. If not,
> >> "force-reload" is +  # just the same as "restart". +  # +
> >> start-stop-daemon -K -x $DAEMON +    sleep 1 +    start-stop-daemon -S
> >> -x $DAEMON +    ;; +  *) +    echo "Usage: /etc/init.d/netperf
> >> {start|stop|restart|force-reload}" +    exit 1 +    ;; +esac + +exit 0
> >> diff --git a/meta-oe/recipes-benchmark/netperf/files/vfork.patch
> >> b/meta- oe/recipes-benchmark/netperf/files/vfork.patch new file mode
> >> 100644 index 0000000..a40c96f --- /dev/null +++
> >> b/meta-oe/recipes-benchmark/netperf/files/vfork.patch @@ -0,0 +1,26
> >> @@
> >> +--- netperf-2.4.4/src/netserver.c	2007-10-17 17:09:12.000000000 -0400
> >> ++++ netperf-2.4.4.new/src/netserver.c	2011-01-23 12:26:39.000000000
> >> -0500 +@@ -567,7 +567,11 @@ +   fflush (stdin); +   fflush (stdout); +
> >> fflush (stderr); ++#if defined(HAVE_FORK) +   switch (fork()) ++#else
> >> ++  switch (vfork()) ++#endif +     { +     case -1: +
> >> perror("netperf server error"); +@@ -712,7 +716,11 @@ + #else +
> >> signal(SIGCLD, SIG_IGN); + ++#if defined(HAVE_FORK) + 	  switch
> >> (fork()) ++#else ++	  switch (vfork()) ++#endif + 	    { +
> case
> >> -1: + 	      /* something went wrong */ diff --git
> >> a/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb b/meta-
> >> oe/recipes-benchmark/netperf/netperf_2.4.4.bb new file mode 100644
> >> index 0000000..6a3a81c --- /dev/null +++
> >> b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 +1,46 @@
> >> +DESCRIPTION=3D"Network performance benchmark including tests for TCP,
> >> UDP, sockets, ATM and more." +SECTION =3D "console/network" +HOMEPAGE =
=3D
> >> "http://www.netperf.org/" +LICENSE =3D "GPLv2+" + +LIC_FILES_CHKSUM =
=3D
> >> "file://COPYING;md5=3Da0ab17253e7a3f318da85382c7d5d5d6" +
> >> +SRC_URI=3D"ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz=
2
> >> \ +         file://cpu_set.patch \ +         file://vfork.patch \ +
> >> file://init" + +SRC_URI[md5sum] =3D "0e942f22864e601406a994420231075b"
> >> +SRC_URI[sha256sum] =3D
> >> "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497" +
> >> +inherit update-rc.d autotools + +S =3D "${WORKDIR}/netperf-${PV}" + +=
#
> >> cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_
> >> +macros CFLAGS_append =3D " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE" +
> >> +do_install() { +        install -d ${D}${sbindir} ${D}${bindir}
> >> ${D}${sysconfdir}/init.d +        install -m 4755 src/netperf
> >> ${D}${bindir} +        install -m 4755 src/netserver ${D}${sbindir} +
> >> install -m 0755 ${WORKDIR}/init +${D}${sysconfdir}/init.d/netperf + +
> >> # man +        install -d ${D}${mandir}/man1/ +        install -m 0644
> >> doc/netserver.man ${D}${mandir}/man1/netserver.1 +        install -m
> >> 0644 doc/netperf.man ${D}${mandir}/man1/netperf.1 + +        # move
> >> scripts to examples directory +        install -d
> >> ${D}${docdir}/netperf/examples +        install -m 0644
> >> doc/examples/*_script + ${D}${docdir}/netperf/examples/ + +        #
> >> docs .. +        install -m 0644 COPYING ${D}${docdir}/netperf +
> >> install -m 0644 Release_Notes ${D}${docdir}/netperf +        install -=
m
> >> 0644 README ${D}${docdir}/netperf +        install -m 0644
> >> doc/netperf_old.ps ${D}${docdir}/netperf } +
> >> +INITSCRIPT_NAME=3D"netperf" +INITSCRIPT_PARAMS=3D"defaults" -- 1.7.0.=
4
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk8UCDQACgkQMkyGM64RGpHofACgmAF+NuS+IOX3q/lmQL/Ya0zW
> hnQAoIL0UrAFgY8dfxKbUqtAzj2Gk8gx
> =3Dodbb
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




