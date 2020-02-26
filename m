Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2A4616F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 09:33:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,487,1574092800"; d="scan'208";a="84286940"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 17:33:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D986B406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:23:34 +0800 (CST)
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 17:33:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local ([fe80::99b4:f2c2:35f3:671a])
	by G08CNEXMBPEKD06.g08.fujitsu.local
	([fe80::99b4:f2c2:35f3:671a%14]) with
	mapi id 15.00.1395.000; Wed, 26 Feb 2020 17:33:18 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
Thread-Index: AQHV65htF+yQebXm7UCuZcp9jvKJa6gtN7CA
Date: Wed, 26 Feb 2020 09:33:18 +0000
Message-ID: <0999b8fa5f394721bdd25b24e1afa2d7@G08CNEXMBPEKD06.g08.fujitsu.local>
References: <1582536523-89923-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<549f56c2-9056-ff8c-96f4-713437fc8de0@gmail.com>
In-Reply-To: <549f56c2-9056-ff8c-96f4-713437fc8de0@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D986B406AB15.A903C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Wed, 26 Feb 2020 09:33:25 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbQ0KDQo+IFRoaXMgaXMgY2F1c2luZyBzbm9ydCBidWlsZCBmYWls
dXJlcyBzaW5jZSB3ZSB1c2Ugc25vcnQgMi45DQo+IA0KPiBodHRwczovL2Vy
cm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzM5MjYxMS8N
Cj4gDQo+IFBlcmhhcHMgd2UgbmVlZCB0byB1cGdyYWRlIHNub3J0IDMuMCBh
bmQgZGFxIHRvZ2V0aGVyDQoNCkknbSBzb3JyeSB0byBoYXZlIHRoaXMgZXJy
b3IuIFRvIGZpeCBpdCwgSSBoYXZlIHRyaWVkIHRvIHVwZ3JhZGUgc25vcnQg
My4wIGJ1dCBpdCBmYWlsZWTvvIhpbiBkb19jb25maWd1cmUgdGFzaykuDQoN
CkFuZCBob3cgc2hvdWxkIHdlIGRvIG5leHQ/IFRvIGZpeCBzbm9ydCBhbmQg
bWFrZSBpdCBwYXNzPw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5n
IEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1Qp
DQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0K
ICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3Jx
LmZuc3RAY24uZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI1LCAyMDIwIDE6MDAg
UE0NCj4gVG86IFpoZW5nLCBSdW9xaW4v6YORIOiLpemSpiA8emhlbmdycS5m
bnN0QGNuLmZ1aml0c3UuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtt
ZXRhLW5ldHdvcmtpbmddW1BBVENIXSBkYXE6IHVwZ3JhZGUgMi4wLjYgLT4g
Mi4yLjINCj4gDQo+IA0KPiANCj4gT24gMi8yNC8yMCAxOjI4IEFNLCBaaGVu
ZyBSdW9xaW4gd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVv
cWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+
ID4gICAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkvZGFxL3tkYXFfMi4wLjYu
YmIgPT4gZGFxXzIuMi4yLmJifSAgIHwgNCArKy0tDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
ICAgcmVuYW1lIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9kYXEve2RhcV8yLjAuNi5iYiA9Pg0KPiBkYXFfMi4yLjIuYmJ9ICg4OCUp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2RhcS9kYXFfMi4wLjYuYmIgYi9tZXRhLQ0KPiBu
ZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RhcS9kYXFfMi4yLjIu
YmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDg4JQ0KPiA+IHJlbmFtZSBmcm9t
IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kYXEvZGFx
XzIuMC42LmJiDQo+ID4gcmVuYW1lIHRvIG1ldGEtbmV0d29ya2luZy9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kYXEvZGFxXzIuMi4yLmJiDQo+ID4gaW5kZXgg
NDJmZmIxN2ExLi4yOWFjNWM3NzAgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RhcS9kYXFfMi4wLjYu
YmINCj4gPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGFxL2RhcV8yLjIuMi5iYg0KPiA+IEBAIC0yNSw4ICsyNSw4IEBA
IEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUtbmZxLW1vZHVsZSAtLWRpc2Fi
bGUtaXBxLQ0KPiBtb2R1bGUgLS1pbmNsdWRlZGlyPSR7aW5jbHVkZQ0KPiA+
ICAgUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElT
VFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iDQo+ID4gICBQQUNLQUdFQ09O
RklHW2lwdjZdID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIg0K
PiA+DQo+ID4gLVNSQ19VUklbbWQ1c3VtXSA9ICIyY2Q2ZGE0MjJhNzJjMTI5
YzY4NWZjNGJiODQ4YzI0YyINCj4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0N
Cj4gImI0MGUxZDEyNzNlMDhhYWVhYTg2ZTY5ZDRmMjhkNTM1YjdlNTNiZGIz
ODk4YWRmNTM5MjY2YjYzMTM3YmU3Y2IiDQo+ID4gK1NSQ19VUklbbWQ1c3Vt
XSA9ICJjNjFmNjA2NzRhNWY5NTFmMGM1MGZhZjMzYTYxMWZlZSINCj4gPiAr
U1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjdjZDgxOGNhYmIxYWQzNTM2MGU4
MzA3NmU1NDc3NWYwNzE2NWVlNzE0MDdkYzY3MmQxNDdlMjdkM2NkMzdmN2Ii
DQo+ID4NCj4gPiAgIGluaGVyaXQgYXV0b3Rvb2xzDQo+ID4NCj4gPg0KPiBU
aGlzIGlzIGNhdXNpbmcgc25vcnQgYnVpbGQgZmFpbHVyZXMgc2luY2Ugd2Ug
dXNlIHNub3J0IDIuOQ0KPiANCj4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9q
ZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy8zOTI2MTEvDQo+IA0KPiBQZXJoYXBz
IHdlIG5lZWQgdG8gdXBncmFkZSBzbm9ydCAzLjAgYW5kIGRhcSB0b2dldGhl
cg0KPiANCg0KCgo=

