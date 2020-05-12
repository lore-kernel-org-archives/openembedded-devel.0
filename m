Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.881.1589263641093801261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 23:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,382,1583164800"; 
   d="scan'208";a="91938620"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 14:06:55 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C22A4BCC89B;
	Tue, 12 May 2020 14:06:55 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 14:06:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::90ed:382f:828d:5124])
 by G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::90ed:382f:828d:5124%14]) with
 mapi id 15.00.1497.006; Tue, 12 May 2020 14:06:53 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
Thread-Topic: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
Thread-Index: AQHWJ/4NxSrZIKVH/Um3odQQegt4iqij73vg
Date: Tue, 12 May 2020 06:06:53 +0000
Message-ID: <1e5d54e6e55e4e6895b02ce6b1b38cc7@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <1589278403-92900-1-git-send-email-wangmy@cn.fujitsu.com>
 <CAMKF1sp1J2tT8=CBkb4vCed9oE5NKUG-8ZNs6tqPLE3a3DpKSQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp1J2tT8=CBkb4vCed9oE5NKUG-8ZNs6tqPLE3a3DpKSQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.33]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 5C22A4BCC89B.AC10F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG1hbiBwYWdlIGNoYW5nZWQgZnJvbSBtYWlsY2FwLjQgdG8gbWFpbGNhcC41IHJlY29yZGVk
IGluIHRoZSBsaWNlbnNlIGZpbGUuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE1heSAxMiwg
MjAyMCA5OjM5IEFNDQpUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBjbi5mdWpp
dHN1LmNvbT4NCkNjOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIG1h
aWxjYXA6IHVwZ3JhZGUgMi4xLjQ4IC0+IDIuMS40OQ0KDQpPbiBNb24sIE1heSAxMSwgMjAyMCBh
dCA2OjEzIFBNIFdhbmcgTWluZ3l1IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPg0K
PiBtYW4gcGFnZSBjaGFuZ2VkIGZyb20gbWFpbGNhcC40IHRvIG1haWxjYXAuNQ0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4g
IC4uLi9tYWlsY2FwL3ttYWlsY2FwXzIuMS40OC5iYiA9PiBtYWlsY2FwXzIuMS40OS5iYn0gICAg
ICAgIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pICByZW5hbWUgDQo+IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21haWxjYXAve21h
aWxjYXBfMi4xLjQ4LmJiID0+IA0KPiBtYWlsY2FwXzIuMS40OS5iYn0gKDgxJSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21haWxjYXAvbWFpbGNhcF8yLjEuNDgu
YmIgDQo+IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbWFpbGNhcC9tYWlsY2FwXzIuMS40OS5i
Yg0KPiBzaW1pbGFyaXR5IGluZGV4IDgxJQ0KPiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC9tYWlsY2FwL21haWxjYXBfMi4xLjQ4LmJiDQo+IHJlbmFtZSB0byBtZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC9tYWlsY2FwL21haWxjYXBfMi4xLjQ5LmJiDQo+IGluZGV4IDExNGNlNDYw
N2MuLmZmMzA0N2YzMjUgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L21h
aWxjYXAvbWFpbGNhcF8yLjEuNDguYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
bWFpbGNhcC9tYWlsY2FwXzIuMS40OS5iYg0KPiBAQCAtMTQsMTIgKzE0LDEyIEBAIGJ5IHNldmVy
YWwgYXBwbGljYXRpb25zIGUuZy4gdG8gZGV0ZXJtaW5lIE1JTUUgdHlwZXMgZm9yIGZpbGVuYW1l
cy4iDQo+ICBTRUNUSU9OID0gIlN5c3RlbSBFbnZpcm9ubWVudC9CYXNlIg0KPg0KPiAgTElDRU5T
RSA9ICJQRCAmIE1JVCINCj4gLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTEwMGZjZmI4NDUxMmNjYzAzZmZjN2Q4OWFjMzkxMzA1Ig0KPiArTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9OGRjZTA4MjI3ZDEzNWNmZGExZjE5ZDRjMGM2Njg5ZGUiDQo+
DQoNCndoYXQgY2hhbmdlZCBpbiBMSUNFTlNFLCBwbGVhc2UgYWRkIGZldyB3b3JkcyBhYm91dCB0
aGF0IHRvIGNvbW1pdCBtc2cuDQoNCj4gIFNSQ19VUkkgPSAiaHR0cHM6Ly9yZWxlYXNlcy5wYWd1
cmUub3JnLyR7QlBOfS8ke0JQfS50YXIueHoiDQo+DQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiMmMy
NmUxOGU5MTJhNWNmMDAzMThmY2Y3ZjhmMmQ3NDciDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDdiMDIzYjIzN2Q2MDUzYmYwNWZmNjc4NmUwNjYzYzU1YzYxNGVmY2M5OWNkZjg1NjEyMGJlMTNi
NWMyOTE1NyINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICJkNTcwMWExYTU0MTM4M2MwZWRhMzI4ZjRh
NjUxODc1MSINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzM4MTUxNmJjMWE5MzczNDhlZmQx
ZDBlMTQ2MThlMGEyYWZjNWQ1OWZlODIxZGQyNDg2MzJkNTYwMWI1OWI1Ig0KPg0KPiAgZG9faW5z
dGFsbCgpIHsNCj4gICAgICBvZV9ydW5tYWtlIGluc3RhbGwgREVTVERJUj0ke0R9IHN5c2NvbmZk
aXI9JHtzeXNjb25mZGlyfSANCj4gbWFuZGlyPSR7bWFuZGlyfQ0KPiAtLQ0KPiAyLjE3LjENCj4N
Cj4NCj4NCj4gDQoNCg0KCgo=
