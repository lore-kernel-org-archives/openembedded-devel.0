Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe001.messaging.microsoft.com [65.55.88.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5FFC60958
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:45:44 +0000 (UTC)
Received: from mail169-tx2-R.bigfish.com (10.9.14.233) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.22; Mon, 29 Jul 2013 09:45:43 +0000
Received: from mail169-tx2 (localhost [127.0.0.1])	by
	mail169-tx2-R.bigfish.com (Postfix) with ESMTP id CF70310009F	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:45:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371Ic3f2I542Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah1de096h8275bh8275dh1de097hz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail169-tx2 (localhost.localdomain [127.0.0.1]) by mail169-tx2
	(MessageSwitch) id 1375091141619327_20246;
	Mon, 29 Jul 2013 09:45:41 +0000 (UTC)
Received: from TX2EHSMHS041.bigfish.com (unknown [10.9.14.233])	by
	mail169-tx2.bigfish.com (Postfix) with ESMTP id 9069A260058	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:45:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS041.bigfish.com
	(10.9.99.141) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 29 Jul 2013 09:45:41 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.139]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.03.0136.001;
	Mon, 29 Jul 2013 09:45:41 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] iperf: Fix license
Thread-Index: AQHOiRk2/cOskMoKbUqP14xZWUlKR5l7bPDQ
Date: Mon, 29 Jul 2013 09:45:40 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E1042EA39@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1374744455-20983-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1374744455-20983-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-oe][PATCH] iperf: Fix license
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
X-List-Received-Date: Mon, 29 Jul 2013 09:45:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'd appreciate if someone can review.

Thanks
chunrong

-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Thursday, July 25, 2013 5:28 PM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Yu Zongchun-B=
40527; Guo Chunrong-B40290
Subject: [meta-oe][PATCH] iperf: Fix license

    *the current version of Iperf has a false LICENSE set,
     so fix license with the generic BSD license

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recip=
es-benchmark/iperf/iperf_2.0.4.bb
index 8107701..03b8fe0 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allowin=
g the tuning of various parameters and UDP characteristics"
 HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
 SECTION =3D "console/network"
-LICENSE =3D "NewBSD"
+LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc3497519336029=
8"
=20
 SRC_URI =3D " \
--=20
1.7.5.4



