Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A297F607A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 01:53:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8M1rNUa003796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 18:53:23 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Wed, 21 Sep 2016 18:53:23 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] samba: remove blacklist
Thread-Index: AQHSE+SBooBkZS8z/kGOp1QN+vfhd6CErpdA
Date: Thu, 22 Sep 2016 01:53:22 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2D4CA4@ALA-MBA.corp.ad.wrs.com>
References: <20160921073909.18711-1-jackie.huang@windriver.com>
	<CALbNGRSa9k2ws4viwiv+vL4un+TofNy7UGxn_9bjzGdONcBqmg@mail.gmail.com>
	<CA+chaQfrUotycPHv=9g2aWijqK3GHOpcJwmMteU=0k+W=O0yCQ@mail.gmail.com>
In-Reply-To: <CA+chaQfrUotycPHv=9g2aWijqK3GHOpcJwmMteU=0k+W=O0yCQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] samba: remove blacklist
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
X-List-Received-Date: Thu, 22 Sep 2016 01:53:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC1k
ZXZlbC0NCj4gYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgTWFy
dGluIEphbnNhDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDIxLCAyMDE2IDQ6NDUgUE0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbA0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3
b3JraW5nXVtQQVRDSF0gc2FtYmE6IHJlbW92ZSBibGFja2xpc3QNCj4gDQo+IFllcywgYW5kIGxp
YnBhbSBhdXRvZGV0ZWN0ZWQgZGVwZW5kZW5jeSB3YXNuJ3QgZml4ZWQgYnkgdGhlIGNoYW5nZQ0K
PiBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBidXQgaW4gbmV3IGNoYW5nZSBwcm92
aWRlZCBieSBBbmRyZWFzDQoNCkkgdGVzdGVkIHdpdGgvd2l0aG91dCBwYW0gaW4gZGlzdHJvX2Zl
YXR1cmUgYWZ0ZXIgdGhlIGNoYW5nZSBmb3Igd2FmLXNhbWJhLmJiYWNsc3MsIA0KYW5kIEkgZGlk
bid0IHNlZSBhbnkgZXJyb3Igb3Igd2FucmluZyBmb3IgbGlicGFtIGFueW1vcmUsIHNvIEkgdGhv
dWdodCBpdCB3YXMgZml4ZWQuDQoNCj4gKGFsc28gaW4gbWFzdGVyLW5leHQpLg0KPiBodHRwczov
L3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzEzMTc4OS8NCg0KU29ycnkgSSBkaWRu
J3Qgbm90aWNlIHRoaXMuIFllcywgaXQgY2FuIGZpeCB0aGUgaXNzdWUuDQoNClRoYW5rcywNCkph
Y2tpZQ0KDQo+IA0KPiBPbiBXZWQsIFNlcCAyMSwgMjAxNiBhdCAxMDozOCBBTSwgQW5kcmVhcyBN
w7xsbGVyIDwNCj4gc2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiA+
IE9uIFdlZCwgU2VwIDIxLCAyMDE2IGF0IDk6MzkgQU0sICA8amFja2llLmh1YW5nQHdpbmRyaXZl
ci5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdAd2lu
ZHJpdmVyLmNvbT4NCj4gPiA+DQo+ID4gPiAqIFRoZSBsaWJwYW0gZGVwZW5kZW5jeSBpc3N1ZSBp
cyBmaXhlZCBieToNCj4gPiA+DQo+ID4gPiAgIDEyYTExODk4OTI5NmQxM2UwMzZkMGRhYTlmOWEz
ZDQ1ZWVlMDNkZWQNCj4gPiA+ICAgd2FmLXNhbWJhLmJiY2xhc3M6IEFkZCBQQUNLQUdFQ09ORklH
X0NPTkZBUkdTIHRvIENPTkZJR1VSRU9QVFMNCj4gPiA+DQo+ID4gPiAqIEkgY2FuJ3QgbmV2ZXIg
cmVwcm9kdWNlIHRoZSBpc3N1ZSB3aXRoIG5ldyBiaW51dGlscy0yLjI3LA0KPiA+ID4gICBidXQg
aXQgc2hvdWxkIGJlIGZpeGVkIGJ5Og0KPiA+ID4NCj4gPiA+ICAgYjYwYzYwODA2ZTU3ZjY5MjMz
ZGI1ODJlZjg4ZDExMzg2N2MyZWNkMQ0KPiA+ID4gICBzYW1iYTogZml4IGJ1aWxkIGJ5IGxpbmtp
bmcgd2l0aCBiZmQgaW5zdGVhZCBvZiBnb2xkDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
SmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4NCj4gPiA+IC0tLQ0KPiA+
ID4gIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1iYS9zYW1iYV80LjQu
NS5iYiB8IDUgLS0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NhbWJhL3NhbWJhXzQuNC41LmJiDQo+ID4gYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1j
b25uZWN0aXZpdHkvc2FtYmEvc2FtYmFfNC40LjUuYmINCj4gPiA+IGluZGV4IDdkN2ZhMDIuLjM2
ODZmYWEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0
aXZpdHkvc2FtYmEvc2FtYmFfNC40LjUuYmINCj4gPiA+ICsrKyBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1iYS9zYW1iYV80LjQuNS5iYg0KPiA+ID4gQEAgLTMxNyw4
ICszMTcsMyBAQCBGSUxFU18ke1BOfS1weXRob24tZGJnID0gIiR7bGliZGlyfS9weXRob24ke1BZ
VEhPTl8NCj4gPiBCQVNFVkVSU0lPTn0vc2l0ZS1wYWNrYWdlcy8uZA0KPiA+ID4NCj4gPiA+ICBS
REVQRU5EU18ke1BOfS1waWRsX2FwcGVuZCA9ICIgcGVybCINCj4gPiA+ICBGSUxFU18ke1BOfS1w
aWRsID0gIiR7YmluZGlyfS9waWRsICR7ZGF0YWRpcn0vcGVybDUvUGFyc2UiDQo+ID4gPiAtDQo+
ID4gPiAtIyBodHRwOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvODEw
MDQvDQo+ID4gPiAtIyBiZWZvcmUgdGhpcyBpc3N1ZSBpdCB3YXMgYWxzbyBmYWlsaW5nIGluIGRv
X3BhY2thZ2UgYW5kDQo+ID4gPiAtIyBhdXRvZGV0ZWN0aW5nIGxpYnBhbSBkZXBlbmRlbmN5DQo+
ID4gPiAtUE5CTEFDS0xJU1Rbc2FtYmFdID89ICJCUk9LRU46IGZhaWxzIHRvIGJ1aWxkIHdpdGgg
bmV3IGJpbnV0aWxzLTIuMjciDQo+ID4gPiAtLQ0KPiA+ID4gMi44LjMNCj4gPiA+DQo+ID4gPiAt
LQ0KPiA+IFNhbWUgcGF0Y2ggZnJvbSBKb2UgTWFjRG9uYWxkIGlzIGluIG1hc3Rlci1uZXh0IGFu
ZCBJIGFzc3VtZSBpdCBpcw0KPiA+IHVuZGVyIE1hcnRpbidzIHdvcmxkIHRlc3QgY3VycmVudGx5
Lg0KPiA+DQo+ID4gQW5kcmVhcw0KPiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBs
aXN0DQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBo
dHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1kZXZlbA0KPiA+DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

