Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 911FA7D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:04:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6823tdU031993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jul 2019 19:04:05 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.194]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Sun, 7 Jul 2019 19:03:44 -0700
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: akuster808 <akuster808@gmail.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 1/2] keyutils: add new recipe for
	version 1.6.
Thread-Index: AQHVNTDXL6pp/1Wo3kambK3Y+VZVpaa/95iw
Date: Mon, 8 Jul 2019 02:03:44 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D19C4EB56@ALA-MBD.corp.ad.wrs.com>
References: <20190708015236.42034-1-yongxin.liu@windriver.com>
	<afcf7ce5-1f2e-c5d1-fca9-a2fcda677b35@gmail.com>
In-Reply-To: <afcf7ce5-1f2e-c5d1-fca9-a2fcda677b35@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/2] keyutils: add new recipe for version 1.6.
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
X-List-Received-Date: Mon, 08 Jul 2019 02:04:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IFttYWlsdG86
YWt1c3RlcjgwOEBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgSnVseSA4LCAyMDE5IDA5OjU5
DQo+IFRvOiBMaXUsIFlvbmd4aW47IHJhai5raGVtQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVkLQ0K
PiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRh
LW9lXVtQQVRDSCB2MiAxLzJdIGtleXV0aWxzOiBhZGQgbmV3IHJlY2lwZSBmb3INCj4gdmVyc2lv
biAxLjYuDQo+IA0KPiANCj4gDQo+IE9uIDcvNy8xOSA2OjUyIFBNLCBZb25neGluIExpdSB3cm90
ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25neGluIExpdSA8eW9uZ3hpbi5saXVAd2luZHJpdmVy
LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS1vZS9yZWNpcGVzLXNlY3VyaXR5L2tleXV0aWxzL2tl
eXV0aWxzXzEuNi5iYiB8IDM4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LW9lL3JlY2lwZXMtc2VjdXJpdHkva2V5dXRpbHMva2V5dXRpbHNfMS42LmJiDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXNlY3VyaXR5L2tleXV0aWxzL2tleXV0aWxzXzEu
Ni5iYiBiL21ldGEtDQo+IG9lL3JlY2lwZXMtc2VjdXJpdHkva2V5dXRpbHMva2V5dXRpbHNfMS42
LmJiDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAuLjNhMjZj
OTAyYQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc2VjdXJp
dHkva2V5dXRpbHMva2V5dXRpbHNfMS42LmJiDQo+IFRoaXMgcmVjaXBlIGlzIGluIG1ldGEtc2Vj
dXJpdHkgYW5kIGNvbnRhaW5zIHB0ZXN0cy4gRGlkIHlvdSB3YW50IHRoZQ0KPiBwdGVzdHMgYW5k
IG90aGVyIGZpeGVzIHRvbz8NCg0KVGhpcyByZWNpcGUgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBi
eSBvdGhlciByZWNpcGVzIGluIE9FLg0KRm9yIG90aGVyIGxheWVycywgSSB0aGluayB0aGV5IGNh
biB1c2UgdGhlaXIgb3duIGtleXV0aWxzLg0KDQpUaGFua3MsDQpZb25neGluDQoNCj4gLSBhcm1p
bg0KPiA+IEBAIC0wLDAgKzEsMzggQEANCj4gPiArU1VNTUFSWSA9ICJMaW51eCBLZXkgTWFuYWdl
bWVudCBVdGlsaXRpZXMiDQo+ID4gK0RFU0NSSVBUSU9OID0gIlRoZXNlIHRvb2xzIGFyZSB1c2Vk
IHRvIGNvbnRyb2wgdGhlIGtleSBtYW5hZ2VtZW50DQo+IHN5c3RlbSBidWlsdCBpbnRvIHRoZSBM
aW51eC4iDQo+ID4gKw0KPiA+ICtTRUNUSU9OID0gImJhc2UiDQo+ID4gKw0KPiA+ICtMSUNFTlNF
ID0gIkxHUEx2Mi4xKyAmIEdQTHYyLjArIg0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZp
bGU6Ly9MSUNFTkNFLkdQTDttZDU9NWY2ZTcyODI0ZjVkYTUwNWMxZjRhNzE5N2YwMDRiNDUgXA0K
PiA+ICsNCj4gZmlsZTovL0xJQ0VOQ0UuTEdQTDttZDU9N2QxY2FjYWEzZWE3NTJiNzJlYTVlNTI1
ZGY1NGEyMWYiDQo+ID4gKw0KPiA+ICtQViA9ICIxLjYrZ2l0JHtTUkNQVn0iDQo+ID4gKw0KPiA+
ICtTUkNfVVJJID0gIlwNCj4gPiArDQo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9kaG93ZWxscy9rZXl1dGlscy5naXQgXA0KPiA+ICsiDQo+ID4gKw0KPiA+
ICtTUkNSRVYgPSAiNDcyM2YwMTg1ZDExYjEzZGYyNDNhZDNjZDQxZmJkZGZlZDUzYjViMSINCj4g
PiArDQo+ID4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4gKw0KPiA+ICtFWFRSQV9PRU1BS0Ug
PSAiJ0NGTEFHUz0ke0NGTEFHU30gLVdhbGwnIg0KPiA+ICsNCj4gPiArSU5TVEFMTF9GTEFHUyA9
ICJcDQo+ID4gKyAgICBMSUJESVI9JHtsaWJkaXJ9IFwNCj4gPiArICAgIFVTUkxJQkRJUj0ke2xp
YmRpcn0gXA0KPiA+ICsgICAgQklORElSPSR7YmluZGlyfSBcDQo+ID4gKyAgICBTQklORElSPSR7
c2JpbmRpcn0gXA0KPiA+ICsgICAgRVRDRElSPSR7c3lzY29uZmRpcn0gXA0KPiA+ICsgICAgU0hB
UkVESVI9JHtkYXRhZGlyfSBcDQo+ID4gKyAgICBNQU5ESVI9JHttYW5kaXJ9IFwNCj4gPiArICAg
IElOQ0xVREVESVI9JHtpbmNsdWRlZGlyfSBcDQo+ID4gKyAgICBERVNURElSPSR7RH0gXA0KPiA+
ICsiDQo+ID4gKw0KPiA+ICtkb19pbnN0YWxsKCkgew0KPiA+ICsgICAgY2QgJHtTfSAmJiBvZV9y
dW5tYWtlICR7SU5TVEFMTF9GTEFHU30gaW5zdGFsbA0KPiA+ICt9DQo+ID4gKw0KPiA+ICtGSUxF
U18ke1BOfSArPSAiJHtkYXRhZGlyfS9yZXF1ZXN0LWtleS1kZWJ1Zy5zaCINCg0K

