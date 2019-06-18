Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E577B7E7F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:25:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="67913040"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2019 20:25:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F33E14CDB1CE;
	Tue, 18 Jun 2019 20:25:03 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Tue, 18 Jun 2019 20:25:05 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][patch v3] dnf-plugin-tui: new recipe
Thread-Index: AQHVB/UV7sM6hF26jkGzUva10+WitKaha5FA
Date: Tue, 18 Jun 2019 12:25:08 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C38CC0@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: F33E14CDB1CE.AC07A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][patch v3] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 12:25:11 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KVGhpcyBwYXRjaCBpcyBzdGlsbCBiZSBpZ25vcmVkLiBEb2VzIGFu
eW9uZSBoYXZlIGFueSBjb21tZW50IGFib3V0IHRoaXMgcGF0Y2g/DQoNCkJl
c3QgcmVnYXJkcy4NClpoZW5nIFJ1b3Fpbg0KDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVv
cWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28u
LCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwgU29mdHdh
cmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1B
SUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFpoZW5nLCBSdW9xaW4v
1qMgyPTH1Q0KPiBTZW50OiBTdW5kYXksIE1heSAxMiwgMjAxOSA1OjI5IEFN
DQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBDYzogWmhlbmcsIFJ1b3Fpbi/WoyDI9MfVIDx6aGVuZ3JxLmZu
c3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtvZV1bbWV0YS1vZV1b
cGF0Y2ggdjNdIGRuZi1wbHVnaW4tdHVpOiBuZXcgcmVjaXBlDQo+IA0KPiBU
aGlzIGRuZiBwbHVnaW4gYWltcyB0byBzdXBwbHkgYSB0dWkgaW50ZXJmYWNl
IGZvciB1c2VyIHRvIG1hbmFnZSBwYWNrYWdlcy4gSXQgaGFzDQo+IGZlYXR1
cmVzIGFzIGZvbGxvd2luZzoNCj4gICAxLiBBZGQgbmV3IGNvbW1hbmQgZG5m
IHR1aSAtLWluaXQgdG8gbWFrZSBkbmYgdG8gd29yayBvbiBob3N0Lg0KPiAg
IDIuIFRleHQtYmFzZWQgdXNlciBpbnRlcmZhY2UgZm9yIGRuZi4NCj4gICAz
LiBNYW5hZ2UgU1BEWCBmaWxlcy4NCj4gICA0LiBNYW5hZ2UgU1JQTSBmaWxl
cy4NCj4gICA1LiBBZGQgaW5zdGFsbGF0aW9uIHNhbXBsZXMgZm9yIGRuZi4N
Cj4gDQo+IE1vcmUgZGV0YWlscyBwbGVhc2UgcmVmZXIgdG8gaHR0cHM6Ly9n
aXRodWIuY29tL3ViaW51eC9kbmYtcGx1Z2luLXR1aS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0
c3UuY29tPg0KPiAtLS0NCj4gIC4uLi9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1
Z2luLXR1aV9naXQuYmIgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgLi4uL2RuZi1wbHVnaW4tdHVpL2ZpbGVzL29lLXJlbW90
ZS5yZXBvLnNhbXBsZSAgICAgfCAgNSArKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1
Z2luLQ0KPiB0dWlfZ2l0LmJiDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2ZpbGVzL29l
LQ0KPiByZW1vdGUucmVwby5zYW1wbGUNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBs
dWdpbi10dWlfZ2l0LmJiDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5lODkxODY4DQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRv
b2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiBA
QCAtMCwwICsxLDM4IEBADQo+ICtTVU1NQVJZID0gIkEgdGV4dC1iYXNlZCB1
c2VyIGludGVyZmFjZSBwbHVnaW4gb2YgZG5mIGZvciB1c2VyIHRvIG1hbmFn
ZQ0KPiBwYWNrYWdlcy4gIg0KPiArTElDRU5TRSA9ICJHUEx2MiINCj4gKw0K
PiArTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vQ09QWUlORzttZDU9
YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiDQo+ICsNCj4gK1NS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS91YmludXgvZG5mLXBsdWdpbi10
dWkuZ2l0O2JyYW5jaD1tYXN0ZXIgIg0KPiArU1JDUkVWID0gIjMxZDY4NjZk
NWVkYTAyYmU5YTZiZmIxZmNhOWU5MDk1YjEyZWVjZDEiDQo+ICtQViA9ICIx
LjAiDQo+ICsNCj4gK1NSQ19VUklfYXBwZW5kX2NsYXNzLXRhcmdldCA9ICJm
aWxlOi8vb2UtcmVtb3RlLnJlcG8uc2FtcGxlIg0KPiArDQo+ICtpbmhlcml0
IGRpc3R1dGlsczMtYmFzZQ0KPiArDQo+ICtTID0gIiR7V09SS0RJUn0vZ2l0
Ig0KPiArDQo+ICtkb19pbnN0YWxsX2FwcGVuZCgpIHsNCj4gKyAgICAgICAg
aW5zdGFsbCAtZCAke0R9JHtkYXRhZGlyfS9kbmYNCj4gKyAgICAgICAgaW5z
dGFsbCAtbSAwNzU1ICR7U30vc2FtcGxlcy8qICR7RH0ke2RhdGFkaXJ9L2Ru
Zg0KPiArICAgICAgICBpbnN0YWxsIC1kICR7RH0ke1BZVEhPTl9TSVRFUEFD
S0FHRVNfRElSfS9kbmYtcGx1Z2lucy9ta2ltZw0KPiArICAgICAgICBpbnN0
YWxsIC1tIDA3NTUgJHtTfS9kbmYtcGx1Z2lucy9ta2ltZy8qDQo+ICR7RH0k
e1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9kbmYtcGx1Z2lucy9ta2ltZw0K
PiArICAgICAgICBmb3IgZmlsZSBpbiAkKGxzICR7U30vZG5mLXBsdWdpbnMv
IHwgZ3JlcCAtdiBta2ltZyk7IGRvDQo+ICsgICAgICAgICAgICBpbnN0YWxs
IC1tIDA3NTUgJHtTfS9kbmYtcGx1Z2lucy8kZmlsZQ0KPiAke0R9JHtQWVRI
T05fU0lURVBBQ0tBR0VTX0RJUn0vZG5mLXBsdWdpbnMNCj4gKyAgICAgICAg
ZG9uZQ0KPiArfQ0KPiArDQo+ICtkb19pbnN0YWxsX2FwcGVuZF9jbGFzcy10
YXJnZXQoKSB7DQo+ICsgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7c3lzY29u
ZmRpcn0veXVtLnJlcG9zLmQNCj4gKyAgICAgICAgaW5zdGFsbCAtbSAwNjQ0
ICR7V09SS0RJUn0vb2UtcmVtb3RlLnJlcG8uc2FtcGxlDQo+ICske0R9JHtz
eXNjb25mZGlyfS95dW0ucmVwb3MuZCB9DQo+ICsNCj4gK0ZJTEVTXyR7UE59
ICs9ICIke2RhdGFkaXJ9L2RuZiINCj4gKw0KPiArUkRFUEVORFNfJHtQTn0g
Kz0gIiBcDQo+ICsgIGRuZiBcDQo+ICsgIGxpYm5ld3QtcHl0aG9uIFwNCj4g
KyAgIg0KPiArDQo+ICtCQkNMQVNTRVhURU5EID0gIm5hdGl2ZXNkayINCj4g
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1
Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8uc2FtcGxlIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2ZpbGVzL29l
LQ0KPiByZW1vdGUucmVwby5zYW1wbGUNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMC4uNmM0NTAyZQ0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2lu
LXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5zYW1wbA0KPiArKysgZQ0KPiBA
QCAtMCwwICsxLDUgQEANCj4gK1tiYXNlXQ0KPiArbmFtZT1teXJlcG8NCj4g
K2Jhc2V1cmw9aHR0cDovLzEyNy4wLjAuMS9vZV9yZXBvLw0KPiArZW5hYmxl
ZD0xDQo+ICtncGdjaGVjaz0wDQo+IC0tDQo+IDIuNy40DQoNCgoK

