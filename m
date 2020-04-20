Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2149.1587372430527458123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 01:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,406,1580745600"; 
   d="scan'208";a="89271043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 16:47:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DA1C49DF15F;
	Mon, 20 Apr 2020 16:36:30 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 16:47:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::15e2:f6f4:7314:fd88])
 by G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::15e2:f6f4:7314:fd88%14]) with
 mapi id 15.00.1497.000; Mon, 20 Apr 2020 16:47:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: =?UTF-8?B?562U5aSNOiBbb2VdIFttZXRhLXB5dGhvbl0gW1BBVENIXSBweXRob24zLWNoZWV0YWg6IHVwZ3JhZGUgMy4yLjQgLT4gMy4yLjViMQ==?=
Thread-Topic: [oe] [meta-python] [PATCH] python3-cheetah: upgrade 3.2.4 ->
 3.2.5b1
Thread-Index: AQHWEshk0Uag0yepdE+X6jH5b0fr6Kh48CkAgAjKuHA=
Date: Mon, 20 Apr 2020 08:47:06 +0000
Message-ID: <26972b9b0aef46339e0dc5be603bc5d9@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
 <1586939501-29659-5-git-send-email-wangmy@cn.fujitsu.com>
 <CAMKF1sqH7934+ao2TPo6OfTgnjPq=OdWKyhAjJx5=S9UEJ_BTA@mail.gmail.com>
In-Reply-To: <CAMKF1sqH7934+ao2TPo6OfTgnjPq=OdWKyhAjJx5=S9UEJ_BTA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.33]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6DA1C49DF15F.ABF13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIGFsbCBmdXR1cmUgdXBkYXRlcyB3aWxsIGJlIHBlcmZvcm1lZCBv
biB0aGUgc3RhYmxlIHZlcnNpb24sIHRoaXMgcHJvYmxlbSB3aWxsIG5vdCBi
ZSByZXBlYXRlZC4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu2
5Lq6OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IOS7o+ihqCBLaGVtIFJhag0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0NOaciDE1
5pelIDEwOjMxDQrmlLbku7bkuro6IFdhbmcsIE1pbmd5dS/njosg6bij55Gc
IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+DQrmioTpgIE6IG9wZW5lbWJlZGVk
LWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4NCuS4u+mimDogUmU6IFtvZV0gW21ldGEtcHl0aG9uXSBbUEFUQ0hd
IHB5dGhvbjMtY2hlZXRhaDogdXBncmFkZSAzLjIuNCAtPiAzLjIuNWIxDQoN
CnRoaXMgaXMgYWxzbyBhIHByZS1yZWxlYXNlLiBwZXJoYXBzIHdlIHNob3Vs
ZCB3YWl0IHVudGlsIGZpbmFsIHJlbGVhc2UuDQoNCk9uIFR1ZSwgQXByIDE0
LCAyMDIwIGF0IDY6NTEgUE0gV2FuZyBNaW5neXUgPHdhbmdteUBjbi5mdWpp
dHN1LmNvbT4gd3JvdGU6DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWlu
Z3l1IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgLi4uL3tw
eXRob24zLWNoZWV0YWhfMy4yLjQuYmIgPT4gcHl0aG9uMy1jaGVldGFoXzMu
Mi41YjEuYmJ9ICB8IDQgDQo+ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pICByZW5hbWUgDQo+IG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNo
ZWV0YWhfMy4yLjQuYmIgPT4gDQo+IHB5dGhvbjMtY2hlZXRhaF8zLjIuNWIx
LmJifSAoNjklKQ0KPg0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hlZXRhaF8zLjIu
NC5iYiANCj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNoZWV0YWhfMy4yLjViMS5iYg0KPiBzaW1pbGFyaXR5IGlu
ZGV4IDY5JQ0KPiByZW5hbWUgZnJvbSANCj4gbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGVldGFoXzMuMi40LmJiDQo+
IHJlbmFtZSB0byANCj4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jaGVldGFoXzMuMi41YjEuYmINCj4gaW5kZXggMDU4
ODJkMDg3Li4yODliNzAyOTggMTAwNjQ0DQo+IC0tLSBhL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hlZXRhaF8zLjIu
NC5iYg0KPiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNoZWV0YWhfMy4yLjViMS5iYg0KPiBAQCAtMTAsNSAr
MTAsNSBAQCBSREVQRU5EU18ke1BOfV9jbGFzcy1uYXRpdmUgPSAiIg0KPg0K
PiAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPg0KPiAt
U1JDX1VSSVttZDVzdW1dID0gIjhjMGFjNjQzMjYzZmZjMzQ1NGZiMzIxMzQy
Mjg0ZDBhIg0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gImNhYWJiOWMyMjk2
MWEzNDEzYWM4NWNkMWU1NTI1ZWM5Y2E4MGRhZWJhNjU1NWY0ZjYwODAyYjZj
MjU2ZTI1MmIiDQo+ICtTUkNfVVJJW21kNXN1bV0gPSAiNWMwN2ViZTRhMzFl
ZGY2MDVhNWFiMjE3MmJmYzQxMWMiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNTJmNGFiZTZjYjg2MmZiYzYwNDdhYzE3ZGMzZDdiNGJiMGZhZjgyNjIx
ZmU5MTFmZWZiYjA0YjdhNWQ1YTdlZSINCj4gLS0NCj4gMi4xNy4xDQo+DQo+
DQo+DQo+IA0KDQoNCgoK
