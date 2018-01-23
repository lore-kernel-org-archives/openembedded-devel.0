Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2F67874D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:38:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35711811"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2018 15:38:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D2DEB486A78E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:38:30 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0361.001; Tue, 23 Jan 2018 15:38:29 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-networking][PATCHv2] samba: Add packagegroup
Thread-Index: AQHTcj/t5lU0TxdbW0qEqrhY6/o2tqOBPyIA
Date: Tue, 23 Jan 2018 07:38:33 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9A988@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.156]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D2DEB486A78E.AB866
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking][PATCHv2] samba: Add packagegroup
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
X-List-Received-Date: Tue, 23 Jan 2018 07:38:30 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogWmhlbmcsIFJ1b3Fpbi/WoyDI9MfVIA0KU2VudDogTW9uZGF5LCBE
ZWNlbWJlciAxMSwgMjAxNyAxMDoyMiBQTQ0KVG86IG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogWmhlbmcsIFJ1b3Fp
bi/WoyDI9MfVIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQpTdWJq
ZWN0OiBbb2VdW21ldGEtbmV0d29ya2luZ11bUEFUQ0h2Ml0gc2FtYmE6IEFk
ZCBwYWNrYWdlZ3JvdXANCg0KQWRkIHBhY2thZ2Vncm91cCBmb3Igc2FtYmEs
IGZvciB0aGVyZSBhcmUgdG9vIG1hbnkgcnBtcyBpbiBzYW1iYSBhbmQgaXQn
cyBoYXJkIHRvIG1hbmFnZS4NCg0KU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVv
cWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQotLS0NCiAuLi4v
cmVjaXBlcy1jb25uZWN0aXZpdHkvc2FtYmEvc2FtYmFfNC42LjcuYmIgICAg
ICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0t
Z2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Nh
bWJhL3NhbWJhXzQuNi43LmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L3NhbWJhL3NhbWJhXzQuNi43LmJiDQppbmRleCAyYjIy
N2M5Li4wYmFjYjAyIDEwMDY0NA0KLS0tIGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L3NhbWJhL3NhbWJhXzQuNi43LmJiDQorKysg
Yi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2FtYmEv
c2FtYmFfNC42LjcuYmINCkBAIC0xNjIsNyArMTYyLDcgQEAgUEFDS0FHRVMg
PSsgIiR7UE59LXB5dGhvbiAke1BOfS1waWRsIFwNCiAgICAgICAgICAgICAg
JHtQTn0tZHNkYi1tb2R1bGVzICR7UE59LXRlc3RzdWl0ZSByZWdpc3RyeS10
b29scyBcDQogICAgICAgICAgICAgIHdpbmJpbmQgXA0KICAgICAgICAgICAg
ICAke1BOfS1jb21tb24gJHtQTn0tYmFzZSAke1BOfS1jdGRiLXRlc3RzIFwN
Ci0gICAgICAgICAgICAgc21iY2xpZW50Ig0KKyAgICAgICAgICAgICBzbWJj
bGllbnQgJHtQTn0tY2xpZW50ICR7UE59LXRlc3QiDQogDQogcHl0aG9uIHNh
bWJhX3BvcHVsYXRlX3BhY2thZ2VzKCkgew0KICAgICBkZWYgbW9kdWxlX2hv
b2soZmlsZSwgcGtnLCBwYXR0ZXJuLCBmb3JtYXQsIGJhc2VuYW1lKToNCkBA
IC0yNTQsMyArMjU0LDIwIEBAIEZJTEVTX3NtYmNsaWVudCA9ICIke2JpbmRp
cn0vY2lmc2RkIFwNCiANCiBSREVQRU5EU18ke1BOfS1waWRsX2FwcGVuZCA9
ICIgcGVybCINCiBGSUxFU18ke1BOfS1waWRsID0gIiR7YmluZGlyfS9waWRs
ICR7ZGF0YWRpcn0vcGVybDUvUGFyc2UiDQorDQorU1VNTUFSWV8ke1BOfS1j
bGllbnQgPSAic2FtYmEgY2xpZW50Ig0KK1JERVBFTkRTXyR7UE59LWNsaWVu
dCA9ICJcDQorICAgIHNtYmNsaWVudCBcDQorICAgIHdpbmJpbmQgXA0KKyAg
ICByZWdpc3RyeS10b29scyBcDQorICAgICR7UE59LXBpZGwgXA0KKyAgICAi
IA0KKw0KK0FMTE9XX0VNUFRZXyR7UE59LWNsaWVudCA9ICIxIg0KKw0KK1JE
RVBFTkRTXyR7UE59LXRlc3QgPSAiXA0KKyAgICAke1BOfS1jdGRiLXRlc3Rz
IFwNCisgICAgJHtQTn0tdGVzdHN1aXRlIFwNCisgICAgIg0KKw0KK0FMTE9X
X0VNUFRZXyR7UE59LXRlc3QgPSAiMSINCi0tIA0KMi43LjQNCg0KCgo=

