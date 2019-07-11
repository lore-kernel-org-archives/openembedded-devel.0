Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6AC7D251
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 08:21:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71170663"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 16:20:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id CFACB4CDDD3F;
	Thu, 11 Jul 2019 16:20:45 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Thu, 11 Jul 2019 16:20:54 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH v2] adcli: added new recipe.
Thread-Index: AQHVLK0tVxP3BzxP7Uyqg2WT5Yx5IKbDmAyAgAGRWxA=
Date: Thu, 11 Jul 2019 08:20:50 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF14EB41@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559871393-38760-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAMKF1sqOR-Ljt5p3mMZanUtQwf5qUNdhUFEyt+zFuMv+NGoD2A@mail.gmail.com>
In-Reply-To: <CAMKF1sqOR-Ljt5p3mMZanUtQwf5qUNdhUFEyt+zFuMv+NGoD2A@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CFACB4CDDD3F.A02EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] adcli: added new recipe.
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
X-List-Received-Date: Thu, 11 Jul 2019 08:21:51 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGnvvIwNCg0KICBUaGFuayB5b3UsIEkgd2lsbCB1cGRhdGUgbXkgcGF0Y2gu
DQoNCkJlc3QgcmVnYXJkcy4NCkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1A
Z21haWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAxMSwgMjAxOSAx
MjoyMyBBTQ0KPiBUbzogTGVpLCBNYW9odWkNCj4gQ2M6IG9wZW5lbWJlZGVk
LWRldmVsDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmdd
W1BBVENIIHYyXSBhZGNsaTogYWRkZWQgbmV3IHJlY2lwZS4NCj4gDQo+IE9u
IFdlZCwgSnVuIDI2LCAyMDE5IGF0IDEwOjU3IFBNIExlaSBNYW9odWkgPGxl
aW1hb2h1aUBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiByYWRp
dXNjbGllbnQtbmcgaXMgdG9vIG9sZC4gU28sIGFkZGVkIGEgc3Vic3RpdHV0
ZS4NCj4gPg0KPiANCj4gVGhpcyBmYWlscyB0byBidWlsZCBvbiBtdXNsDQo+
IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFp
bHMvMjUxMjgwLw0KPiANCj4gQ2FuIHlvdSB0cnkgYSBwYXRjaCBsaWtlIHRo
aXMgYW5kIHNlZSBpZiBpdCB3b3JrcyBmb3IgeW91Pw0KPiBpdCB3aWxsIGFs
c28gZml4IHRoZSBidWlsZCBvbiBtdXNsDQo+IA0KPiAtLS0gYS9saWJyYXJ5
L2FkdXRpbC5jDQo+ICsrKyBiL2xpYnJhcnkvYWR1dGlsLmMNCj4gQEAgLTMw
LDYgKzMwLDcgQEANCj4gICNpbmNsdWRlIDxhc3NlcnQuaD4NCj4gICNpbmNs
dWRlIDxjdHlwZS5oPg0KPiAgI2luY2x1ZGUgPGVycm5vLmg+DQo+ICsjaW5j
bHVkZSA8ZW5kaWFuLmg+DQo+ICAjaW5jbHVkZSA8c3RkaW8uaD4NCj4gICNp
bmNsdWRlIDxzdGRsaWIuaD4NCj4gICNpbmNsdWRlIDxzdHJpbmcuaD4NCj4g
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1
aUBjbi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2FkY2xpL2FkY2xpXzAuOC4yLmJiICAgICAgfCAyNg0K
PiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvYWRjbGkvYWRj
bGlfMC44LjIuYmINCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvYWRjbGkvYWRjbGlfMC44LjIu
YmINCj4gYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YWRjbGkvYWRjbGlfMC44LjIuYmINCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAuLmE5OGExYjMNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2FkY2xpL2FkY2xpXzAuOC4yLmJiDQo+ID4gQEAgLTAsMCArMSwy
NiBAQA0KPiA+ICtTVU1NQVJZID0gIkFjdGl2ZSBEaXJlY3RvcnkgZW5yb2xs
bWVudCINCj4gPiArREVTQ1JJUFRJT04gPSAiQSBoZWxwZXIgbGlicmFyeSBh
bmQgdG9vbHMgZm9yIEFjdGl2ZSBEaXJlY3RvcnkgY2xpZW50DQo+IG9wZXJh
dGlvbnMuIg0KPiA+ICsNCj4gPiArSE9NRVBBR0UgPSAiaHR0cDovL2NnaXQu
ZnJlZWRlc2t0b3Aub3JnL3JlYWxtZC9hZGNsaSINCj4gPiArU0VDVElPTiA9
ICJuZXQiDQo+ID4gKw0KPiA+ICtTUkNSRVYgPSAiY2MzZWY1Mjg4NGE0ODg2
M2E4MWFjYmZjNzQxNzM1ZmUwOWNkODVmNyINCj4gPiArDQo+ID4gK1NSQ19V
UkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9yZWFsbWQvYWRj
bGk7YnJhbmNoPW1hc3RlciBcDQo+ID4gKyAgICAgICAgICAiDQo+ID4gKw0K
PiA+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ICsNCj4gPiArTElDRU5T
RSA9ICJMR1BMdjIrIg0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT0yM2MyYTVlMDEwNmI5OWQ3NTIzODk4NjU1OWJiNWZj
NiINCj4gPiArDQo+ID4gK2luaGVyaXQgYXV0b3Rvb2xzIHhtbGNhdGFsb2cN
Cj4gPiArDQo+ID4gK0RFUEVORFMgKz0gInZpcnR1YWwvY3J5cHQga3JiNSBv
cGVubGRhcCBnZXR0ZXh0IGxpYnhzbHQgeG1sdG8gbGlieG1sMi1uYXRpdmUN
Cj4gXA0KPiA+ICsgICAgICAgICAgICBjeXJ1cy1zYXNsIGxpYnhzbHQtbmF0
aXZlIHhtbHRvLW5hdGl2ZSBjb3JldXRpbHMtbmF0aXZlXA0KPiA+ICsgICAg
ICAgICAgICINCj4gPiArDQo+ID4gK0VYVFJBX09FQ09ORiArPSAiLS1kaXNh
YmxlLXN0YXRpYyBcDQo+ID4gKyAgICAgICAgICAgICAgICAgLS1kaXNhYmxl
LXNpbGVudC1ydWxlcyBcDQo+ID4gKyAgICAgICAgICAgICAgICAgLS1kaXNh
YmxlLWRvYyBcDQo+ID4gKyAgICAgICAgICAgICAgICAiDQo+ID4gLS0NCj4g
PiAyLjcuNA0KPiA+DQo+ID4NCj4gPg0KPiA+IC0tDQo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBP
cGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1kZXZlbA0KPiANCg0KCgo=

