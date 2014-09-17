Return-Path: <B40869@freescale.com>
X-Greylist: delayed 145323 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Sep 2014 03:21:14 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0112.outbound.protection.outlook.com [157.56.110.112])
	by mail.openembedded.org (Postfix) with ESMTP id 60AF6714D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 03:21:14 +0000 (UTC)
Received: from BY2PR0301MB0757.namprd03.prod.outlook.com (25.160.63.26) by
	BY2PR0301MB0760.namprd03.prod.outlook.com (25.160.63.24) with Microsoft
	SMTP Server (TLS) id 15.0.1019.16; Wed, 17 Sep 2014 03:21:13 +0000
Received: from BY2PR0301MB0757.namprd03.prod.outlook.com ([25.160.63.26]) by
	BY2PR0301MB0757.namprd03.prod.outlook.com ([25.160.63.26]) with mapi id
	15.00.1019.015; Wed, 17 Sep 2014 03:21:13 +0000
From: "B40869@freescale.com" <B40869@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
Thread-Index: AQHP0iHzgkzay2Pt5UyQ7lRmTAkn65wEqFtB
Date: Wed, 17 Sep 2014 03:21:12 +0000
Message-ID: <1410924647639.22034@freescale.com>
References: <1410921525-20513-1-git-send-email-b40869@freescale.com>
In-Reply-To: <1410921525-20513-1-git-send-email-b40869@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.158.211]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;UriScan:;
x-forefront-prvs: 0337AFFE9A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(199003)(189002)(36756003)(83322001)(110136001)(74502003)(85852003)(90102001)(74662003)(92726001)(106356001)(99286002)(80022003)(77982003)(86362001)(92566001)(50986999)(81542003)(46102003)(76176999)(97736003)(76482002)(2351001)(81342003)(87936001)(95666004)(101416001)(105586002)(85306004)(106116001)(19580395003)(15975445006)(20776003)(21056001)(77096002)(31966008)(19580405001)(117636001)(107046002)(54356999)(66066001)(107886001)(99396002)(4396001)(64706001)(2656002)(15395725005)(83072002)(79102003)(15202345003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0760;
	H:BY2PR0301MB0757.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Wed, 17 Sep 2014 03:21:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There is a typo error, will resubmit it=0A=
________________________________________=0A=
From: YangHaibo <b40869@freescale.com>=0A=
Sent: Wednesday, September 17, 2014 10:38 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Cc: Yang Haibo-B40869=0A=
Subject: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8=0A=
=0A=
Signed-off-by: YangHaibo <b40869@freescale.com>=0A=
---=0A=
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++=0A=
 1 file changed, 10 insertions(+)=0A=
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb=0A=
=0A=
diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-netw=
orking/recipes-support/pimd/pimd_2.1.8.bb=0A=
new file mode 100644=0A=
index 0000000..0cb7979=0A=
--- /dev/null=0A=
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb=0A=
@@ -0,0 +1,10 @@=0A=
+SUMMARY =3D "pimd is a lightweight stand-alone PIM-SM v2 multicast routing=
 daemon."=0A=
+HOMEPAGE =3D "http://troglobit.com/pimd.html"=0A=
+LICENSE =3D "BSD-3-Clause"=0A=
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94f108f91fab720d62425770b70dd79=
0"=0A=
+=0A=
+SRC_URI =3D "ftp://troglobit.com/pimd/${BP}.tar.bz2"=0A=
+SRC_URI[md5sum] =3D "a12448bc7c9bfcebf51a13ebf1ffa962"=0A=
+SRC_URI[sha256] =3D "3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8=
fb080126009"=0A=
+=0A=
+CFLAGS_prepend =3D "-I ${S}/include "=0A=
--=0A=
1.9.2=0A=
=0A=

