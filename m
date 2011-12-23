Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=VA3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rdygs-0002Lu-AE
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 07:33:14 +0100
Received: from mail13-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Dec 2011 06:25:51 +0000
Received: from mail13-va3 (localhost [127.0.0.1])	by mail13-va3-R.bigfish.com
	(Postfix) with ESMTP id DCE9344019F	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 06:26:50 +0000 (UTC)
X-SpamScore: -27
X-BigFish: VS-27(z98bRz154cP9371I936eK542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail13-va3 (localhost.localdomain [127.0.0.1]) by mail13-va3
	(MessageSwitch) id 1324621608723433_2780;
	Fri, 23 Dec 2011 06:26:48 +0000 (UTC)
Received: from VA3EHSMHS004.bigfish.com (unknown [10.7.14.236])	by
	mail13-va3.bigfish.com (Postfix) with ESMTP id AD838540042	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 06:26:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS004.bigfish.com
	(10.7.99.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Dec 2011 06:25:49 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 23 Dec 2011 00:26:00 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v3 meta-oe 7/7] xfsprogs: add version 3.1.7
Thread-Index: AQHMv6WaXWdN4VoSZESP/FA9vdSJ/ZXn+JgAgAD/WQA=
Date: Fri, 23 Dec 2011 06:26:00 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BBE33@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
	<1324447304-4874-7-git-send-email-b19537@freescale.com>
	<jcus7i$5a2$1@dough.gmane.org>
In-Reply-To: <jcus7i$5a2$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v3 meta-oe 7/7] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Fri, 23 Dec 2011 06:33:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks. I created a new patch of xfsprogs to fix the issue.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Thursday, December 22, 2011 5:11 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH v3 meta-oe 7/7] xfsprogs: add version 3.1.7
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 21-12-11 07:01, b19537@freescale.com schreef:
> > From: Zhenhua Luo <b19537@freescale.com>
> >
> > xfsprogs provides XFS filesystem utilities.
>=20
> I get:
>=20
> NOTE: package xfsprogs-3.1.7-r0: task do_install: Started
> ERROR: Function 'do_install' failed (see
> /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-
> gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
> for further information)
> ERROR: Logfile of failure stored in:
> /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-
> gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common=
']
> | ERROR: Function 'do_install' failed (see
> /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-
> gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
> for further information)
> | + cd
> /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-
> gnueabi/xfsprogs-3.1.7-r0/xfsprogs-3.1.7
> | + do_install
> | + export
> DIST_ROOT=3D/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-ang=
strom-
> linux-gnueabi/xfsprogs-3.1.7-r0/image
> | +
> DIST_ROOT=3D/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-ang=
strom-
> linux-gnueabi/xfsprogs-3.1.7-r0/image
> | + oe_runmake install
> | + '[' xmake =3D x ']'
> | + bbnote make LIBTOOL=3Darm-angstrom-linux-gnueabi-libtool install echo
> | + 'NOTE: make LIBTOOL=3Darm-angstrom-linux-gnueabi-libtool install'
> | NOTE: make LIBTOOL=3Darm-angstrom-linux-gnueabi-libtool install
> | + make LIBTOOL=3Darm-angstrom-linux-gnueabi-libtool install
> | Installing include-install
> | make[1]: Nothing to be done for `install'.
> | Installing libxfs-install
> | make[1]: Nothing to be done for `install'.
> | Installing libxlog-install
> | make[1]: Nothing to be done for `install'.
> | Installing libxcmd-install
> | make[1]: Nothing to be done for `install'.
> | Installing libhandle-install
> | cd ../libhandle/.libs; ../../install-sh -o koen -g koen -m 755 -d
> | /lib;
> ../../install-sh -o koen -g koen -m 644 -T so_dot_version libhandle.lai
> /lib; ../../install-sh -o koen -g koen -T so_dot_current libhandle.lai /l=
ib
> | chown: invalid user: `koen:koen'
> | chown: invalid user: `koen:koen'
> | Installing libdisk-install
> | make[1]: Nothing to be done for `install'.
> | Installing copy-install
> | ../install-sh -o koen -g koen -m 755 -d /usr/sbin
> | chown: invalid user: `koen:koen'
> | make[1]: *** [install] Error 1
> | make: *** [copy-install] Error 2
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
>=20
>=20
> I've pushed the other 6 patches.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7y9CoACgkQMkyGM64RGpFmDwCfU8GxakEJlbraZyyELIeApzzi
> 99MAoKaLUGwa5QvVnuxGsGIFqVW4+nPf
> =3DSmzT
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




