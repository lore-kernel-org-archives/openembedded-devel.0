Return-Path: <ismo.puustinen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DFB8C71A0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 12:26:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 03 May 2017 05:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="1143097781"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2017 05:26:17 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.107]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.12]) with mapi id
	14.03.0319.002; Wed, 3 May 2017 13:26:14 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] libdevmapper: enable native support.
Thread-Index: AQHSw/xqwtF15kyPJkCm+8wBrq+q8aHiZ1gAgAAQ0gA=
Date: Wed, 3 May 2017 12:26:14 +0000
Message-ID: <1493814372.18488.2.camel@intel.com>
References: <20170503105945.28388-1-ismo.puustinen@intel.com>
	<4763ed6bb356444fafd6a0c60df2f7c7@XBOX02.axis.com>
In-Reply-To: <4763ed6bb356444fafd6a0c60df2f7c7@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.72]
MIME-Version: 1.0
Subject: Re: [PATCH] libdevmapper: enable native support.
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
X-List-Received-Date: Wed, 03 May 2017 12:26:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFAD9531142C9C4480CF93DB68CD4281@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA1LTAzIGF0IDExOjI2ICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3Jv
dGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBvcGVuZW1iZWRk
ZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gW21haWx0bzpvcGVu
ZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbg0KPiA+IEJl
aGFsZiBPZg0KPiA+IElzbW8gUHV1c3RpbmVuDQo+ID4gU2VudDogZGVuIDMgbWFqIDIwMTcgMTM6
MDANCj4gPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PiBTdWJqZWN0OiBbb2VdIFtQQVRDSF0gbGliZGV2bWFwcGVyOiBlbmFibGUgbmF0aXZlIHN1cHBv
cnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXNtbyBQdXVzdGluZW4gPGlzbW8ucHV1c3Rp
bmVuQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2
bTIvbGliZGV2bWFwcGVyXzIuMDIuMTY2LmJiIHwgNCArKystDQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbGliZGV2bWFwcGVyXzIuMDIuMTY2LmJiDQo+
ID4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2xpYmRldm1hcHBlcl8yLjAyLjE2Ni5i
Yg0KPiA+IGluZGV4IDQ2MmU4ZmIuLjM3YzBhOTcgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQvbHZtMi9saWJkZXZtYXBwZXJfMi4wMi4xNjYuYmINCj4gPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2xpYmRldm1hcHBlcl8yLjAyLjE2Ni5iYg0KPiA+
IEBAIC0yOCw0ICsyOCw2IEBAIGRvX2luc3RhbGxfYXBwZW5kKCkgew0KPiA+IMKgwqDCoMKgwqBy
bSAtcmYgJHtEfSR7ZGF0YWRpcn0NCj4gPiDCoH0NCj4gPiANCj4gPiAtUlJFQ09NTUVORFNfJHtQ
Tn0gKz0gImx2bTItdWRldnJ1bGVzIg0KPiA+ICtSUkVDT01NRU5EU18ke1BOfV9jbGFzcy10YXJn
ZXQgKz0gImx2bTItdWRldnJ1bGVzIg0KPiANCj4gVGhhdCBzaG91bGQgYmUgZWl0aGVyOg0KPiAN
Cj4gUlJFQ09NTUVORFNfJHtQTn1fYXBwZW5kX2NsYXNzLXRhcmdldCA9ICIgbHZtMi11ZGV2cnVs
ZXMiDQo+IA0KPiBvcjoNCj4gDQo+IFJSRUNPTU1FTkRTXyR7UE59X2NsYXNzLXRhcmdldCA9ICJs
dm0yLXVkZXZydWxlcyINCj4gDQo+IFVzaW5nIEZPT19jbGFzcy10YXJnZXQgKz0gIi4uLiIgZ2l2
ZXMgdGhlIGltcHJlc3Npb24gdGhhdCBpdCBhZGRzIHRvwqANCj4gRk9PLCBidXQgaXQgZG9lcyBu
b3QsIGl0IGFkZHMgdG8gRk9PX2NsYXNzLXRhcmdldCB3aGljaCB0aGVuDQo+IGNvbXBsZXRlbHnC
oA0KPiByZXBsYWNlcyBGT08gZm9yIHRhcmdldCBidWlsZHMuIEUuZy4sIHdpdGggdGhlIGZvbGxv
d2luZyB0d28NCj4gZGVmaW5pdGlvbnM6DQo+IA0KPiBGT08gPSAiZm9vIg0KPiBGT09fY2xhc3Mt
dGFyZ2V0ICs9ICJiYXIiDQo+IA0KPiB0aGVuICR7Rk9PfSB3aWxsIGJlICJiYXIiIGZvciB0YXJn
ZXQgYnVpbGRzIGFuZCAiZm9vIiBmb3IgYWxsIG90aGVywqANCj4gYnVpbGRzLiBJdCB3aWxsIG5l
dmVyIGJlICJmb28gYmFyIi4NCj4gDQo+ID4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2
ZXNkayINCj4gPiAtLQ0KPiA+IDIuOS4zDQo+IA0KPiAvL1BldGVyDQoNCkdvb2QgcG9pbnQuIEkn
bGwgcHJlcGFyZSBhIHNlY29uZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4gSSBmb3VuZCBpdCBiaXQN
CnN1cnByaXNpbmcgdGhhdCBSUkVDT01NRU5EUyBpcyBldmVuIGEgdGhpbmcgZm9yIG5hdGl2ZSBy
ZWNpcGVzLi4uDQoNCklzbW8NCiA=

