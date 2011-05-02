Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QGrB1-0002PJ-04 for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:20:31 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p42BHvZR007597
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2011 13:17:58 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 2 May 2011 13:17:51 +0200
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Mon, 2 May 2011 13:17:51 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5168@GSX300A.mxchg.m.corp>
In-Reply-To: <iplshp$vse$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [2011.03-maintenance] Pull request #16
Thread-Index: AcwIqSrcIosRSXrbSuiX2/Nrz28rzwAEQBSw
References: <iplshp$vse$1@dough.gmane.org>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 02 May 2011 11:17:51.0498 (UTC)
	FILETIME=[934A96A0:01CC08BA]
Subject: Re: [2011.03-maintenance] Pull request #16
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
X-List-Received-Date: Mon, 02 May 2011 11:20:31 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

is there an up to date git for 2011.03-maintenance which is accessible =
by http:// ??

Thanks and regards
Wolfgang Hauser
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Koen Kooi
Gesendet: Montag, 2. Mai 2011 11:12
An: openembedded-devel@lists.openembedded.org
Betreff: [oe] [2011.03-maintenance] Pull request #16

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 5 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Jeff Lance (1):
      am-benchmarks: add return values

Koen Kooi (3):
      opencv 2.2: fix opencv-dev dependency chain
      opencv 2.2: include actual headers in the -dev package
      linux-omap-psp 2.6.32: add support for 5MP camera board

Michael 'Mickey' Lauer (1):
      qt4-embedded: enable support for the built-in LinuxInput keyboard

Philip Balister (1):
      uhd : Update to latest release. Both source and fpga images.

These are all cherry-picks from .dev.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNvnV0MkyGM64RGpERAptmAKClbBQspBMjxpazJ2lTDXGezE8CSgCgmCda
/eYseg2E8z3khzooXDZ0PYQ=3D
=3DP2f4
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


