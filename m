Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8909D7E14E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 10:11:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,494,1549900800"; d="scan'208";a="63980205"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 May 2019 18:11:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 917724CDB2E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 18:11:52 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Tue, 21 May 2019 18:11:50 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][patch v3] dnf-plugin-tui: new recipe
Thread-Index: AQHVB/UV7sM6hF26jkGzUva10+WitKZ1aydA
Date: Tue, 21 May 2019 10:11:56 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C2E980@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 917724CDB2E5.AA0EC
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
X-List-Received-Date: Tue, 21 May 2019 10:11:52 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBaaGVuZywgUnVvcWluL9ajIMj0x9UNCj4gU2VudDogU3VuZGF5
LCBNYXkgMTIsIDIwMTkgNToyOSBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFpoZW5nLCBSdW9x
aW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiBT
dWJqZWN0OiBbb2VdW21ldGEtb2VdW3BhdGNoIHYzXSBkbmYtcGx1Z2luLXR1
aTogbmV3IHJlY2lwZQ0KPiANCj4gVGhpcyBkbmYgcGx1Z2luIGFpbXMgdG8g
c3VwcGx5IGEgdHVpIGludGVyZmFjZSBmb3IgdXNlciB0byBtYW5hZ2UgcGFj
a2FnZXMuIEl0IGhhcw0KPiBmZWF0dXJlcyBhcyBmb2xsb3dpbmc6DQo+ICAg
MS4gQWRkIG5ldyBjb21tYW5kIGRuZiB0dWkgLS1pbml0IHRvIG1ha2UgZG5m
IHRvIHdvcmsgb24gaG9zdC4NCj4gICAyLiBUZXh0LWJhc2VkIHVzZXIgaW50
ZXJmYWNlIGZvciBkbmYuDQo+ICAgMy4gTWFuYWdlIFNQRFggZmlsZXMuDQo+
ICAgNC4gTWFuYWdlIFNSUE0gZmlsZXMuDQo+ICAgNS4gQWRkIGluc3RhbGxh
dGlvbiBzYW1wbGVzIGZvciBkbmYuDQo+IA0KPiBNb3JlIGRldGFpbHMgcGxl
YXNlIHJlZmVyIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS91YmludXgvZG5mLXBs
dWdpbi10dWkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4g
PHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4v
ZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiICAgICAgICAg
ICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIC4uLi9kbmYtcGx1
Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5zYW1wbGUgICAgIHwgIDUg
KysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykNCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi0NCj4gdHVpX2dpdC5iYg0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9k
bmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8uc2FtcGxl
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1
Z2luLXR1aV9naXQuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMC4uZTg5MTg2OA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYt
cGx1Z2luLXR1aV9naXQuYmINCj4gQEAgLTAsMCArMSwzOCBAQA0KPiArU1VN
TUFSWSA9ICJBIHRleHQtYmFzZWQgdXNlciBpbnRlcmZhY2UgcGx1Z2luIG9m
IGRuZiBmb3IgdXNlciB0byBtYW5hZ2UNCj4gcGFja2FnZXMuICINCj4gK0xJ
Q0VOU0UgPSAiR1BMdjIiDQo+ICsNCj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0K
PiAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBm
ZGFmNGE0MjYzIg0KPiArDQo+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vdWJpbnV4L2RuZi1wbHVnaW4tdHVpLmdpdDticmFuY2g9bWFzdGVyICIN
Cj4gK1NSQ1JFViA9ICIzMWQ2ODY2ZDVlZGEwMmJlOWE2YmZiMWZjYTllOTA5
NWIxMmVlY2QxIg0KPiArUFYgPSAiMS4wIg0KPiArDQo+ICtTUkNfVVJJX2Fw
cGVuZF9jbGFzcy10YXJnZXQgPSAiZmlsZTovL29lLXJlbW90ZS5yZXBvLnNh
bXBsZSINCj4gKw0KPiAraW5oZXJpdCBkaXN0dXRpbHMzLWJhc2UNCj4gKw0K
PiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gKw0KPiArZG9faW5zdGFsbF9h
cHBlbmQoKSB7DQo+ICsgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7ZGF0YWRp
cn0vZG5mDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9L3NhbXBs
ZXMvKiAke0R9JHtkYXRhZGlyfS9kbmYNCj4gKyAgICAgICAgaW5zdGFsbCAt
ZCAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vZG5mLXBsdWdpbnMv
bWtpbWcNCj4gKyAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30vZG5mLXBs
dWdpbnMvbWtpbWcvKg0KPiAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJ
Un0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gKyAgICAgICAgZm9yIGZpbGUgaW4g
JChscyAke1N9L2RuZi1wbHVnaW5zLyB8IGdyZXAgLXYgbWtpbWcpOyBkbw0K
PiArICAgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30vZG5mLXBsdWdp
bnMvJGZpbGUNCj4gJHtEfSR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L2Ru
Zi1wbHVnaW5zDQo+ICsgICAgICAgIGRvbmUNCj4gK30NCj4gKw0KPiArZG9f
aW5zdGFsbF9hcHBlbmRfY2xhc3MtdGFyZ2V0KCkgew0KPiArICAgICAgICBp
bnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L3l1bS5yZXBvcy5kDQo+ICsg
ICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L29lLXJlbW90ZS5y
ZXBvLnNhbXBsZQ0KPiArJHtEfSR7c3lzY29uZmRpcn0veXVtLnJlcG9zLmQg
fQ0KPiArDQo+ICtGSUxFU18ke1BOfSArPSAiJHtkYXRhZGlyfS9kbmYiDQo+
ICsNCj4gK1JERVBFTkRTXyR7UE59ICs9ICIgXA0KPiArICBkbmYgXA0KPiAr
ICBsaWJuZXd0LXB5dGhvbiBcDQo+ICsgICINCj4gKw0KPiArQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmVzZGsiDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMvb2UtDQo+IHJl
bW90ZS5yZXBvLnNhbXBsZSBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9k
bmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8uc2FtcGxl
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjZj
NDUwMmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMvb2UtcmVtb3RlLnJl
cG8uc2FtcGwNCj4gKysrIGUNCj4gQEAgLTAsMCArMSw1IEBADQo+ICtbYmFz
ZV0NCj4gK25hbWU9bXlyZXBvDQo+ICtiYXNldXJsPWh0dHA6Ly8xMjcuMC4w
LjEvb2VfcmVwby8NCj4gK2VuYWJsZWQ9MQ0KPiArZ3BnY2hlY2s9MA0KPiAt
LQ0KPiAyLjcuNA0KDQoKCg==

