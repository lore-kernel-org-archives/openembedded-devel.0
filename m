Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe006.messaging.microsoft.com [216.32.180.189])
	by mail.openembedded.org (Postfix) with ESMTP id 06CF861563
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:55:15 +0000 (UTC)
Received: from mail200-co1-R.bigfish.com (10.243.78.239) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 06:55:15 +0000
Received: from mail200-co1 (localhost [127.0.0.1])	by
	mail200-co1-R.bigfish.com (Postfix) with ESMTP id D5243E0144	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:55:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz9371I542Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bh8275dhz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail200-co1 (localhost.localdomain [127.0.0.1]) by mail200-co1
	(MessageSwitch) id 13787961153122_9836;
	Tue, 10 Sep 2013 06:55:15 +0000 (UTC)
Received: from CO1EHSMHS011.bigfish.com (unknown [10.243.78.253])	by
	mail200-co1.bigfish.com (Postfix) with ESMTP id F1912800040	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:55:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS011.bigfish.com
	(10.243.66.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 06:55:14 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.211]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.03.0158.002;
	Tue, 10 Sep 2013 06:55:13 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-fsl-ppc][PATCH v2] tclap: update SRC_URI
Thread-Index: AQHOrfKbjoPziZEy3Uu8UnGsHOS5XZm+iWjw
Date: Tue, 10 Sep 2013 06:55:13 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E10462830@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1378796062-15201-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1378796062-15201-1-git-send-email-b40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [meta-fsl-ppc][PATCH v2] tclap: update SRC_URI
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
X-List-Received-Date: Tue, 10 Sep 2013 06:55:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore it

-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Tuesday, September 10, 2013 2:54 PM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
Subject: [meta-fsl-ppc][PATCH v2] tclap: update SRC_URI

From: Chunrong Guo <B40290@freescale.com>

  *fix unfetchable SRC_URI

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipe=
s-devtools/tclap/tclap_1.2.1.bb
index 7075664..8cbe912 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f873245=
3"
=20
 SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
-SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
+SRC_URI =3D "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \  "=20
=20
--
1.7.5.4



