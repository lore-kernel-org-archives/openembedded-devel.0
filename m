Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 28374786BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 03:30:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30748860"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Dec 2017 11:30:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 78E9C482D017;
	Wed,  6 Dec 2017 11:30:35 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0361.001; Wed, 6 Dec 2017 11:30:34 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] [meta-networking][PATCH] packagegroup-samba: new add
Thread-Index: AQHTbc4xyMs8oWh/ckOWvYqZdU3Sk6M1pNNA
Date: Wed, 6 Dec 2017 03:30:32 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA53C1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20171205142903.6443ab7e@t460p>
In-Reply-To: <20171205142903.6443ab7e@t460p>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.116]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 78E9C482D017.A8DA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] [meta-networking][PATCH] packagegroup-samba: new add
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
X-List-Received-Date: Wed, 06 Dec 2017 03:30:37 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQW5kcmVhc6OhDQogICBJIGhhdmUgc29tZSBxdWVzdGlvbnMgaGVyZToN
Cg0KICAgMS4gV2h5IGRvbid0IHlvdSBqdXN0IGNyZWF0ZSBhIHNhbWJhLWNs
aWVudCBtZXRhIHBhY2thZ2UgaW5zaWRlIHRoZSBzYW1iYSByZWNpcGUgaW5z
dGVhZD8NCiAgICAgIFdlbGwsIEkgZG9uJ3Qga25vdyBob3cgdG8gY3JlYXRl
IGEgc2FtYmEtY2xpZW50IG1ldGEgcGFja2FnZSwgYW5kIGNvdWxkIHlvdSBo
ZWxwIG1lPw0KDQogICAyLiBBbGwgc2FtYmEgbGlicmFyaWVzIGFscmVhZHkg
ZGVwZW5kIG9uIHNhbWJhLWNvbW1vbiwgc28gc2FtYmEgZGVwZW5kcyBvbiBp
dCBpbmRpcmVjdGx5LiBUaGVyZWZvcmUgdGhpcyAicGFja2FnZSBncm91cCIg
ZG9lc24ndCBzZWVtIHRvIGJlIG5lY2Vzc2FyeS4NCiAgICAgICBZZXMsIEkg
Zm91bmQgaXQsIHRoYW5rIHlvdS4NCg0KPiArDQo+ICtTVU1NQVJZXyR7UE59
LWN0ZGItdGVzdHMgPSAiIHNhbWJhIGN0ZGItdGVzdHMiDQo+ICtSREVQRU5E
U18ke1BOfS1jdGRiLXRlc3RzID0gInNhbWJhLWN0ZGItdGVzdHMiDQo+ICsN
Cj4gK1NVTU1BUllfJHtQTn0tcGlkbCA9ICJzYW1iYS1waWRsIg0KPiArUkRF
UEVORFNfJHtQTn0tcGlkbCA9ICJzYW1iYS1waWRsIg0KDQogICAzLiBUaGVz
ZSB0d28gc2VlbSB0byBiZSB1bm5lY2Vzc2FyeSwgdG9vLg0KICAgICAgVGVz
dHN1aXRlIGZvciBzYW1iYSBpcyB1bm5lY2Vzc2FyeSBmb3IgdGhlIHBhY2th
Z2Vncm91cCwgd2h5Pw0KICAgICAgQW5kIGNhbiB5b3UgZ2l2ZSBtZSBhIGFk
dmljZSBhYm91dCBob3cgdG8gZGVhbCB3aXRoIHNhbWJhLXBpZGw/UHV0IGl0
IGludG8gY2xpZW50Pw0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9xaW4NCk5hbmpp
bmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5T
VCkNCkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBBdmVudWUs
DQogICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6IHpoZW5n
cnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0Bs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxm
IE9mIEFuZHJlYXMgT2JlcnJpdHRlcg0KU2VudDogVHVlc2RheSwgRGVjZW1i
ZXIgMDUsIDIwMTcgOToyOSBQTQ0KVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbUEFU
Q0hdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBwYWNrYWdlZ3JvdXAtc2Ft
YmE6IG5ldyBhZGQNCg0KSGkgWmhlbmcsDQoNCk9uIFR1ZSwgNSBEZWMgMjAx
NyAxNzozMzowNyArMDgwMA0KemhlbmdycSA8emhlbmdycS5mbnN0QGNuLmZ1
aml0c3UuY29tPiB3cm90ZToNCg0KPiBBZGQgcGFja2FnZWdyb3VwIGZvciBz
YW1iYSwgZm9yIHRoZXJlIGFyZSB0b28gbWFueSBycG1zIGluIHNhbWJhIGFu
ZCBpdCdzIGhhcmQgdG8gbWFuYWdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
WmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+
IC0tLQ0KPiAgLi4uL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLXNhbWJh
LmJiICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IA0KPiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtc2FtYmEuDQo+
IGJiDQo+IA0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91
cC1zYW1iDQo+IGEuYmIgDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLXNhbWIN
Cj4gYS5iYg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwLi42MTc3NjkxDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L3BhY2thZ2Vncm91cHMv
cGFja2FnZWdyb3VwLQ0KPiArKysgc2FtYmEuYmINCj4gQEAgLTAsMCArMSwy
OCBAQA0KPiArU1VNTUFSWSA9ICJzYW1iYSBwYWNrYWdlIGdyb3VwcyINCj4g
K1BWID0gIjEuMCINCj4gK1BSID0gInIyIg0KPiArDQo+ICtpbmhlcml0IHBh
Y2thZ2Vncm91cA0KPiArDQo+ICtQUk9WSURFUyA9ICIke1BBQ0tBR0VTfSIN
Cj4gK1BBQ0tBR0VTID0gIiR7UE59LXNlcnZlciAke1BOfS1jbGllbnQgJHtQ
Tn0tY3RkYi10ZXN0cyAke1BOfS1waWRsIg0KPiArDQo+ICtTVU1NQVJZXyR7
UE59LWNsaWVudCA9ICIgc2FtYmEgY2xpZW50Ig0KPiArUkRFUEVORFNfJHtQ
Tn0tY2xpZW50ID0gIlwNCj4gKyAgICBzbWJjbGllbnQgXA0KPiArICAgIHNh
bWJhLWNvbW1vbiBcDQo+ICsgICAgd2luYmluZCBcDQo+ICsgICAgcmVnaXN0
cnktdG9vbHMgXA0KPiArICAgICINCg0KV2h5IGRvbid0IHlvdSBqdXN0IGNy
ZWF0ZSBhIHNhbWJhLWNsaWVudCBtZXRhIHBhY2thZ2UgaW5zaWRlIHRoZSBz
YW1iYSByZWNpcGUgaW5zdGVhZD8NCg0KPiArDQo+ICtTVU1NQVJZXyR7UE59
LXNlcnZlciA9ICIgc2FtYmEgc2VydmVyIg0KPiArUkRFUEVORFNfJHtQTn0t
c2VydmVyID0gIlwNCj4gKyAgICBzYW1iYSBcDQo+ICsgICAgc2FtYmEtY29t
bW9uIFwNCj4gKyAgICAiDQoNCkFsbCBzYW1iYSBsaWJyYXJpZXMgYWxyZWFk
eSBkZXBlbmQgb24gc2FtYmEtY29tbW9uLCBzbyBzYW1iYSBkZXBlbmRzIG9u
IGl0IGluZGlyZWN0bHkuIFRoZXJlZm9yZSB0aGlzICJwYWNrYWdlIGdyb3Vw
IiBkb2Vzbid0IHNlZW0gdG8gYmUgbmVjZXNzYXJ5Lg0KDQo+ICsNCj4gK1NV
TU1BUllfJHtQTn0tY3RkYi10ZXN0cyA9ICIgc2FtYmEgY3RkYi10ZXN0cyIN
Cj4gK1JERVBFTkRTXyR7UE59LWN0ZGItdGVzdHMgPSAic2FtYmEtY3RkYi10
ZXN0cyINCj4gKw0KPiArU1VNTUFSWV8ke1BOfS1waWRsID0gInNhbWJhLXBp
ZGwiDQo+ICtSREVQRU5EU18ke1BOfS1waWRsID0gInNhbWJhLXBpZGwiDQoN
ClRoZXNlIHR3byBzZWVtIHRvIGJlIHVubmVjZXNzYXJ5LCB0b28uDQoNClJl
Z2FyZHMsDQpBbmRyZWFzDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1kZXZlbCBt
YWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KDQoNCgoK

