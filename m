Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UIWpS-0002i8-Se
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 05:10:16 +0100
Received: from mail151-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 02:52:51 +0000
Received: from mail151-co1 (localhost [127.0.0.1])	by
	mail151-co1-R.bigfish.com (Postfix) with ESMTP id A166B4607CD	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:52:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz9371I542Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275dh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail151-co1 (localhost.localdomain [127.0.0.1]) by mail151-co1
	(MessageSwitch) id 1363834370177908_22843;
	Thu, 21 Mar 2013 02:52:50 +0000 (UTC)
Received: from CO1EHSMHS010.bigfish.com (unknown [10.243.78.251])	by
	mail151-co1.bigfish.com (Postfix) with ESMTP id 29A4580085	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:52:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS010.bigfish.com
	(10.243.66.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 02:52:50 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.235]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Thu, 21 Mar 2013 02:52:48 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] fmlib: update to the commit for sdk 1.3.2
Thread-Index: AQHOJdxL4rhon7eC5kKf7Qrg7XxyGpivcpOQ
Date: Thu, 21 Mar 2013 02:52:48 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E06806F47@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1363833125-9370-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1363833125-9370-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.249]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [OE-core][PATCH] fmlib: update to the commit for sdk 1.3.2
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
X-List-Received-Date: Thu, 21 Mar 2013 04:10:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore it .

Sorry, I send patch to wrong maillist .

-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Thursday, March 21, 2013 10:32 AM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH] fmlib: update to the commit for sdk 1.3.2

From: Chunrong Guo <b40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-ucode/fmlib/fmlib_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-ucode/fmlib/fmlib_git.bb b/recipes-ucode/fmlib/fmlib_g=
it.bb
index 74eb204..038f899 100644
--- a/recipes-ucode/fmlib/fmlib_git.bb
+++ b/recipes-ucode/fmlib/fmlib_git.bb
@@ -3,11 +3,13 @@ SECTION =3D "fman"
 LICENSE =3D "BSD & GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f16fa8e677e45af3127c5c4bafc3c0=
0"
=20
+PR =3D "r1"
+
 DEPENDS =3D "linux-libc-headers"
 DEPENDS_virtclass-native =3D ""
=20
 SRC_URI =3D "git://git.freescale.com/ppc/sdk/fmlib.git"
-SRCREV =3D "5ebbf75c3108404b513198c9fd9b955b123680af"
+SRCREV =3D "e80c0625d4f2671ac4f15cabfdd1b334143eb515"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -34,6 +36,6 @@ do_install_virtclass-native () {
       cp -rf ${S}/include/* ${D}/${includedir}  }
=20
-ALLOW_EMPTY =3D "1"
+ALLOW_EMPTY_${PN} =3D "1"
=20
 BBCLASSEXTEND =3D "native"
--
1.7.5.4




