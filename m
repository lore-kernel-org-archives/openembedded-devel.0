Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E39B67F8B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 02:42:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,265,1569254400"; d="scan'208";a="77873381"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 10:42:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3ECCE41B7076;
	Mon,  4 Nov 2019 10:34:46 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Mon, 4 Nov 2019 10:42:52 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] iwd: upgrade 0.20 -> 0.23
Thread-Index: AQHVkafl4j0PG0xprESzy6UBcnURlqd6T4HA
Date: Mon, 4 Nov 2019 02:42:50 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B94A60@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1soJ99bwEYUyszo9L28Uoo9DF-Le6JRtoCGXZ3orNxjqBA@mail.gmail.com>
In-Reply-To: <CAMKF1soJ99bwEYUyszo9L28Uoo9DF-Le6JRtoCGXZ3orNxjqBA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3ECCE41B7076.AC99C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iwd: upgrade 0.20 -> 0.23
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
X-List-Received-Date: Mon, 04 Nov 2019 02:42:52 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbQ0KDQpZZXPvvIxJJ20gcGxhbiB0byB1cGdyYWRlIGl0IHRvIDEu
MC4NCg0KwqAgLS0NCkJlc3QgUmVnYXJkcw0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgTm92ZW1iZXIgMywgMjAxOSAyOjAz
IEFNDQo+IFRvOiBaaGVuZywgUnVvcWluL+mDkSDoi6XpkqYgPHpoZW5ncnEu
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVs
IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBpd2Q6IHVw
Z3JhZGUgMC4yMCAtPiAwLjIzDQo+IA0KPiBaaGVuZw0KPiANCj4gSSBoYXZl
IHRha2VuIHRoaXMgYW5kIG1vc3RseSBpdCB3aWxsIGJlIGluIG1hc3RlciBz
aG9ydGx5LCBob3dldmVyLCBJIHNlZSB0aGF0IDEuMA0KPiBpcyBhbHNvIG91
dCBpbiBsYXN0IHdlZWsgb3Igc28uDQo+IGRvIHlvdSBwbGFuIHRvIHdvcmsg
b24gdXBncmFkaW5nIHRvIDEuMCBhcyB3ZWxsID8NCj4gDQo+IE9uIEZyaSwg
Tm92IDEsIDIwMTkgYXQgMTI6NDUgQU0gWmhlbmcgUnVvcWluDQo+IDx6aGVu
Z3JxLmZuc3RAY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gMSkg
QWRkIERFUEVORCBweXRob24tZG9jdXRpbHMtbmF0aXZlIHRvIGdlbmVyYXRl
IG1hbnVhbCBwYWdlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5n
IFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0t
LQ0KPiA+ICBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2l3ZC97aXdk
XzAuMjAuYmIgPT4gaXdkXzAuMjMuYmJ9IHwgNg0KPiA+ICsrKy0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKSAgcmVuYW1lDQo+ID4gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9pd2Qve2l3ZF8wLjIwLmJiID0+IGl3ZF8wLjIzLmJifSAoODclKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZp
dHkvaXdkL2l3ZF8wLjIwLmJiDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2l3ZC9pd2RfMC4yMy5iYg0KPiA+IHNpbWlsYXJpdHkgaW5k
ZXggODclDQo+ID4gcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pd2QvaXdkXzAuMjAuYmINCj4gPiByZW5hbWUgdG8gbWV0YS1v
ZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pd2QvaXdkXzAuMjMuYmINCj4gPiBp
bmRleCA0MjIwNTAzLi5kNDhmYjg0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEt
b2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXdkL2l3ZF8wLjIwLmJiDQo+ID4g
KysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pd2QvaXdkXzAu
MjMuYmINCj4gPiBAQCAtMiwxMiArMiwxMiBAQCBERVNDUklQVElPTiA9ICJX
aXJlbGVzcyBkYWVtb24gZm9yIExpbnV4Ig0KPiA+ICBMSUNFTlNFID0gIkxH
UEwtMi4xIg0KPiA+ICBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9D
T1BZSU5HO21kNT1mYjUwNGI2N2M1MDMzMWZjNzg3MzRmZWQ5MGZiMGUwOSIN
Cj4gPg0KPiA+IC1pbmhlcml0IGF1dG90b29scyBwa2djb25maWcgc3lzdGVt
ZA0KPiA+ICtpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgc3lzdGVtZCBw
eXRob25uYXRpdmUNCj4gPg0KPiA+IC1ERVBFTkRTID0gImVsbCByZWFkbGlu
ZSBkYnVzIg0KPiA+ICtERVBFTkRTID0gImVsbCByZWFkbGluZSBkYnVzIHB5
dGhvbi1kb2N1dGlscy1uYXRpdmUiDQo+ID4NCj4gPiAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvd2lyZWxlc3Mv
aXdkLmdpdCINCj4gPiAtU1JDUkVWID0gIjAwZjAwMzkyMzJjYzczYmJjZjdh
MTg3NWY4ZjlhYWU0NjRkOTBhOGYiDQo+ID4gK1NSQ1JFViA9ICI3N2YxNmFl
MjZmYzAxMzQ3N2Y2MzYyYTBjMzNmMGU1MmU4Mjg2M2UwIg0KPiA+ICBTID0g
IiR7V09SS0RJUn0vZ2l0Ig0KPiA+DQo+ID4gIFBBQ0tBR0VDT05GSUcgPz89
ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0
ZW1kJywNCj4gZCl9Ig0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0KPiA+DQo+
ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsIG1h
aWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4gDQoN
CgoK

