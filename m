Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 240437F3A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 03:23:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,328,1559491200"; d="scan'208";a="72560187"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 11:23:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2855F4CDD99E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 11:23:49 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Wed, 31 Jul 2019 11:23:57 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][patch v4] dnf-plugin-tui: new recipe
Thread-Index: AQHVJxBJ9Id5xTGswEGU1hR2s2L0NqbkUISg
Date: Wed, 31 Jul 2019 03:23:55 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B5D96E@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559868144-38423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1559868144-38423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2855F4CDD99E.AACFB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
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
X-List-Received-Date: Wed, 31 Jul 2019 03:23:52 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBGcmlk
YXksIEp1bmUgMDcsIDIwMTkgODo0MiBBTQ0KPiBUbzogb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IExlaSwgTWFv
aHVpL8DXIMOvu9sgPGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT47IFpoZW5n
LCBSdW9xaW4v1qMgyPTH1Q0KPiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3Uu
Y29tPg0KPiBTdWJqZWN0OiBbb2VdIFttZXRhLW9lXVtwYXRjaCB2NF0gZG5m
LXBsdWdpbi10dWk6IG5ldyByZWNpcGUNCj4gDQo+IEZyb206IExlaSBNYW9o
dWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gDQo+IFRoaXMgZG5m
IHBsdWdpbiBhaW0gdG8gc3VwcGx5IGEgdHVpIGludGVyZmFjZSBmb3IgdXNl
ciB0byBtYW5hZ2UgcGFja2FnZXMuIEl0IGhhcw0KPiBmZWF0dXJlcyBhcyBm
b2xsb3dpbmc6DQo+ICAgMS4gQWRkIG5ldyBjb21tYW5kIGRuZiB0dWkgLS1p
bml0IHRvIG1ha2UgZG5mIHRvIHdvcmsgb24gaG9zdC4NCj4gICAyLiBUZXh0
LWJhc2VkIHVzZXIgaW50ZXJmYWNlIGZvciBkbmYuDQo+ICAgMy4gTWFuYWdl
IFNQRFggZmlsZXMuDQo+ICAgNC4gTWFuYWdlIFNSUE0gZmlsZXMuDQo+ICAg
NS4gQWRkIGluc3RhbGxhdGlvbiBzYW1wbGVzIGZvciBkbmYuDQo+IA0KPiBN
b3JlIGRldGFpbHMgcGxlYXNlIHJlZmVyIHRvIGh0dHBzOi8vZ2l0aHViLmNv
bS91YmludXgvZG5mLXBsdWdpbi10dWkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4N
Cj4gLS0tDQo+ICAuLi4vZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlf
Z2l0LmJiICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4gIC4uLi9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5z
YW1wbGUgICAgIHwgIDUgKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGlu
c2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi0NCj4g
dHVpX2dpdC5iYg0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVt
b3RlLnJlcG8uc2FtcGxlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVp
X2dpdC5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1
Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uZTg5MTg2OA0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYt
cGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gQEAgLTAsMCAr
MSwzOCBAQA0KPiArU1VNTUFSWSA9ICJBIHRleHQtYmFzZWQgdXNlciBpbnRl
cmZhY2UgcGx1Z2luIG9mIGRuZiBmb3IgdXNlciB0byBtYW5hZ2UNCj4gcGFj
a2FnZXMuICINCj4gK0xJQ0VOU0UgPSAiR1BMdjIiDQo+ICsNCj4gK0xJQ19G
SUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIg0KPiArDQo+ICtTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdWJpbnV4L2RuZi1wbHVnaW4tdHVpLmdpdDti
cmFuY2g9bWFzdGVyICINCj4gK1NSQ1JFViA9ICIzMWQ2ODY2ZDVlZGEwMmJl
OWE2YmZiMWZjYTllOTA5NWIxMmVlY2QxIg0KPiArUFYgPSAiMS4wIg0KPiAr
DQo+ICtTUkNfVVJJX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiZmlsZTovL29l
LXJlbW90ZS5yZXBvLnNhbXBsZSINCj4gKw0KPiAraW5oZXJpdCBkaXN0dXRp
bHMzLWJhc2UNCj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gKw0K
PiArZG9faW5zdGFsbF9hcHBlbmQoKSB7DQo+ICsgICAgICAgIGluc3RhbGwg
LWQgJHtEfSR7ZGF0YWRpcn0vZG5mDQo+ICsgICAgICAgIGluc3RhbGwgLW0g
MDc1NSAke1N9L3NhbXBsZXMvKiAke0R9JHtkYXRhZGlyfS9kbmYNCj4gKyAg
ICAgICAgaW5zdGFsbCAtZCAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJ
Un0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gKyAgICAgICAgaW5zdGFsbCAtbSAw
NzU1ICR7U30vZG5mLXBsdWdpbnMvbWtpbWcvKg0KPiAke0R9JHtQWVRIT05f
U0lURVBBQ0tBR0VTX0RJUn0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gKyAgICAg
ICAgZm9yIGZpbGUgaW4gJChscyAke1N9L2RuZi1wbHVnaW5zLyB8IGdyZXAg
LXYgbWtpbWcpOyBkbw0KPiArICAgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1
ICR7U30vZG5mLXBsdWdpbnMvJGZpbGUNCj4gJHtEfSR7UFlUSE9OX1NJVEVQ
QUNLQUdFU19ESVJ9L2RuZi1wbHVnaW5zDQo+ICsgICAgICAgIGRvbmUNCj4g
K30NCj4gKw0KPiArZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtdGFyZ2V0KCkg
ew0KPiArICAgICAgICBpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L3l1
bS5yZXBvcy5kDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktE
SVJ9L29lLXJlbW90ZS5yZXBvLnNhbXBsZQ0KPiArJHtEfSR7c3lzY29uZmRp
cn0veXVtLnJlcG9zLmQgfQ0KPiArDQo+ICtGSUxFU18ke1BOfSArPSAiJHtk
YXRhZGlyfS9kbmYiDQo+ICsNCj4gK1JERVBFTkRTXyR7UE59ICs9ICIgXA0K
PiArICBkbmYgXA0KPiArICBsaWJuZXd0LXB5dGhvbiBcDQo+ICsgICINCj4g
Kw0KPiArQkJDTEFTU0VYVEVORCA9ICJuYXRpdmVzZGsiDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkv
ZmlsZXMvb2UtDQo+IHJlbW90ZS5yZXBvLnNhbXBsZSBiL21ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVt
b3RlLnJlcG8uc2FtcGxlDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAuLjZjNDUwMmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmls
ZXMvb2UtcmVtb3RlLnJlcG8uc2FtcGwNCj4gKysrIGUNCj4gQEAgLTAsMCAr
MSw1IEBADQo+ICtbYmFzZV0NCj4gK25hbWU9bXlyZXBvDQo+ICtiYXNldXJs
PWh0dHA6Ly8xMjcuMC4wLjEvb2VfcmVwby8NCj4gK2VuYWJsZWQ9MQ0KPiAr
Z3BnY2hlY2s9MA0KPiAtLQ0KPiAyLjcuNA0KDQoKCg==

