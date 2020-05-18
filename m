Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.36512.1589782137867204898
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 23:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,406,1583164800"; 
   d="scan'208";a="92434531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 May 2020 14:08:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E1FC24BCC89E;
	Mon, 18 May 2020 14:08:47 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 May 2020 14:08:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223])
 by G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223%14]) with mapi
 id 15.00.1497.006; Mon, 18 May 2020 14:08:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Tim Orling <ticotimo@gmail.com>
Subject: =?UTF-8?B?562U5aSNOiBbb2VdIFttZXRhLXB5dGhvbl0gW1BBVENIXSBweXRob24zLXBhcnNlLXR5cGU6IE1vZGlmeSBwdGVzdCBvdXRwdXQgZm9ybWF0?=
Thread-Topic: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest
 output format
Thread-Index: AQHWKKOQ6mI1993veEWp8imMjfO176itXZSA
Date: Mon, 18 May 2020 06:08:49 +0000
Message-ID: <c3f75d649f9742d68fd74a76236b2fab@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <1589293385-96425-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <717899d43ac1c6d9f7b4f334b705e10b0fbd1ae3.camel@linuxfoundation.org>
In-Reply-To: <717899d43ac1c6d9f7b4f334b705e10b0fbd1ae3.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E1FC24BCC89E.AE90E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm93IEkgaGF2ZSBtb2RpZmllZCB0aGUgb3V0cHV0IG9mIHB5dGVzdCBieSBt
b2RpZnlpbmcgcHRlc3QtcnVubmVyLiBNeSBzb2x1dGlvbiBpcyB0aGF0IGlm
IE9TUyB1c2VzIHB5dGVzdCB0ZXN0aW5nLCBuYW1lIGl0cyBwdGVzdCBmaWxl
IHJ1bi1wdGVzdC1weXRlc3QuDQoNClRoZSBjb250ZW50IG9mIHJ1bi1wdGVz
dC1weXRlc3QgaXMgYXMgZm9sbG93czoNCnB5dGVzdCAtbyBsb2dfY2xpID0g
dHJ1ZSAtbyBsb2dfY2xpX2xldmVsID0gSU5GTw0KDQpUaGUgdGVzdCBvdXRw
dXQgaXMgYXMgZm9sbG93czoNClNUQVJUOiBwdGVzdC1ydW5uZXINCjIwMjAt
MDUtMThUMDU6NDINCkJFR0lOOiAvdXNyL2xpYi9weXRob24zLXBhcnNlLXR5
cGUvcHRlc3QNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09IHRlc3Qg
c2Vzc2lvbiBzdGFydHMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQpwbGF0Zm9ybSBsaW51eCAtLSBQeXRob24gMy44LjIsIHB5dGVzdC01LjMu
NSwgcHktMS44LjEsIHBsdWdneS0wLjEzLjENCnJvb3RkaXI6IC91c3IvbGli
L3B5dGhvbjMtcGFyc2UtdHlwZS9wdGVzdA0KY29sbGVjdGVkIDE5MiBpdGVt
cw0KDQpQQVNTOiB0ZXN0cy90ZXN0X2J1aWxkZXIucHk6OlRlc3RUeXBlQnVp
bGRlcjRFbnVtOjp0ZXN0X21ha2VfZW51bV93aXRoX2RpY3QgDQpQQVNTOiB0
ZXN0cy90ZXN0X2J1aWxkZXIucHk6OlRlc3RUeXBlQnVpbGRlcjRFbnVtOjp0
ZXN0X21ha2VfZW51bV93aXRoX2VudW1fY2xhc3MgDQpQQVNTOiB0ZXN0cy90
ZXN0X2J1aWxkZXIucHk6OlRlc3RUeXBlQnVpbGRlcjRFbnVtOjp0ZXN0X3Bh
cnNlX2VudW1feWVzbm8gDQouLi4NClBBU1M6IHRlc3RzL3Rlc3RfcGFyc2Vf
dXRpbC5weTo6VGVzdEZpZWxkUGFyc2VyOjp0ZXN0X2V4dHJhY3RfdHlwZXMg
DQpQQVNTOiB0ZXN0cy90ZXN0X3BhcnNlX3V0aWwucHk6OlRlc3RGaWVsZFBh
cnNlcjo6dGVzdF9wYXJzZV9fcmFpc2VzX2Vycm9yX3dpdGhfbWlzc2luZ19v
cl9wYXJ0aWFsX2JyIA0KUEFTUzogdGVzdHMvdGVzdF9wYXJzZV91dGlsLnB5
OjpUZXN0RmllbGRQYXJzZXI6OnRlc3RfcGFyc2VfX3dpdGhfdmFsaWRfZmll
bGRzIA0KDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09IDE5MiBw
YXNzZWQgaW4gMTguNDFzID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQpTVE9QOiBwdGVzdC1ydW5uZXINCkRVUkFUSU9OOiAzMg0KRU5EOiAvdXNy
L2xpYi9weXRob24zLXBhcnNlLXR5cGUvcHRlc3QNCjIwMjAtMDUtMThUMDU6
NDINClNUT1A6IHB0ZXN0LXJ1bm5lcg0KDQotLS0tLemCruS7tuWOn+S7ti0t
LS0tDQrlj5Hku7bkuro6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPiANCuWPkemAgeaXtumXtDogMjAyMOW5
tDXmnIgxM+aXpSA1OjIzDQrmlLbku7bkuro6IFphbmcsIFJ1b2NoZW4v6Ien
IOiLpeWwmCA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+OyBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K5oqE6YCBOiBU
aW0gT3JsaW5nIDx0aWNvdGltb0BnbWFpbC5jb20+DQrkuLvpopg6IFJlOiBb
b2VdIFttZXRhLXB5dGhvbl0gW1BBVENIXSBweXRob24zLXBhcnNlLXR5cGU6
IE1vZGlmeSBwdGVzdCBvdXRwdXQgZm9ybWF0DQoNCk9uIFR1ZSwgMjAyMC0w
NS0xMiBhdCAyMjoyMyArMDgwMCwgemFuZ3JjIHdyb3RlOg0KPiBTaWduZWQt
b2ZmLWJ5OiBaYW5nIFJ1b2NoZW4gPHphbmdyYy5mbnN0QGNuLmZ1aml0c3Uu
Y29tPg0KPiAtLS0NCj4gIC4uLi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBhcnNlLXR5cGUvcnVuLXB0ZXN0ICAgICAgICB8IDIgKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCANCj4gYS9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhcnNlLXR5cGUvcnVuLXB0ZXN0
IA0KPiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGFyc2UtdHlwZS9ydW4tcHRlc3QNCj4gaW5kZXggNWNlYzcxMTY5
Li5iNjNjNGRlMGQgMTAwNjQ0DQo+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFyc2UtdHlwZS9ydW4tcHRl
c3QNCj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYXJzZS10eXBlL3J1bi1wdGVzdA0KPiBAQCAtMSwzICsx
LDMgQEANCj4gICMhL2Jpbi9zaA0KPiAgDQo+IC1weXRlc3QNCj4gK3B5dGVz
dCAtbyBsb2dfY2xpPXRydWUgLW8gbG9nX2NsaV9sZXZlbD1JTkZPIHwgc2Vk
IC1lICdzL1xbLi4uJVxdLy9nJ3wgc2VkIC1lICdzL1BBU1NFRC9QQVNTL2cn
fCBzZWQgLWUgJ3MvRkFJTEVEL0ZBSUwvZyd8c2VkIC1lICdzL1NLSVBQRUQv
U0tJUC9nJ3wgYXdrICd7aWYgKCRORj09IlBBU1MiIHx8ICRORj09IkZBSUwi
IHx8ICRORj09IlNLSVAiIHx8ICRORj09IlhGQUlMIiB8fCAkTkY9PSJYUEFT
UyIpe3ByaW50ZiAiJXM6ICVzXG4iLCAkTkYsICQwfWVsc2V7cHJpbnR9fSd8
IGF3ayAne2lmICgkTkY9PSJQQVNTIiB8fCAkTkY9PSJGQUlMIiB8fCAkTkY9
PSJTS0lQIiB8fCAkTkY9PSJYRkFJTCIgfHwgJE5GPT0iWFBBU1MiKSB7JE5G
PSIiO3ByaW50ICQwfWVsc2V7cHJpbnR9fScNCg0KUmF0aGVyIHRoYW4gZG9p
bmcgdGhpcyBmb3IgZXZlcnkgcHl0aG9uIG1vZHVsZSwgaXQgbWF5IGJlIGFu
IGlkZWEgdG8NCmNvbnNpZGVyOg0KDQphKSB0ZWFjaGluZyBwdGVzdCBydW5u
ZXIgaG93IHRvIGhhbmRsZSB0aGUgYWx0ZXJuYXRlIG91dHB1dCBmb3JtYXQg
KHRyaWdnZXJlZCBieSBydW4tcHRlc3QtWFhYIGluc3RlYWQgb2YgcnVuLXB0
ZXN0KQ0KDQpvcg0KDQpiKSBhZGRpbmcgYSBjb21tb24gcHl0aG9uIHNjcmlw
dCB3aGljaCBjb3VsZCBhdm9pZCBhbGwgdGhpcyBzZWQvYXdrIG1hZ2ljIGFu
ZCB0aGUgZXh0cmEgZGVwZW5kZW5jaWVzDQoNCm9yDQoNCmMpIHBhdGNoIGlu
IGEgcGFyYW1ldGVyIHRvIHB5dGVzdCB3aGljaCBvdXRwdXRzIHRoZSBkYXRh
IGluIHRoZSBmb3JtYXQgd2UgbmVlZC4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJk
DQoNCg0KDQoKCg==
