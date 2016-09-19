Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31AA56AC37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 01:16:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11086866"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2016 09:16:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 44F3A43653EC;
	Mon, 19 Sep 2016 09:16:47 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0279.002; Mon, 19 Sep 2016 09:16:50 +0800
From: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH] lksctp-tools: 1.0.16 -> 1.0.17
Thread-Index: AQHSDoNlVhpqgrDer0mMTLrcvz8QlqCACT/Q
Date: Mon, 19 Sep 2016 01:16:50 +0000
Message-ID: <C43D7C6FFC265C429F44FEB1C68F1B25633E0B6A@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1473829173-3175-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<20160914122720.GD25499@mentor.com>
In-Reply-To: <20160914122720.GD25499@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.120]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 44F3A43653EC.AD5B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] lksctp-tools: 1.0.16 -> 1.0.17
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
X-List-Received-Date: Mon, 19 Sep 2016 01:16:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U29ycnksIEkgZm9yZ2V0IHRoYXQgSSBoYWQgc2VudCBpdC4gSXQncyBteSBm
YXVsdC4gUGxlYXNlIGlnbm9yZSBpdC4gVGhhbmtzLg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSm9lIE1hY0RvbmFsZCBbbWFpbHRv
OkpvZV9NYWNEb25hbGRAbWVudG9yLmNvbV0gDQpTZW50OiBXZWRuZXNkYXks
IFNlcHRlbWJlciAxNCwgMjAxNiA4OjI3IFBNDQpUbzogV2FuZywgWGluL831
IPbODQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BB
VENIXSBsa3NjdHAtdG9vbHM6IDEuMC4xNiAtPiAxLjAuMTcNCg0KW1tvZV0g
W21ldGEtbmV0d29ya2luZ11bUEFUQ0hdIGxrc2N0cC10b29sczogMS4wLjE2
IC0+IDEuMC4xN10gT24gMTYuMDkuMTQgKFdlZCAwMDo1OSkgV2FuZyBYaW4g
d3JvdGU6DQoNCj4gVXBncmFkZSBsa3NjdHAtdG9vbHMgZnJvbSAxLjAuMTYg
dG8gMS4wLjE3Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaW4gPHdh
bmd4aW4yMDE1LmZuc3RAY24uZnVqaXRzdS5jb20+DQoNCklzIHRoaXMgYW55
IGRpZmZlcmVudCB0aGFuIHRoZSBvbmUgeW91IHNlbnQgb3V0IG9uIE1vbmRh
eT8gIEl0IGxvb2tzIGxpa2UgYW4gYWNjaWRlbnRhbCByZS1zZW5kLCBidXQg
SSB0aG91Z2h0IEknZCBhc2sgaW4gY2FzZSB5b3UgaW50ZW5kZWQgdG8gc2Vu
ZCBzb21ldGhpbmcgZGlmZmVyZW50Lg0KDQotSi4NCg0KPiAtLS0NCj4gIC4u
Li9sa3NjdHAtdG9vbHMve2xrc2N0cC10b29sc18xLjAuMTYuYmIgPT4gbGtz
Y3RwLXRvb2xzXzEuMC4xNy5iYn0gICB8IDQgKystLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkgIHJlbmFt
ZSANCj4gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9sa3NjdHAt
dG9vbHMve2xrc2N0cC10b29sc18xLjAuMTYuYmIgDQo+ID0+IGxrc2N0cC10
b29sc18xLjAuMTcuYmJ9ICg5NCUpDQo+IA0KPiBkaWZmIC0tZ2l0IA0KPiBh
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGtzY3RwLXRvb2xz
L2xrc2N0cC10b29sc18xLjAuMTYuYmIgDQo+IGIvbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtc3VwcG9ydC9sa3NjdHAtdG9vbHMvbGtzY3RwLXRvb2xzXzEu
MC4xNy5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDk0JQ0KPiByZW5hbWUgZnJv
bSANCj4gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9sa3NjdHAt
dG9vbHMvbGtzY3RwLXRvb2xzXzEuMC4xNi5iYg0KPiByZW5hbWUgdG8gDQo+
IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGtzY3RwLXRvb2xz
L2xrc2N0cC10b29sc18xLjAuMTcuYmINCj4gaW5kZXggZTZhODRjYy4uMTFj
NDNmZiAxMDA2NDQNCj4gLS0tIA0KPiBhL21ldGEtbmV0d29ya2luZy9yZWNp
cGVzLXN1cHBvcnQvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29sc18xLjAuMTYu
YmINCj4gKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9s
a3NjdHAtdG9vbHMvbGtzY3RwLXRvb2xzXzEuMC4xNw0KPiArKysgLmJiDQo+
IEBAIC0xNCw4ICsxNCw4IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9N
SVJST1J9L2xrc2N0cC8ke0JQfS50YXIuZ3ogXA0KPiAgICAgIGZpbGU6Ly92
NnRlc3Quc2ggXA0KPiAgIg0KPiAgDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAi
NzA4YmIwYjVhNjgwNmFkNmU4ZDEzYzU1YjA2NzUxOGUiDQo+IC1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMDkwM2RkNTI2YjdmMzBhODlkNTAzMWFhMmM4Mjc1
NzYxMmJlY2MzOGVkN2JjNmU0Zjk3MmY4ZGVhZTM1MWYyNiINCj4gK1NSQ19V
UklbbWQ1c3VtXSA9ICI2OGU5YjhmYTRkNGUzMzEwMjliMjQ3YjcyZDQ2ZDdh
NSINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYWViMjA0Y2RiMmJlZmM5
NGQ5ZWIzMDM3ZDE2MDljOWQxZDJjZDUzNzlkNmRkMmMwYThjYTliMTA1MzNh
YTE1Ig0KPiAgDQo+ICAjfCBhcm0tb2UtbGludXgtZ251ZWFiaS1saWJ0b29s
OiBsaW5rOiBhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tYXJjaD1hcm12
NXRlIC1tYXJtIC1tdGh1bWItaW50ZXJ3b3JrIC0tc3lzcm9vdD0vaG9tZS9q
ZW5raW5zL29lL3dvcmxkL3Noci1jb3JlL3RtcC1lZ2xpYmMvc3lzcm9vdHMv
cWVtdWFybSAtc2hhcmVkICAtZlBJQyAtRFBJQyAgLmxpYnMvYmluZHgubyAu
bGlicy9jb25uZWN0eC5vIC5saWJzL3BlZWxvZmYubyAubGlicy9vcHRfaW5m
by5vIC5saWJzL2FkZHJzLm8gLmxpYnMvc2VuZG1zZy5vIC5saWJzL3JlY3Zt
c2cubyAgICAtbWFyY2g9YXJtdjV0ZSAtbWFybSAtbXRodW1iLWludGVyd29y
ayAtLXN5c3Jvb3Q9L2hvbWUvamVua2lucy9vZS93b3JsZC9zaHItY29yZS90
bXAtZWdsaWJjL3N5c3Jvb3RzL3FlbXVhcm0gLU8yIC1XbCwtLXZlcnNpb24t
c2NyaXB0PS9ob21lL2plbmtpbnMvb2Uvd29ybGQvc2hyLWNvcmUvdG1wLWVn
bGliYy93b3JrL2FybXY1dGUtb2UtbGludXgtZ251ZWFiaS9sa3NjdHAtdG9v
bHMvMS4wLjE2LXIwL2xrc2N0cC10b29scy0xLjAuMTYvc3JjL2xpYi9WZXJz
aW9ucy5tYXAgLVdsLC1PMSAtV2wsLS1oYXNoLXN0eWxlPWdudSAtV2wsLS1h
cy1uZWVkZWQgICAtV2wsLXNvbmFtZSAtV2wsbGlic2N0cC5zby4xIC1vIC5s
aWJzL2xpYnNjdHAuc28uMS4wLjE2DQo+ICAjfCANCj4gL2hvbWUvamVua2lu
cy9vZS93b3JsZC9zaHItY29yZS90bXAtZWdsaWJjL3N5c3Jvb3RzL3g4Nl82
NC1saW51eC91c3IvbA0KPiBpYmV4ZWMvYXJtLW9lLWxpbnV4LWdudWVhYmkv
Z2NjL2FybS1vZS1saW51eC1nbnVlYWJpLzQuOS4wL2xkOiBlcnJvcjogDQo+
IHN5bWJvbCBzY3RwX2Nvbm5lY3R4IGhhcyB1bmRlZmluZWQgdmVyc2lvbg0K
PiAtLQ0KPiAyLjcuNA0KPiANCj4gDQo+IA0KLS0NCi1Kb2UgTWFjRG9uYWxk
Lg0KOndxDQoKCg==

