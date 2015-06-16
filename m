Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E8AD673779
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 01:55:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97104674"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jun 2015 09:59:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5G1rcPP029744
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 09:53:38 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 16 Jun 2015 09:55:21 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 5/7] libtalloc: add new recipe
Thread-Index: AQHQp0nY8b9IT6CZKE+i2PhkhMx12J2s9luAgAFpdwA=
Date: Tue, 16 Jun 2015 01:55:15 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73E0F71E@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-6-git-send-email-biannm@cn.fujitsu.com>
	<20150615121927.GB2398@jama>
In-Reply-To: <20150615121927.GB2398@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 5/7] libtalloc: add new recipe
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
X-List-Received-Date: Tue, 16 Jun 2015 01:55:16 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IE1hcnRp
biBKYW5zYQ0KPiBTZW50OiBNb25kYXksIEp1bmUgMTUsIDIwMTUgODoxOSBQTQ0KPiBUbzogb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtv
ZV0gW21ldGEtb2VdW1BBVENIIDUvN10gbGlidGFsbG9jOiBhZGQgbmV3IHJlY2lwZQ0KPiANCj4g
T24gTW9uLCBKdW4gMTUsIDIwMTUgYXQgMDQ6NTI6MTRQTSArMDgwMCwgQmlhbiBOYWltZW5nIHdy
b3RlOg0KPiA+IGxpYnRhbGxvYyA+PSAyLjAuOCBpcyByZXF1aXJlZCBieSBzYW1iYTQNCj4gDQo+
IFdlIGFscmVhZHkgaGF2ZQ0KPiAuL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3RhbGxvYy90YWxs
b2NfMi4wLjEuYmINCj4gc28geW91IHNob3VsZCBqdXN0IHVwZ3JhZGUgaXQuDQo+IA0KDQpJIHdp
bGwgdHJ5IHRvIHVwZ3JhZGUgaXQsIGFuZCBzZW5kIFYyIHBhdGNoLg0KDQpUaGFua3MNCiBiaWFu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWFuIE5haW1lbmcgPGJpYW5ubUBjbi5mdWppdHN1
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlY2lwZXMtc3VwcG9ydC9saWJ0YWxsb2MvbGlidGFs
bG9jXzIuMS4xLmJiICAgfCA0Mg0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9saWJ0YWxsb2MvbGlidGFsbG9jXzIuMS4xLmJiDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlidGFsbG9jL2xpYnRhbGxv
Y18yLjEuMS5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnRhbGxvYy9saWJ0YWxs
b2NfMi4xLjEuYmINCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAu
LjYyODVhM2MNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvbGlidGFsbG9jL2xpYnRhbGxvY18yLjEuMS5iYg0KPiA+IEBAIC0wLDAgKzEsNDIgQEAN
Cj4gPiArU1VNTUFSWSA9ICJIaWVyYXJjaGljYWwsIHJlZmVyZW5jZSBjb3VudGVkIG1lbW9yeSBw
b29sIHN5c3RlbSB3aXRoDQo+IGRlc3RydWN0b3JzIg0KPiA+ICtIT01FUEFHRSA9ICJodHRwOi8v
dGFsbG9jLnNhbWJhLm9yZyINCj4gPiArU0VDVElPTiA9ICJsaWJzIg0KPiA+ICtMSUNFTlNFID0g
IkxHUEwtMy4wKyAmIEdQTC0zLjArIg0KPiA+ICsNCj4gPiArU1JDX1VSSSA9ICJodHRwOi8vc2Ft
YmEub3JnL2Z0cC90YWxsb2MvdGFsbG9jLSR7UFZ9LnRhci5neiINCj4gPiArTElDX0ZJTEVTX0NI
S1NVTSA9DQo+ICJmaWxlOi8vJHtDT1JFQkFTRX0vbWV0YS9maWxlcy9jb21tb24tbGljZW5zZXMv
TEdQTC0zLjA7bWQ1PWJmY2NmZTk1MjI2OWZmDQo+IGYyYjQwN2RkMTFmMmYzMDgzYiBcDQo+ID4g
Kw0KPiBmaWxlOi8vJHtDT1JFQkFTRX0vbWV0YS9maWxlcy9jb21tb24tbGljZW5zZXMvR1BMLTMu
MDttZDU9Yzc5ZmYzOWYxOWRmZWM2ZA0KPiAyOTNiOTVkZWE3YjA3ODkxIg0KPiA+ICsNCj4gPiAr
U1JDX1VSSVttZDVzdW1dID0gIjVkZmZiODY0MTQyMThhOTE4NjRlZDQ0NTNiYTliZTA3Ig0KPiA+
ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiM2UyOWNlNmMzYmEzYzRmN2MyZDU3Y2U4Y2YwZmJj
MjRjODY2MThjNTE5ZjJiMmZiNmE0NTkwMjU0ODhiNjE3NCINCj4gPiArDQo+ID4gK2luaGVyaXQg
d2Fmc2FtYmENCj4gPiArDQo+ID4gK1MgPSAiJHtXT1JLRElSfS90YWxsb2MtJHtQVn0iDQo+ID4g
Kw0KPiA+ICtFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS1ycGF0aCBcDQo+ID4gKyAgICAgICAg
ICAgICAgICAgLS1kaXNhYmxlLXJwYXRoLWluc3RhbGwgXA0KPiA+ICsgICAgICAgICAgICAgICAg
IC0tYnVuZGxlZC1saWJyYXJpZXM9Tk9ORSBcDQo+ID4gKyAgICAgICAgICAgICAgICAgLS1idWls
dGluLWxpYnJhcmllcz1yZXBsYWNlIFwNCj4gPiArICAgICAgICAgICAgICAgICAtLWRpc2FibGUt
c2lsZW50LXJ1bGVzIFwNCj4gPiArICAgICAgICAgICAgICAgICAtLXdpdGgtbGliaWNvbnY9JHtT
VEFHSU5HX0RJUl9IT1NUfSR7cHJlZml4fVwNCj4gPiArICAgICAgICAgICAgICAgICINCj4gPiAr
DQo+ID4gK1BBQ0tBR0VTICs9ICJweXRhbGxvYyBweXRhbGxvYy1kYmcgcHl0YWxsb2MtZGV2Ig0K
PiA+ICsNCj4gPiArRklMRV8ke1BOfSA9ICIke2xpYmRpcn0vbGlidGFsbG9jLnNvLjIgXA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgJHtsaWJkaXJ9L2xpYnRhbGxvYy5zby4yLjEuMSINCj4gPiAr
RklMRVNfJHtQTn0tZGJnID0gIi91c3Ivc3JjL2RlYnVnLyBcDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgJHtsaWJkaXJ9Ly5kZWJ1Zy9saWJ0YWxsb2Muc28uMi4xLjEiDQo+ID4gK0ZJTEVT
XyR7UE59LWRldiA9ICIke2luY2x1ZGVkaXJ9LyBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgJHtsaWJkaXJ9L2xpYnRhbGxvYy5zbyBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
JHtsaWJkaXJ9L3BrZ2NvbmZpZy8iDQo+ID4gKw0KPiA+ICtGSUxFU19weXRhbGxvYyA9ICIke2xp
YmRpcn0vcHl0aG9uJHtQWVRIT05fQkFTRVZFUlNJT059L3NpdGUtcGFja2FnZXMvKiBcDQo+ID4g
KyAgICAgICAgICAgICAgICAgICR7bGliZGlyfS9saWJweXRhbGxvYy11dGlsLnNvLjIgXA0KPiA+
ICsgICAgICAgICAgICAgICAgICAke2xpYmRpcn0vbGlicHl0YWxsb2MtdXRpbC5zby4yLjEuMSBc
DQo+ID4gKyAgICAgICAgICAgICAgICAgIg0KPiA+ICtGSUxFU19weXRhbGxvYy1kYmcgPQ0KPiAi
JHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX0JBU0VWRVJTSU9OfS9zaXRlLXBhY2thZ2VzLy5kZWJ1
ZyBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAke2xpYmRpcn0vLmRlYnVnL2xpYnB5dGFs
bG9jLXV0aWwuc28uMi4xLjEiDQo+ID4gK0ZJTEVTX3B5dGFsbG9jLWRldiA9ICIke2xpYmRpcn0v
bGlicHl0YWxsb2MtdXRpbC5zbyINCj4gPiArUkRFUEVORFNfcHl0YWxsb2MgPSAicHl0aG9uIg0K
PiA+IC0tDQo+ID4gMS44LjQuMg0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWls
aW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLWRldmVsDQo+IA0KPiAtLQ0KPiBNYXJ0aW4gJ0phTWEnIEphbnNhICAgICBqYWJiZXI6
IE1hcnRpbi5KYW5zYUBnbWFpbC5jb20NCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlz
dA0KPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZl
bA0K

