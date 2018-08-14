Return-Path: <fritjof.jonsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84A6E7458A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CD57918070
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Zil4iWkX1y2w
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9F33318399
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87BEC1A05E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C22D1A058
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 6FBB3EDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:22 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 14 Aug 2018 09:35:22 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 14 Aug 2018 09:35:22 +0200
From: Fritjof Jonsson <fritjof.jonsson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2] Add recipe for cereal, a header-only C++11
	serialization library.
Thread-Index: AQHUMwh2Bmea3IR3ZUGR8iSkdJi1mKS+1v6y
Date: Tue, 14 Aug 2018 07:35:22 +0000
Message-ID: <1534232121870.60223@axis.com>
References: <20180813132030.22046-1-fritjofj@axis.com>
In-Reply-To: <20180813132030.22046-1-fritjofj@axis.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH v2] Add recipe for cereal, a header-only C++11 serialization library.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 07:35:26 -0000
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch, since a move of the recipe  to the correct locati=
on has been submitted. =0A=
=0A=
________________________________________=0A=
Change-Id: I93a3d6b34650998d67f5c00ed8ff14e2658cbec7=0A=
Signed-off-by: Fritjof Jonsson <fritjofj@axis.com>=0A=
---=0A=
 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb | 16 ++++++++++++++++=
=0A=
 1 file changed, 16 insertions(+)=0A=
 create mode 100644 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb=0A=
=0A=
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-oe=
/recipes-support/libcereal/libcereal_1.2.2.bb=0A=
new file mode 100644=0A=
index 000000000..6507dd63e=0A=
--- /dev/null=0A=
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb=0A=
@@ -0,0 +1,16 @@=0A=
+SUMMARY =3D "A C++11 library for serialization"=0A=
+HOMEPAGE =3D "https://uscilab.github.io/cereal/"=0A=
+=0A=
+SECTION =3D "libs"=0A=
+=0A=
+LICENSE =3D "BSD-3-Clause"=0A=
+LIC_FILES_CHKSUM =3D "[file://LICENSE;md5=3De612690af2f575dfd02e2e91443cea=
23]file://LICENSE;md5=3De612690af2f575dfd02e2e91443cea23"=0A=
+=0A=
+SRCREV =3D "51cbda5f30e56c801c07fe3d3aba5d7fb9e6cca4"=0A=
+SRC_URI =3D "git://github.com/USCiLab/cereal.git"=0A=
+=0A=
+S =3D "${WORKDIR}/git"=0A=
+=0A=
+inherit cmake=0A=
+=0A=
+EXTRA_OECMAKE =3D "-DJUST_INSTALL_CEREAL=3DON"=0A=
--=0A=
2.11.0=0A=
=0A=

