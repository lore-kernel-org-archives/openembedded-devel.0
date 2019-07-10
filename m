Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A624F7D729
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 05:46:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,473,1557158400"; d="scan'208";a="71079495"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2019 13:46:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 37B304B4041E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 13:46:52 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Wed, 10 Jul 2019 13:46:52 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][patch v4] dnf-plugin-tui: new recipe
Thread-Index: AQHVJxBJfuRH9SDvZ0W223ohkniEtKbDd3Uw
Date: Wed, 10 Jul 2019 05:46:56 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF14B00C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559868144-38423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1559868144-38423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 37B304B4041E.A98AF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][patch v4] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Wed, 10 Jul 2019 05:46:54 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

UGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFpoZW5nLCBSdW9xaW4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDA3LCAyMDE5
IDg6NDIgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBMZWksIE1hb2h1aTsgWmhlbmcsIFJ1b3Fp
bg0KPiBTdWJqZWN0OiBbb2VdIFttZXRhLW9lXVtwYXRjaCB2NF0gZG5mLXBs
dWdpbi10dWk6IG5ldyByZWNpcGUNCj4gDQo+IEZyb206IExlaSBNYW9odWkg
PGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gDQo+IFRoaXMgZG5mIHBs
dWdpbiBhaW0gdG8gc3VwcGx5IGEgdHVpIGludGVyZmFjZSBmb3IgdXNlciB0
byBtYW5hZ2UNCj4gcGFja2FnZXMuIEl0IGhhcyBmZWF0dXJlcyBhcyBmb2xs
b3dpbmc6DQo+ICAgMS4gQWRkIG5ldyBjb21tYW5kIGRuZiB0dWkgLS1pbml0
IHRvIG1ha2UgZG5mIHRvIHdvcmsgb24gaG9zdC4NCj4gICAyLiBUZXh0LWJh
c2VkIHVzZXIgaW50ZXJmYWNlIGZvciBkbmYuDQo+ICAgMy4gTWFuYWdlIFNQ
RFggZmlsZXMuDQo+ICAgNC4gTWFuYWdlIFNSUE0gZmlsZXMuDQo+ICAgNS4g
QWRkIGluc3RhbGxhdGlvbiBzYW1wbGVzIGZvciBkbmYuDQo+IA0KPiBNb3Jl
IGRldGFpbHMgcGxlYXNlIHJlZmVyIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS91
YmludXgvZG5mLXBsdWdpbi10dWkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBa
aGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4g
LS0tDQo+ICAuLi4vZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0
LmJiICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysNCj4g
IC4uLi9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5zYW1w
bGUgICAgIHwgIDUgKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2Vy
dGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi0NCj4gdHVp
X2dpdC5iYg0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3Rl
LnJlcG8uc2FtcGxlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dp
dC5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2lu
LXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uZTg5MTg2OA0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1
Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gQEAgLTAsMCArMSwz
OCBAQA0KPiArU1VNTUFSWSA9ICJBIHRleHQtYmFzZWQgdXNlciBpbnRlcmZh
Y2UgcGx1Z2luIG9mIGRuZiBmb3IgdXNlciB0byBtYW5hZ2UNCj4gcGFja2Fn
ZXMuICINCj4gK0xJQ0VOU0UgPSAiR1BMdjIiDQo+ICsNCj4gK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZj
ZTQ0ODZhODBmZGFmNGE0MjYzIg0KPiArDQo+ICtTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vdWJpbnV4L2RuZi1wbHVnaW4tdHVpLmdpdDticmFuY2g9
bWFzdGVyICINCj4gK1NSQ1JFViA9ICIzMWQ2ODY2ZDVlZGEwMmJlOWE2YmZi
MWZjYTllOTA5NWIxMmVlY2QxIg0KPiArUFYgPSAiMS4wIg0KPiArDQo+ICtT
UkNfVVJJX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiZmlsZTovL29lLXJlbW90
ZS5yZXBvLnNhbXBsZSINCj4gKw0KPiAraW5oZXJpdCBkaXN0dXRpbHMzLWJh
c2UNCj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gKw0KPiArZG9f
aW5zdGFsbF9hcHBlbmQoKSB7DQo+ICsgICAgICAgIGluc3RhbGwgLWQgJHtE
fSR7ZGF0YWRpcn0vZG5mDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDc1NSAk
e1N9L3NhbXBsZXMvKiAke0R9JHtkYXRhZGlyfS9kbmYNCj4gKyAgICAgICAg
aW5zdGFsbCAtZCAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vZG5m
LXBsdWdpbnMvbWtpbWcNCj4gKyAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7
U30vZG5mLXBsdWdpbnMvbWtpbWcvKg0KPiAke0R9JHtQWVRIT05fU0lURVBB
Q0tBR0VTX0RJUn0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gKyAgICAgICAgZm9y
IGZpbGUgaW4gJChscyAke1N9L2RuZi1wbHVnaW5zLyB8IGdyZXAgLXYgbWtp
bWcpOyBkbw0KPiArICAgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30v
ZG5mLXBsdWdpbnMvJGZpbGUNCj4gJHtEfSR7UFlUSE9OX1NJVEVQQUNLQUdF
U19ESVJ9L2RuZi1wbHVnaW5zDQo+ICsgICAgICAgIGRvbmUNCj4gK30NCj4g
Kw0KPiArZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtdGFyZ2V0KCkgew0KPiAr
ICAgICAgICBpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L3l1bS5yZXBv
cy5kDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L29l
LXJlbW90ZS5yZXBvLnNhbXBsZQ0KPiAke0R9JHtzeXNjb25mZGlyfS95dW0u
cmVwb3MuZA0KPiArfQ0KPiArDQo+ICtGSUxFU18ke1BOfSArPSAiJHtkYXRh
ZGlyfS9kbmYiDQo+ICsNCj4gK1JERVBFTkRTXyR7UE59ICs9ICIgXA0KPiAr
ICBkbmYgXA0KPiArICBsaWJuZXd0LXB5dGhvbiBcDQo+ICsgICINCj4gKw0K
PiArQkJDTEFTU0VYVEVORCA9ICJuYXRpdmVzZGsiDQo+IGRpZmYgLS1naXQg
YS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmls
ZXMvb2UtDQo+IHJlbW90ZS5yZXBvLnNhbXBsZSBiL21ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3Rl
LnJlcG8uc2FtcGxlDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAuLjZjNDUwMmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMv
b2UtcmVtb3RlLnJlcG8uc2FtcGxlDQo+IEBAIC0wLDAgKzEsNSBAQA0KPiAr
W2Jhc2VdDQo+ICtuYW1lPW15cmVwbw0KPiArYmFzZXVybD1odHRwOi8vMTI3
LjAuMC4xL29lX3JlcG8vDQo+ICtlbmFibGVkPTENCj4gK2dwZ2NoZWNrPTAN
Cj4gLS0NCj4gMi43LjQNCg0KCgo=

