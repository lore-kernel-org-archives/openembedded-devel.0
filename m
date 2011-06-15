Received: from smtp22.4emm.com ([69.18.222.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QWemJ-0008PB-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 03:20:19 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB22.4emm.local ([fe80::7cff:1819:796a:2546%14]) with mapi;
	Tue, 14 Jun 2011 21:13:30 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] prelink: Added prelink-20100106, which works on ARM.
Thread-Index: AQHMKnN6SfrLtVwp10y0WKgfnodR7JS9mtfw
Date: Wed, 15 Jun 2011 01:16:22 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02EA9D@MBX20.4emm.local>
References: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
	<1308043009.25285.219.camel@phil-desktop>
In-Reply-To: <1308043009.25285.219.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2011 01:20:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlc2RheSwgMTQgSnVuZSAyMDExIDU6MTcgUE0sIFBoaWwgQmx1bmRlbGwgd3JvdGU6DQo+
IE9uIFR1ZSwgMjAxMS0wNi0xNCBhdCAxNTo0OSArMDgwMCwgSmFtZXMgTGltYm91cmlzIHdyb3Rl
Og0KPiA+IFRoaXMgdmVyc2lvbiBvZiBwcmVsaW5rLCB0b2dldGhlciB3aXRoIGEgcGF0Y2ggYnkg
Q2Fyc3RlbiBNdW5rDQo+ID4gPGNhcnN0ZW5AbWFlbW8ub3JnPiwgdGFrZW4gZnJvbSBNZWVHbywg
Zml4ZXMgYW4gQVJNIGluY29tcGF0aWJpbGl0eQ0KPiA+IHdpdGggMjAwOTA5MjUuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBMaW1ib3VyaXMgPGphbWVzQGRpZ2l0YWxtYXR0ZXIuY29t
LmF1Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vcHJlbGluay0yMDEwMDEwNi1hcm0tZml4LnBhdGNoICAg
ICAgICAgICAgICAgICB8ICAgODYgKysrKysrKysrKysrKysrKysrKysNCj4gPiAgcmVjaXBlcy9w
cmVsaW5rL3ByZWxpbmtfMjAxMDAxMDYuYmIgICAgICAgICAgICAgICAgfCAgIDUzICsrKysrKysr
KysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9u
cygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA3NTUgcmVjaXBlcy9wcmVsaW5rL3ByZWxpbmstMjAx
MDAxMDYvcHJlbGluay0yMDEwMDEwNi1hcm0tZml4LnBhdGNoDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCByZWNpcGVzL3ByZWxpbmsvcHJlbGlua18yMDEwMDEwNi5iYg0KPiA+DQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvcmVjaXBlcy9wcmVsaW5rL3ByZWxpbmstMjAxMDAxMDYvcHJlbGluay0yMDEw
MDEwNi1hcm0tZml4LnBhdGNoDQo+ID4gYi9yZWNpcGVzL3ByZWxpbmsvcHJlbGluay0yMDEwMDEw
Ni9wcmVsaW5rLTIwMTAwMTA2LWFybS1maXgucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDc1
NQ0KPiA+IGluZGV4IDAwMDAwMDAuLmE2OTQ1NDENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvcmVjaXBlcy9wcmVsaW5rL3ByZWxpbmstMjAxMDAxMDYvcHJlbGluay0yMDEwMDEwNi1hcm0t
Zml4LnBhdGNoDQo+ID4gQEAgLTAsMCArMSw4NiBAQA0KPiA+ICtkaWZmIC1ydSBwcmVsaW5rLW9s
ZC9zcmMvYXJjaC1hcm0uYyBwcmVsaW5rL3NyYy9hcmNoLWFybS5jDQo+ID4gKy0tLSBwcmVsaW5r
LW9sZC9zcmMvYXJjaC1hcm0uYwkyMDA5LTA2LTE1IDA3OjM3OjUwLjAwMDAwMDAwMCAtMDQwMA0K
PiA+ICsrKysgcHJlbGluay9zcmMvYXJjaC1hcm0uYwkyMDEwLTA4LTE3IDAzOjM1OjA1LjAwMDAw
MDAwMCAtMDQwMA0KPiA+ICtAQCAtODMyLDcgKzgzMiw3IEBADQo+ID4gKyAgIC5SX0NPUFkgPSBS
X0FSTV9DT1BZLA0KPiA+ICsgICAuUl9SRUxBVElWRSA9IFJfQVJNX1JFTEFUSVZFLA0KPiA+ICsg
ICAucnR5cGVfY2xhc3NfdmFsaWQgPSBSVFlQRV9DTEFTU19WQUxJRCwNCj4gPiArLSAgLmR5bmFt
aWNfbGlua2VyID0gIi9saWIvbGQtbGludXguc28uMiIsDQo+ID4gKysgIC5keW5hbWljX2xpbmtl
ciA9ICIvbGliL2xkLWxpbnV4LnNvLjMiLA0KPiANCj4gVGhhdCBsb29rcyBsaWtlIGl0J3MgZ29p
bmcgdG8gYnJlYWsgT0FCSSBiaW5hcmllcy4gIEknbSBub3Qgc3VyZSB0byB3aGF0IGV4dGVudA0K
PiB3ZSBjYXJlIGFib3V0IHRob3NlIGFueW1vcmUsIGJ1dCBJJ20gbm90IHN1cmUgSSB3b3VsZCBk
ZXNjcmliZSB0aGlzIGFzIGENCj4gImZpeCIgZXhhY3RseS4NCj4gDQo+ID4gKy0gIHN3aXRjaCAo
dmZvcmsgKCkpDQo+ID4gKysgIHN3aXRjaCAocGlkPWZvcmsgKCkpDQo+ID4gKyAgICAgew0KPiA+
ICsgICAgIGNhc2UgLTE6DQo+ID4gKyAgICAgICBlcnJvciAoMCwgZXJybm8sICJDb3VsZCBub3Qg
cnVuICVzIiwgcGF0aCk7IEBAIC02Myw3ICs2NSw5IEBADQo+ID4gKyAJICBjbG9zZSAocFsxXSk7
DQo+ID4gKyAJfQ0KPiA+ICsgICAgICAgZHVwMiAoMSwgMik7DQo+ID4gKy0gICAgICBleGVjdmUg
KHBhdGgsIGFyZ3YsIGVudnApOw0KPiA+ICsrICAgICAgd2hpbGUgKCplbnZwKQ0KPiA+ICsrICAg
ICAgICBwdXRlbnYoKmVudnArKyk7DQo+ID4gKysgICAgICBleGVjdiAocGF0aCwgYXJndik7DQo+
ID4gKyAgICAgICBfZXhpdCAoMTI3KTsNCj4gDQo+IFdoYXQncyB0aGF0IGFib3V0Pw0KPiANCj4g
cC4NCg0KSGksDQoNCkkgYmVsaWV2ZSB0aGUgdmZvcmsoKSBjaGFuZ2VzIGFyZSBmb3IgcWVtdSBj
b21wYXRpYmlsaXR5IC0gSSBkb24ndCBrbm93IHdoYXQgdGhlIGlzc3VlIHdhcyBleGFjdGx5Lg0K
DQpJIGRpZG4ndCByZWFsaXNlIHRoZSBsaW5rZXIgdmVyc2lvbiB3YXMgZm9yIEVBQkkvT0FCSSBj
b21wYXRpYmlsaXR5IC0gSSBndWVzcyBwcmVsaW5rIHNob3VsZCBkZXRlcm1pbmUgdGhlIEFCSSBh
bmQgY2hvb3NlIGFjY29yZGluZ2x5Li4uIA0KQnV0IEkgZG9uJ3QgaGF2ZSBhbnkgT0FCSSBiaW5h
cmllcyBvbiBteSBzeXN0ZW0gYXQgYWxsLi4uDQpTbyB3ZSBjYW46DQoJMS4gRml4IGl0IHByb3Bl
cmx5DQoJMi4gU3dpdGNoIGZyb20gT0FCSSBvbmx5IHRvIEVBQkkgb25seQ0KCTMuIE1ha2UgYSBw
cmVsaW5rLWVhYmkgcmVjaXBlLg0KDQpJIGRvbid0IHJlYWxseSBoYXZlIHRoZSBwYXRpZW5jZSBm
b3IgMS4sIHNpbmNlIEkgaGF2ZSBubyBPQUJJIGJpbmFyaWVzLiBEb2VzIGFueW9uZSBoYXZlIGFu
eSBwcmVmZXJlbmNlcyBoZXJlPw0KDQpSZWdhcmRzLA0KSmFtZXMNCg0KDQo=


