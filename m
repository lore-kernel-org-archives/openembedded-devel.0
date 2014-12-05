Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 91BBB65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 02:33:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44535644"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2014 10:30:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB52WwtF031542
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Dec 2014 10:32:58 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Fri, 5 Dec 2014 10:33:19 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] [Patch V2][meta-oe]dmraid: add recipe
Thread-Index: AQHQDe2FeLODSVzsX06gScfBPb0GWpx9o5AAgAFPlpD//+LpAIABdCUw
Date: Fri, 5 Dec 2014 02:33:18 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DE105D@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1417496458-47021-1-git-send-email-biannm@cn.fujitsu.com>
	<20141203175838.GE2455@jama>
	<30DC4EDFD798C94083F3E083754532CC73DE0C7E@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20141204121538.GA2453@jama>
In-Reply-To: <20141204121538.GA2453@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [PATCH] [Patch V2][meta-oe]dmraid: add recipe
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
X-List-Received-Date: Fri, 05 Dec 2014 02:33:22 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IE1hcnRp
biBKYW5zYQ0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMDQsIDIwMTQgODoxNiBQTQ0KPiBU
bzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtvZV0gW1BBVENIXSBbUGF0Y2ggVjJdW21ldGEtb2VdZG1yYWlkOiBhZGQgcmVjaXBlDQo+
IA0KPiBPbiBUaHUsIERlYyAwNCwgMjAxNCBhdCAwNjowOTo1OEFNICswMDAwLCBCaWFuLCBOYWlt
ZW5nIHdyb3RlOg0KPiA+IEknbSB2ZXJ5IHNvcnJ5LiBJIGhhdmUgbm90IGFkZHJlc3NlZCB3aGF0
J3Mgd3Jvbmcgd2l0aCBteSBlLW1haWwgY2xpZW50Lg0KPiA+IExldCBtZSBzZW5kIHRoZSBwYXRj
aCBhcyBhdHRhY2htZW50IGluc3RlYWQuDQo+ID4gQW5kIC0ta2VlcC1jciBpcyBuZWNlc3Nhcnkg
Zm9yIGdpdC1hbSB3aGVuIGFwcGx5aW5nIHRoaXMgcGF0Y2guDQo+IA0KPiBZb3UgY2FuIGFsc28g
cHVzaCBpdCB0byBzb21lIHB1YmxpYyByZXBvIGFuZCBJJ2xsIGZldGNoIGl0IGZyb20gdGhlcmUs
IHRoYXQncw0KPiB0aGUgc2FmZXN0IG9wdGlvbiBmb3Igd2VpcmQgbGluZSBlbmRpbmdzIG9yIGJp
bmFyeSBibG9icy4NCj4gDQoNCk9oLCBpdCdzIHByZXR0eSBnb29kIGFkdmljZSwgdGhhbmtzLiBe
X14NClBsZWFzZSBmZXRjaCB0aGlzIHBhdGNoIGZyb20gdGhlIGZvbGxvd2luZyByZXBvLg0KIC0g
VVJMOiBodHRwczovL2dpdGh1Yi5jb20vYmVuZGFhcm9uL21ldGEtb2UtZGV2LmdpdA0KIC0gQnJh
bmNoOiBkZXZlbG9wDQogLSBDb21taXQ6IDlmMzA1OWFjOTg0NzZmMzQxMjk4Yzg2Mzk3ODEwY2Fj
YzZmMzE3N2UNCg0KVGhhbmtzDQogQmlhbg0KDQo+IFRoYW5rcw0KPiANCj4gPg0KPiA+IFRoYW5r
cw0KPiA+ICBCaWFuDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmddIE9uIEJlaGFsZg0KPiA+ID4gT2YgTWFydGluIEphbnNhDQo+ID4gPiBTZW50OiBU
aHVyc2RheSwgRGVjZW1iZXIgMDQsIDIwMTQgMTo1OSBBTQ0KPiA+ID4gVG86IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW29lXSBb
UEFUQ0hdIFtQYXRjaCBWMl1bbWV0YS1vZV1kbXJhaWQ6IGFkZCByZWNpcGUNCj4gPiA+DQo+ID4g
PiBPbiBUdWUsIERlYyAwMiwgMjAxNCBhdCAwMTowMDo1OFBNICswODAwLCBCaWFuIE5haW1lbmcg
d3JvdGU6DQo+ID4gPiA+IFRoZXJlIGlzIG5vIHVwZGF0ZSBhbnltb3JlIHNpbmNlIDIwMTAsIGJ1
dCBpcyBzdGlsbCBzdXBwb3J0ZWQgYnkNCj4gPiA+ID4gc29tZSBkaXN0cm8gc3VjaCBhcyBVYnVu
dHUodHJ1c3R5IDE0LjA0TFRTKS4NCj4gPiA+DQo+ID4gPiBTdGlsbCBkb2Vzbid0IGFwcGx5LCBw
cm9iYWJseSBtYW5nbGVkIGJ5IHlvdXIgZS1tYWlsIGNsaWVudA0KPiA+ID4NCj4gPiA+IE9FIEAg
4oC+L21ldGEtb3BlbmVtYmVkZGVkICQgcHdhbSA4NDIxMw0KPiA+ID4gMjAxNC0xMi0wMyAxODo1
NDoyNw0KPiA+ID4gVVJMOmh0dHA6Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9wYXRjaC84
NDIxMy9tYm94Lw0KPiA+ID4gWzY3MTQzXSAtPiAicHctYW0tODQyMTMucGF0Y2giIFsxXQ0KPiA+
ID4gQXBwbHlpbmc6IGRtcmFpZDogYWRkIHJlY2lwZQ0KPiA+ID4gL09FL21ldGEtb3BlbmVtYmVk
ZGVkLy5naXQvcmViYXNlLWFwcGx5L3BhdGNoOjY1OiB0cmFpbGluZyB3aGl0ZXNwYWNlLg0KPiA+
ID4NCj4gPiA+IC9PRS9tZXRhLW9wZW5lbWJlZGRlZC8uZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo3
MzogdHJhaWxpbmcgd2hpdGVzcGFjZS4NCj4gPiA+DQo+ID4gPiAvT0UvbWV0YS1vcGVuZW1iZWRk
ZWQvLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6NzQ6IHRyYWlsaW5nIHdoaXRlc3BhY2UuDQo+ID4g
Pg0KPiA+ID4gL09FL21ldGEtb3BlbmVtYmVkZGVkLy5naXQvcmViYXNlLWFwcGx5L3BhdGNoOjc5
OiB0cmFpbGluZyB3aGl0ZXNwYWNlLg0KPiA+ID4NCj4gPiA+IC9PRS9tZXRhLW9wZW5lbWJlZGRl
ZC8uZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDo4NTogdHJhaWxpbmcgd2hpdGVzcGFjZS4NCj4gPiA+
DQo+ID4gPiBmYXRhbDogY29ycnVwdCBwYXRjaCBhdCBsaW5lIDMxOQ0KPiA+ID4gUGF0Y2ggZmFp
bGVkIGF0IDAwMDEgZG1yYWlkOiBhZGQgcmVjaXBlIFRoZSBjb3B5IG9mIHRoZSBwYXRjaCB0aGF0
DQo+ID4gPiBmYWlsZWQgaXMgZm91bmQgaW46DQo+ID4gPiAgICAvT0UvbWV0YS1vcGVuZW1iZWRk
ZWQvLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2gNCj4gPiA+IFdoZW4geW91IGhhdmUgcmVzb2x2ZWQg
dGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4NCj4gPiA+IElmIHlvdSBwcmVm
ZXIgdG8gc2tpcCB0aGlzIHBhdGNoLCBydW4gImdpdCBhbSAtLXNraXAiIGluc3RlYWQuDQo+ID4g
PiBUbyByZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFuY2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAi
Z2l0IGFtIC0tYWJvcnQiLg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPRSBAIOKAvi9tZXRhLW9wZW5l
bWJlZGRlZCAkIHBhdGNoIC1wMSA8IHB3LWFtLTg0MjEzLnBhdGNoIHBhdGNoaW5nDQo+ID4gPiBm
aWxlDQo+ID4gPiBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZG1yYWlkL2RtcmFpZC8wMV9maXhf
YnJva2VuX2xpbmtpbmcucGF0Y2gNCj4gPiA+IHBhdGNoaW5nIGZpbGUNCj4gPiA+IG1ldGEtb2Uv
cmVjaXBlcy1leHRlbmRlZC9kbXJhaWQvZG1yYWlkLzAyX2Rpc2FibGVfZG1yZWcucGF0Y2gNCj4g
PiA+IHBhdGNoOiAqKioqIG1hbGZvcm1lZCBwYXRjaCBhdCBsaW5lIDI2NToNCj4gPiA+DQo+ID4g
PiA+ICstLS0gMS4wLjAucmMxNi5vcmlnL2xpYi8uZXhwb3J0LnN5bQ0KPiA+ID4gPiArKysrIDEu
MC4wLnJjMTYvbGliLy5leHBvcnQuc3ltDQo+ID4gPiA+ICtAQCAtNTIsOCArNTIsNiBAQCBCYXNl
IHsNCj4gPiA+ID4NCj4gPiA+ID4gKyAJCWRzb19lbmRfcmVidWlsZDsNCj4gPiA+ID4NCj4gPiA+
ID4gKyAJCWhvdF9zcGFyZV9hZGQ7DQo+ID4gPiA+DQo+ID4gPiA+ICsgCQlkc29fZ2V0X21lbWJl
cnM7DQo+ID4gPiA+DQo+ID4gPiA+ICstCQlkbV9yZWdpc3Rlcl9kZXZpY2U7DQo+ID4gPiA+DQo+
ID4gPiA+ICstCQlkbV91bnJlZ2lzdGVyX2RldmljZTsNCj4gPiA+ID4gKyAJCWRtX2FsbF9tb25p
dG9yZWQ7DQo+ID4gPiA+ICsgCWxvY2FsOg0KPiA+ID4gPg0KPiA+ID4gPiArIAkJKjsNCj4gPiA+
DQo+ID4gPiBUaGlzIGlzIHRoZSBicm9rZW4gcGFydCwgYW5kIGluZGVlZCB0aGVyZSBhcmUgc3Ry
YW5nZSBibGFuayBsaW5lcyBpbg0KPiA+ID4gaXQsIG1heWJlIG1peGluZyBkb3MgYW5kIGxpbnV4
IGxpbmUgZW5kcyBpbiBkaWZmZXJlbnQgZmlsZXM/DQo+ID4NCj4gDQo+IA0KPiA+IC0tDQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVu
ZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiANCj4gDQo+IC0tDQo+IE1hcnRpbiAn
SmFNYScgSmFuc2EgICAgIGphYmJlcjogTWFydGluLkphbnNhQGdtYWlsLmNvbQ0K

