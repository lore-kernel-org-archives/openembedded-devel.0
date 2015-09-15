Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA0B65D00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 01:58:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100713401"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Sep 2015 10:01:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t8F1vv2X010756
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:57:57 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Tue, 15 Sep 2015 09:58:12 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
Thread-Index: AQHQ1lYAh+m2lEvFj0WPtOf5jBVRnZ49BVxQ
Date: Tue, 15 Sep 2015 01:58:12 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDA8E4C8F5@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1439531817-34541-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1439531817-34541-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
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
X-List-Received-Date: Tue, 15 Sep 2015 01:58:16 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkNCg0KRXhjdXNlIG1lLiBUaGlzIHBhdGNoIGhhcyBiZWVuIGluIG1hc3Rlci1uZXh0IGZvciBh
IGxvbmcgdGltZS4gV2h5IG5vdCBiZWVuIG1lcmdlZCBpbnRvIG1hc3Rlcj8NCg0KDQpDaGVlcnMN
CkxlaQ0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWksIE1h
b2h1aSANCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTQsIDIwMTUgMTo1NyBQTQ0KPiBUbzogb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IExlaSwgTWFvaHVp
IA0KPiBTdWJqZWN0OiBbb2VdIFttZXRhLW9lXVtQQVRDSF0gZG5zbWFzcTogdXBncmFkZSAyLjcy
LT4yLjc1DQo+IA0KPiAtcGFyYWxsZWwtbWFrZS5wYXRjaCBpcyBub3QgbmVlZGVkIGFueSBtb3Jl
LHNvIGRlbGV0ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBj
bi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4vZG5zbWFzcS9kbnNtYXNxL3BhcmFsbGVsLW1h
a2UucGF0Y2ggICAgICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIC4uLi9y
ZWNpcGVzLXN1cHBvcnQvZG5zbWFzcS9kbnNtYXNxXzIuNzIuYmIgICAgICAgICAgIHwgMTAgLS0t
LS0tLS0tLQ0KPiAgLi4uL3JlY2lwZXMtc3VwcG9ydC9kbnNtYXNxL2Ruc21hc3FfMi43NS5iYiAg
ICAgICAgICAgfCAgOSArKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAyOSBkZWxldGlvbnMoLSkgIGRlbGV0ZSBtb2RlIDEwMDY0NA0KPiBtZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcS9wYXJhbGxlbC1tYWtlLnBhdGNoDQo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNt
YXNxL2Ruc21hc3FfMi43Mi5iYg0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2lu
Zy9yZWNpcGVzLXN1cHBvcnQvZG5zbWFzcS9kbnNtYXNxXzIuNzUuYmINCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcS9wYXJh
bGxlbC1tYWtlLnBhdGNoDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNt
YXNxL2Ruc21hc3EvcGFyYWxsZWwtbWFrZS5wYXRjaA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggNmQ1YjcyMi4uMDAwMDAwMA0KPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcS9wYXJhbGxlbC1tYWtlLnBhdGNoDQo+ICsrKyAv
ZGV2L251bGwNCj4gQEAgLTEsMTkgKzAsMCBAQA0KPiAtVGhlIGRuc21hc3EgdGFyZ2V0IGRlcGVu
ZHMgb24gLmNvbmZpZ3VyZWQgYW5kICQob2JqcykuIC5jb25maWd1cmVkIGRvZXMgYW4gcm0gLS1m
ICouby4NCj4gWWV0IHRoZSBvbmx5IHRoaW5nIHRlbGxpbmcgbWFrZSB0byBidWlsZCB0aGUgLmNv
bmZpZ3VyZWQgdGFyZ2V0IGJlZm9yZSAtdGhlICQob2JqcykgdGFyZ2V0DQo+IHdhcyB0aGUgb3Jk
ZXIgb2YgdGhlIGRlcGVuZGVuY2llcyBvZiB0aGUgZG5zbWFzcSB0YXJnZXQuIFdlIC1jYW4ndCBy
ZWx5IG9uIHRoYXQgb3JkZXINCj4gd2hlbiBkb2luZyBhIHBhcmFsbGxlbCBtYWtlIGJ1aWxkLCBz
byBhZGQgYW4gZXhwbGljaXQgLXJ1bGUgdG8gZW5mb3JjZSB0aGF0IG9yZGVyLg0KPiAtDQo+IC1T
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3IuY29t
Pg0KPiAtVXBzdHJlYW0tc3RhdHVzOiBQZW5kaW5nDQo+IC0NCj4gLS0tLSBkbnNtYXNxLTIuNjgu
b3JpZy9NYWtlZmlsZQ0KPiAtKysrIGRuc21hc3EtMi42OC9NYWtlZmlsZQ0KPiAtQEAgLTEzOSw2
ICsxMzksOCBAQCBibG9hdGNoZWNrIDogJChCVUlMRERJUikvZG5zbWFzcV9iYXNlbGluDQo+IC0J
QHJtIC1mICoubw0KPiAtCUB0b3VjaCAkQA0KPiAtDQo+IC0rJChvYmpzKTogLmNvbmZpZ3VyZWQN
Cj4gLSsNCj4gLSAkKG9ianM6Lm89LmMpICQoaGRycyk6DQo+IC0JbG4gLXMgJCh0b3ApLyQoU1JD
KS8kQCAuDQo+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Ru
c21hc3EvZG5zbWFzcV8yLjcyLmJiDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9y
dC9kbnNtYXNxL2Ruc21hc3FfMi43Mi5iYg0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggYmQ1OTE5NC4uMDAwMDAwMA0KPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1z
dXBwb3J0L2Ruc21hc3EvZG5zbWFzcV8yLjcyLmJiDQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEs
MTAgKzAsMCBAQA0KPiAtcmVxdWlyZSBkbnNtYXNxLmluYw0KPiAtDQo+IC1TUkNfVVJJICs9ICJc
DQo+IC0gICAgZmlsZTovL3BhcmFsbGVsLW1ha2UucGF0Y2ggXA0KPiAtICAgIGZpbGU6Ly9sdWEu
cGF0Y2ggXA0KPiAtIg0KPiAtDQo+IC1TUkNfVVJJW2Ruc21hc3EtMi43Mi5tZDVzdW1dID0gImNm
ODJmODFjZjA5YWQzZDQ3NjEyOTg1MDEyMjQwNDgzIg0KPiAtU1JDX1VSSVtkbnNtYXNxLTIuNzIu
c2hhMjU2c3VtXSA9DQo+ICI2MzVmMWI0NzQxN2QxN2NmMzJlNDVjZmNmZDAyMTNhYzM5ZmQwOTkx
ODQ3OWEyNTM3M2JhOWIyY2U0YWRjMDVkIg0KPiAtDQo+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcV8yLjc1LmJiDQo+IGIvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNtYXNxL2Ruc21hc3FfMi43NS5iYg0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5hMTFhYWJiDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNtYXNxL2Ruc21h
c3FfMi43NS5iYg0KPiBAQCAtMCwwICsxLDkgQEANCj4gK3JlcXVpcmUgZG5zbWFzcS5pbmMNCj4g
Kw0KPiArU1JDX1VSSSArPSAiXA0KPiArICAgIGZpbGU6Ly9sdWEucGF0Y2ggXA0KPiArIg0KPiAr
DQo+ICtTUkNfVVJJW2Ruc21hc3EtMi43NS5tZDVzdW1dID0gImQ5OWFjMTI2ZDRmZTkxMGM2Nzlk
ODg0MzA1NTk2NjliIg0KPiArU1JDX1VSSVtkbnNtYXNxLTIuNzUuc2hhMjU2c3VtXSA9DQo+ICJm
ODI1MmMwYTBiYTE2MmMyY2Q0NWY4MTE0MGM3YzE3Y2M0MGE1ZmNhMmI4NjlkMWE0MjA4MzViNzRh
Y2FkMjk0Ig0KPiArDQo+IC0tDQo+IDEuOC40LjINCg0K

