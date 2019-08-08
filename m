Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E7DC17EC65
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 02:28:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,358,1559491200"; d="scan'208";a="73183254"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 10:28:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 83ACA4CDFCDD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 10:28:42 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Thu, 8 Aug 2019 10:28:49 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][patch v5] dnf-plugin-tui: new recipe
Thread-Index: AQHVTZB+QBaphBHs4Ui/S9u7H9ACzabwheZg
Date: Thu, 8 Aug 2019 02:28:46 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B61082@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 83ACA4CDFCDD.AD1C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][patch v5] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 02:28:39 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KTG9uZyB0aW1lIG5vIHJlcGx5LiBTbyBJIHJlc2VuZCBpdCBhZnRl
ciByZWJhc2luZyBvbiB0b3Agb2YgbWFzdGVyIGJyYW5jaCwgSSBob3BlIHBh
dGNod29yayBjYW4gY2FwdHVyZSBpdC4NCg0KQmVzdCByZWdhcmRzLg0KWmhl
bmcgUnVvcWluDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0
c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERS
LjogTm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAg
IE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RA
Y24uZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDA4LCAyMDE5IDc6MjQgUE0NCj4gVG86IG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBa
aGVuZywgUnVvcWluL9ajIMj0x9UgPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1
LmNvbT4NCj4gU3ViamVjdDogW29lXVttZXRhLW9lXVtwYXRjaCB2NV0gZG5m
LXBsdWdpbi10dWk6IG5ldyByZWNpcGUNCj4gDQo+IFRoaXMgZG5mIHBsdWdp
biBhaW1zIHRvIHN1cHBseSBhIHR1aSBpbnRlcmZhY2UgZm9yIHVzZXIgdG8g
bWFuYWdlIHBhY2thZ2VzLiBJdCBoYXMNCj4gZmVhdHVyZXMgYXMgZm9sbG93
aW5nOg0KPiAgIDEuIEFkZCBuZXcgY29tbWFuZCBkbmYgdHVpIC0taW5pdCB0
byBtYWtlIGRuZiB3b3JrIG9uIGhvc3QuDQo+ICAgMi4gVGV4dC1iYXNlZCB1
c2VyIGludGVyZmFjZSBmb3IgZG5mLg0KPiAgIDMuIE1hbmFnZSBTUERYIGZp
bGVzLg0KPiAgIDQuIE1hbmFnZSBTUlBNIGZpbGVzLg0KPiAgIDUuIEFkZCBp
bnN0YWxsYXRpb24gc2FtcGxlcyBmb3IgZG5mLg0KPiANCj4gTW9yZSBkZXRh
aWxzIHBsZWFzZSByZWZlciB0byBodHRwczovL2dpdGh1Yi5jb20vdWJpbnV4
L2RuZi1wbHVnaW4tdHVpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcg
UnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0K
PiAgLi4uL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYiAg
ICAgIHwgMzggKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL2ZpbGVzL29l
LXJlbW90ZS5yZXBvLnNhbXBsZSAgICAgICAgICAgICAgIHwgIDUgKysrDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBs
dWdpbi10dWkvZG5mLXBsdWdpbi0NCj4gdHVpX2dpdC5iYg0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1
Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8uc2FtcGxlDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1w
bHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiBiL21ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1
aV9naXQuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAw
MDAwMDAwLi5lODkxODY4Y2QNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBs
dWdpbi10dWlfZ2l0LmJiDQo+IEBAIC0wLDAgKzEsMzggQEANCj4gK1NVTU1B
UlkgPSAiQSB0ZXh0LWJhc2VkIHVzZXIgaW50ZXJmYWNlIHBsdWdpbiBvZiBk
bmYgZm9yIHVzZXIgdG8gbWFuYWdlDQo+IHBhY2thZ2VzLiAiDQo+ICtMSUNF
TlNFID0gIkdQTHYyIg0KPiArDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4g
ImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRh
ZjRhNDI2MyINCj4gKw0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3ViaW51eC9kbmYtcGx1Z2luLXR1aS5naXQ7YnJhbmNoPW1hc3RlciAiDQo+
ICtTUkNSRVYgPSAiMzFkNjg2NmQ1ZWRhMDJiZTlhNmJmYjFmY2E5ZTkwOTVi
MTJlZWNkMSINCj4gK1BWID0gIjEuMCINCj4gKw0KPiArU1JDX1VSSV9hcHBl
bmRfY2xhc3MtdGFyZ2V0ID0gImZpbGU6Ly9vZS1yZW1vdGUucmVwby5zYW1w
bGUiDQo+ICsNCj4gK2luaGVyaXQgZGlzdHV0aWxzMy1iYXNlDQo+ICsNCj4g
K1MgPSAiJHtXT1JLRElSfS9naXQiDQo+ICsNCj4gK2RvX2luc3RhbGxfYXBw
ZW5kKCkgew0KPiArICAgICAgICBpbnN0YWxsIC1kICR7RH0ke2RhdGFkaXJ9
L2RuZg0KPiArICAgICAgICBpbnN0YWxsIC1tIDA3NTUgJHtTfS9zYW1wbGVz
LyogJHtEfSR7ZGF0YWRpcn0vZG5mDQo+ICsgICAgICAgIGluc3RhbGwgLWQg
JHtEfSR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L2RuZi1wbHVnaW5zL21r
aW1nDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9L2RuZi1wbHVn
aW5zL21raW1nLyoNCj4gJHtEfSR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9
L2RuZi1wbHVnaW5zL21raW1nDQo+ICsgICAgICAgIGZvciBmaWxlIGluICQo
bHMgJHtTfS9kbmYtcGx1Z2lucy8gfCBncmVwIC12IG1raW1nKTsgZG8NCj4g
KyAgICAgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9L2RuZi1wbHVnaW5z
LyRmaWxlDQo+ICR7RH0ke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9kbmYt
cGx1Z2lucw0KPiArICAgICAgICBkb25lDQo+ICt9DQo+ICsNCj4gK2RvX2lu
c3RhbGxfYXBwZW5kX2NsYXNzLXRhcmdldCgpIHsNCj4gKyAgICAgICAgaW5z
dGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS95dW0ucmVwb3MuZA0KPiArICAg
ICAgICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9vZS1yZW1vdGUucmVw
by5zYW1wbGUNCj4gKyR7RH0ke3N5c2NvbmZkaXJ9L3l1bS5yZXBvcy5kIH0N
Cj4gKw0KPiArRklMRVNfJHtQTn0gKz0gIiR7ZGF0YWRpcn0vZG5mIg0KPiAr
DQo+ICtSREVQRU5EU18ke1BOfSArPSAiIFwNCj4gKyAgZG5mIFwNCj4gKyAg
bGlibmV3dC1weXRob24gXA0KPiArICAiDQo+ICsNCj4gK0JCQ0xBU1NFWFRF
TkQgPSAibmF0aXZlc2RrIg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2ZpbGVzL29lLQ0KPiByZW1v
dGUucmVwby5zYW1wbGUgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5m
LXBsdWdpbi10dWkvZmlsZXMvb2UtDQo+IHJlbW90ZS5yZXBvLnNhbXBsZQ0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAuLjZj
NDUwMmUxNw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUu
cmVwby5zYW1wbA0KPiArKysgZQ0KPiBAQCAtMCwwICsxLDUgQEANCj4gK1ti
YXNlXQ0KPiArbmFtZT1teXJlcG8NCj4gK2Jhc2V1cmw9aHR0cDovLzEyNy4w
LjAuMS9vZV9yZXBvLw0KPiArZW5hYmxlZD0xDQo+ICtncGdjaGVjaz0wDQo+
IC0tDQo+IDIuMTcuMQ0KDQoKCg==

