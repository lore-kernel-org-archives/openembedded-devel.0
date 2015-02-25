Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93E8C605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 23:49:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2015 15:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,648,1418112000"; d="scan'208";a="683503123"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2015 15:49:44 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.113]) by
	ORSMSX109.amr.corp.intel.com ([169.254.2.184]) with mapi id
	14.03.0195.001; Wed, 25 Feb 2015 15:49:45 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Why no recipe for openjdk-headless?
Thread-Index: AdBP/L1HbtyqS+zmR/SMcDiep4TwVQAAlqmgACYOE4AAAa7LAAAAGqyAAD6H3wA=
Date: Wed, 25 Feb 2015 23:49:44 +0000
Message-ID: <1424908098.7043.8.camel@hbruce-desk3.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
	<2039424.onani1CoMk@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKpz2e5usvJNihsA9Cq9wSzxoP1-oLdULupAvxXnFqd19Q@mail.gmail.com>
In-Reply-To: <CAP9ODKpz2e5usvJNihsA9Cq9wSzxoP1-oLdULupAvxXnFqd19Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.120]
MIME-Version: 1.0
Subject: Re: Why no recipe for openjdk-headless?
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
X-List-Received-Date: Wed, 25 Feb 2015 23:49:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3384FFDE1D487446A5B13955290C48E7@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE1LTAyLTI0IGF0IDE0OjU3IC0wMzAwLCBPdGF2aW8gU2FsdmFkb3Igd3JvdGU6
DQo+IE9uIFR1ZSwgRmViIDI0LCAyMDE1IGF0IDI6NTQgUE0sIFBhdWwgRWdnbGV0b24NCj4gPHBh
dWwuZWdnbGV0b25AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPiBPbiBUdWVzZGF5IDI0IEZl
YnJ1YXJ5IDIwMTUgMTQ6MDY6NDEgT3RhdmlvIFNhbHZhZG9yIHdyb3RlOg0KPiA+PiBPbiBUdWUs
IEZlYiAyNCwgMjAxNSBhdCA0OjAwIEFNLCBCcnVjZSwgSGVucnkgPGhlbnJ5LmJydWNlQGludGVs
LmNvbT4gd3JvdGU6DQo+ID4+ID4gSSdtIHB1dHRpbmcgdG9nZXRoZXIgYW4gT1MgaW1hZ2UgdGhh
dCBpbmNsdWRlcyAgYSBKYXZhIGhlYWRsZXNzDQo+ID4+ID4gYXBwbGljYXRpb24uIEhhdmluZyB1
c2VkIHRoZSBvcGVuamRrNy1qcmUtaGVhZGxlc3MgcGFja2FnZSBvbiBVYnVudHUgSQ0KPiA+PiA+
IHdhcyBob3BpbmcgdG8gZmluZCBhIG1hdGNoaW5nIHJlY2lwZSwgYnV0IHNhZGx5IG5vbmUgZXhp
c3QsLiAgVGhlDQo+ID4+ID4gb3BlbmpkazctanJlIHJlY2lwZSByZXF1aXJlcyB0aGUgWDExIGRp
c3RybyBmZWF0dXJlIHdoaWNoIGFkZHMNCj4gPj4gPiB1bm5lY2Vzc2FyeSBsdWdnYWdlIGZvciBh
IHNtYWxsIGZvb3RwcmludCBJb1Qgc29sdXRpb24uIFRoYW5rcyB0byBhDQo+ID4+ID4gYmJhcHBl
bmQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vd29nbGluZGUvbWV0YS1qYXZhL2lzc3Vlcy80NSBJ
IGNhbg0KPiA+PiA+IG1pbmltaXplIGZvb3RwcmludCwgYnV0IGEgaGVhZGxlc3MgcmVjaXBlIHdv
dWxkIGJlIGEgYmV0dGVyIHNvbHV0aW9uLg0KPiA+PiA+IEknbSBmYWlybHkgbmV3IHRvIFlvY3Rv
IHNvIGNvdWxkIHNvbWVvbmUgZXhwbGFpbiB0aGUgY2hhbGxlbmdlcyBvZiBhDQo+ID4+ID4gaGVh
ZGxlc3MgcmVjaXBlIGFuZCB3aGVyZSBvbmUgbWlnaHQgc3RhcnQgd2hlbiBjcmVhdGluZyBvbmU/
DQo+ID4+DQo+ID4+IFBhdGNoZXMgYXJlIHdlbGNvbWUuIEkgdGhpbmsgdGhlIGxpbmsgeW91IHBv
c3RlZCBoYXMgYSBnb29kIGJhc2Ugb2YNCj4gPj4gd29yayBkb25lIHNvIHlvdSBjb3VsZCBzdGFy
dCB0aGVyZSBhbmQgbGF0ZXIgZm9sbG93IHRoZSBSRUFETUUgZmlsZSB0bw0KPiA+PiBwb3N0IHRo
ZSBwYXRjaGVzIGhlcmUuDQo+ID4NCj4gPiBQZXJoYXBzIG1vcmUgY29uY3JldGVseSwgdGhpcyB3
b3VsZCBwcmVzdW1hYmx5IGJlIGEgcGxhY2Ugd2hlcmUgeW91IHdvdWxkIHVzZQ0KPiA+IFBBQ0tB
R0VDT05GSUcgdG8gYWRkIGFuZCByZW1vdmUgdGhlIGFwcHJvcHJpYXRlIGRlcGVuZGVuY2llcyBh
bmQgYWxzbyBvcHRpb25zDQo+ID4gaW4gRVhUUkFfT0VDT05GLiBJdCBsb29rcyBsaWtlIHRoYXQg
YmJhcHBlbmQgaGFzIGEgbWl4dHVyZSBvZiB0aGluZ3MgdGhhdCBhcmUNCj4gPiBhbmQgYXJlbid0
IHJlbGF0ZWQgdG8gYnVpbGRpbmcgd2l0aG91dCBYLiBIZW5yeSwgSSdtIG5vdCBzdXJlIGlmIHlv
dSd2ZSBjb21lDQo+ID4gYWNyb3NzIFBBQ0tBR0VDT05GSUcgeWV0IGJ1dCBqdXN0IGluIGNhc2Us
IGhlcmUgaXMgYW4gZXhhbXBsZSBmcm9tIG91cg0KPiA+IG1wZWcyZGVjIHJlY2lwZToNCj4gPg0K
PiA+IFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVS
RVMnLCAneDExJywgJ3gxMScsICcnLCBkKX0iDQo+ID4gUEFDS0FHRUNPTkZJR1t4MTFdID0gIi0t
d2l0aC14LC0td2l0aG91dC14LHZpcnR1YWwvbGlieDExIGxpYnhleHQgbGlieHYiDQo+ID4NCj4g
PiAoT2J2aW91c2x5IHlvdSdkIG5lZWQgdG8gdXNlIHZhbHVlcyBhcHByb3ByaWF0ZSBmb3IgdGhl
IG9wZW5qZGsgcmVjaXBlIGluDQo+ID4gdGhlIHNlY29uZCBsaW5lLikNCj4gDQo+IFRoZSBvbmx5
IGRyYXdiYWNrIEkgc2VlIGZyb20gdGhlIFBBQ0tBR0VDT05GSUcgc29sdXRpb24sIGZvciB0aGlz
DQo+IHNwZWNpZmljIGNhc2UsIGlzIHRoYXQgSSBjYW4gc2VlIHVzZSBjYXNlcyB3aGVyZSBvbmUg
cHJvZHVjdCB3aWxsIHVzZQ0KPiBoZWFkbGVzcyBhbmQgYW5vdGhlciB1c2UgY29tcGxldGUgSmF2
YSBhbmQgdGhpcyB3b3VsZCBpbXBvc2Ugb3INCj4gbWFjaGluZSBzcGVjaWZpYyBwYWNrYWdlcyBv
ciBzcGxpdCBkaXN0cm9zLg0KPiANCj4gSG93ZXZlciBJIGFsc28gdGhpbmsgdGhhdCBNT1NUIHBl
b3BsZSB3aWxsIHVzZSBoZWFkbGVzcyBzbyBtYXliZSB3ZQ0KPiBjb3VsZCBhZGQgdGhlIFBBQ0tB
R0VDT05GSUcgYW5kIGRlZmF1bHQgdG8gaGVhZGxlc3MgYW5kIGhhbmRsZSB0aGUNCj4gZXhjZXB0
aW9uIHdoZW4gaXQgaGFwcGVucy4uLg0KPiANCg0KT3RhdmlvIGFuZCBQYXVsIC0gdGhhbmtzIGZv
ciB0aGUgcG9pbnRlcnMuDQpQQUNLQUdFQ09ORklHIGxvb2tzIGxpa2UgYSBnb29kIGFwcHJvYWNo
IGFzIEkgY2FuJ3Qgc2VlIG11Y2ggZGVtYW5kIGZvcg0KaGVhZGZ1bCBhcHBsaWNhdGlvbnMgaW4g
dGhlIGVtYmVkZGVkIHNwYWNlLg0KQXMgdGhlcmUgaXMgbm8gcXVpY2sgcm91dGUgdG8gYSBoZWFk
bGVzcyByZWNpcGUgSSBjYW4gbGl2ZSB3aXRoIGN1cnJlbnQNCmJiYXBwZW5kIHNvbHV0aW9uIGZv
ciB0aGUgdGltZSBiZWluZy4NCkknbGwgc29vbiBiZSBvdXQgZm9yIGNvdXBsZSBvZiBtb250aHMg
YW5kIHdpbGwgY2hlY2sgaW4gd2hlbiBJIGdldCBiYWNrLg0KDQpIZW5yeQ0KDQoNCg==

