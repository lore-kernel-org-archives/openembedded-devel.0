Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Nov 2017 16:08:55 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 23824782D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:08:55 +0000 (UTC)
X-AuditID: 0a00029b-c8dff70000007b66-83-59fb3f8fd6ca
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	0B.8A.31590.F8F3BF95; Thu,  2 Nov 2017 10:53:54 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 2 Nov 2017 10:53:51 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] nodejs: Update to 8.9.0
Thread-Index: AQHTU/LGER+wibFihkGyhamPU3CZsA==
Date: Thu, 2 Nov 2017 15:53:50 +0000
Message-ID: <20171102155307.7360-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.97]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsWyRiBPQ3eS/e9Ig6lPOS0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujO0fX7IXnOSpmHr/AGMDYy93FyMnh4SAicTvuWcZuxi5OIQE
	jjJKbPv4FMqZySjR0HaaDaSKTcBI4tz1TYwgtohArMS8TTOZQGxmAQOJd5s3snYxcnAICxhK
	PP0rB1FiJjHh9xtmCFtPYtu15WCtLAIqEi1TV7OA2LwCthK91yeC1TAKiEl8P7UGaqS4xK0n
	85kgjhOQWLLnPDOELSrx8vE/VghbTuLB39NQ9XoSN6ZOYYOwtSWWLXzNDDFfUOLkzCcsExiF
	ZyEZOwtJyywkLbOQtCxgZFnFyJdrpJdaXFyWX5Kql5yfu4kRGNRcDEyzdzD2NMUeYhTgYFTi
	4T2g/itSiDWxrLgy9xCjNAeLkjjv4mudkUIC6YklqdmpqQWpRfFFpTmpxYcYmTg4QQSXVAMj
	P/OaRJPlL+tOyZv+npm2Mlftxue3O9ZIztDNfCrntaPFsSbSO/7euwJrg7V+cWwWette54hs
	7FS51X5261aDD/zv+uQVOffvrTYN+C9Zc+Hzc+Z4R5Gzf6ZvDEr9/+PS5OAqs+sJ5a+XL3ZI
	nHhia/3KQx//2224XOgbrrjU49CDt86FxrMuK7EUZyQaajEXFScCAHLsBk9QAgAA
Subject: [meta-oe][PATCH] nodejs: Update to 8.9.0
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
X-List-Received-Date: Thu, 02 Nov 2017 16:08:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Update nodejs to latest stable release 8.9.0.
---
 .../recipes-devtools/nodejs/{nodejs_8.7.0.bb =3D> nodejs_8.9.0.bb}    | 6 =
+++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.7.0.bb =3D> nodejs_8.9.0.=
bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb b/meta-oe/reci=
pes-devtools/nodejs/nodejs_8.9.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
index 3ef4e6a1c..1cab6a497 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D23bbe20ee15d74b4c56e57f73e9c039=
b"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14045ee6ae930d784435884f8aa1be0=
d"
=20
 DEPENDS =3D "openssl10 zlib"
=20
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] =3D "78c297b4a23f7f9c0c031baa77702402"
-SRC_URI[sha256sum] =3D "5a17d08c68ee7c1e748fd32534edda766cb57c13ed98e693f3=
075bc9d9a0b59a"
+SRC_URI[md5sum] =3D "49001b4037b2ddf10c2174c38a40f112"
+SRC_URI[sha256sum] =3D "ae8258f89e127a76d4b4aff6fdb8dc395b7da0069cba054b91=
3dfc36b3c91189"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.13.6

