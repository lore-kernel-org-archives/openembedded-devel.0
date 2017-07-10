Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 271AD70178
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 01:28:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21064260"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2017 09:28:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 70C674D14A48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 09:28:18 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Mon, 10 Jul 2017 09:28:22 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5] [PATCH] qtbase: add ptest
Thread-Index: AQHS4LynT7YFNQDK3k6KSbSlVRNYoqJMdfkg
Date: Mon, 10 Jul 2017 01:28:19 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E023ED7@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.235.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 70C674D14A48.ABDC6
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
X-List-Received-Date: Mon, 10 Jul 2017 01:28:32 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1IA0KPiBTZW50OiBGcmlkYXksIEp1bmUgMDksIDIwMTcg
OTowNiBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gQ2M6IEh1YW5nLCBRaXl1IDxodWFuZ3F5LmZuc3RA
Y24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtvZV0gW21ldGEtcXQ1XSBb
UEFUQ0hdIHF0YmFzZTogYWRkIHB0ZXN0DQo+IA0KPiBBZGQgcHRlc3QgZm9y
IHF0YmFzZSAgYnkgdXNpbmcgcHJvdmlkZWQgdGVzdHN1aXRlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSHVhbmcgUWl5dSA8aHVhbmdxeS5mbnN0QGNuLmZ1
aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi8wMDAxLURlbGV0ZS1xbG9uZ2xv
bmctYW5kLXF1bG9uZ2xvbmcucGF0Y2ggICAgIHwgMjgNCj4gKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgcmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1bi1w
dGVzdCAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKw0KPiAgcmVjaXBl
cy1xdC9xdDUvcXRiYXNlX2dpdC5iYiAgICAgICAgICAgICAgICAgICAgICAg
fCAxNyArKysrKysrKysrKystDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUwIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkgIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPiByZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmds
b25nLWFuZC1xdWxvbmdsb25nLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1bi1wdGVzdA0KPiANCj4gZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS8wMDAxLURlbGV0ZS1x
bG9uZ2xvbmctYW5kLXF1bG9uZ2xvbmcucGF0Y2gNCj4gYi9yZWNpcGVzLXF0
L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmdsb25nLWFuZC1xdWxvbmds
b25nLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAuLjk3NWNkMjgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9yZWNp
cGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmdsb25nLWFuZC1x
dWxvbmdsb25nLnBhdGNoDQo+IEBAIC0wLDAgKzEsMjggQEANCj4gK0Zyb20g
YzY3YTRhZjJlNWRiNGMxZTIyMTM5NjFlNjM5MmI1OWFmZmQxOTU5ZiBNb24g
U2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEh1YW5nIFFpeXUg
PGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gK0RhdGU6IFdlZCwg
NyBKdW4gMjAxNyAyMTowMDo0OSArMDkwMA0KPiArU3ViamVjdDogW1BBVENI
XSBEZWxldGUgcWxvbmdsb25nIGFuZCBxdWxvbmdsb25nDQo+ICsNCj4gK1Np
Z25lZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWpp
dHN1LmNvbT4NCj4gKy0tLQ0KPiArIHRlc3RzL2F1dG8vY29yZWxpYi90aHJl
YWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJvIHwgMiAtLQ0K
PiArIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtk
aWZmIC0tZ2l0DQo+ICthL3Rlc3RzL2F1dG8vY29yZWxpYi90aHJlYWQvcWF0
b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJvDQo+ICtiL3Rlc3RzL2F1
dG8vY29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVn
ZXIucHJvDQo+ICtpbmRleCAwOTQ1OGJkLi41OWExMjBlIDEwMDY0NA0KPiAr
LS0tIGEvdGVzdHMvYXV0by9jb3JlbGliL3RocmVhZC9xYXRvbWljaW50ZWdl
ci9xYXRvbWljaW50ZWdlci5wcm8NCj4gKysrKyBiL3Rlc3RzL2F1dG8vY29y
ZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJv
DQo+ICtAQCAtNSwxMCArNSw4IEBAIFNVQkRJUlM9XA0KPiArICAgICBjaGFy
MzJfdCBcDQo+ICsgICAgIGludCBcDQo+ICsgICAgIGxvbmcgXA0KPiArLSAg
ICBxbG9uZ2xvbmcgXA0KPiArICAgICBxcHRyZGlmZiBcDQo+ICsgICAgIHF1
aW50cHRyIFwNCj4gKy0gICAgcXVsb25nbG9uZyBcDQo+ICsgICAgIHNjaGFy
IFwNCj4gKyAgICAgc2hvcnQgXA0KPiArICAgICB1Y2hhciBcDQo+ICstLQ0K
PiArMi43LjQNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9xdDUv
cXRiYXNlL3J1bi1wdGVzdCBiL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS9ydW4t
cHRlc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMC4u
MDQ0ZjgzNA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMtcXQv
cXQ1L3F0YmFzZS9ydW4tcHRlc3QNCj4gQEAgLTAsMCArMSw2IEBADQo+ICsj
IS9iaW4vc2gNCj4gKw0KPiArZm9yIHggaW4gYCBhd2sgJ3twcmludCAkMX0n
IHRzdF9saXN0IGA7ZG8NCj4gKyAgICAuLyR7eH07DQo+ICtkb25lDQo+ICsN
Cj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZV9naXQuYmIg
Yi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiIGluZGV4DQo+IDI3ZDBk
ZTEuLjM5ZmMyNzIgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtcXQvcXQ1L3F0
YmFzZV9naXQuYmINCj4gKysrIGIvcmVjaXBlcy1xdC9xdDUvcXRiYXNlX2dp
dC5iYg0KPiBAQCAtMjMsOCArMjMsMTIgQEAgU1JDX1VSSSArPSAiXA0KPiAg
ICAgIGZpbGU6Ly8wMDA1LWNvbmZpZ3VyZS1idW1wLXBhdGgtbGVuZ3RoLWZy
b20tMjU2LXRvLTUxMi1jaGFyYWN0ZXIucGF0Y2gNCj4gXA0KPiAgICAgIGZp
bGU6Ly8wMDA5LURpc2FibGUtYWxsLXVua25vd24tZmVhdHVyZXMtaW5zdGVh
ZC1vZi1lcnJvcmluZy1vdXQucGF0Y2ggXA0KPiANCj4gZmlsZTovLzAwMTAt
UHJldGVuZC1RdDUtd2Fzbi10LWZvdW5kLWlmLU9FX1FNQUtFX1BBVEhfRVhU
RVJOQUxfSC5wYXRjaA0KPiBcDQo+ICsgICAgZmlsZTovLzAwMDEtRGVsZXRl
LXFsb25nbG9uZy1hbmQtcXVsb25nbG9uZy5wYXRjaCBcDQo+ICsgICAgZmls
ZTovL3J1bi1wdGVzdCBcDQo+ICAiDQo+IA0KPiAraW5oZXJpdCBwdGVzdA0K
PiArDQo+ICAjIG9ubHkgZm9yIHRhcmdldCBxdGJhc2UNCj4gIFNSQ19VUkkg
Kz0gIlwNCj4gICAgICBmaWxlOi8vMDAwOC1jb25maWd1cmUtcGF0aHMtZm9y
LXRhcmdldC1xbWFrZS1wcm9wZXJseS5wYXRjaCBcIEBAIC00OCw3DQo+ICs1
Miw3IEBAIFBBQ0tBR0VDT05GSUdfRElTVFJPID89ICIiDQo+ICBQQUNLQUdF
Q09ORklHX1JFTEVBU0UgPz0gInJlbGVhc2UiDQo+ICAjIFRoaXMgaXMgaW4g
cXQ1LmluYywgYmVjYXVzZSBxdHdlYmtpdC1leGFtcGxlcyBhcmUgdXNpbmcg
aXQgdG8gZW5hYmxlDQo+IGNhLWNlcnRpZmljYXRlcyBkZXBlbmRlbmN5ICAj
IFBBQ0tBR0VDT05GSUdfT1BFTlNTTCA/PSAib3BlbnNzbCINCj4gLVBBQ0tB
R0VDT05GSUdfREVGQVVMVCA/PSAiZGJ1cyB1ZGV2IGV2ZGV2IHdpZGdldHMg
dG9vbHMgbGlicyBmcmVldHlwZSINCj4gK1BBQ0tBR0VDT05GSUdfREVGQVVM
VCA/PSAiZGJ1cyB1ZGV2IGV2ZGV2IHdpZGdldHMgdG9vbHMgbGlicyBmcmVl
dHlwZQ0KPiB0ZXN0cyINCj4gDQo+ICBQQUNLQUdFQ09ORklHID89ICIgXA0K
PiAgICAgICR7UEFDS0FHRUNPTkZJR19SRUxFQVNFfSBcDQo+IEBAIC0xNzAs
NiArMTc0LDE3IEBAIGRvX2NvbmZpZ3VyZSgpIHsNCj4gICAgICAgICAgJHtR
VF9DT05GSUdfRkxBR1N9DQo+ICB9DQo+IA0KPiArZmFrZXJvb3QgZG9faW5z
dGFsbF9wdGVzdCgpIHsNCj4gKyAgICBta2RpciAtcCAke0R9JHtQVEVTVF9Q
QVRIfQ0KPiArICAgIHQ9JHtEfSR7UFRFU1RfUEFUSH0NCj4gKyAgICBmb3Ig
dmFyIGluIGAgZmluZCAke0J9L3Rlc3RzL2F1dG8vIC1uYW1lIHRzdF8qYDsg
ZG8NCj4gKyAgICAgICAgaWYgWyBub3QgYCBlY2hvICR7dmFyIyMqL30gfCBn
cmVwICdcLidgIF07IHRoZW4NCj4gKyAgICAgICAgICAgIGVjaG8gJHt2YXIj
IyovfSA+PiAke3R9L3RzdF9saXN0DQo+ICsgICAgICAgICAgICBpbnN0YWxs
IC1tIDA2NDQgJHt2YXJ9ICR7dH0NCj4gKyAgICAgICAgZmkNCj4gKyAgICBk
b25lDQo+ICt9DQo+ICsNCj4gIGRvX2luc3RhbGxfYXBwZW5kKCkgew0KPiAg
ICAgICMgQXZvaWQgcW1ha2UgZXJyb3IgIkNhbm5vdCByZWFkDQo+IFsuLi5d
L3Vzci9saWIvcXQ1L21rc3BlY3Mvb2UtZGV2aWNlLWV4dHJhLnByaTogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeSINCj4gICAgICB0b3VjaA0KPiAke0R9
LyR7T0VfUU1BS0VfUEFUSF9RVF9BUkNIREFUQX0vbWtzcGVjcy9vZS1kZXZp
Y2UtZXh0cmEucHJpDQo+IC0tDQo+IDIuNy40DQoNCgoK

