Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 370EE771F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 05:48:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35900087"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2018 13:48:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 14F4E49F19A2;
	Thu, 25 Jan 2018 13:48:35 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Thu, 25 Jan 2018 13:48:39 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCHv2] samba: Add packagegroup
Thread-Index: AQHTlKcuOL0MjvyQfEegaXc5wxoOWqOEDwKw
Date: Thu, 25 Jan 2018 05:48:38 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9AD94@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363A9A988@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20180124010556.367817ec@t460p>
In-Reply-To: <20180124010556.367817ec@t460p>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.156]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 14F4E49F19A2.AD03D
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
X-List-Received-Date: Thu, 25 Jan 2018 05:48:36 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmVhczoNCiAgICAgSSdtIHNvcnJ5IEkgZGlkbid0IGV4cGxhaW4g
aXQuIA0KPiBZb3UgZGlkbid0IGFuc3dlciBteSBxdWVzdGlvbiBhYm91dCB0
aGUgZGVwZW5kZW5jeSBvbiBwZXJsOg0KDQogICBXZWxsLCB0aGUgc2FtYmEt
cGlkbCBpcyBub3QgcmVxdWlyZWQgdG8gcnVuIHRoZSBTYW1iYSBzZXJ2ZXIu
DQoNCj4gSW5zdGVhZCB5b3UgcmVtb3ZlZCB0aGUgc2VydmVyIG1ldGEgcGFj
a2FnZSB3aXRob3V0IGV4cGxhbmF0aW9uLiBJdCdzIGhhcmQgdG8gZm9sbG93
IHRoZSByZWFzb25pbmcgYmVoaW5kIHlvdXIgcGF0Y2ggaXRlcmF0aW9ucyB0
aGlzIHdheS4NCg0KICAgSSdtIHNvcnJ5IEkgbWlzcyBpdCwgaW4gbXkgdjMg
cGF0Y2gsIEkgd2lsbCBpbmNsdWRlIGl0IGxpa2UgdGhpczoNCitSREVQRU5E
U18ke1BOfS1zZXJ2ZXIgPSAiXA0KKyAgICAke1BOfSBcDQorICAgIHdpbmJp
bmQgXA0KKyAgICByZWdpc3RyeS10b29scyBcDQorICAgICINCg0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdh
cmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUg
Um9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAx
MiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20N
Cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVt
YmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBb
bWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZWFzIE9iZXJyaXR0ZXIN
ClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNCwgMjAxOCA4OjA2IEFNDQpU
bzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
ClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIdjJd
IHNhbWJhOiBBZGQgcGFja2FnZWdyb3VwDQoNCk9uIFR1ZSwgMjMgSmFuIDIw
MTggMDc6Mzg6MzMgKzAwMDANCiJaaGVuZywgUnVvcWluIiA8emhlbmdycS5m
bnN0QGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCg0KPiBwaW5nDQoNCllvdSBk
aWRuJ3QgYW5zd2VyIG15IHF1ZXN0aW9uIGFib3V0IHRoZSBkZXBlbmRlbmN5
IG9uIHBlcmw6DQoNCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3Bp
cGVybWFpbC9vcGVuZW1iZWRkZWQtZGV2ZWwvMjAxNy1EZWNlbWJlci8xMTU5
MzguaHRtbA0KDQpJbnN0ZWFkIHlvdSByZW1vdmVkIHRoZSBzZXJ2ZXIgbWV0
YSBwYWNrYWdlIHdpdGhvdXQgZXhwbGFuYXRpb24uIEl0J3MgaGFyZCB0byBm
b2xsb3cgdGhlIHJlYXNvbmluZyBiZWhpbmQgeW91ciBwYXRjaCBpdGVyYXRp
b25zIHRoaXMgd2F5Lg0KDQpCdHcsIHlvdSBrZXB0IG9uZSBvZiB0aGUgU1VN
TUFSWSBsaW5lcywgd2hpY2ggZG9lc24ndCBjb250YWluIGFueXRoaW5nIGJ1
dCB0aGUgcGFja2FnZSBuYW1lLg0KDQpSZWdhcmRzLA0KQW5kcmVhcw0KDQoN
Cg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gWmhlbmcgUnVvcWluDQo+IE5hbmppbmcgRnVq
aXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCj4g
QUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCj4g
ICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gTUFJTCA6IHpoZW5n
cnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KPiANCj4gDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFpoZW5nLCBSdW9xaW4v6YORIOiL
pemSpg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDExLCAyMDE3IDEwOjIy
IFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBDYzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVu
Z3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtvZV1bbWV0
YS1uZXR3b3JraW5nXVtQQVRDSHYyXSBzYW1iYTogQWRkIHBhY2thZ2Vncm91
cA0KPiANCj4gQWRkIHBhY2thZ2Vncm91cCBmb3Igc2FtYmEsIGZvciB0aGVy
ZSBhcmUgdG9vIG1hbnkgcnBtcyBpbiBzYW1iYSBhbmQgaXQncyBoYXJkIHRv
IG1hbmFnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8
emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1iYS9zYW1iYV80LjYuNy5iYiAgICAg
ICAgIHwgMTkgKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc2FtYmEvc2FtYmFfNC42LjcuYmIgDQo+IGIvbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NhbWJhL3NhbWJhXzQuNi43LmJiDQo+
IGluZGV4IDJiMjI3YzkuLjBiYWNiMDIgMTAwNjQ0DQo+IC0tLSBhL21ldGEt
bmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1iYS9zYW1iYV80
LjYuNy5iYg0KPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvc2FtYmEvc2FtYmFfNC42LjcuYmINCj4gQEAgLTE2Miw3ICsx
NjIsNyBAQCBQQUNLQUdFUyA9KyAiJHtQTn0tcHl0aG9uICR7UE59LXBpZGwg
XA0KPiAgICAgICAgICAgICAgICR7UE59LWRzZGItbW9kdWxlcyAke1BOfS10
ZXN0c3VpdGUgcmVnaXN0cnktdG9vbHMgXA0KPiAgICAgICAgICAgICAgIHdp
bmJpbmQgXA0KPiAgICAgICAgICAgICAgICR7UE59LWNvbW1vbiAke1BOfS1i
YXNlICR7UE59LWN0ZGItdGVzdHMgXA0KPiAtICAgICAgICAgICAgIHNtYmNs
aWVudCINCj4gKyAgICAgICAgICAgICBzbWJjbGllbnQgJHtQTn0tY2xpZW50
ICR7UE59LXRlc3QiDQo+ICANCj4gIHB5dGhvbiBzYW1iYV9wb3B1bGF0ZV9w
YWNrYWdlcygpIHsNCj4gICAgICBkZWYgbW9kdWxlX2hvb2soZmlsZSwgcGtn
LCBwYXR0ZXJuLCBmb3JtYXQsIGJhc2VuYW1lKToNCj4gQEAgLTI1NCwzICsy
NTQsMjAgQEAgRklMRVNfc21iY2xpZW50ID0gIiR7YmluZGlyfS9jaWZzZGQg
XA0KPiAgDQo+ICBSREVQRU5EU18ke1BOfS1waWRsX2FwcGVuZCA9ICIgcGVy
bCINCj4gIEZJTEVTXyR7UE59LXBpZGwgPSAiJHtiaW5kaXJ9L3BpZGwgJHtk
YXRhZGlyfS9wZXJsNS9QYXJzZSINCj4gKw0KPiArU1VNTUFSWV8ke1BOfS1j
bGllbnQgPSAic2FtYmEgY2xpZW50Ig0KPiArUkRFUEVORFNfJHtQTn0tY2xp
ZW50ID0gIlwNCj4gKyAgICBzbWJjbGllbnQgXA0KPiArICAgIHdpbmJpbmQg
XA0KPiArICAgIHJlZ2lzdHJ5LXRvb2xzIFwNCj4gKyAgICAke1BOfS1waWRs
IFwNCj4gKyAgICAiIA0KPiArDQo+ICtBTExPV19FTVBUWV8ke1BOfS1jbGll
bnQgPSAiMSINCj4gKw0KPiArUkRFUEVORFNfJHtQTn0tdGVzdCA9ICJcDQo+
ICsgICAgJHtQTn0tY3RkYi10ZXN0cyBcDQo+ICsgICAgJHtQTn0tdGVzdHN1
aXRlIFwNCj4gKyAgICAiDQo+ICsNCj4gK0FMTE9XX0VNUFRZXyR7UE59LXRl
c3QgPSAiMSINCg0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGlu
ZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg0KDQoKCg==

