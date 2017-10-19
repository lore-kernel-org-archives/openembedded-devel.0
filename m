Return-Path: <kwangsub.kim@qt.io>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30136.outbound.protection.outlook.com [40.107.3.136])
	by mail.openembedded.org (Postfix) with ESMTP id 545C471D9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=F0arPjmlWytufGTUic6tXML/7L1cIQIXdh/4nU5PJp0=;
	b=rWuvvgmLnh3LQq8n3P3616YuN9Nr8RCHq/gbjROxowy/nu452l0GNTyYag/Ws8dZEuvYJBxkk3RJ4irNooWDtfdUrAyVgV0AaNSHRHIFKesNpM7AmEBOzCVRVdHD2MuRLFX/5tVvkYJiR+TIbilDnpDthTnMrUBJ7qWc1iOVAdI=
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) by
	HE1PR0202MB2492.eurprd02.prod.outlook.com (10.168.183.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Thu, 19 Oct 2017 07:07:28 +0000
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::a191:7106:b9ab:6304]) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::a191:7106:b9ab:6304%14]) with mapi id 15.20.0077.023;
	Thu, 19 Oct 2017 07:07:28 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: Christian Gagneraud <chgans@gmail.com>
Thread-Topic: [oe] [meta-qt5][PATCH] qt5: add missing commercial license
Thread-Index: AQHTMsBwP8B5iU45RkSTg+Kq9mUZy6K/YLRAgCWXUwCABfRPgA==
Date: Thu, 19 Oct 2017 07:07:28 +0000
Message-ID: <D38AD408-F299-4144-B45E-5AF22966F458@qt.io>
References: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
	<CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
	<HE1PR0202MB2491EF42CA7564345575961086660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
	<CABxGUTgSUMy2y3OhCRbXJeVseti77DUc+-e+XsN61BjwW0jT+Q@mail.gmail.com>
In-Reply-To: <CABxGUTgSUMy2y3OhCRbXJeVseti77DUc+-e+XsN61BjwW0jT+Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
x-originating-ip: [175.195.156.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0202MB2492;
	6:0cyWTHHN6S/EyCjmb27FiQlN7DrPctOW6cPz5/VP8AnFlis3egFqwfhPdlybRMyyFBx2AgdNMLDl73Q+2L+XsmR2P0G2diOlyYNSXJ97sQw7T+158kAcNp62rKJoNXwjMRnjVbGdylWHtdxkd1eBIcXE4AGTew6OTTdlpbN+68DsUbeZCT2yafMGW9Rf9p6bXWdK3NDohO+TPdX2Mf7BXlHSNubFExzvijZ5bTMn1R3riirejarf9wUMOpMNSurR978Bga7W9jtDNAI1t1zVuPuM0/2UDfXzcHW1c+YEBTs5pnDFjyAqI4hzXLHvqpDUIPwnj2kyq75+qLCuNPeQWA==;
	5:RnnaXs+O++PIyspSF4zrnnHAl4eh2rlRyzTMbHVqdarb7iGfVIrds1XBaoPw1zwc6LCtU8bCQuMR6eCni6uDDjRv+tl631I9NrfqXoAWsMIQ/b0JJ00uCYDi6Gdc3ZtV/drAF/qDeG3hvPZtEMmUtQ==;
	24:QAy5aMiIJ5RWg4pOptu37O7el/aDdLuLrMSLbjSwchwlTZL18yjtIVXA62QbYgSDa/+9NDS+fjTHU8M5sZq2183dB+EYL1Q+d90SYRj2nM0=;
	7:zW9b8eX6nRYkdckM32q7Z/veckQRGPzQUf0C2cvpCQMZ75yw5T8G5vGQ8Xj65kDFr+GG7esMxmZ2LfEYdJj9e8HX1fgc7TlgSXaPhowpJe7yzVO5wxR2lCPi5kcxvMjryF+XPUCklzQr6UiBNcnjLEycVdBtiRzJT5dBau5ZGRPcm4zcc60nvZsL/SidOEZdLl96BlACldF8Ke+npdPqktmoUHXe0bhlS93pHFLz3lE=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 0d3b41f2-ad2e-4701-4b75-08d516c00ef6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:HE1PR0202MB2492; 
x-ms-traffictypediagnostic: HE1PR0202MB2492:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <HE1PR0202MB24929118E03907D7DB40B63086420@HE1PR0202MB2492.eurprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(6041248)(20161123562025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0202MB2492; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0202MB2492; 
x-forefront-prvs: 0465429B7F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(346002)(376002)(199003)(24454002)(189002)(377454003)(51444003)(305945005)(5250100002)(2950100002)(2906002)(106356001)(68736007)(74482002)(86362001)(105586002)(76176999)(6512007)(101416001)(50986999)(316002)(3660700001)(3280700002)(97736004)(33656002)(54356999)(478600001)(2900100001)(4326008)(8676002)(7736002)(3846002)(102836003)(6116002)(8936002)(14454004)(81166006)(81156014)(93886005)(83716003)(99286003)(1411001)(25786009)(6916009)(6246003)(189998001)(53546010)(5660300001)(229853002)(36756003)(66066001)(53936002)(6486002)(39060400002)(6436002)(82746002)(6506006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2492;
	H:HE1PR0202MB2491.eurprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2017 07:07:28.2566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2492
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
X-List-Received-Date: Thu, 19 Oct 2017 07:39:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <848AA1F8A302F5488F8C87CC1F05895E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuLA0KDQpJIHRoaW5rIHRoZXJl4oCZcyBhbWJpZ3VpdHkgaW4gdHdvIHJlc3Bl
Y3RzLiBPbmUgaXMgb24gdGhlIGxvZ2ljYWwgZXhwcmVzc2lvbiBpdHNlbGYgKFRoYXTigJlzIHdo
YXQgeW91IHBvaW50ZWQgb3V0IGJlZm9yZSkuIEFuZCB0aGUgb3RoZXIgb25lIGlzIHJlbGF0ZWQg
dG8gbGljZW5zZSBtYW5hZ2VtZW50IG9mIFlvY3RvIChvciBsZWdhbCBsaWFiaWxpdHkgc29tZXRp
bWVzKS4gVGhlIGZvcm1lciBpcyBzaW1wbGUgYW5kIHRoZSBsYXR0ZXIgd291bGQgYmUgY29tcGxl
eC4NCkFzIGZhciBhcyBJIGtub3csIFF04oCZcyBtZXRhLXF0NSBpcyBhbG1vc3Qgc2FtZSBhcyB0
aGUgdXBzdHJlYW0gbWV0YS1xdDUgYXQgbGVhc3QgZm9yIGxpY2Vuc2UgZXhwcmVzc2lvbnMuIEJh
c2ljYWxseSwgUXQgaXMgdW5kZXIgZHVhbCBsaWNlbnNlcyBhbmQgaXRzIGxpY2Vuc2UgaXMgYWxz
byBkZWNsYXJlZCBpbiB0aGUgc2FtZSBtYW5uZXIuIEN1cnJlbnRseSB0aGVyZeKAmXMgbm8gZXhw
bGljaXQgb3B0aW9uIHRvIGNob29zZSBvbmUgYW5kIGl0IHdvdWxkIGJlIHNlbGVjdGVkIGltcGxp
Y2l0bHkgd2l0aCBhdmFpbGFibGUgbGljZW5zZXMg4oCTIGl0IGxlYWRzIHRvIHRoZSBsYXR0ZXIg
YW1iaWd1aXR5LiBJbiBteSBodW1ibGUgb3BpbmlvbiwgaXQgaXMgbmF0dXJhbCB0byBkZXNjcmli
ZSBsaWNlbnNlcyBieSByZWZsZWN0aW5nIHRoZSB0ZXJtcyBpbiB0aGUgY29kZSBsaWtlIG5vdy4g
Rm9yIGNvbW1lcmNpYWwgbGljZW5zZSwgdGhlIFF0IGNvbXBhbnkgc2hvdWxkIGd1aWRlIGEgY29y
cmVjdCB3YXkgdG8gYSBjb21tZXJjaWFsIGxpY2Vuc2VlIHNlcGFyYXRlbHkuIEkgYmVsaWV2ZSBp
dCBpcyBvbiB0aGUgd2F5Lg0KDQpUaGFua3MgZm9yIHlvdXIgdGhvdWdodGZ1bCBtZXNzYWdlcyEN
Ckt3YW5nc3ViDQoNCk9uIDE1LzEwLzIwMTcsIDk6MTEgUE0sICJDaHJpc3RpYW4gR2FnbmVyYXVk
IiA8Y2hnYW5zQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAyMiBTZXB0ZW1iZXIgMjAxNyBh
dCAwMjozMSwgS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW8+IHdyb3RlOg0KICAgID4g
SSBhZ3JlZSBvbiBjbGVhcmluZyB1cCBjb21wbGV4IGxvZ2ljYWwgZXhwcmVzc2lvbnMgb2YgbGlj
ZW5zZXMuIEJ1dA0KICAgID4gSSB0aGluayBpdCdzIGFub3RoZXIgdG9waWMgYmVjYXVzZSBpdCB3
b3VsZCBuZWVkIHdpZGVyIHVwZGF0ZXMgaW5jbHVkaW5nDQogICAgPiB0aGUgb3RoZXIgcGFja2Fn
ZXMgdW5yZWxhdGVkIHRvIGNvbW1lcmNpYWwgbGljZW5zZSBmaXguDQogICAgPiBXaGF0IGFib3V0
IGRpc2N1c3NpbmcgYWJvdXQgaXQgb24gbmV3IHRocmVhZCBhZnRlciB0aGlzIHBhdGNoPw0KICAg
IA0KICAgIFllYWgsIG1heWJlLiBEb2VzIFlvY3RvIGNhcmUgYWJvdXQgbGljZW5zZSBhbWJpZ3Vp
dHk/IE15IHVuZGVyc3RhbmRpbmcNCiAgICB3YXMgdGhhdCB5ZXMgaXQgZG9lcy4NCiAgICBUaGUg
cGl0Y2ggaXMgdGhhdCBpdCdzIG9uZSBvZiB0aGUgWW9jdG8ncyBzdHJlbmd0aDogZ2V0IGEgY2xl
YXINCiAgICBwaWN0dXJlIGFib3V0IGxpY2Vuc2UgaXNzdWUsIGlzbid0IGl0Pw0KICAgIA0KICAg
IEkndmUgYmVlbiBmb2xsb3dpbmcgYW5kIHVzaW5nIHlvY3RvL2JpdGJha2Uvb2UvcG9reS9hbmdz
dHJvbS8uLi4gZm9yIGENCiAgICB3ZWUgd2hpbGUgbm93IGFuZCBpIHRoaW5rIHRoYXQgdGhlIGN1
cnJlbnQgc3RhdGUgb2YgbGljZW5zaW5nIGlzDQogICAgb3V0LW9mLWNvbnRyb2wsIHlldCBZb2N0
by9MRiBwcmV0ZW5kcyB0byBiZSBpbiBmdWxsLWNvbnRyb2wuDQogICAgDQogICAgUXQgbGljZW5z
aW5nIGlzIG5vdCBhbiBlYXN5IHRvcGljLiBUaGUgTGludXggRnVuZGF0aW9uIG5lZWRzIHRvIGJl
DQogICAgcmF6b3Igc2hhcnAgYWJvdXQgaXQuDQogICAgDQogICAgV2hhdCBjYW4gaSBhY2Nlc3Mg
ZnJvbSBtZXRhLXF0NSBpbiBbTF1HUEx2KDJ8MykgbW9kZT8NCiAgICBJcyBMRidzIG1ldGEtcXQ1
IHNhZmVyIHRoYW4gUXQncyBvd24gbWV0YS1xdDU/DQogICAgDQogICAgV2hhdCBpIGNhbiBhY2Nl
c3Mgd2l0aCBhIGNvbW1lcmNpYWwgUXQgbGljZW5zZSBhcyBvZiBPY3RvYmVyIDIwMTcgaXMNCiAg
ICBwdXJlbHkgYSAiVGhlIFF0IENvbXBhbnkiIGJ1c2luZXNzIGRlY2lzaW9uLg0KICAgIA0KICAg
ICJIYWNrZXJzIiB3YW4ndCB0byBrbm93LCB3aXRob3V0IGFtYmlndWl0eSwgd2hhdCB0aGV5IGhh
dmUgYWNjZXNzIHRvDQogICAgZ2l2ZW4gYSAibGljZW5zZSIgY29udGV4dCAoT3BlbiBzb3VyY2Ug
b3IgY29tbWVyY2lhbCkuDQogICAgDQogICAgTXkgMiBjZW50cy4NCiAgICBDaHJpcw0KICAgIA0K
DQo=

