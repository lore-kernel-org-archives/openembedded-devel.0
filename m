Return-Path: <kwangsub.kim@qt.io>
X-Greylist: delayed 58970 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Sep 2017 19:04:07 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40108.outbound.protection.outlook.com [40.107.4.108])
	by mail.openembedded.org (Postfix) with ESMTP id 93A9B78233
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fSCJ80OawWhTYR8QcshxasFHaumfemkUbeMoA7Ly0q0=;
	b=TJSnv/DGwIM/HKTfKRcxYKcu5XisuRuEX6lD7CqBOoz80kr71DnS1VQYohDIm2zZ6iqsebnBKPvb0IfFoxUxFD5gVCjSx11CsRkVk5vk3nKslizq9dG1J1Vg0fWar+AnEwNHfxc7T8TIhRqfxgMxJtINZoSVOHFiM6eSi1hCf84=
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) by
	HE1PR0202MB2939.eurprd02.prod.outlook.com (10.171.93.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Thu, 21 Sep 2017 14:31:47 +0000
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::a191:7106:b9ab:6304]) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::a191:7106:b9ab:6304%14]) with mapi id 15.20.0077.011;
	Thu, 21 Sep 2017 14:31:47 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: Christian Gagneraud <chgans@gmail.com>
Thread-Topic: [oe] [meta-qt5][PATCH] qt5: add missing commercial license
Thread-Index: AQHTMsBwP8B5iU45RkSTg+Kq9mUZy6K/YLRA
Date: Thu, 21 Sep 2017 14:31:47 +0000
Message-ID: <HE1PR0202MB2491EF42CA7564345575961086660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
References: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
	<CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
In-Reply-To: <CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
x-originating-ip: [182.221.180.81]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0202MB2939;
	6:KbVESYkwu16iE7O9GXU0gx8xlJD7uYqisMZ0Mhujrqh4DSbzfzw9kzBTBbN3ayKqiE6xkOGxXf2+q3w5JxYto5cJkHhanmC4DSasQXTFFdEAVdTu3DAzsu/vn/C3kuVlEOrvLZXa0LIKfi9IsIfod0OjvPo2HobylOMBzk2sZdH7S1Vza0iXUSUu3HWmNrKiAA5KeDUlCr3834FfXQcfRRZCjGRpwN3NfLqoVykfxnYH1pFUgvU+7+dmh1ACCqy229J6YMM/oXzElUFPUjqbQrtk57s3A1pFBNPEjx9cAMr8LF5wk1QDcNdUzeL90VRV0Xsyq05I/EtHARpTDsb/wQ==;
	5:mzfaig8fe5xBli2h4OJSE1XQo1TO65VqmfJpvCc5dReM7NS3vQCbhrRE1IF0mVOY0qHiowXqAbOE4ZZ6gLU/aQwQm4siTwdbxbEN4IW1pXm/19sINwRTH1NU3qtcU2pkV3/Ydg8VfPck50afY6f21A==;
	24:0HXw+dep19pg9CLM/AuDwUVQoN1VdZb8nutrxPfYKDhC49Hg+DBPYTNvRUVRV9P0oD2qRVEXt2PH9oobO+MzzkAfaMSU7Mw6vPM8BZfokv4=;
	7:LrLBFnEIGGpO22gChpQdooMFGAn9nT9UKAcjR5+N6YqBFoutrLlJ0ctFt9muEO33prh4s8Gp5RJUVBWXY/MvvTeXHworU0QuC3kIaWIoq/+Q/6DpwYhquljmlLs3diob/00Qxd7/fI5t5azK4W4AC61MD08iro3F9Yx+rWIjwo7ogXd29Q/XXpE9NGBSaQsI5I5HC1LbLyPreJv+oDUfJ31BusTwJGZEfIbMtsv+nq4=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 5d17dedb-508e-4358-b61d-08d500fd7daf
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0202MB2939; 
x-ms-traffictypediagnostic: HE1PR0202MB2939:
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-microsoft-antispam-prvs: <HE1PR0202MB2939F7B0D59E4E251A64816586660@HE1PR0202MB2939.eurprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123560025)(20161123558100)(20161123564025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0202MB2939; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0202MB2939; 
x-forefront-prvs: 04371797A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(39830400002)(346002)(189002)(377454003)(24454002)(199003)(13464003)(8936002)(74316002)(81166006)(81156014)(53546010)(39060400002)(316002)(25786009)(97736004)(6246003)(86362001)(74482002)(478600001)(5660300001)(5250100002)(33656002)(8676002)(7696004)(1411001)(6306002)(3846002)(101416001)(229853002)(55016002)(99286003)(7736002)(966005)(53936002)(9686003)(66066001)(6116002)(102836003)(76176999)(54356999)(68736007)(2900100001)(105586002)(2906002)(14454004)(6916009)(3660700001)(3280700002)(4326008)(189998001)(6436002)(2950100002)(6506006)(50986999)(106356001)(305945005)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2939;
	H:HE1PR0202MB2491.eurprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2017 14:31:47.6936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2939
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: add missing commercial license
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
X-List-Received-Date: Thu, 21 Sep 2017 19:04:09 -0000
Content-Language: ko-KR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

KFNvcnJ5IGZvciBkdXBsaWNhdGUgZW1haWxzLiBJIHRob3VnaHQgdGhvc2Ugd2VyZSBub3QgZGVs
aXZlcmVkLikNCg0KSSBhZ3JlZSBvbiBjbGVhcmluZyB1cCBjb21wbGV4IGxvZ2ljYWwgZXhwcmVz
c2lvbnMgb2YgbGljZW5zZXMuIEJ1dA0KSSB0aGluayBpdCdzIGFub3RoZXIgdG9waWMgYmVjYXVz
ZSBpdCB3b3VsZCBuZWVkIHdpZGVyIHVwZGF0ZXMgaW5jbHVkaW5nDQp0aGUgb3RoZXIgcGFja2Fn
ZXMgdW5yZWxhdGVkIHRvIGNvbW1lcmNpYWwgbGljZW5zZSBmaXguDQpXaGF0IGFib3V0IGRpc2N1
c3NpbmcgYWJvdXQgaXQgb24gbmV3IHRocmVhZCBhZnRlciB0aGlzIHBhdGNoPw0KDQpSZWdhcmRz
LA0KS3dhbmdzdWINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJp
c3RpYW4gR2FnbmVyYXVkIFttYWlsdG86Y2hnYW5zQGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAyMSwgMjAxNyA3OjAwIFBNDQo+IFRvOiBLd2FuZ3N1YiBLaW0gPGt3YW5n
c3ViLmtpbUBxdC5pbz4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLXF0NV1bUEFUQ0hdIHF0NTogYWRkIG1p
c3NpbmcgY29tbWVyY2lhbCBsaWNlbnNlDQo+IA0KPiBPbiAyMSBTZXB0ZW1iZXIgMjAxNyBhdCAx
NDo0MCwgS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW8+IHdyb3RlOg0KPiBbLi4uXQ0K
PiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLXF0L3F0NS9xdHNlcmlhbHBvcnRfZ2l0LmJiDQo+ID4g
Yi9yZWNpcGVzLXF0L3F0NS9xdHNlcmlhbHBvcnRfZ2l0LmJiDQo+ID4gaW5kZXggMDU2ZTIzNy4u
MjNmMDNjZSAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLXF0L3F0NS9xdHNlcmlhbHBvcnRfZ2l0
LmJiDQo+ID4gKysrIGIvcmVjaXBlcy1xdC9xdDUvcXRzZXJpYWxwb3J0X2dpdC5iYg0KPiA+IEBA
IC0zLDcgKzMsNyBAQCByZXF1aXJlIHF0NS1naXQuaW5jDQo+ID4NCj4gPiAgIyB0ZXh0IG9mIExH
UExfRVhDRVBUSU9OLnR4dCBhbmQgTElDRU5TRS5GREwgaXMgc2xpZ2h0bHkgZGlmZmVyZW50DQo+
ID4gdGhhbiB3aGF0ICAjIG90aGVyIHF0KiBjb21wb25lbnRzIHVzZSA6LyAtTElDRU5TRSA9ICJH
RkRMLTEuMyAmIEJTRCAmDQo+ID4gKExHUEwtMi4xICYgVGhlLVF0LUNvbXBhbnktUXQtTEdQTC1F
eGNlcHRpb24tMS4xIHwgTEdQTC0zLjApIg0KPiA+ICtMSUNFTlNFID0gIkdGREwtMS4zICYgQlNE
ICYgKExHUEwtMi4xICYgVGhlLVF0LUNvbXBhbnktUXQtTEdQTC0NCj4gRXhjZXB0aW9uLTEuMSB8
IExHUEwtMy4wKSB8IFRoZS1RdC1Db21wYW55LUNvbW1lcmNpYWwiDQo+IA0KPiBFeHBsaWNpdCBi
cmFja2V0cyB3b3VsZCBiZSBuaWNlIHRvIGRpc2FtYmlndWF0ZSAmIGFuZCB8IHByZWNlZGVuY2Uu
DQo+IA0KPiBhcmUgd2UgdGFsa2luZywgZWc6DQo+IA0KPiAoTEdQTC0yLjEgJiBUaGUtUXQtQ29t
cGFueS1RdC1MR1BMLUV4Y2VwdGlvbi0xLjEpIHwgTEdQTC0zLjANCj4gDQo+IG9yDQo+IA0KPiBH
RkRMLTEuMyAmIChCU0QgJiAoTEdQTC0yLjEgJiAoVGhlLVF0LUNvbXBhbnktUXQtTEdQTC1FeGNl
cHRpb24tMS4xIHwNCj4gTEdQTC0zLjApKSB8IFRoZS1RdC1Db21wYW55LUNvbW1lcmNpYWwpDQo+
IA0KPiB3aGF0ZXZlciB0aGUgYW5zd2VyIGlzLCBtb3JlIGV4cGxpY2l0IGJyYWNrZXRpbmcgd291
bGQgbWFrZSBpdCBtb3JlDQo+IG9idmlvdXMgdG8gdGVkaW91cyByZWFkZXJzLCBidXQgbWF5YmUg
YXQgdGhlIGV4cGVuc2Ugb2YgcmVhZGFiaWxpdHkgKGlmDQo+IHRoYXQgbWFrZXMgc2Vuc2UpLg0K
PiANCj4gSSBkb24ndCBrbm93IHdoaWNoIHBhcnQgb2YgdGhlIGNvZGUgaXMgaW4gY2hhcmdlIG9m
IGV2YWx1YXRpbmcgdGhlc2UNCj4gZXhwcmVzc2lvbnMsIGlzIGl0IGVnLjoNCj4gaHR0cDovL2Vu
LmNwcHJlZmVyZW5jZS5jb20vdy9jcHAvbGFuZ3VhZ2Uvb3BlcmF0b3JfcHJlY2VkZW5jZSwNCj4g
aHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy9yZWZlcmVuY2UvZXhwcmVzc2lvbnMuaHRtbCNvcGVy
YXRvci1wcmVjZWRlbmNlLA0KPiBvciBiaXRiYWtlIG93biBzYXVjZS4uLi4NCj4gDQo+IEkgdGhp
bmsgbGljZW5zaW5nIGlzIGltcG9ydGFudCB0byBnZXQgcmlnaHQsIGNsZWFyIGFuZCByZWxpYWJs
ZS4NCj4gDQo+IENocmlzDQo=

