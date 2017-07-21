Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EC316778D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:01:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21615181"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2017 15:01:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6AFF346B5DF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 15:01:13 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Fri, 21 Jul 2017 15:01:13 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5] [PATCH] qtbase: add ptest
Thread-Index: AQHS4LynT7YFNQDK3k6KSbSlVRNYoqJeHMXg
Date: Fri, 21 Jul 2017 07:01:12 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E25DEFE@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.235.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6AFF346B5DF4.A9466
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-qt5] [PATCH] qtbase: add ptest
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
X-List-Received-Date: Fri, 21 Jul 2017 07:01:15 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1L7vGIOf50+4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDA5
LCAyMDE3IDk6MDYgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBIdWFuZywgUWl5dS+7xiDn+dPu
IDxodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtv
ZV0gW21ldGEtcXQ1XSBbUEFUQ0hdIHF0YmFzZTogYWRkIHB0ZXN0DQo+IA0K
PiBBZGQgcHRlc3QgZm9yIHF0YmFzZSAgYnkgdXNpbmcgcHJvdmlkZWQgdGVz
dHN1aXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUWl5dSA8aHVh
bmdxeS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi8wMDAx
LURlbGV0ZS1xbG9uZ2xvbmctYW5kLXF1bG9uZ2xvbmcucGF0Y2ggICAgIHwg
MjgNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiAgcmVjaXBlcy1xdC9x
dDUvcXRiYXNlL3J1bi1wdGVzdCAgICAgICAgICAgICAgICAgICAgfCAgNiAr
KysrKw0KPiAgcmVjaXBlcy1xdC9xdDUvcXRiYXNlX2dpdC5iYiAgICAgICAg
ICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKystDQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkgIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiByZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAw
MS1EZWxldGUtcWxvbmdsb25nLWFuZC1xdWxvbmdsb25nLnBhdGNoDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1bi1w
dGVzdA0KPiANCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFz
ZS8wMDAxLURlbGV0ZS1xbG9uZ2xvbmctYW5kLXF1bG9uZ2xvbmcucGF0Y2gN
Cj4gYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmds
b25nLWFuZC1xdWxvbmdsb25nLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAuLjk3NWNkMjgNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUt
cWxvbmdsb25nLWFuZC1xdWxvbmdsb25nLnBhdGNoDQo+IEBAIC0wLDAgKzEs
MjggQEANCj4gK0Zyb20gYzY3YTRhZjJlNWRiNGMxZTIyMTM5NjFlNjM5MmI1
OWFmZmQxOTU5ZiBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zy
b206IEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4N
Cj4gK0RhdGU6IFdlZCwgNyBKdW4gMjAxNyAyMTowMDo0OSArMDkwMA0KPiAr
U3ViamVjdDogW1BBVENIXSBEZWxldGUgcWxvbmdsb25nIGFuZCBxdWxvbmds
b25nDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5n
cXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gKy0tLQ0KPiArIHRlc3RzL2F1
dG8vY29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVn
ZXIucHJvIHwgMiAtLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0DQo+ICthL3Rlc3RzL2F1dG8vY29y
ZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJv
DQo+ICtiL3Rlc3RzL2F1dG8vY29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVn
ZXIvcWF0b21pY2ludGVnZXIucHJvDQo+ICtpbmRleCAwOTQ1OGJkLi41OWEx
MjBlIDEwMDY0NA0KPiArLS0tIGEvdGVzdHMvYXV0by9jb3JlbGliL3RocmVh
ZC9xYXRvbWljaW50ZWdlci9xYXRvbWljaW50ZWdlci5wcm8NCj4gKysrKyBi
L3Rlc3RzL2F1dG8vY29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0
b21pY2ludGVnZXIucHJvDQo+ICtAQCAtNSwxMCArNSw4IEBAIFNVQkRJUlM9
XA0KPiArICAgICBjaGFyMzJfdCBcDQo+ICsgICAgIGludCBcDQo+ICsgICAg
IGxvbmcgXA0KPiArLSAgICBxbG9uZ2xvbmcgXA0KPiArICAgICBxcHRyZGlm
ZiBcDQo+ICsgICAgIHF1aW50cHRyIFwNCj4gKy0gICAgcXVsb25nbG9uZyBc
DQo+ICsgICAgIHNjaGFyIFwNCj4gKyAgICAgc2hvcnQgXA0KPiArICAgICB1
Y2hhciBcDQo+ICstLQ0KPiArMi43LjQNCj4gKw0KPiBkaWZmIC0tZ2l0IGEv
cmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1bi1wdGVzdCBiL3JlY2lwZXMtcXQv
cXQ1L3F0YmFzZS9ydW4tcHRlc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQg
aW5kZXggMDAwMDAwMC4uMDQ0ZjgzNA0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS9ydW4tcHRlc3QNCj4gQEAgLTAs
MCArMSw2IEBADQo+ICsjIS9iaW4vc2gNCj4gKw0KPiArZm9yIHggaW4gYCBh
d2sgJ3twcmludCAkMX0nIHRzdF9saXN0IGA7ZG8NCj4gKyAgICAuLyR7eH07
DQo+ICtkb25lDQo+ICsNCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1
L3F0YmFzZV9naXQuYmIgYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJi
IGluZGV4DQo+IDI3ZDBkZTEuLjM5ZmMyNzIgMTAwNjQ0DQo+IC0tLSBhL3Jl
Y2lwZXMtcXQvcXQ1L3F0YmFzZV9naXQuYmINCj4gKysrIGIvcmVjaXBlcy1x
dC9xdDUvcXRiYXNlX2dpdC5iYg0KPiBAQCAtMjMsOCArMjMsMTIgQEAgU1JD
X1VSSSArPSAiXA0KPiAgICAgIGZpbGU6Ly8wMDA1LWNvbmZpZ3VyZS1idW1w
LXBhdGgtbGVuZ3RoLWZyb20tMjU2LXRvLTUxMi1jaGFyYWN0ZXIucGF0Y2gN
Cj4gXA0KPiAgICAgIGZpbGU6Ly8wMDA5LURpc2FibGUtYWxsLXVua25vd24t
ZmVhdHVyZXMtaW5zdGVhZC1vZi1lcnJvcmluZy1vdXQucGF0Y2ggXA0KPiAN
Cj4gZmlsZTovLzAwMTAtUHJldGVuZC1RdDUtd2Fzbi10LWZvdW5kLWlmLU9F
X1FNQUtFX1BBVEhfRVhURVJOQUxfSC5wYXRjaA0KPiBcDQo+ICsgICAgZmls
ZTovLzAwMDEtRGVsZXRlLXFsb25nbG9uZy1hbmQtcXVsb25nbG9uZy5wYXRj
aCBcDQo+ICsgICAgZmlsZTovL3J1bi1wdGVzdCBcDQo+ICAiDQo+IA0KPiAr
aW5oZXJpdCBwdGVzdA0KPiArDQo+ICAjIG9ubHkgZm9yIHRhcmdldCBxdGJh
c2UNCj4gIFNSQ19VUkkgKz0gIlwNCj4gICAgICBmaWxlOi8vMDAwOC1jb25m
aWd1cmUtcGF0aHMtZm9yLXRhcmdldC1xbWFrZS1wcm9wZXJseS5wYXRjaCBc
IEBAIC00OCw3DQo+ICs1Miw3IEBAIFBBQ0tBR0VDT05GSUdfRElTVFJPID89
ICIiDQo+ICBQQUNLQUdFQ09ORklHX1JFTEVBU0UgPz0gInJlbGVhc2UiDQo+
ICAjIFRoaXMgaXMgaW4gcXQ1LmluYywgYmVjYXVzZSBxdHdlYmtpdC1leGFt
cGxlcyBhcmUgdXNpbmcgaXQgdG8gZW5hYmxlDQo+IGNhLWNlcnRpZmljYXRl
cyBkZXBlbmRlbmN5ICAjIFBBQ0tBR0VDT05GSUdfT1BFTlNTTCA/PSAib3Bl
bnNzbCINCj4gLVBBQ0tBR0VDT05GSUdfREVGQVVMVCA/PSAiZGJ1cyB1ZGV2
IGV2ZGV2IHdpZGdldHMgdG9vbHMgbGlicyBmcmVldHlwZSINCj4gK1BBQ0tB
R0VDT05GSUdfREVGQVVMVCA/PSAiZGJ1cyB1ZGV2IGV2ZGV2IHdpZGdldHMg
dG9vbHMgbGlicyBmcmVldHlwZQ0KPiB0ZXN0cyINCj4gDQo+ICBQQUNLQUdF
Q09ORklHID89ICIgXA0KPiAgICAgICR7UEFDS0FHRUNPTkZJR19SRUxFQVNF
fSBcDQo+IEBAIC0xNzAsNiArMTc0LDE3IEBAIGRvX2NvbmZpZ3VyZSgpIHsN
Cj4gICAgICAgICAgJHtRVF9DT05GSUdfRkxBR1N9DQo+ICB9DQo+IA0KPiAr
ZmFrZXJvb3QgZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4gKyAgICBta2RpciAt
cCAke0R9JHtQVEVTVF9QQVRIfQ0KPiArICAgIHQ9JHtEfSR7UFRFU1RfUEFU
SH0NCj4gKyAgICBmb3IgdmFyIGluIGAgZmluZCAke0J9L3Rlc3RzL2F1dG8v
IC1uYW1lIHRzdF8qYDsgZG8NCj4gKyAgICAgICAgaWYgWyBub3QgYCBlY2hv
ICR7dmFyIyMqL30gfCBncmVwICdcLidgIF07IHRoZW4NCj4gKyAgICAgICAg
ICAgIGVjaG8gJHt2YXIjIyovfSA+PiAke3R9L3RzdF9saXN0DQo+ICsgICAg
ICAgICAgICBpbnN0YWxsIC1tIDA2NDQgJHt2YXJ9ICR7dH0NCj4gKyAgICAg
ICAgZmkNCj4gKyAgICBkb25lDQo+ICt9DQo+ICsNCj4gIGRvX2luc3RhbGxf
YXBwZW5kKCkgew0KPiAgICAgICMgQXZvaWQgcW1ha2UgZXJyb3IgIkNhbm5v
dCByZWFkDQo+IFsuLi5dL3Vzci9saWIvcXQ1L21rc3BlY3Mvb2UtZGV2aWNl
LWV4dHJhLnByaTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSINCj4gICAg
ICB0b3VjaA0KPiAke0R9LyR7T0VfUU1BS0VfUEFUSF9RVF9BUkNIREFUQX0v
bWtzcGVjcy9vZS1kZXZpY2UtZXh0cmEucHJpDQo+IC0tDQo+IDIuNy40DQoN
CgoK

