Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A758860089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 10:30:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99293510"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 18:34:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t75AT2Ar023453
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 18:29:02 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Wed, 5 Aug 2015 18:30:55 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH v2] python-requests: upgrade
	2.5.1->2.7.0
Thread-Index: AdDPacUkG8e9HLtETPGV7zARbcJG0w==
Date: Wed, 5 Aug 2015 10:30:54 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDA8E3CEA5@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: [meta-python][PATCH v2] python-requests: upgrade 2.5.1->2.7.0
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
X-List-Received-Date: Wed, 05 Aug 2015 10:31:00 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCj4gPiBBZ2Fpbiwgc2luY2UgdGhlIExJQ19GSUxFU19DSEtTVU0gaGFzIGNoYW5nZWQs
IGl0IGlzIGEgY291cnRlc3kgdG8NCj4gPiBpbmRpY2F0ZSB3aHkuIEFzIHRoZSBjb21taXR0ZXIs
IGl0IGlzIHlvdXIgcmVzcG9uc2liaWxpdHkgdG8gbWFrZSBzdXJlDQo+ID4gdGhlIHNhbWUgbGlj
ZW5zZSBzdGlsbCBhcHBsaWVzLg0KPiANCj4gQSBtaW5vciBjb3JyZWN0aW9uIC0gaXQncyBub3Qg
anVzdCBhIGNvdXJ0ZXN5LCBJIHRoaW5rIHdlJ2QgY29uc2lkZXIgaXQgbWFuZGF0b3J5LiBXZQ0K
PiBwcm9iYWJseSBvdWdodCB0byBkb2N1bWVudCB0aGF0IHNvbWV3aGVyZSAoYXQgdGhlIE9FIGxl
dmVsKSBpZiB3ZSBoYXZlbid0IGFscmVhZHkuDQoNCkkgZ290IGl0LiBJJ2xsIHJlLXN1Ym1pdCB0
aGlzIHBhdGNoLg0KDQpDaGVlcnMNCkxlaQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBQYXVsDQo+IEVnZ2xldG9uDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXVndXN0IDA1LCAyMDE1IDQ6MTggUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLXB5dGhvbl1bUEFU
Q0ggdjJdIHB5dGhvbi1yZXF1ZXN0czogdXBncmFkZSAyLjUuMS0+Mi43LjANCj4gDQo+IE9uIFR1
ZXNkYXkgMDQgQXVndXN0IDIwMTUgMjE6NTE6MzYgVGltIE9ybGluZyB3cm90ZToNCj4gPiAuDQo+
ID4NCj4gPiBPbiBUdWUsIEF1ZyA0LCAyMDE1IGF0IDc6MjUgUE0sIExlaSBNYW9odWkgPGxlaW1h
b2h1aUBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFv
aHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiAg
Li4uL3B5dGhvbi97cHl0aG9uLXJlcXVlc3RzXzIuNS4xLmJiID0+IHB5dGhvbi1yZXF1ZXN0c18y
LjcuMC5iYn0NCj4gPiA+IHwgNw0KPiA+ID4NCj4gPiA+ICsrKy0tLS0NCj4gPiA+DQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkgIHJlbmFtZQ0K
PiA+ID4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbi1yZXF1ZXN0
c18yLjUuMS5iYiA9Pg0KPiA+ID4NCj4gPiA+IHB5dGhvbi1yZXF1ZXN0c18yLjcuMC5iYn0gKDU2
JSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1yZXF1ZXN0c18yLjUuMS5iYg0KPiA+ID4gYi9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVxdWVzdHNfMi43LjAuYmINCj4g
PiA+IHNpbWlsYXJpdHkgaW5kZXggNTYlDQo+ID4gPiByZW5hbWUgZnJvbQ0KPiA+ID4gbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXJlcXVlc3RzXzIuNS4xLmJiDQo+
ID4gPiByZW5hbWUgdG8NCj4gPiA+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1yZXF1ZXN0c18yLjcuMC5iYg0KPiA+ID4gaW5kZXggYjcxOWRjYS4uMTU2NGQ1MCAx
MDA2NDQNCj4gPiA+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1yZXF1ZXN0c18yLjUuMS5iYg0KPiA+ID4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLXJlcXVlc3RzXzIuNy4wLmJiDQo+ID4gPiBAQCAtMiwxNSAr
MiwxNCBAQCBERVNDUklQVElPTiA9ICJQeXRob24gSFRUUCBmb3IgSHVtYW5zLiINCj4gPiA+DQo+
ID4gPiAgSE9NRVBBR0UgPSAiaHR0cDovL3B5dGhvbi1yZXF1ZXN0cy5vcmciDQo+ID4gPiAgU0VD
VElPTiA9ICJkZXZlbC9weXRob24iDQo+ID4gPiAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIg0KPiA+
ID4NCj4gPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT1jNzg2
OWU1MmM4Mjc1NTM3MTg2ZGUzNWUzY2Q1ZjllYyINCj4gPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0N
Cj4gImZpbGU6Ly9MSUNFTlNFO21kNT01OGM3ZTE2M2M5ZjhlZTAzNzI0NmRhMTAxYzZhZmQxZSIN
Cj4gPg0KPiA+IEFnYWluLCBzaW5jZSB0aGUgTElDX0ZJTEVTX0NIS1NVTSBoYXMgY2hhbmdlZCwg
aXQgaXMgYSBjb3VydGVzeSB0bw0KPiA+IGluZGljYXRlIHdoeS4gQXMgdGhlIGNvbW1pdHRlciwg
aXQgaXMgeW91ciByZXNwb25zaWJpbGl0eSB0byBtYWtlIHN1cmUNCj4gPiB0aGUgc2FtZSBsaWNl
bnNlIHN0aWxsIGFwcGxpZXMuDQo+IA0KPiBBIG1pbm9yIGNvcnJlY3Rpb24gLSBpdCdzIG5vdCBq
dXN0IGEgY291cnRlc3ksIEkgdGhpbmsgd2UnZCBjb25zaWRlciBpdCBtYW5kYXRvcnkuIFdlDQo+
IHByb2JhYmx5IG91Z2h0IHRvIGRvY3VtZW50IHRoYXQgc29tZXdoZXJlIChhdCB0aGUgT0UgbGV2
ZWwpIGlmIHdlIGhhdmVuJ3QgYWxyZWFkeS4NCj4gDQo+IENoZWVycywNCj4gUGF1bA0KPiANCj4g
LS0NCj4gDQo+IFBhdWwgRWdnbGV0b24NCj4gSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBD
ZW50cmUNCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K

