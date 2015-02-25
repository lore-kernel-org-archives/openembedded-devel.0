Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 146B860670
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 23:56:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2015 15:52:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,648,1418112000"; d="scan'208";a="671726286"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2015 15:56:36 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.113]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.154]) with mapi id
	14.03.0195.001; Wed, 25 Feb 2015 15:56:36 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] iecedtea7-native will not build. Possible fix attached
Thread-Index: AdBP+fLsafhPhiqMR7u7y2+QNY7AcwAnZhQAAAIuMgAAPlHIAA==
Date: Wed, 25 Feb 2015 23:56:35 +0000
Message-ID: <1424908510.7043.12.camel@hbruce-desk3.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D1276975E1@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKo1c8NuZvTY-j+dbiYVeRo4Qe6HdqHEdiZULPxNb4ASpQ@mail.gmail.com>
	<20150224181045.GF1284@saldanha.aker.com.br>
In-Reply-To: <20150224181045.GF1284@saldanha.aker.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.120]
MIME-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: iecedtea7-native will not build. Possible fix attached
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 23:56:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B1781F638602949B130F4A1A4444138@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE1LTAyLTI0IGF0IDE1OjEwIC0wMzAwLCBIdWdvIFZhc2NvbmNlbG9zIFNhbGRh
bmhhIHdyb3RlOg0KPiBPbiBUdWUsIEZlYiAyNCwgMjAxNSBhdCAwMjowODoyMFBNIC0wMzAwLCBP
dGF2aW8gU2FsdmFkb3Igd3JvdGU6DQo+ID4gT24gVHVlLCBGZWIgMjQsIDIwMTUgYXQgMzozNyBB
TSwgQnJ1Y2UsIEhlbnJ5IDxoZW5yeS5icnVjZUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gSGVs
bG8gb3BlbmpkayBjb21tdW5pdHksDQo+ID4gPg0KPiA+ID4gaWVjZWR0ZWE3LW5hdGl2ZSBmcm9t
IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtamF2YSBkb2Vzbid0IGJ1aWxkIGR1ZSB0
byB3ZWxsIGRvY3VtZW50ZWQgVHVya2lzaCBjdXJyZW5jeSBleHBpcmF0aW9uIHByb2JsZW0uIFRo
aXMgaGFzIGJlZW4gZml4ZWQgZm9yIGljZWR0ZWE2IHNvIEkgYm9ycm93ZWQgdGhlIHBhdGNoIChu
b3Qgc3VyZSBpZiB0aGlzIGlzIGFwcHJvcHJpYXRlKSBhbmQgcHV0IGludG8gYSB0aGUgYXR0YWNo
ZWQgYmJhcHBlbmQgdGhhdCBmaXhlcyB0aGUgcHJvYmxlbS4gSSB3ZW50IHdpdGggYSBiYmFwcGVu
ZCBhcyBJIHdhc24ndCBzdXJlIG9mIHRoZSBwcm9jZXNzIGZvciBwYXRjaGluZyBhIHJlY2lwZS4g
UmVzdWx0aW5nIEpWTSBzZWVtcyB0byB3b3JrIGZvciBteSBhcHBsaWNhdGlvbi4NCj4gPiANCj4g
PiBDaGVjayB0aGUgY3VycmVudCBwYXRjaHNldCB3aGljaCBIdWdvIGhhcyBzZW50IChub3cgaW4g
Q2MpIGFzIEkgdGhpbmsNCj4gPiB0aGlzIGFkZHJlc3MgdGhlIGlzc3VlIHlvdSBoYWQuDQo+ID4g
DQo+IA0KPiBUaGF0IGlzIHRydWUuIEkndmUganVzdCB0YWtlbiBhIGRpZmZlcmVudCBhcHByb2Fj
aCwgYmFzZWQgb24gd2hhdCB3YXMgZG9uZQ0KPiB3aXRoIG9wZW5qZGstNywgYnV0IGVzc2VudGlh
bGx5IHRoZSBwYXRjaCBkb2VzIHRoZSBzYW1lIHRoaW5nDQoNCkh1Z28ncyBwYXRjaCBpcyBhIGJl
dHRlciBhcHByb2FjaC4gDQpJJ2xsIHdhaXQgdW50aWwgaXQgaXMgbWVyZ2VkIGFuZCB0aGVuIHN3
aXRjaCBvdXQgbXkgYmJhcHBlbmQuDQpUaGFua3MgZm9yIHlvdSB3b3JrIG9uIEphdmEuIA0KDQpI
ZW5yeQ0KDQo=

