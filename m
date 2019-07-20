Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 61228 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Jul 2019 14:34:04 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254065.outbound.protection.outlook.com [40.92.254.65])
	by mail.openembedded.org (Postfix) with ESMTP id 792167ED61
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:34:04 +0000 (UTC)
Received: from PU1APC01FT010.eop-APC01.prod.protection.outlook.com
	(10.152.252.53) by PU1APC01HT189.eop-APC01.prod.protection.outlook.com
	(10.152.252.253) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18;
	Sat, 20 Jul 2019 16:59:06 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.252.58) by
	PU1APC01FT010.mail.protection.outlook.com (10.152.252.83) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18 via Frontend Transport; Sat, 20 Jul 2019 16:59:06 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::149e:5882:56e4:98f8]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::149e:5882:56e4:98f8%4]) with mapi id 15.20.2094.013;
	Sat, 20 Jul 2019 16:59:06 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH] python: pypi: Add python3-term
Thread-Index: AQHVPxxwjcgCBxzX5EasfORV6ffvbQ==
Date: Sat, 20 Jul 2019 16:59:05 +0000
Message-ID: <PSXP216MB027758D2A51CD416FBB406E3DDCA0@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0073.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::14) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:14B82B4B1F6BDA375930FB1D7BCEAC6B904688E14427811B548881DA06A66BAD;
	UpperCasedChecksum:519FC26ED79FCBB4AB7DE577142A0905C774EAB742EA48FA9CA7DE8BD2D039EB;
	SizeAsReceived:7454; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-tmn: [gS+HQVPqvLKkMmJO27CgyHCuw5vSZBGxjHDU5K5QX+MljEIua4p9/nx3Kasd/wIW]
x-microsoft-original-message-id: <20190720165851.20759-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:PU1APC01HT189; 
x-ms-traffictypediagnostic: PU1APC01HT189:
x-microsoft-antispam-message-info: qoahR1GGImArYPvXEPbbIJ4d3SCSt1lqG7tZXnfLm4rhkiNm0f8HymzaO5RaHGjxf7fagFlmPjxL4IEiC+q5uxQg4FHNS+mRD4FDgj+qHBEo58pAzKULSTAuATcNOM4kjchm1qmLa9Lk81Jk1Ss06wW8dBmxCdsrtXmrL+Ujcs4xOTsTx+BGBQRvZLEW0qFg
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ab180219-4f89-4ad6-c700-08d70d3392b2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2019 16:59:06.0353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT189
Subject: [meta-python][PATCH] python: pypi: Add python3-term
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
X-List-Received-Date: Sun, 21 Jul 2019 14:34:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python-term.inc     | 9 +++++++++
 meta-python/recipes-devtools/python/python3-term_2.3.bb | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-term.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-term_2.3.bb

diff --git a/meta-python/recipes-devtools/python/python-term.inc b/meta-pyt=
hon/recipes-devtools/python/python-term.inc
new file mode 100644
index 000000000..8a2df0e19
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-term.inc
@@ -0,0 +1,9 @@
+SUMMARY =3D "An enhanced version of the tty module"
+SECTION =3D "devel/python"
+LICENSE =3D "Python-2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd90e2d280a4836c607520383d1639be=
1"
+
+PYPI_PACKAGE_EXT =3D "zip"
+
+SRC_URI[md5sum] =3D "ab0c1bce381b1109fe4390c56aa06237"
+SRC_URI[sha256sum] =3D "3dcc8c212e04700784e5c1c5b601916ba0549ae6025b35b64f=
d62144899e7180"
diff --git a/meta-python/recipes-devtools/python/python3-term_2.3.bb b/meta=
-python/recipes-devtools/python/python3-term_2.3.bb
new file mode 100644
index 000000000..372cffe04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-term_2.3.bb
@@ -0,0 +1,2 @@
+require python-term.inc
+inherit pypi setuptools3
--=20
2.21.0


