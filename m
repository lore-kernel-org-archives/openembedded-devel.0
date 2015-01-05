Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BE24965D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 23:45:18 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Y8HKo-0007Ii-3X from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2015 15:45:18 -0800
Received: from NA-MBX-04.mgc.mentorg.com ([169.254.4.117]) by
	SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) with mapi id
	14.03.0224.002; Mon, 5 Jan 2015 15:45:19 -0800
From: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe] [V2 PATCH 1/5] dash: use BP in SRC_URI
Thread-Index: AdApQahRhFyCplikzU6DA43wAph00A==
Date: Mon, 5 Jan 2015 23:45:16 +0000
Message-ID: <EC21369A6993DD47985E1CBF1038266E2202D49F@NA-MBX-04.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] [V2 PATCH 1/5] dash: use BP in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 23:45:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiA1IEphbiAyMDE1IDE4OjI2LCBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5j
b20+IHdyb3RlOg0KPg0KPiBPbiBUdWUsIEphbiAwNiwgMjAxNSBhdCAwNjo1OTozNEFNICswODAw
LCBSb2JlcnQgWWFuZyB3cm90ZToNCj4gPg0KPiA+DQo+ID4gT24gMDEvMDUvMjAxNSAwNzo1OSBQ
TSwgTWFydGluIEphbnNhIHdyb3RlOg0KPiA+ID4gVGhhbmtzIGZvciB2Mg0KPiA+ID4NCj4gPiA+
IFBsZWFzZSByZW1lbWJlciB0byB1cGRhdGUgeW91ciBvbGQgc2VyaWVzIGFzIHN1cGVyc2VkZWQg
d2hlbiBwdXNoaW5nDQo+ID4gPiBuZXdlciB2ZXJzaW9uLCBpdCB3b3VsZCBoZWxwIG1lIGEgbG90
IHdoZW4gc29ydGluZyB0aGUgcGVuZGluZyBwYXRjaGVzLg0KPiA+DQo+ID4gSGkgTWF0aW4sIHdo
YXQgZGlkIHlvdSBtZWFuIGFib3V0OiAidXBkYXRlIHlvdXIgb2xkIHNlcmllcyBhcyBzdXBlcnNl
ZGVkIiwNCj4gPiBwbGVhc2UgPyBJIGNhbid0IHVuZGVyc3RhbmQgdGhpcyBjbGVhcmx5Lg0KPg0K
PiBTZWUNCj4gaHR0cDovL3d3dy5vcGVuZW1iZWRkZWQub3JnL3dpa2kvUGF0Y2h3b3JrDQo+IGFu
ZCBsaXN0IG9mIHBhdGNoZXMgaGVyZQ0KPiBodHRwOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5v
cmcvcHJvamVjdC9vZS9saXN0Lw0KPg0KPiBJdCBoZWxwcyBtZSBhIGxvdCB3aGVuIHRoZSBzdWJt
aXR0ZXJzIHVwZGF0ZSBzdGF0dXMgb2YgdGhlaXIgcGF0Y2hlcw0KPiAoYmVjYXVzZSB0aGV5IHVz
dWFsbHkgZG9uJ3QgaGF2ZSBzbyBtYW55IG9mIHRoZW0gYW5kIHRoZXkgc2hvdWxkIGtub3cgaWYN
Cj4gdGhleSB3ZXJlIGFwcGxpZWQsIHJlamVjdGVkIGluIGUtbWFpbCByZXZpZXcgb3Igc3VwZXJz
ZWRlZCB3aGVuIHRoZXkNCj4gc2VuZCBuZXcgdmVyc2lvbikuDQoNCkZXSVcgSSdtIG5vdyBkb2lu
ZyB0aGlzIGZvciBhbnl0aGluZyBkaXJlY3RlZCB0byBtZXRhLW5ldHdvcmtpbmcgdG8gdHJ5IHRv
IG1ha2UgeW91ciBqb2IgZWFzaWVyLCBidXQgdGhlIHYyKyB0aGluZyBpc24ndCBhbHdheXMgY2xl
YXIgaWYgYSBwYXRjaCBpc24ndCBjbGVhcmx5IGxhYmVsbGVkIHYyIChldGMuKSBzbyBpdCB3b3Vs
ZCByZWFsbHkgaGVscCBmb3Igc3VibWl0dGVycyB0byBtYXJrIHRoZWlyIG93biBjaGFuZ2VzIHN1
cGVyc2VkZWQuDQoNCi1KLg0KDQo+DQo+IE15IG11bHRpLWxheWVyIHRyaWFnZSB1c3VhbGx5IHN0
YXJ0cyBieSBmaW5kaW5nIGR1cGxpY2F0ZSBjaGFuZ2VzLA0KPiBtYXJraW5nIGFsbCBidXQgbGF0
ZXN0IGFzIHN1cGVyc2VkZWQsIHRoZW4gYWRkaW5nIHRoZW0gdG8gcmlnaHQgYnVuZGxlDQo+IGlm
IHRoZXkgYmVsb25nIHRvIGxheWVyIHdpdGggc2VwYXJhdGUgbWFpbnRhaW5lciBhbmQgdGhlbiBj
aGVycnktcGljaw0KPiB0aGUgcmVzdCB0byBtYXN0ZXItbmV4dCAob3IgdXBkYXRlIGl0IHRoZXJl
KS4NCj4NCj4gQW55IGhlbHAgaW4gdGhpcyB0cmlhZ2UgaGVscHMgbWUgdG8gZG8gaXQgZmFzdGVy
IGFuZCBwb3NzaWJseSBtb3JlIG9mdGVuDQo+IChidXQgZXZlbiBub3cgSSBkbyBpdCBhcyBvZnRl
biBhcyBJIGhhdmUgamVua2lucyBzZXJ2ZXIgYXZhaWxhYmxlIGZvcg0KPiBhbm90aGVyIHJvdW5k
IG9mIHRlc3RpbmcpDQo+DQo+ID4NCj4gPiAvLyBSb2JlcnQNCj4gPg0KPiA+ID4NCj4gPiA+IE9u
IFN1biwgSmFuIDA0LCAyMDE1IGF0IDA2OjMwOjA5UE0gLTA4MDAsIFJvYmVydCBZYW5nIHdyb3Rl
Og0KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2
ZXIuY29tPg0KPiA+ID4+IC0tLQ0KPiA+ID4+ICAgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Rh
c2gvZGFzaF8wLjUuOC5iYiB8ICAgIDIgKy0NCj4gPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL21l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9kYXNoL2Rhc2hfMC41LjguYmIgYi9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvZGFzaC9kYXNoXzAuNS44LmJiDQo+ID4gPj4gaW5kZXggYzJiNTI0OS4uNDk2
MWQ3YiAxMDA2NDQNCj4gPiA+PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZGFzaC9k
YXNoXzAuNS44LmJiDQo+ID4gPj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Rhc2gv
ZGFzaF8wLjUuOC5iYg0KPiA+ID4+IEBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1iNTI2MmI0YTFhMWJmZjcyYjQ4ZTkzNTUzMTk3NmQyZSINCj4g
PiA+Pg0KPiA+ID4+ICAgaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcw0KPiA+
ID4+DQo+ID4gPj4gLVNSQ19VUkkgPSAiaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJl
cnQvZGFzaC9maWxlcy8ke1BOfS0ke1BWfS50YXIuZ3oiDQo+ID4gPj4gK1NSQ19VUkkgPSAiaHR0
cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJlcnQvJHtCUE59L2ZpbGVzLyR7QlB9LnRhci5n
eiINCj4gPiA+PiAgIFNSQ19VUklbbWQ1c3VtXSA9ICI1YzE1MjIwOTY4MGRhYjNjMzE5ZTg5MjNm
NmM1MTM3OCINCj4gPiA+PiAgIFNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNmRiM2EyMzc3NDdiMDJk
MjAzODJhNzYxMzk3NTYzZDgxM2IzMDZjMDIwYWUyOGNlMjVhMWMzOTE1ZmFjNjBmIg0KPiA+ID4+
DQo+ID4gPj4gLS0NCj4gPiA+PiAxLjcuOS41DQo+ID4gPj4NCj4gPiA+PiAtLQ0KPiA+ID4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gPj4gT3Bl
bmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+ID4+IE9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4gPiA+DQo+ID4gPg0KPiA+
ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4NCj4gLS0N
Cj4gTWFydGluICdKYU1hJyBKYW5zYSAgICAgamFiYmVyOiBNYXJ0aW4uSmFuc2FAZ21haWwuY29t
DQo=

