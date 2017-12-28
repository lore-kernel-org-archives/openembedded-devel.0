Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5E99A606CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 02:24:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33249750"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Dec 2017 10:24:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8EBD048AE9FD;
	Thu, 28 Dec 2017 10:24:57 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0361.001; Thu, 28 Dec 2017 10:24:57 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] xorgxrdp: new add
Thread-Index: AQHTfsFeqv30TKKdI0+EDcKE8Uqxp6NYBw8Q
Date: Thu, 28 Dec 2017 02:25:01 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A90578@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1513699918-7720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<53571896-e752-6e16-c51b-bfa9096b4f72@gmail.com>
In-Reply-To: <53571896-e752-6e16-c51b-bfa9096b4f72@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.55]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8EBD048AE9FD.AE7C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][PATCH] xorgxrdp: new add
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
X-List-Received-Date: Thu, 28 Dec 2017 02:25:00 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYXJtaW4NCiAgICBDb3VsZCB5b3UgZ2l2ZSBtZSBzb21lIGFkdmljZSBh
Ym91dCBob3cgdG8gZml4IGl0Pw0KICAgIA0KICAgIFRoYW5rIHlvdS4NCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNv
ZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5vLjYgV2Vu
emh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAy
MTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlzdHUu
Y29tDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFr
dXN0ZXI4MDggW21haWx0bzpha3VzdGVyODA4QGdtYWlsLmNvbV0gDQpTZW50
OiBXZWRuZXNkYXksIERlY2VtYmVyIDI3LCAyMDE3IDExOjE4IEFNDQpUbzog
WmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24uZnVq
aXRzdS5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSB4
b3JneHJkcDogbmV3IGFkZA0KDQoNCg0KT24gMTIvMTkvMjAxNyAwODoxMSBB
TSwgemhlbmdycSB3cm90ZToNCj4gQWRkIGEgbmV3IHJlY2lwZSB4b3JneHJk
cF8wLjIuNS5iYi4NCg0KSSBhbSBzZWVpbmcNCg0KRVJST1I6IHhvcmd4cmRw
LTAuMi41K2dpdEFVVE9JTkMrYzEyMjU0NGYxOC1yMCBkb19wYWNrYWdlX3Fh
OiBRQSBJc3N1ZTogUGFja2FnZSB4b3JneHJkcCBjb250YWlucyBYb3JnIGRy
aXZlciAoeHJkcGRldl9kcnYuc28pIGJ1dCBubyB4b3JnLWFiaS0gZGVwZW5k
ZW5jaWVzIFt4b3JnLWRyaXZlci1hYmldDQpFUlJPUjogeG9yZ3hyZHAtMC4y
LjUrZ2l0QVVUT0lOQytjMTIyNTQ0ZjE4LXIwIGRvX3BhY2thZ2VfcWE6IFFB
IHJ1biBmb3VuZCBmYXRhbCBlcnJvcnMuIFBsZWFzZSBjb25zaWRlciBmaXhp
bmcgdGhlbS4NCkVSUk9SOiB4b3JneHJkcC0wLjIuNStnaXRBVVRPSU5DK2Mx
MjI1NDRmMTgtcjAgZG9fcGFja2FnZV9xYTogRnVuY3Rpb24gZmFpbGVkOiBk
b19wYWNrYWdlX3FhDQoNCnBsZWFzZSBmaXguDQoNCi0gYXJtaW4NCg0KPiBT
aWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5m
dWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC94b3JnLXhyZHAveG9yZ3hyZHBfMC4yLjUuYmIgfCAyMCANCj4gKysrKysr
KysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5iYg0KPg0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveG9yZy14
cmRwL3hvcmd4cmRwXzAuMi41LmJiIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5iYg0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5iNDExOTBkDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
eG9yZy14cmRwL3hvcmd4cmRwXzAuMi41LmJiDQo+IEBAIC0wLDAgKzEsMjAg
QEANCj4gK1NVTU1BUlkgPSAiWG9yZyBkcml2ZXJzIGZvciB4cmRwLiINCj4g
Kw0KPiArTElDRU5TRSA9ICJYMTEiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0g
DQo+ICsiZmlsZTovL0NPUFlJTkc7bWQ1PWEyNTIzNjYwMzI5ZmRjYTNkOTU0
YzBhODczOTBlMDA3IFwgIg0KPiArDQo+ICtpbmhlcml0IGF1dG90b29scyBw
a2djb25maWcNCj4gKw0KPiArREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYngxMSB4
c2VydmVyLXhvcmcgeHJkcCBuYXNtLW5hdGl2ZSINCj4gKw0KPiArU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL25ldXRyaW5vbGFicy94b3JneHJkcC5n
aXQgXA0KPiArICAgICAgICAgICAiDQo+ICsNCj4gK1NSQ1JFViA9ICJjMTIy
NTQ0ZjE4NGQ0MDMxYmJhZTFhZDgwZmJhYjU1NGMzNGE5NDI3Ig0KPiArDQo+
ICtQViA9ICIwLjIuNStnaXQke1NSQ1BWfSINCj4gKw0KPiArUyA9ICIke1dP
UktESVJ9L2dpdCINCj4gKw0KPiArRklMRVNfJHtQTn0gKz0gIiR7bGliZGly
fS94b3JnL21vZHVsZXMvKiINCg0KDQoNCgoK

