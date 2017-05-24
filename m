Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E297777CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 03:46:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19237486"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 May 2017 11:46:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D78C47C6520;
	Wed, 24 May 2017 11:46:37 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Wed, 24 May 2017 11:46:36 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>, Samuli Piippo
	<samuli.piippo@gmail.com>
Thread-Topic: [oe] [meta-qt5] [PATCH] qtxmlpatterns: add ptest
Thread-Index: AQHS0rvph8SkZTDlPUuatngveSTLcaH/YOsAgAKO+wCAAOrQIA==
Date: Wed, 24 May 2017 03:46:36 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E012B44@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1495430748-34054-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<c548dc49-a1c6-2323-4c73-e7812b70ebfc@gmail.com>
	<CA+chaQdo+woo4H6ppJHD=F5+3=AtiU28g+SZfXof6JX286anug@mail.gmail.com>
In-Reply-To: <CA+chaQdo+woo4H6ppJHD=F5+3=AtiU28g+SZfXof6JX286anug@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4D78C47C6520.AB600
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH] qtxmlpatterns: add ptest
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
X-List-Received-Date: Wed, 24 May 2017 03:46:46 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLkkgd2lsbCB0cnkgdG8gcmVwcm9k
dWNlIHRoZXNlIGVycm9yIGFuZCBmaXggdGhlbS4NCg0KaHVhbmdxeQ0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
W21haWx0bzpvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gTWFydGluIEphbnNhDQo+
IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDI0LCAyMDE3IDU6NDQgQU0NCj4gVG86
IFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AZ21haWwuY29tPg0KPiBD
Yzogb3BlbmVtYmVkZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtvZV0gW21l
dGEtcXQ1XSBbUEFUQ0hdIHF0eG1scGF0dGVybnM6IGFkZCBwdGVzdA0KPiAN
Cj4gQWxzbyBhbGwgMyBmYWlsIHRvIGJ1aWxkOg0KPiBodHRwOi8vZXJyb3Jz
LnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvMTQzMDQ3Lw0KPiBo
dHRwOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMv
MTQzMDQ1Lw0KPiBodHRwOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJy
b3JzL0RldGFpbHMvMTQzMDQ0Lw0KPiANCj4gT24gTW9uLCBNYXkgMjIsIDIw
MTcgYXQgODo0MCBBTSwgU2FtdWxpIFBpaXBwbyA8c2FtdWxpLnBpaXBwb0Bn
bWFpbC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBTaW5jZSB0aGUgY29kZSBz
ZWVtcyB0byBiZSBjb3B5LXBhc3RlZCBhcyBpcyB0byBzZXZlcmFsIG1vZHVs
ZXMsIGl0DQo+ID4gcmVhbGx5IHNob3VsZCBiZSBtb3ZlZCB0byBhIG5ldyAu
YmJjbGFzcyBvciAuaW5jIGFuZA0KPiA+IGluaGVyaXRlZC9pbmNsdWRlZCBp
biB0aGUgbW9kdWxlcyB0aGF0IHN1cHBvcnQgaXQuDQo+ID4NCj4gPiAtc2Ft
dWxpDQo+ID4NCj4gPg0KPiA+IE9uIDIyLjA1LjIwMTcgMDg6MjUsIEh1YW5n
IFFpeXUgd3JvdGU6DQo+ID4NCj4gPj4gQWRkIHB0ZXN0IGZvciBxdHhtbHBh
dHRlcm5zIGJ5IHVzaW5nIHByb3ZpZGVkIHRlc3RzdWl0ZS4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUWl5dSA8aHVhbmdxeS5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KPiA+PiAtLS0NCj4gPj4gICByZWNpcGVzLXF0L3F0
NS9xdHhtbHBhdHRlcm5zL3J1bi1wdGVzdCB8ICA1ICsrKysrDQo+ID4+ICAg
cmVjaXBlcy1xdC9xdDUvcXR4bWxwYXR0ZXJuc19naXQuYmIgICAgfCAyNA0K
PiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgcmVjaXBlcy1xdC9xdDUvcXR4bWxwYXR0ZXJucy9ydW4tcHRlc3QN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0eG1s
cGF0dGVybnMvcnVuLXB0ZXN0DQo+ID4+IGIvcmVjaXBlcy1xdC9xdDUvcXR4
bWxwYXR0ZXJucy9ydW4tcHRlc3QNCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPj4gaW5kZXggMDAwMDAwMC4uNmMzZjUyMg0KPiA+PiAtLS0gL2Rl
di9udWxsDQo+ID4+ICsrKyBiL3JlY2lwZXMtcXQvcXQ1L3F0eG1scGF0dGVy
bnMvcnVuLXB0ZXN0DQo+ID4+IEBAIC0wLDAgKzEsNSBAQA0KPiA+PiArIyEv
YmluL3NoDQo+ID4+ICsNCj4gPj4gK2ZvciB4IGluIGAgYXdrICd7cHJpbnQg
JDF9JyB0c3RfbGlzdCBgO2RvDQo+ID4+ICsgICAgLi8ke3h9Ow0KPiA+PiAr
ZG9uZQ0KPiA+PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9xdDUvcXR4bWxw
YXR0ZXJuc19naXQuYmIgYi9yZWNpcGVzLXF0L3F0NS8NCj4gPj4gcXR4bWxw
YXR0ZXJuc19naXQuYmIgaW5kZXggYzdlZmFmMy4uYmM4NjNkZSAxMDA2NDQN
Cj4gPj4gLS0tIGEvcmVjaXBlcy1xdC9xdDUvcXR4bWxwYXR0ZXJuc19naXQu
YmINCj4gPj4gKysrIGIvcmVjaXBlcy1xdC9xdDUvcXR4bWxwYXR0ZXJuc19n
aXQuYmINCj4gPj4gQEAgLTE0LDggKzE0LDMyIEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiIFwNCj4gPj4gICAgICAgZmlsZTovL0xJQ0VOU0UuRkRMO21kNT02
ZDlmMmE5YWY0YzhiOGMzYzc2OWY2Y2MxYjZhYWY3ZSBcDQo+ID4+ICAgIg0K
PiA+PiAgICtpbmhlcml0IHB0ZXN0DQo+ID4+ICsNCj4gPj4gICBERVBFTkRT
ICs9ICJxdGJhc2UiDQo+ID4+ICAgICBTUkNSRVYgPSAiOWY3ZTAxYjU4MmIx
YmQ4M2NjNmI4YTg1NGM1MTA4NzEzMzVlMmU3NCINCj4gPj4gICAgIEJCQ0xB
U1NFWFRFTkQgPSsgIm5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4+ICsNCj4gPj4g
K2FkZHRhc2sgZG9fcG9wdWxhdGVfc3lzcm9vdCBhZnRlciBkb19pbnN0YWxs
IGJlZm9yZQ0KPiA+PiArZG9fY29tcGlsZV9wdGVzdF9iYXNlIGRlbHRhc2sg
ZG9fY29tcGlsZV9wdGVzdF9iYXNlIGFkZHRhc2sNCj4gPj4gK2RvX2NvbXBp
bGVfcHRlc3RfYmFzZSBhZnRlciBkb19wb3B1bGF0ZV9zeXNyb290IGJlZm9y
ZQ0KPiA+PiBkb19pbnN0YWxsX3B0ZXN0DQo+ID4+ICthZGR0YXNrIGRvX2lu
c3RhbGxfcHRlc3QgYWZ0ZXIgZG9fY29tcGlsZV9wdGVzdF9iYXNlIGJlZm9y
ZQ0KPiA+PiArZG9fcGFja2FnZQ0KPiA+PiArDQo+ID4+ICtkb19jb21waWxl
X3B0ZXN0KCkgew0KPiA+PiArICAgIGNkICR7U30vdGVzdHMNCj4gPj4gKyAg
ICBxbWFrZSAtbyBNYWtlZmlsZSB0ZXN0cy5wcm8NCj4gPj4gKyAgICBvZV9y
dW5tYWtlDQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gK2Zha2Vyb290IGRvX2lu
c3RhbGxfcHRlc3QoKSB7DQo+ID4+ICsgICAgbWtkaXIgLXAgJHtEfSR7UFRF
U1RfUEFUSH0NCj4gPj4gKyAgICB0PSR7RH0ke1BURVNUX1BBVEh9DQo+ID4+
ICsgICAgZm9yIHZhciBpbiBgIGZpbmQgJHtTfS90ZXN0cy9hdXRvLyAtbmFt
ZSB0c3RfKmA7IGRvDQo+ID4+ICsgICAgICAgIGlmIFsgbm90IGAgZWNobyAk
e3ZhciMjKi99IHwgZ3JlcCAnXC4nYCBdOyB0aGVuDQo+ID4+ICsgICAgICAg
ICAgICBlY2hvICR7dmFyIyMqL30gPj4gJHt0fS90c3RfbGlzdA0KPiA+PiAr
ICAgICAgICAgICAgaW5zdGFsbCAtbSAwNjQ0ICR7dmFyfSAke3R9DQo+ID4+
ICsgICAgICAgIGZpDQo+ID4+ICsgICAgZG9uZQ0KPiA+PiArfQ0KPiA+Pg0K
PiA+Pg0KPiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwg
bWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiA+
DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxp
c3QNCj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4gDQoNCgoK

