Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0706E78250
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:13:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T1DnlU016557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 18:13:49 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Mon, 28 Aug 2017 18:13:49 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] enscript: set the correct path for perl
Thread-Index: AQHTIBIWl1soNknKrkCf2zWEssrt96KahWeAgAB3LYD//4tYYA==
Date: Tue, 29 Aug 2017 01:13:48 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B889766@ALA-MBC.corp.ad.wrs.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
	<CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B889665@ALA-MBC.corp.ad.wrs.com>
	<CAMKF1sqNhcDG6z1hZVFLTNDgtzsuq=ofRZm1=mrOzGo1ET_ZDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqNhcDG6z1hZVFLTNDgtzsuq=ofRZm1=mrOzGo1ET_ZDQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.93]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] enscript: set the correct path for perl
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
X-List-Received-Date: Tue, 29 Aug 2017 01:13:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyOSwgMjAxNyAw
OToxMQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwN
Cj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBlbnNjcmlwdDogc2V0IHRoZSBj
b3JyZWN0IHBhdGggZm9yIHBlcmwNCj4gDQo+IE9uIE1vbiwgQXVnIDI4LCAyMDE3IGF0IDY6MDcg
UE0sIEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gPEphY2tpZS5IdWFuZ0B3aW5kcml2ZXIuY29tPiB3
cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+PiBTZW50OiBNb25k
YXksIEF1Z3VzdCAyOCwgMjAxNyAyMzoyNg0KPiA+PiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0K
PiA+PiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwNCj4gPj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEt
b2VdW1BBVENIXSBlbnNjcmlwdDogc2V0IHRoZSBjb3JyZWN0IHBhdGggZm9yIHBlcmwNCj4gPj4N
Cj4gPj4gT24gU3VuLCBBdWcgMjcsIDIwMTcgYXQgMTE6MDUgUE0sICA8amFja2llLmh1YW5nQHdp
bmRyaXZlci5jb20+IHdyb3RlOg0KPiA+PiA+IEZyb206IEphY2tpZSBIdWFuZyA8amFja2llLmh1
YW5nQHdpbmRyaXZlci5jb20+DQo+ID4+ID4NCj4gPj4gPiBTZXQgdGhlIGNvcnJlY3QgcGF0aCBm
b3IgcGVybCBhbmQgYXZvaWQNCj4gPj4gPiBzZWFyY2hpbmcgdGhlIG9uZSBpbiBob3N0dG9vbHMg
dGhhdCBjYXVzZQ0KPiA+PiA+IFFBIGlzc3VlOg0KPiA+PiA+DQo+ID4+ID4gfCBFUlJPUjogZW5z
Y3JpcHQtMS42LjYtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IC91c3IvYmluL2RpZmZwcA0K
PiA+PiA+ICAgY29udGFpbmVkIGluIHBhY2thZ2UgZW5zY3JpcHQgcmVxdWlyZXMNCj4gPj4gPiAg
IC9idWlsZGRpci90bXAvaG9zdHRvb2xzL3BlcmwsIGJ1dCBubyBwcm92aWRlcnMgZm91bmQgaW4N
Cj4gUkRFUEVORFNfZW5zY3JpcHQ/DQo+ID4+IFtmaWxlLXJkZXBzXQ0KPiA+PiA+DQo+ID4+DQo+
ID4+IGFscmVhZHkgZml4ZWQgd2l0aCBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3Jn
L3BhdGNoLzE0MzI4MS8NCj4gPg0KPiANCj4gSSBwcmVmZXIgdGhlIHBhdGNoIHRoYXQgSSBzZW50
IHNpbmNlIHRoYXQgZG9lcyBub3QgaGFyZGNvZGUgdmFyaWFibGVzIHRoYXQNCj4gY29uZmlndXJl
IHNob3VsZCBkZWZpbmUuDQoNCkkgYWdyZWUuDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiA+
IEdvdCBpdCwgdGhhbmtzIQ0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IEphY2tpZQ0KPiA+DQo+ID4+
DQo+ID4+ID4gU2lnbmVkLW9mZi1ieTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdAd2luZHJp
dmVyLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4gPiAgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Vu
c2NyaXB0L2Vuc2NyaXB0XzEuNi42LmJiIHwgMiArKw0KPiA+PiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspDQo+ID4+ID4NCj4gPj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL2Vuc2NyaXB0L2Vuc2NyaXB0XzEuNi42LmJiIGIvbWV0YS0NCj4gPj4gb2Uv
cmVjaXBlcy1leHRlbmRlZC9lbnNjcmlwdC9lbnNjcmlwdF8xLjYuNi5iYg0KPiA+PiA+IGluZGV4
IDk2MTI5ODgwYS4uNjVmMWNjZmEwIDEwMDY0NA0KPiA+PiA+IC0tLSBhL21ldGEtb2UvcmVjaXBl
cy1leHRlbmRlZC9lbnNjcmlwdC9lbnNjcmlwdF8xLjYuNi5iYg0KPiA+PiA+ICsrKyBiL21ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9lbnNjcmlwdC9lbnNjcmlwdF8xLjYuNi5iYg0KPiA+PiA+IEBA
IC0xOSw0ICsxOSw2IEBAIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQNCj4gPj4gPiAgU1JDX1VS
SVttZDVzdW1dID0gIjNhY2MyNDJiODI5YWRhY2FiY2FmMjg1MzNmMDQ5YWZkIg0KPiA+PiA+ICBT
UkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+Pg0KPiAiNmQ1NmJhZGE2OTM0ZDA1NWIzNGI2YzkwMzk5
YWE4NTk3NWU2NjQ1N2FjNWJmNTEzNDI3YWU3ZmM3N2Y1YzBiYiINCj4gPj4gPg0KPiA+PiA+ICtD
QUNIRURfQ09ORklHVVJFVkFSUyArPSAiYWNfY3ZfcGF0aF9QRVJMPSR7YmluZGlyfS9wZXJsIg0K
PiA+PiA+ICsNCj4gPj4gPiAgUkRFUEVORFNfJHtQTn0gPSAicGVybCINCj4gPj4gPiAtLQ0KPiA+
PiA+IDIuMTEuMA0KPiA+PiA+DQo+ID4+ID4gLS0NCj4gPj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+PiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBt
YWlsaW5nIGxpc3QNCj4gPj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+PiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWRldmVsDQo=

