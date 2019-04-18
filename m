Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEB47D26C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 02:45:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,364,1549900800"; d="scan'208";a="59581773"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2019 10:45:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A84F24CD884C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 10:45:10 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Thu, 18 Apr 2019 10:45:17 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][patch v2] dnf-plugin-tui: new recipe
Thread-Index: AQHU8RCP+c8K4RGxSUO64L/tyEyNgKZBP0FQ
Date: Thu, 18 Apr 2019 02:45:16 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C13EB0@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555093001-41848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1555093001-41848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A84F24CD884C.AC023
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][patch v2] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 18 Apr 2019 02:45:13 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBTYXR1
cmRheSwgQXByaWwgMTMsIDIwMTkgMjoxNyBBTQ0KPiBUbzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFpoZW5n
LCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29t
Pg0KPiBTdWJqZWN0OiBbb2VdW21ldGEtb2VdW3BhdGNoIHYyXSBkbmYtcGx1
Z2luLXR1aTogbmV3IHJlY2lwZQ0KPiANCj4gVGhpcyBkbmYgcGx1Z2luIGFp
bXMgdG8gc3VwcGx5IGEgdHVpIGludGVyZmFjZSBmb3IgdXNlciB0byBtYW5h
Z2UgcGFja2FnZXMuIEl0IGhhcw0KPiBmZWF0dXJlcyBhcyBmb2xsb3dpbmc6
DQo+ICAgMS4gQWRkIG5ldyBjb21tYW5kIGRuZiB0dWkgLS1pbml0IHRvIG1h
a2UgZG5mIHRvIHdvcmsgb24gaG9zdC4NCj4gICAyLiBUZXh0LWJhc2VkIHVz
ZXIgaW50ZXJmYWNlIGZvciBkbmYuDQo+ICAgMy4gTWFuYWdlIFNQRFggZmls
ZXMuDQo+ICAgNC4gTWFuYWdlIFNSUE0gZmlsZXMuDQo+ICAgNS4gQWRkIGlu
c3RhbGxhdGlvbiBzYW1wbGVzIGZvciBkbmYuDQo+IA0KPiBNb3JlIGRldGFp
bHMgcGxlYXNlIHJlZmVyIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS91YmludXgv
ZG5mLXBsdWdpbi10dWkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBS
dW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+
ICAuLi4vZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiICAg
ICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIC4uLi9k
bmYtcGx1Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5zYW1wbGUgICAg
IHwgIDUgKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMo
KykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi0NCj4gdHVpX2dpdC5i
Yg0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8u
c2FtcGxlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0K
PiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9k
bmYtcGx1Z2luLXR1aV9naXQuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMC4uZTg5MTg2OA0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1
aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gQEAgLTAsMCArMSwzOCBAQA0K
PiArU1VNTUFSWSA9ICJBIHRleHQtYmFzZWQgdXNlciBpbnRlcmZhY2UgcGx1
Z2luIG9mIGRuZiBmb3IgdXNlciB0byBtYW5hZ2UNCj4gcGFja2FnZXMuICIN
Cj4gK0xJQ0VOU0UgPSAiR1BMdjIiDQo+ICsNCj4gK0xJQ19GSUxFU19DSEtT
VU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0
ODZhODBmZGFmNGE0MjYzIg0KPiArDQo+ICtTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vdWJpbnV4L2RuZi1wbHVnaW4tdHVpLmdpdDticmFuY2g9bWFz
dGVyICINCj4gK1NSQ1JFViA9ICIzMWQ2ODY2ZDVlZGEwMmJlOWE2YmZiMWZj
YTllOTA5NWIxMmVlY2QxIg0KPiArUFYgPSAiMS4wIg0KPiArDQo+ICtTUkNf
VVJJX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiZmlsZTovL29lLXJlbW90ZS5y
ZXBvLnNhbXBsZSINCj4gKw0KPiAraW5oZXJpdCBkaXN0dXRpbHMzLWJhc2UN
Cj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gKw0KPiArZG9faW5z
dGFsbF9hcHBlbmQoKSB7DQo+ICsgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7
ZGF0YWRpcn0vZG5mDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9
L3NhbXBsZXMvKiAke0R9JHtkYXRhZGlyfS9kbmYNCj4gKyAgICAgICAgaW5z
dGFsbCAtZCAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vZG5mLXBs
dWdpbnMvbWtpbWcNCj4gKyAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30v
ZG5mLXBsdWdpbnMvbWtpbWcvKg0KPiAke0R9JHtQWVRIT05fU0lURVBBQ0tB
R0VTX0RJUn0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gKyAgICAgICAgZm9yIGZp
bGUgaW4gJChscyAke1N9L2RuZi1wbHVnaW5zLyB8IGdyZXAgLXYgbWtpbWcp
OyBkbw0KPiArICAgICAgICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30vZG5m
LXBsdWdpbnMvJGZpbGUNCj4gJHtEfSR7UFlUSE9OX1NJVEVQQUNLQUdFU19E
SVJ9L2RuZi1wbHVnaW5zDQo+ICsgICAgICAgIGRvbmUNCj4gK30NCj4gKw0K
PiArZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtdGFyZ2V0KCkgew0KPiArICAg
ICAgICBpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L3l1bS5yZXBvcy5k
DQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L29lLXJl
bW90ZS5yZXBvLnNhbXBsZQ0KPiArJHtEfSR7c3lzY29uZmRpcn0veXVtLnJl
cG9zLmQgfQ0KPiArDQo+ICtGSUxFU18ke1BOfSArPSAiJHtkYXRhZGlyfS9k
bmYiDQo+ICsNCj4gK1JERVBFTkRTXyR7UE59ICs9ICIgXA0KPiArICBkbmYg
XA0KPiArICBsaWJuZXd0LXB5dGhvbiBcDQo+ICsgICINCj4gKw0KPiArQkJD
TEFTU0VYVEVORCA9ICJuYXRpdmVzZGsiDQo+IGRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMvb2Ut
DQo+IHJlbW90ZS5yZXBvLnNhbXBsZSBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9kbmYtcGx1Z2luLXR1aS9maWxlcy9vZS0NCj4gcmVtb3RlLnJlcG8u
c2FtcGxlDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAuLjZjNDUwMmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMvb2UtcmVt
b3RlLnJlcG8uc2FtcGwNCj4gKysrIGUNCj4gQEAgLTAsMCArMSw1IEBADQo+
ICtbYmFzZV0NCj4gK25hbWU9bXlyZXBvDQo+ICtiYXNldXJsPWh0dHA6Ly8x
MjcuMC4wLjEvb2VfcmVwby8NCj4gK2VuYWJsZWQ9MQ0KPiArZ3BnY2hlY2s9
MA0KPiAtLQ0KPiAxLjguMy4xDQoNCgoK

