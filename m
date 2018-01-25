Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDCD178787
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 05:10:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35896796"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2018 13:10:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D4D27486A777;
	Thu, 25 Jan 2018 13:10:30 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0361.001; Thu, 25 Jan 2018 13:10:30 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2] xorgxrdp: new add
Thread-Index: AQHTlGECfpCCowYESEy8vLiN3liMKaOEDMkQ
Date: Thu, 25 Jan 2018 05:10:34 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9AD74@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1515141913-120084-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363A9A981@G08CNEXMBPEKD01.g08.fujitsu.local>
	<3a00bb76-d692-19bf-764a-a2508dd1de19@gmail.com>
In-Reply-To: <3a00bb76-d692-19bf-764a-a2508dd1de19@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.156]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D4D27486A777.A8891
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][PATCH v2] xorgxrdp: new add
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
X-List-Received-Date: Thu, 25 Jan 2018 05:10:38 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

WWVzLCB0aGFuayB5b3UuDQoNCi0tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpO
YW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQu
KEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZl
bnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6
aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogYWt1c3RlcjgwOCBbbWFpbHRvOmFrdXN0
ZXI4MDhAZ21haWwuY29tXSANClNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjMs
IDIwMTggMTE6NDQgUE0NClRvOiBaaGVuZywgUnVvcWluL9ajIMj0x9UgPHpo
ZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT47IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBb
bWV0YS1vZV1bUEFUQ0ggdjJdIHhvcmd4cmRwOiBuZXcgYWRkDQoNCg0KDQpP
biAwMS8yMi8yMDE4IDExOjM4IFBNLCBaaGVuZywgUnVvcWluIHdyb3RlOg0K
PiBwaW5nDQoNCml0cyBpbiBtYXN0ZXINCmh0dHA6Ly9jZ2l0Lm9wZW5lbWJl
ZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvY29tbWl0Lz9pZD01ZTRkZmI3
ZWU2M2NkYWEyZGU0NDdlMjRlOTE2NDc0ZmMxOWY5NTYwDQoNCj4NCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gWmhlbmcgUnVvcWluDQo+IE5hbmppbmcgRnVqaXRzdSBOYW5kYSBT
b2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCj4gQUREUi46IE5vLjYg
V2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCj4gICAgICAgIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENCj4gTUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5m
dWppc3R1LmNvbQ0KPg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBaaGVuZywgUnVvcWluL9ajIMj0x9UgDQo+IFNlbnQ6IEZy
aWRheSwgSmFudWFyeSAwNSwgMjAxOCA0OjQ1IFBNDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogWmhl
bmcsIFJ1b3Fpbi/WoyDI9MfVIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5j
b20+DQo+IFN1YmplY3Q6IFtvZV1bbWV0YS1vZV1bUEFUQ0ggdjJdIHhvcmd4
cmRwOiBuZXcgYWRkDQo+DQo+IEFkZCBhIG5ldyByZWNpcGUgeG9yZ3hyZHBf
MC4yLjUuYmIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8
emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi9y
ZWNpcGVzLXN1cHBvcnQveG9yZy14cmRwL3hvcmd4cmRwXzAuMi41LmJiICAg
IHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC94b3JnLXhyZHAveG9yZ3hyZHBfMC4y
LjUuYmINCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5iYiBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5iYg0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi4yMGNmNDVm
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQveG9yZy14cmRwL3hvcmd4cmRwXzAuMi41LmJiDQo+IEBAIC0wLDAg
KzEsMjIgQEANCj4gK1NVTU1BUlkgPSAiWG9yZyBkcml2ZXJzIGZvciB4cmRw
LiINCj4gKw0KPiArTElDRU5TRSA9ICJYMTEiDQo+ICtMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hMjUyMzY2MDMyOWZkY2EzZDk1
NGMwYTg3MzkwZTAwNyANCj4gK1wgIg0KPiArDQo+ICtpbmhlcml0IGF1dG90
b29scyBwa2djb25maWcNCj4gKw0KPiArREVQRU5EUyA9ICJ2aXJ0dWFsL2xp
YngxMSB4c2VydmVyLXhvcmcgeHJkcCBuYXNtLW5hdGl2ZSINCj4gKw0KPiAr
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL25ldXRyaW5vbGFicy94b3Jn
eHJkcC5naXQgXA0KPiArICAgICAgICAgICAiDQo+ICsNCj4gK1NSQ1JFViA9
ICJjMTIyNTQ0ZjE4NGQ0MDMxYmJhZTFhZDgwZmJhYjU1NGMzNGE5NDI3Ig0K
PiArDQo+ICtQViA9ICIwLjIuNStnaXQke1NSQ1BWfSINCj4gKw0KPiArUyA9
ICIke1dPUktESVJ9L2dpdCINCj4gKw0KPiArRklMRVNfJHtQTn0gKz0gIiR7
bGliZGlyfS94b3JnL21vZHVsZXMvKiINCj4gKw0KPiArSU5TQU5FX1NLSVBf
JHtQTn0gKz0gInhvcmctZHJpdmVyLWFiaSINCj4gLS0NCj4gMi43LjQNCj4N
Cj4NCj4NCg0KDQoNCgoK

