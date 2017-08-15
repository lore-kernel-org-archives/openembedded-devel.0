Return-Path: <huangqy.fnst@cn.fujitsu.com>
X-Greylist: delayed 760 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Aug 2017 01:34:30 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A50F27847E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 01:34:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,375,1498492800"; d="scan'208";a="23546198"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2017 09:21:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 824C5472438F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:21:41 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Tue, 15 Aug 2017 09:21:40 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5] [PATCH v2] qtbase: add ptest
Thread-Index: AQHTBOWbOx+aLrbRTkKNcuqXNf4wnaKEv7ag
Date: Tue, 15 Aug 2017 01:21:44 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E31BBC6@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1500946223-25865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.235.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 824C5472438F.A45CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-qt5] [PATCH v2] qtbase: add ptest
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
X-List-Received-Date: Tue, 15 Aug 2017 01:34:34 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1IA0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDI1LCAyMDE3
IDk6MzAgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBIdWFuZywgUWl5dSA8aHVhbmdxeS5mbnN0
QGNuLmZ1aml0c3UuY29tPg0KPiBTdWJqZWN0OiBbb2VdIFttZXRhLXF0NV0g
W1BBVENIIHYyXSBxdGJhc2U6IGFkZCBwdGVzdA0KPiANCj4gQWRkIHB0ZXN0
IGZvciBxdGJhc2UgYnkgdXNpbmcgcHJvdmlkZWQgdGVzdHN1aXRlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUWl5dSA8aHVhbmdxeS5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIC4uLi8wMDAxLURlbGV0ZS1xbG9u
Z2xvbmctYW5kLXF1bG9uZ2xvbmcucGF0Y2ggICAgIHwgMjgNCj4gKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgcmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1
bi1wdGVzdCAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKw0KPiAgcmVj
aXBlcy1xdC9xdDUvcXRiYXNlX2dpdC5iYiAgICAgICAgICAgICAgICAgICAg
ICAgfCAxNyArKysrKysrKysrKystDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiByZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxv
bmdsb25nLWFuZC1xdWxvbmdsb25nLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcmVjaXBlcy1xdC9xdDUvcXRiYXNlL3J1bi1wdGVzdA0KPiANCj4g
ZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS8wMDAxLURlbGV0
ZS1xbG9uZ2xvbmctYW5kLXF1bG9uZ2xvbmcucGF0Y2gNCj4gYi9yZWNpcGVz
LXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmdsb25nLWFuZC1xdWxv
bmdsb25nLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAuLjk3NWNkMjgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9y
ZWNpcGVzLXF0L3F0NS9xdGJhc2UvMDAwMS1EZWxldGUtcWxvbmdsb25nLWFu
ZC1xdWxvbmdsb25nLnBhdGNoDQo+IEBAIC0wLDAgKzEsMjggQEANCj4gK0Zy
b20gYzY3YTRhZjJlNWRiNGMxZTIyMTM5NjFlNjM5MmI1OWFmZmQxOTU5ZiBN
b24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEh1YW5nIFFp
eXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gK0RhdGU6IFdl
ZCwgNyBKdW4gMjAxNyAyMTowMDo0OSArMDkwMA0KPiArU3ViamVjdDogW1BB
VENIXSBEZWxldGUgcWxvbmdsb25nIGFuZCBxdWxvbmdsb25nDQo+ICsNCj4g
K1NpZ25lZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5m
dWppdHN1LmNvbT4NCj4gKy0tLQ0KPiArIHRlc3RzL2F1dG8vY29yZWxpYi90
aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJvIHwgMiAt
LQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+
ICtkaWZmIC0tZ2l0DQo+ICthL3Rlc3RzL2F1dG8vY29yZWxpYi90aHJlYWQv
cWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIucHJvDQo+ICtiL3Rlc3Rz
L2F1dG8vY29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2lu
dGVnZXIucHJvDQo+ICtpbmRleCAwOTQ1OGJkLi41OWExMjBlIDEwMDY0NA0K
PiArLS0tIGEvdGVzdHMvYXV0by9jb3JlbGliL3RocmVhZC9xYXRvbWljaW50
ZWdlci9xYXRvbWljaW50ZWdlci5wcm8NCj4gKysrKyBiL3Rlc3RzL2F1dG8v
Y29yZWxpYi90aHJlYWQvcWF0b21pY2ludGVnZXIvcWF0b21pY2ludGVnZXIu
cHJvDQo+ICtAQCAtNSwxMCArNSw4IEBAIFNVQkRJUlM9XA0KPiArICAgICBj
aGFyMzJfdCBcDQo+ICsgICAgIGludCBcDQo+ICsgICAgIGxvbmcgXA0KPiAr
LSAgICBxbG9uZ2xvbmcgXA0KPiArICAgICBxcHRyZGlmZiBcDQo+ICsgICAg
IHF1aW50cHRyIFwNCj4gKy0gICAgcXVsb25nbG9uZyBcDQo+ICsgICAgIHNj
aGFyIFwNCj4gKyAgICAgc2hvcnQgXA0KPiArICAgICB1Y2hhciBcDQo+ICst
LQ0KPiArMi43LjQNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9x
dDUvcXRiYXNlL3J1bi1wdGVzdCBiL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS9y
dW4tcHRlc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAw
MC4uMDQ0ZjgzNA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMt
cXQvcXQ1L3F0YmFzZS9ydW4tcHRlc3QNCj4gQEAgLTAsMCArMSw2IEBADQo+
ICsjIS9iaW4vc2gNCj4gKw0KPiArZm9yIHggaW4gYCBhd2sgJ3twcmludCAk
MX0nIHRzdF9saXN0IGA7ZG8NCj4gKyAgICAuLyR7eH07DQo+ICtkb25lDQo+
ICsNCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZV9naXQu
YmIgYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiIGluZGV4DQo+IDVj
ZmJjZmEuLjg0NjQ4NzMgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtcXQvcXQ1
L3F0YmFzZV9naXQuYmINCj4gKysrIGIvcmVjaXBlcy1xdC9xdDUvcXRiYXNl
X2dpdC5iYg0KPiBAQCAtMjMsOCArMjMsMTIgQEAgU1JDX1VSSSArPSAiXA0K
PiAgICAgIGZpbGU6Ly8wMDA1LWNvbmZpZ3VyZS1idW1wLXBhdGgtbGVuZ3Ro
LWZyb20tMjU2LXRvLTUxMi1jaGFyYWN0ZXIucGF0Y2gNCj4gXA0KPiAgICAg
IGZpbGU6Ly8wMDA5LURpc2FibGUtYWxsLXVua25vd24tZmVhdHVyZXMtaW5z
dGVhZC1vZi1lcnJvcmluZy1vdXQucGF0Y2ggXA0KPiANCj4gZmlsZTovLzAw
MTAtUHJldGVuZC1RdDUtd2Fzbi10LWZvdW5kLWlmLU9FX1FNQUtFX1BBVEhf
RVhURVJOQUxfSC5wYXRjaA0KPiBcDQo+ICsgICAgZmlsZTovLzAwMDEtRGVs
ZXRlLXFsb25nbG9uZy1hbmQtcXVsb25nbG9uZy5wYXRjaCBcDQo+ICsgICAg
ZmlsZTovL3J1bi1wdGVzdCBcDQo+ICAiDQo+IA0KPiAraW5oZXJpdCBwdGVz
dA0KPiArDQo+ICAjIG9ubHkgZm9yIHRhcmdldCBxdGJhc2UNCj4gIFNSQ19V
UkkgKz0gIlwNCj4gICAgICBmaWxlOi8vMDAwOC1jb25maWd1cmUtcGF0aHMt
Zm9yLXRhcmdldC1xbWFrZS1wcm9wZXJseS5wYXRjaCBcIEBAIC00OCw3DQo+
ICs1Miw3IEBAIFBBQ0tBR0VDT05GSUdfRElTVFJPID89ICIiDQo+ICBQQUNL
QUdFQ09ORklHX1JFTEVBU0UgPz0gInJlbGVhc2UiDQo+ICAjIFRoaXMgaXMg
aW4gcXQ1LmluYywgYmVjYXVzZSBxdHdlYmtpdC1leGFtcGxlcyBhcmUgdXNp
bmcgaXQgdG8gZW5hYmxlDQo+IGNhLWNlcnRpZmljYXRlcyBkZXBlbmRlbmN5
ICAjIFBBQ0tBR0VDT05GSUdfT1BFTlNTTCA/PSAib3BlbnNzbCINCj4gLVBB
Q0tBR0VDT05GSUdfREVGQVVMVCA/PSAiZGJ1cyB1ZGV2IGV2ZGV2IHdpZGdl
dHMgdG9vbHMgbGlicyBmcmVldHlwZSINCj4gK1BBQ0tBR0VDT05GSUdfREVG
QVVMVCA/PSAiZGJ1cyB1ZGV2IGV2ZGV2IHdpZGdldHMgdG9vbHMgbGlicyBm
cmVldHlwZQ0KPiB0ZXN0cyINCj4gDQo+ICBQQUNLQUdFQ09ORklHID89ICIg
XA0KPiAgICAgICR7UEFDS0FHRUNPTkZJR19SRUxFQVNFfSBcDQo+IEBAIC0x
NzEsNiArMTc1LDE3IEBAIGRvX2NvbmZpZ3VyZSgpIHsNCj4gICAgICAgICAg
JHtRVF9DT05GSUdfRkxBR1N9DQo+ICB9DQo+IA0KPiArZmFrZXJvb3QgZG9f
aW5zdGFsbF9wdGVzdCgpIHsNCj4gKyAgICBta2RpciAtcCAke0R9JHtQVEVT
VF9QQVRIfQ0KPiArICAgIHQ9JHtEfSR7UFRFU1RfUEFUSH0NCj4gKyAgICBm
b3IgdmFyIGluIGAgZmluZCAke0J9L3Rlc3RzL2F1dG8vIC1uYW1lIHRzdF8q
YDsgZG8NCj4gKyAgICAgICAgaWYgWyBub3QgYCBlY2hvICR7dmFyIyMqL30g
fCBncmVwICdcLidgIF07IHRoZW4NCj4gKyAgICAgICAgICAgIGVjaG8gJHt2
YXIjIyovfSA+PiAke3R9L3RzdF9saXN0DQo+ICsgICAgICAgICAgICBpbnN0
YWxsIC1tIDA2NDQgJHt2YXJ9ICR7dH0NCj4gKyAgICAgICAgZmkNCj4gKyAg
ICBkb25lDQo+ICt9DQo+ICsNCj4gIGRvX2luc3RhbGxfYXBwZW5kKCkgew0K
PiAgICAgICMgQXZvaWQgcW1ha2UgZXJyb3IgIkNhbm5vdCByZWFkDQo+IFsu
Li5dL3Vzci9saWIvcXQ1L21rc3BlY3Mvb2UtZGV2aWNlLWV4dHJhLnByaTog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSINCj4gICAgICB0b3VjaA0KPiAk
e0R9LyR7T0VfUU1BS0VfUEFUSF9RVF9BUkNIREFUQX0vbWtzcGVjcy9vZS1k
ZXZpY2UtZXh0cmEucHJpDQo+IC0tDQo+IDIuNy40DQoNCgoK

