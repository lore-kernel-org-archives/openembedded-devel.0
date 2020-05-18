Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.36529.1589782318414791096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 23:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,406,1583164800"; 
   d="scan'208";a="92435805"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 May 2020 14:11:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A9AF44BCC8A5;
	Mon, 18 May 2020 14:11:53 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 May 2020 14:11:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223])
 by G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223%14]) with mapi
 id 15.00.1497.006; Mon, 18 May 2020 14:11:57 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Tim Orling <ticotimo@gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
Thread-Topic: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest
 output format
Thread-Index: AdYs2xOatmbo8LSHQZmURiz3V3O32A==
Date: Mon, 18 May 2020 06:11:56 +0000
Message-ID: <23ede0caf80b42f39d56544e267cee99@G08CNEXMBPEKD04.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A9AF44BCC8A5.AC15D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgdGhpcyBzb2x1dGlvbiBmZWFzaWJsZSwgYW5kIGlmIGl0IGlzIGZlYXNp
YmxlLCB3aGljaCBtYWlsaW5nIGxpc3Qgc2hvdWxkIEkgc3VibWl0IHRoZSBw
YXRjaCB0b++8nw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bk
uro6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
5Luj6KGoIHphbmdyYw0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0NeaciDE45pel
IDE0OjA5DQrmlLbku7bkuro6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCuaKhOmAgTogVGltIE9ybGluZyA8
dGljb3RpbW9AZ21haWwuY29tPg0K5Li76aKYOiDnrZTlpI06IFtvZV0gW21l
dGEtcHl0aG9uXSBbUEFUQ0hdIHB5dGhvbjMtcGFyc2UtdHlwZTogTW9kaWZ5
IHB0ZXN0IG91dHB1dCBmb3JtYXQNCg0KTm93IEkgaGF2ZSBtb2RpZmllZCB0
aGUgb3V0cHV0IG9mIHB5dGVzdCBieSBtb2RpZnlpbmcgcHRlc3QtcnVubmVy
LiBNeSBzb2x1dGlvbiBpcyB0aGF0IGlmIE9TUyB1c2VzIHB5dGVzdCB0ZXN0
aW5nLCBuYW1lIGl0cyBwdGVzdCBmaWxlIHJ1bi1wdGVzdC1weXRlc3QuDQoN
ClRoZSBjb250ZW50IG9mIHJ1bi1wdGVzdC1weXRlc3QgaXMgYXMgZm9sbG93
czoNCnB5dGVzdCAtbyBsb2dfY2xpID0gdHJ1ZSAtbyBsb2dfY2xpX2xldmVs
ID0gSU5GTw0KDQpUaGUgdGVzdCBvdXRwdXQgaXMgYXMgZm9sbG93czoNClNU
QVJUOiBwdGVzdC1ydW5uZXINCjIwMjAtMDUtMThUMDU6NDINCkJFR0lOOiAv
dXNyL2xpYi9weXRob24zLXBhcnNlLXR5cGUvcHRlc3QgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0gdGVzdCBzZXNzaW9uIHN0YXJ0cyA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0gcGxhdGZvcm0gbGludXggLS0gUHl0
aG9uIDMuOC4yLCBweXRlc3QtNS4zLjUsIHB5LTEuOC4xLCBwbHVnZ3ktMC4x
My4xDQpyb290ZGlyOiAvdXNyL2xpYi9weXRob24zLXBhcnNlLXR5cGUvcHRl
c3QgY29sbGVjdGVkIDE5MiBpdGVtcw0KDQpQQVNTOiB0ZXN0cy90ZXN0X2J1
aWxkZXIucHk6OlRlc3RUeXBlQnVpbGRlcjRFbnVtOjp0ZXN0X21ha2VfZW51
bV93aXRoX2RpY3QNClBBU1M6IHRlc3RzL3Rlc3RfYnVpbGRlci5weTo6VGVz
dFR5cGVCdWlsZGVyNEVudW06OnRlc3RfbWFrZV9lbnVtX3dpdGhfZW51bV9j
bGFzcw0KUEFTUzogdGVzdHMvdGVzdF9idWlsZGVyLnB5OjpUZXN0VHlwZUJ1
aWxkZXI0RW51bTo6dGVzdF9wYXJzZV9lbnVtX3llc25vDQouLi4NClBBU1M6
IHRlc3RzL3Rlc3RfcGFyc2VfdXRpbC5weTo6VGVzdEZpZWxkUGFyc2VyOjp0
ZXN0X2V4dHJhY3RfdHlwZXMNClBBU1M6IHRlc3RzL3Rlc3RfcGFyc2VfdXRp
bC5weTo6VGVzdEZpZWxkUGFyc2VyOjp0ZXN0X3BhcnNlX19yYWlzZXNfZXJy
b3Jfd2l0aF9taXNzaW5nX29yX3BhcnRpYWxfYnINClBBU1M6IHRlc3RzL3Rl
c3RfcGFyc2VfdXRpbC5weTo6VGVzdEZpZWxkUGFyc2VyOjp0ZXN0X3BhcnNl
X193aXRoX3ZhbGlkX2ZpZWxkcyANCg0KDQo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PSAxOTIgcGFzc2VkIGluIDE4LjQxcyA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KU1RPUDogcHRlc3QtcnVubmVyDQpEVVJBVElP
TjogMzINCkVORDogL3Vzci9saWIvcHl0aG9uMy1wYXJzZS10eXBlL3B0ZXN0
DQoyMDIwLTA1LTE4VDA1OjQyDQpTVE9QOiBwdGVzdC1ydW5uZXINCg0KLS0t
LS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCuWPkemA
geaXtumXtDogMjAyMOW5tDXmnIgxM+aXpSA1OjIzDQrmlLbku7bkuro6IFph
bmcsIFJ1b2NoZW4v6IenIOiLpeWwmCA8emFuZ3JjLmZuc3RAY24uZnVqaXRz
dS5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0K5oqE6YCBOiBUaW0gT3JsaW5nIDx0aWNvdGltb0BnbWFpbC5jb20+
DQrkuLvpopg6IFJlOiBbb2VdIFttZXRhLXB5dGhvbl0gW1BBVENIXSBweXRo
b24zLXBhcnNlLXR5cGU6IE1vZGlmeSBwdGVzdCBvdXRwdXQgZm9ybWF0DQoN
Ck9uIFR1ZSwgMjAyMC0wNS0xMiBhdCAyMjoyMyArMDgwMCwgemFuZ3JjIHdy
b3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBaYW5nIFJ1b2NoZW4gPHphbmdyYy5m
bnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBhcnNlLXR5cGUvcnVuLXB0ZXN0ICAg
ICAgICB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFyc2Ut
dHlwZS9ydW4tcHRlc3QNCj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBhcnNlLXR5cGUvcnVuLXB0ZXN0DQo+IGlu
ZGV4IDVjZWM3MTE2OS4uYjYzYzRkZTBkIDEwMDY0NA0KPiAtLS0gYS9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhcnNl
LXR5cGUvcnVuLXB0ZXN0DQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFyc2UtdHlwZS9ydW4tcHRlc3QN
Cj4gQEAgLTEsMyArMSwzIEBADQo+ICAjIS9iaW4vc2gNCj4gIA0KPiAtcHl0
ZXN0DQo+ICtweXRlc3QgLW8gbG9nX2NsaT10cnVlIC1vIGxvZ19jbGlfbGV2
ZWw9SU5GTyB8IHNlZCAtZSAncy9cWy4uLiVcXS8vZyd8IHNlZCAtZSAncy9Q
QVNTRUQvUEFTUy9nJ3wgc2VkIC1lICdzL0ZBSUxFRC9GQUlML2cnfHNlZCAt
ZSAncy9TS0lQUEVEL1NLSVAvZyd8IGF3ayAne2lmICgkTkY9PSJQQVNTIiB8
fCAkTkY9PSJGQUlMIiB8fCAkTkY9PSJTS0lQIiB8fCAkTkY9PSJYRkFJTCIg
fHwgJE5GPT0iWFBBU1MiKXtwcmludGYgIiVzOiAlc1xuIiwgJE5GLCAkMH1l
bHNle3ByaW50fX0nfCBhd2sgJ3tpZiAoJE5GPT0iUEFTUyIgfHwgJE5GPT0i
RkFJTCIgfHwgJE5GPT0iU0tJUCIgfHwgJE5GPT0iWEZBSUwiIHx8ICRORj09
IlhQQVNTIikgeyRORj0iIjtwcmludCAkMH1lbHNle3ByaW50fX0nDQoNClJh
dGhlciB0aGFuIGRvaW5nIHRoaXMgZm9yIGV2ZXJ5IHB5dGhvbiBtb2R1bGUs
IGl0IG1heSBiZSBhbiBpZGVhIHRvDQpjb25zaWRlcjoNCg0KYSkgdGVhY2hp
bmcgcHRlc3QgcnVubmVyIGhvdyB0byBoYW5kbGUgdGhlIGFsdGVybmF0ZSBv
dXRwdXQgZm9ybWF0ICh0cmlnZ2VyZWQgYnkgcnVuLXB0ZXN0LVhYWCBpbnN0
ZWFkIG9mIHJ1bi1wdGVzdCkNCg0Kb3INCg0KYikgYWRkaW5nIGEgY29tbW9u
IHB5dGhvbiBzY3JpcHQgd2hpY2ggY291bGQgYXZvaWQgYWxsIHRoaXMgc2Vk
L2F3ayBtYWdpYyBhbmQgdGhlIGV4dHJhIGRlcGVuZGVuY2llcw0KDQpvcg0K
DQpjKSBwYXRjaCBpbiBhIHBhcmFtZXRlciB0byBweXRlc3Qgd2hpY2ggb3V0
cHV0cyB0aGUgZGF0YSBpbiB0aGUgZm9ybWF0IHdlIG5lZWQuDQoNCkNoZWVy
cywNCg0KUmljaGFyZA0KDQoNCg0KDQoNCgoK
