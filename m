Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 079906C4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 10:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A533018512;
	Wed, 21 Nov 2018 11:35:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iP5_w9aU0K_m; Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 71FC618293;
	Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F03F1A07C;
	Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538B51A07F;
	Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 47D541BD5;
	Wed, 21 Nov 2018 11:35:49 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 21 Nov 2018 11:35:49 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 21 Nov 2018 11:35:49 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <martin@geanix.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] iwd: add version 0.12
Thread-Index: AQHUgXLZI0uRFezOl0qMq3dJpi7FmKVaAs3w
Date: Wed, 21 Nov 2018 10:35:49 +0000
Message-ID: <bb6f2afa98ad453e99aa779d7bf0c904@XBOX04.axis.com>
References: <20181121081012.118414-1-martin@geanix.com>
	<20181121081012.118414-3-martin@geanix.com>
In-Reply-To: <20181121081012.118414-3-martin@geanix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH 3/3] iwd: add version 0.12
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
X-List-Received-Date: Wed, 21 Nov 2018 10:35:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVsLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1hcnRpbiBIdW5kZWLD
uGxsDQo+IFNlbnQ6IGRlbiAyMSBub3ZlbWJlciAyMDE4IDA5OjEwDQo+IFRvOiBvcGVuZW1iZWRk
ZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBbb2VdIFttZXRhLW9l
XVtQQVRDSCAzLzNdIGl3ZDogYWRkIHZlcnNpb24gMC4xMg0KPiANCj4gVGhlIGl3ZCB3aXJlbGVz
cyBkYWVtb24gaXMgYW4gYWx0ZXJuYXRpdmUgdG8gd3BhX3N1cHBsaWNhbnQuIEl0IGlzDQo+IGNv
bnRyb2xsZWQgdXNpbmcgdGhlIGl3Y3RsIGNvbW1hbmQgbGluZSBjbGllbnQgKG9yIHRoZSBkYnVz
IGludGVyZmFjZSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+DQo+IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9p
d2QvaXdkXzAuMTIuYmIgfCAyNCArKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2l3ZC9pd2RfMC4xMi5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXdkL2l3ZF8wLjEyLmJiIGIvbWV0YS0NCj4gb2UvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXdkL2l3ZF8wLjEyLmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMC4uYTQyNjE1NDdlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pd2QvaXdkXzAuMTIuYmINCj4gQEAgLTAsMCAr
MSwyNCBAQA0KPiArREVTQ1JJUFRJT04gPSAiV2lyZWxlc3MgZGFlbW9uIGZvciBMaW51eCINCj4g
K0xJQ0VOU0UgPSAiTEdQTC0yLjEiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT1mYjUwNGI2N2M1MDMzMWZjNzg3MzRmZWQ5MGZiMGUwOSINCj4gKw0KPiAraW5oZXJp
dCBhdXRvdG9vbHMgcGtnY29uZmlnIHN5c3RlbWQNCj4gKw0KPiArREVQRU5EUyA9ICJlbGwgcmVh
ZGxpbmUgZGJ1cyINCg0KR2l2ZW4gdGhhdCB0aGUgcmVhZGxpbmUgbGlicmFyeSBpcyBHUEx2Mywg
aXQgaXMgcHJvYmFibHkgYSBnb29kIGlkZWEgDQp0byBiZSBhYmxlIHRvIGRpc2FibGUgdGhlIHBh
cnQgdGhhdCB1c2VzIGl0LiBJLmUuLCBzb21ldGhpbmcgbGlrZToNCg0KUEFDS0FHRUNPTkZJR1tj
bGllbnRdID0gIi0tZW5hYmxlLWNsaWVudCwgLS1kaXNhYmxlLWNsaWVudCwgcmVhZGxpbmUsIg0K
DQphbmQgYWRkICJjbGllbnQiIHRvIFBBQ0tBR0VDT05GSUcgYnkgZGVmYXVsdC4NCg0KPiArDQo+
ICtTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbmV0d29yay93aXJlbGVz
cy9pd2QuZ2l0Ig0KPiArU1JDUkVWID0gImQ3NjA5OTE1ZGI0YjU3MjI5ZjdkZDRjMDRiNGVhYmNj
ZTYzNzg3MmEiDQo+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiArDQo+ICtTWVNURU1EX1NFUlZJ
Q0VfJHtQTn0gPSAiaXdkLnNlcnZpY2UiDQo+ICsNCj4gK1BBQ0tBR0VDT05GSUcgPz89ICIke0Bi
Yi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgZCl9Ig0KPiArUEFD
S0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICItLXdpdGgtc3lzdGVtZC11bml0ZGlyPSR7c3lzdGVtZF9z
eXN0ZW1fdW5pdGRpcn0sLS1kaXNhYmxlLXN5c3RlbWQtc2VydmljZSxzeXN0ZW1kIg0KPiArDQo+
ICtFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLWV4dGVybmFsLWVsbCINCj4gKw0KPiArZG9fY29u
ZmlndXJlX3ByZXBlbmQgKCkgew0KPiArICAgIG1rZGlyIC1wICR7U30vYnVpbGQtYXV4DQo+ICt9
DQo+ICsNCj4gK0ZJTEVTXyR7UE59ICs9ICIke2RhdGFkaXJ9L2RidXMtMSINCj4gLS0NCj4gMi4x
OS4xDQoNCi8vUGV0ZXINCg0K

