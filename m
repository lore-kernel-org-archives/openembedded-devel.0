Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EAAC7EFEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 17:14:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6BHDmhg005041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2019 10:14:03 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.194]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Thu, 11 Jul 2019 10:13:47 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH 1/1] drbd-utils: enable
	reproducible_build awareness
Thread-Index: AQHVN3sp+ZckOnUhY0OM82wL52bd/KbFfDgAgAAsB5A=
Date: Thu, 11 Jul 2019 17:13:46 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA81B350@ALA-MBD.corp.ad.wrs.com>
References: <20190710235657.97551-1-joe.slater@windriver.com>
	<CAMKF1sqf=s9QFozJc0tsUZOt=aAAG_R7jiiaVyuyb22YiXgWjg@mail.gmail.com>
In-Reply-To: <CAMKF1sqf=s9QFozJc0tsUZOt=aAAG_R7jiiaVyuyb22YiXgWjg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.209.216]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] drbd-utils: enable reproducible_build awareness
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
X-List-Received-Date: Thu, 11 Jul 2019 17:14:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDExLCAyMDE5IDEy
OjMzIEFNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaA0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwNCj4g
U3ViamVjdDogUmU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0ggMS8xXSBkcmJkLXV0aWxz
OiBlbmFibGUNCj4gcmVwcm9kdWNpYmxlX2J1aWxkIGF3YXJlbmVzcw0KPiANCj4gT24gV2VkLCBK
dWwgMTAsIDIwMTkgYXQgNDo1NyBQTSBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gRW5hYmxlIHVzZSBvZiBTT1VSQ0VfREFURV9FUE9DSCBm
cm9tIHRoZSByZXByb2R1Y2libGVfYnVpbGQgYmJjbGFzcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAg
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kcmJkL2RyYmQtdXRpbHNfOS4xMC4wLmJi
IHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvZHJiZC9kcmJkLXV0
aWxzXzkuMTAuMC5iYg0KPiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvZHJiZC9k
cmJkLXV0aWxzXzkuMTAuMC5iYg0KPiA+IGluZGV4IDcwZTA0YjkuLjdmZDMwOTAgMTAwNjQ0DQo+
ID4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kcmJkL2RyYmQtdXRpbHNf
OS4xMC4wLmJiDQo+ID4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kcmJk
L2RyYmQtdXRpbHNfOS4xMC4wLmJiDQo+ID4gQEAgLTM1LDYgKzM1LDkgQEAgRVhUUkFfT0VDT05G
ID0gIiBcDQo+ID4gICAgICAgICAgICAgICAgICAtLXdpdGhvdXQtbWFudWFsIFwNCj4gPiAgICAg
ICAgICAgICAgICAgIg0KPiA+DQo+ID4gKyMgSWYgd2UgaGF2ZSBpbmhlcml0ZWQgcmVwcm9kdWNp
YmxlX2J1aWxkLCB3ZSB3YW50IHRvIHVzZSBpdC4NCj4gPiArZXhwb3J0IFdBTlRfRFJCRF9SRVBS
T0RVQ0lCTEVfQlVJTEQgPSAieWVzIg0KPiANCj4gc2hvdWxkIHRoaXMgYmUgc2V0IGFmdGVyIGNo
ZWNraW5nIGZvciBpbmhlcml0IA0KDQpbSm9lIFNsYXRlcl0gVGhpcyB2YXJpYWJsZSBpcyBhbHdh
eXMgcXVlcmllZCBhbmQgdGhlIGNvZGUgY2hlY2tzIGZvciBhIHJlcHJvZHVjaWJsZV9idWlsZCBl
bnZpcm9ubWVudCwgc28gd2UgZG9uJ3QgbmVlZCB0byB0ZXN0IGhlcmUuDQoNCj4gPiArDQo+ID4g
IGRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgew0KPiA+ICAgICAgIyBtb3ZlIHRoZSB0aGUgZmlsZSB1
bmRlciBmb2xkZXIgL2xpYi9kcmJkLyB0byAvdXNyL2xpYi9kcmJkIHdoZW4NCj4gdXNybWVyZ2Ug
ZW5hYmxlZA0KPiA+ICAgICAgaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJF
UycsICd1c3JtZXJnZScsICd0cnVlJywgJ2ZhbHNlJywgZCl9Ow0KPiB0aGVuDQo+ID4gLS0NCj4g
PiAyLjcuNA0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
PiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVs
DQo=

