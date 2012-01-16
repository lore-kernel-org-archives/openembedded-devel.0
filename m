Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RmjJU-0002cg-0s
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 10:57:16 +0100
Received: from mail210-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jan 2012 09:34:30 +0000
Received: from mail210-ch1 (localhost [127.0.0.1])	by
	mail210-ch1-R.bigfish.com (Postfix) with ESMTP id 723C118011D	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 09:34:31 +0000 (UTC)
X-SpamScore: -30
X-BigFish: VS-30(z98bRz9371I1803M936eK146fK542M1432Nzz1202hzz8275fh8275bh8275dhz2dhc1ahc1bh2a8h668h839h8e2h8e3h944hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail210-ch1 (localhost.localdomain [127.0.0.1]) by mail210-ch1
	(MessageSwitch) id 1326706470843618_5753;
	Mon, 16 Jan 2012 09:34:30 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail210-ch1.bigfish.com (Postfix) with ESMTP id
	C78CD400063	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 09:34:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jan 2012 09:34:30 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 16 Jan 2012 03:34:32 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 meta-oe] netperf: add version 2.4.4
Thread-Index: AQHMxTqFkGWIj6thEEWkdUUpvTvbFpYO2Xyg
Date: Mon, 16 Jan 2012 09:34:32 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010CE056@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325061063-26942-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1325061063-26942-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
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
X-List-Received-Date: Mon, 16 Jan 2012 09:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,=20

Any comment on it?


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Wednesday, December 28, 2011 4:31 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH v2 meta-oe] netperf: add version 2.4.4
>=20
> From: Zhenhua Luo <b19537@freescale.com>
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  .../recipes-benchmark/netperf/files/cpu_set.patch  |   24 +++++++++
>  meta-oe/recipes-benchmark/netperf/files/init       |   51 ++++++++++++++=
++++++
>  .../recipes-benchmark/netperf/files/vfork.patch    |   26 ++++++++++
>  meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb |   46 ++++++++++++++=
++++
>  4 files changed, 147 insertions(+), 0 deletions(-)  create mode 100644 m=
eta-
> oe/recipes-benchmark/netperf/files/cpu_set.patch
>  create mode 100644 meta-oe/recipes-benchmark/netperf/files/init
>  create mode 100644 meta-oe/recipes-benchmark/netperf/files/vfork.patch
>  create mode 100644 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch b/meta=
-
> oe/recipes-benchmark/netperf/files/cpu_set.patch
> new file mode 100644
> index 0000000..b2b95c7
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
> @@ -0,0 +1,24 @@
> +Index: netperf-2.4.4/src/netlib.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- netperf-2.4.4.orig/src/netlib.c	2007-10-17 23:16:02.000000000 +0200
> ++++ netperf-2.4.4/src/netlib.c	2008-12-03 17:56:32.000000000 +0100
> +@@ -1988,10 +1988,15 @@
> +      fall-back on what we had before, which is to use just the size of
> +      an unsigned long. raj 2006-09-14 */
> +
> +-#if defined(__CPU_SETSIZE)
> +-#define NETPERF_CPU_SETSIZE __CPU_SETSIZE -#define
> +NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET(cpu, cpusetp)
> +-#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
> ++#if defined(CPU_SETSIZE)
> ++#define NETPERF_CPU_SETSIZE CPU_SETSIZE #define NETPERF_CPU_SET(cpu,
> ++cpusetp)  CPU_SET(cpu, cpusetp)
> ++#define NETPERF_CPU_ZERO(cpusetp)      CPU_ZERO (cpusetp)
> ++  typedef cpu_set_t netperf_cpu_set_t; #elif defined(__CPU_SETSIZE)
> ++#define NETPERF_CPU_SETSIZE __CPU_SETSIZE #define NETPERF_CPU_SET(cpu,
> ++cpusetp)  __CPU_SET (cpu, cpusetp)
> ++#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
> +   typedef cpu_set_t netperf_cpu_set_t; #else #define
> + NETPERF_CPU_SETSIZE sizeof(unsigned long)
> diff --git a/meta-oe/recipes-benchmark/netperf/files/init b/meta-oe/recip=
es-
> benchmark/netperf/files/init
> new file mode 100644
> index 0000000..7cc053a
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/netperf/files/init
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +#
> +#
> +# Written by Miquel van Smoorenburg <miquels@cistron.nl>.
> +# Modified for Debian GNU/Linux by Ian Murdock <imurdock@gnu.org>.
> +# Modified for Debian by Christoph Lameter <clameter@debian.org> #
> +Modified for openembedded by Bruno Randolf
> +<bruno.randolf@4g-systems.biz>
> +
> +PATH=3D/bin:/usr/bin:/sbin:/usr/sbin
> +DAEMON=3D/usr/sbin/netserver
> +
> +test -f $DAEMON || exit 0
> +
> +case "$1" in
> +  start)
> +		echo -n "Starting network benchmark server: netserver"
> +    start-stop-daemon -S -x $DAEMON > /dev/null 2>&1
> +		echo "."
> +    ;;
> +  stop)
> +		echo -n "Stopping network benchmark server: netserver"
> +    start-stop-daemon -K -x $DAEMON
> +		echo "."
> +    ;;
> +  #reload)
> +    #
> +    # If the daemon can reload its config files on the fly
> +    # for example by sending it SIGHUP, do it here.
> +    #
> +    # If the daemon responds to changes in its config file
> +    # directly anyway, make this a do-nothing entry.
> +    #
> +    # start-stop-daemon --stop --signal 1 --verbose --exec $DAEMON
> +    # ;;
> +  restart|force-reload)
> +  #
> +  # If the "reload" option is implemented, move the "force-reload"
> +  # option to the "reload" entry above. If not, "force-reload" is
> +  # just the same as "restart".
> +  #
> +    start-stop-daemon -K -x $DAEMON
> +    sleep 1
> +    start-stop-daemon -S -x $DAEMON
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/netperf {start|stop|restart|force-reload}"
> +    exit 1
> +    ;;
> +esac
> +
> +exit 0
> diff --git a/meta-oe/recipes-benchmark/netperf/files/vfork.patch b/meta-
> oe/recipes-benchmark/netperf/files/vfork.patch
> new file mode 100644
> index 0000000..a40c96f
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/netperf/files/vfork.patch
> @@ -0,0 +1,26 @@
> +--- netperf-2.4.4/src/netserver.c	2007-10-17 17:09:12.000000000 -0400
> ++++ netperf-2.4.4.new/src/netserver.c	2011-01-23 12:26:39.000000000 -050=
0
> +@@ -567,7 +567,11 @@
> +   fflush (stdin);
> +   fflush (stdout);
> +   fflush (stderr);
> ++#if defined(HAVE_FORK)
> +   switch (fork())
> ++#else
> ++  switch (vfork())
> ++#endif
> +     {
> +     case -1:
> +       perror("netperf server error");
> +@@ -712,7 +716,11 @@
> + #else
> +       signal(SIGCLD, SIG_IGN);
> +
> ++#if defined(HAVE_FORK)
> + 	  switch (fork())
> ++#else
> ++	  switch (vfork())
> ++#endif
> + 	    {
> + 	    case -1:
> + 	      /* something went wrong */
> diff --git a/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb b/meta-
> oe/recipes-benchmark/netperf/netperf_2.4.4.bb
> new file mode 100644
> index 0000000..6a3a81c
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION=3D"Network performance benchmark including tests for TCP, UD=
P,
> sockets, ATM and more."
> +SECTION =3D "console/network"
> +HOMEPAGE =3D "http://www.netperf.org/"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da0ab17253e7a3f318da85382c7d5d=
5d6"
> +
> +SRC_URI=3D"ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
> +         file://cpu_set.patch \
> +         file://vfork.patch \
> +         file://init"
> +
> +SRC_URI[md5sum] =3D "0e942f22864e601406a994420231075b"
> +SRC_URI[sha256sum] =3D
> "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"
> +
> +inherit update-rc.d autotools
> +
> +S =3D "${WORKDIR}/netperf-${PV}"
> +
> +# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_
> +macros CFLAGS_append =3D " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
> +
> +do_install() {
> +        install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
> +        install -m 4755 src/netperf ${D}${bindir}
> +        install -m 4755 src/netserver ${D}${sbindir}
> +        install -m 0755 ${WORKDIR}/init
> +${D}${sysconfdir}/init.d/netperf
> +
> +        # man
> +        install -d ${D}${mandir}/man1/
> +        install -m 0644 doc/netserver.man ${D}${mandir}/man1/netserver.1
> +        install -m 0644 doc/netperf.man ${D}${mandir}/man1/netperf.1
> +
> +        # move scripts to examples directory
> +        install -d ${D}${docdir}/netperf/examples
> +        install -m 0644 doc/examples/*_script
> + ${D}${docdir}/netperf/examples/
> +
> +        # docs ..
> +        install -m 0644 COPYING ${D}${docdir}/netperf
> +        install -m 0644 Release_Notes ${D}${docdir}/netperf
> +        install -m 0644 README ${D}${docdir}/netperf
> +        install -m 0644 doc/netperf_old.ps ${D}${docdir}/netperf }
> +
> +INITSCRIPT_NAME=3D"netperf"
> +INITSCRIPT_PARAMS=3D"defaults"
> --
> 1.7.0.4




