Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E5D427D7A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:16:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,352,1549900800"; d="scan'208";a="59317646"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2019 14:16:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A87DE4CD80C7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 14:16:15 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Mon, 15 Apr 2019 14:16:17 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH] To fix confilict error with
	python3-pbr.
Thread-Index: AQHU81APPKCQSb4sXkWLeiALNpiLKaY8vLjA
Date: Mon, 15 Apr 2019 06:16:16 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF0F1376@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555307833-17472-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1555307833-17472-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A87DE4CD80C7.AEEB8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-python][PATCH] To fix confilict error with python3-pbr.
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
X-List-Received-Date: Mon, 15 Apr 2019 06:16:19 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgSSBzaG91bGQgc3VibWl0
IGEgcGF0Y2ggdG8gbW9kaWZ5IHB5dGhvbjMtcGJyIGluc3RlYWQgdGhpcyBw
YXRjaC4gQmVjYXVzZSBJIG5vdGljZWQgdGhhdCBGZWRvcmEgaW5zdGFsbCBw
eXRob24zLXBiciBpbnRvICR7RH0ke2JpbmRpcn0vcGJyLTMuDQpCdXQgaXQg
aXMgb2RkIHRoYXQgbW9kaWZ5IG9lLWNvcmUgdG8gZml4IGNvbmZsaWN0IGVy
cm9yIHdpdGggbWV0YS1vZS4NCg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVpLCBN
YW9odWkNCj4gU2VudDogTW9uZGF5LCBBcHJpbCAxNSwgMjAxOSAxOjU3IFBN
DQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBDYzogTGVpLCBNYW9odWkNCj4gU3ViamVjdDogW29lXSBbbWV0
YS1weXRob25dW1BBVENIXSBUbyBmaXggY29uZmlsaWN0IGVycm9yIHdpdGgg
cHl0aG9uMy1wYnIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVp
IDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBicl80LjIu
MC5iYiB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBicl80LjIuMC5iYiBiL21ldGEt
DQo+IHB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcGJy
XzQuMi4wLmJiDQo+IGluZGV4IDMyNDg3NzIuLjM2MWYyYTQgMTAwNjQ0DQo+
IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1wYnJfNC4yLjAuYmINCj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uLXBicl80LjIuMC5iYg0KPiBAQCAt
NSwzICs1LDkgQEAgcmVxdWlyZSByZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tcGJyLmluYw0KPiAgU1JDX1VSSVttZDVzdW1dID0gIjY2MTk3ODA4
OTZjYTgxYzdjZDE5YzZlMmY0MzliNmM5Ig0KPiAgU1JDX1VSSVtzaGEyNTZz
dW1dID0NCj4gIjFiOGJlNTBkOTM4YzliYjc1ZDBlYWY3ZWRhMTExZWVjMWJm
NmRjODhhNjJhNjQxMmUzM2JmMDc3NDU3ZTBmNDUiDQo+IA0KPiArZG9faW5z
dGFsbF9hcHBlbmQoKSB7DQo+ICsgICAgICAgIGlmIFsgLWYgJHtEfSR7Ymlu
ZGlyfS9wYnIgXTsgdGhlbg0KPiArICAgICAgICAgICAgICAgIG12ICR7RH0k
e2JpbmRpcn0vcGJyICR7RH0ke2JpbmRpcn0vcGJyLTINCj4gKyAgICAgICAg
ZmkNCj4gK30NCj4gKw0KPiAtLQ0KPiAyLjcuNA0KDQoKCg==

