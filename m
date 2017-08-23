Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBDC878227
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 00:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N0bMgw004194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 17:37:22 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Tue, 22 Aug 2017 17:37:21 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] mozjs: customize HOST_CFLAGS
Thread-Index: AQHTG6XDucYE+nUch0aYsl8Um3YPq6KRFw0A
Date: Wed, 23 Aug 2017 00:37:21 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B86EC4D@ALA-MBD.corp.ad.wrs.com>
References: <20170822070258.27716-1-jackie.huang@windriver.com>
	<CAJ86T=WihaULMmH5uQwtxsgDfsXFy4YH=PznYGm-uz=g2q9O8w@mail.gmail.com>
In-Reply-To: <CAJ86T=WihaULMmH5uQwtxsgDfsXFy4YH=PznYGm-uz=g2q9O8w@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.90]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: customize HOST_CFLAGS
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
X-List-Received-Date: Wed, 23 Aug 2017 00:37:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmUgTWNDdXJkeSBb
bWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDIz
LCAyMDE3IDA4OjIxDQo+IFRvOiBIdWFuZywgSmllIChKYWNraWUpDQo+IENjOiBvcGVuZW1iZWRl
ZC1kZXZlbA0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIG1vempzOiBjdXN0
b21pemUgSE9TVF9DRkxBR1MNCj4gDQo+IE9uIFR1ZSwgQXVnIDIyLCAyMDE3IGF0IDEyOjAyIEFN
LCAgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBNaW5nbGkg
WXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPg0KPiA+DQo+ID4gQ3VzdG9taXplIEhPU1RfQ0ZM
QUdTLCBIT1NUX0NYWEZMQUdTIGFuZCBIT1NUX0xERkxBR1MNCj4gPiB0byBmaXggZG9fY29uZmln
dXJlIGVycm9yIGFzIHByZXZpb3VzbHkgdXNlIHRoZSBjb21tb24NCj4gPiBDRkxBR1MgYW5kIENY
WEZMQUdTIGluIGJvdGggY3Jvc3MtY29tcGlsZSBlbnYgYW5kIGhvc3QgZW52LA0KPiA+IGFuZCB0
aGUgb3B0aW9uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyB3aGljaCBub3QNCj4gPiByZWNvZ25p
emVkIGluIGhvc3QgZW52IGNhbiByZXN1bHQgaW4gZG9fY29uZmlndXJlDQo+ID4gZXJyb3IgYXMg
YmVsb3cuDQo+IA0KPiBUaGF0IHNob3VsZCBhbHJlYWR5IGJlIHNvbHZlZCBieToNCj4gDQo+ICAg
aHR0cDovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtDQo+IG9wZW5lbWJlZGRlZC9jb21taXQv
P2lkPWEwYjJlNmY0ZmNhN2FjOTA3ZWI3ZDZlMDZjYTRjMTU4MWE1YzU1M2YNCg0KVGhhbmtzIGZv
ciBwb2ludGluZyB0aGF0IG91dCENCg0KPiANCj4gV2hpY2ggdmVyc2lvbiBvZiBtZXRhLW9lIGFy
ZSB5b3UgdGVzdGluZyB3aXRoPw0KDQpJIHRoaW5rIGl0J3MgTW9ydHksIHNvcnJ5IHRoYXQgSSBk
aWRuJ3QgY2hlY2sgd2l0aCB0aGUgbGF0ZXN0IGJlZm9yZSBzZW5kaW5nIHRoZSBwYXRjaC4NCg0K
VGhhbmtzLA0KSmFja2llDQoNCj4gDQo+ID4gfCBjaGVja2luZyB3aGV0aGVyIHRoZSBob3N0IGMg
Y29tcGlsZXIgKGdjYyAtTzIgLXBpcGUgLWcgLWZzdGFjay1wcm90ZWN0b3ItDQo+IHN0cm9uZyAt
RF9GT1JUSUZZX1NPVVJDRT0yIC1XbCwtTzEgLVdsLC0taGFzaC1zdHlsZT1nbnUgLVdsLC0tYXMt
bmVlZGVkIC0NCj4gZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdsLC16LHJlbHJvLC16LG5vdykg
d29ya3MuLi4gY29uZmlndXJlOiBlcnJvcjoNCj4gaW5zdGFsbGF0aW9uIG9yIGNvbmZpZ3VyYXRp
b24gcHJvYmxlbTogaG9zdCBjb21waWxlciBnY2MgY2Fubm90IGNyZWF0ZQ0KPiBleGVjdXRhYmxl
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZl
ci5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdAd2lu
ZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL21vempz
L21vempzXzE3LjAuMC5iYiB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbW96
anMvbW96anNfMTcuMC4wLmJiIGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1leHRlbmRlZC9tb3pqcy9t
b3pqc18xNy4wLjAuYmINCj4gPiBpbmRleCBiNjc0NDM5NWYuLmI3MmVlN2JiMyAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbW96anMvbW96anNfMTcuMC4wLmJiDQo+
ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL21vempzL21vempzXzE3LjAuMC5iYg0K
PiA+IEBAIC01MSw2ICs1MSw5IEBAIFBBQ0tBR0VDT05GSUdbeDExXSA9ICItLXdpdGgteCAtLXgt
DQo+IGluY2x1ZGVzPSR7U1RBR0lOR19JTkNESVJ9IC0teC1saWJyYXJpZXM9JHtTVA0KPiA+DQo+
ID4gICMgbW96anMgcmVxdWlyZXMgYXV0b3JlY29uZiAyLjEzDQo+ID4gIGRvX2NvbmZpZ3VyZSgp
IHsNCj4gPiArICAgIGV4cG9ydCBIT1NUX0NGTEFHUz0iJHtCVUlMRF9DRkxBR1N9Ig0KPiA+ICsg
ICAgZXhwb3J0IEhPU1RfQ1hYRkxBR1M9IiR7QlVJTERfQ1BQRkxBR1N9Ig0KPiA+ICsgICAgZXhw
b3J0IEhPU1RfTERGTEFHUz0iJHtCVUlMRF9MREZMQUdTfSINCj4gPiAgICAgICggY2QgJHtTfQ0K
PiA+ICAgICAgICBnbnUtY29uZmlnaXplIC0tZm9yY2UNCj4gPiAgICAgICAgbXYgY29uZmlnLmd1
ZXNzIGNvbmZpZy5zdWIgYnVpbGQvYXV0b2NvbmYgKQ0KPiA+IC0tDQo+ID4gMi4xMS4wDQo+ID4N
Cj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

