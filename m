Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 21658 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 May 2019 12:49:58 UTC
Received: from APC01-HK2-obe.outbound.protection.outlook.com
	(mail-oln040092255075.outbound.protection.outlook.com [40.92.255.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2D66B50B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 12:49:58 +0000 (UTC)
Received: from HK2APC01FT034.eop-APC01.prod.protection.outlook.com
	(10.152.248.52) by HK2APC01HT015.eop-APC01.prod.protection.outlook.com
	(10.152.248.225) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16;
	Mon, 20 May 2019 04:17:19 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.248.56) by
	HK2APC01FT034.mail.protection.outlook.com (10.152.248.191) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1900.16 via Frontend Transport; Mon, 20 May 2019 04:17:19 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::c476:b880:356b:be15]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::c476:b880:356b:be15%5]) with mapi id 15.20.1900.020;
	Mon, 20 May 2019 04:17:19 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH] python-obd: Uprade from 0.7.0 to 0.7.1
Thread-Index: AQHVDsLpR+HANn0Y5kmp2D+LHL1opQ==
Date: Mon, 20 May 2019 04:17:18 +0000
Message-ID: <PSXP216MB0277BA7E0C93F84B8946575CDD060@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0014.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::27) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:BA684033E794A2CAB3D23534F7BDD2E674545708F60CC807F9964D53F44F4E96;
	UpperCasedChecksum:0FCFD484CCF604F2A4B4271448611FDC9B829ABE9A382BDA7E361DC34ECD77A3;
	SizeAsReceived:7469; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-tmn: [6/cLKsk0LcQcYxANBsTyK3dnpFe9Sb8oqGR9pUI52+3j+IHlVVn44YafyynCPMrX]
x-microsoft-original-message-id: <20190520041704.10448-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:HK2APC01HT015; 
x-ms-traffictypediagnostic: HK2APC01HT015:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: A6YyQd1pdg7/G29FREoqdguWT6OyylTCaaxju3lnsyhy3mAPOzv92SstHiQtKZTkp9FdyY+a4jCq+9CkfL+litgDYpEJ1DjHwyl883gJ9GgRGbh0xvxh9L6PushwOgluyWugO7/tG5oYp6Cr4TAMX5alWWZfjmIJYR0GrykyTguWonVQ6UT92qsr/531ji9V
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd39a2c8-fed1-49f7-da42-08d6dcda0ba4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 04:17:19.1081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT015
Subject: [meta-python][PATCH] python-obd: Uprade from 0.7.0 to 0.7.1
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
X-List-Received-Date: Mon, 20 May 2019 12:50:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4N
Ci0tLQ0KIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1vYmQuaW5j
ICAgICAgICAgIHwgNiArKystLS0NCiAuLi4vcHl0aG9uL3tweXRob24zLW9iZF8wLjcuMC5iYiA9
PiBweXRob24zLW9iZF8wLjcuMS5iYn0gICB8IDANCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24ve3B5dGhvbjMtb2JkXzAuNy4wLmJiID0+IHB5dGhvbjMtb2JkXzAuNy4xLmJi
fSAoMTAwJSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1vYmQuaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLW9iZC5pbmMNCmluZGV4IDU2MjFkYmE5NC4uNTFlNjYzYjUxIDEwMDY0NA0KLS0tIGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLW9iZC5pbmMNCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1vYmQuaW5jDQpAQCAt
MSwxMCArMSwxMCBAQA0KIERFU0NSSVBUSU9OID0gIkEgcHl0aG9uIG1vZHVsZSBmb3IgaGFuZGxp
bmcgcmVhbHRpbWUgc2Vuc29yIGRhdGEgZnJvbSBPQkQtSUkgdmVoaWNsZSBwb3J0cyINCiBIT01F
UEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vYnJlbmRhbi13L3B5dGhvbi1PQkQiDQogTElDRU5T
RSA9ICJHUEx2MiINCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUucnN0O21kNT0y
OTg4YTVlOTEzZWIxMDVmYTA4MDExMTM1YzQxNTdkNCINCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9SRUFETUUubWQ7bWQ1PTU4YmE4OTZmYTA4NmM5NmFkMjMzMTdjZWJmZWFiMjc3Ig0KIA0K
LVNSQ19VUklbbWQ1c3VtXSA9ICI5M2UwNGY4MjVlMTNiN2ViYzk3ZDA2YjZhNjQwNzgwNyINCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGIxYmFjOTVkZjJmYWFjNTcxZWJmNDQ0Nzc4ZTRkNzM2ZDA1
MGQ4ZWQ3MDQ5MDIzYzBmYzkyOWE1MjBlYmE2ZCINCitTUkNfVVJJW21kNXN1bV0gPSAiMzA1ZWZj
YjZjNjUwZGI3Yjk1ODM1MzIzNTVlYmViN2MiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiODFl
YTU4OTYxNTdiNmU4NjFhZjEyZTE3M2MxMGIwMDFjYjZjY2E2ZWJiMDRkYjJjMDFkMzI2ODEyYWQ3
N2IiDQogDQogaW5oZXJpdCBweXBpDQogDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1vYmRfMC43LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW9iZF8wLjcuMS5iYg0Kc2ltaWxhcml0eSBpbmRl
eCAxMDAlDQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW9iZF8wLjcuMC5iYg0KcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtb2JkXzAuNy4xLmJiDQotLSANCjIuMjEuMA0KDQo=

