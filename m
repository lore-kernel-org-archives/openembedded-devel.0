Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 807E078255
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:13:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T1DFXt002106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Aug 2017 18:13:15 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Mon, 28 Aug 2017 18:13:15 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] enscript: set the correct path for perl
Thread-Index: AQHTIFPXl1soNknKrkCf2zWEssrt96KahuAw
Date: Tue, 29 Aug 2017 01:13:13 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B889752@ALA-MBC.corp.ad.wrs.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
	<CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
	<CA+chaQfG3sQW6mncedu36aeuWuckbmADjgVeCraU1dsXRAxWqg@mail.gmail.com>
In-Reply-To: <CA+chaQfG3sQW6mncedu36aeuWuckbmADjgVeCraU1dsXRAxWqg@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.93]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 29 Aug 2017 01:13:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T2ssIHBsZWFzZSBpZ25vcmUgbWluZSBpZiBvbmUgb2YgdGhlbSBpcyBhY2NlcHRlZC4NCg0KVGhh
bmtzLA0KSmFja2llDQoNCkZyb206IE1hcnRpbiBKYW5zYSBbbWFpbHRvOm1hcnRpbi5qYW5zYUBn
bWFpbC5jb21dDQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjksIDIwMTcgMDc6MTcNClRvOiBLaGVt
IFJhag0KQ2M6IEh1YW5nLCBKaWUgKEphY2tpZSk7IG9wZW5lbWJlZGVkLWRldmVsDQpTdWJqZWN0
OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIGVuc2NyaXB0OiBzZXQgdGhlIGNvcnJlY3QgcGF0
aCBmb3IgcGVybA0KDQpBbmQgYWxzbyBieToNCmh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRl
ZC5vcmcvcGF0Y2gvMTQzMzQwLw0KDQpPbiBNb24sIEF1ZyAyOCwgMjAxNyBhdCA1OjI2IFBNLCBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPG1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20+PiB3
cm90ZToNCk9uIFN1biwgQXVnIDI3LCAyMDE3IGF0IDExOjA1IFBNLCAgPGphY2tpZS5odWFuZ0B3
aW5kcml2ZXIuY29tPG1haWx0bzpqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4+IHdyb3RlOg0K
PiBGcm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPG1haWx0bzpq
YWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4+DQo+DQo+IFNldCB0aGUgY29ycmVjdCBwYXRoIGZv
ciBwZXJsIGFuZCBhdm9pZA0KPiBzZWFyY2hpbmcgdGhlIG9uZSBpbiBob3N0dG9vbHMgdGhhdCBj
YXVzZQ0KPiBRQSBpc3N1ZToNCj4NCj4gfCBFUlJPUjogZW5zY3JpcHQtMS42LjYtcjAgZG9fcGFj
a2FnZV9xYTogUUEgSXNzdWU6IC91c3IvYmluL2RpZmZwcA0KPiAgIGNvbnRhaW5lZCBpbiBwYWNr
YWdlIGVuc2NyaXB0IHJlcXVpcmVzDQo+ICAgL2J1aWxkZGlyL3RtcC9ob3N0dG9vbHMvcGVybCwg
YnV0IG5vIHByb3ZpZGVycyBmb3VuZCBpbiBSREVQRU5EU19lbnNjcmlwdD8gW2ZpbGUtcmRlcHNd
DQo+DQoNCmFscmVhZHkgZml4ZWQgd2l0aCBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQu
b3JnL3BhdGNoLzE0MzI4MS8NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVhbmcgPGphY2tp
ZS5odWFuZ0B3aW5kcml2ZXIuY29tPG1haWx0bzpqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4+
DQo+IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Vuc2NyaXB0L2Vuc2NyaXB0XzEu
Ni42LmJiPGh0dHA6Ly9lbnNjcmlwdF8xLjYuNi5iYj4gfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0
ZW5kZWQvZW5zY3JpcHQvZW5zY3JpcHRfMS42LjYuYmI8aHR0cDovL2Vuc2NyaXB0XzEuNi42LmJi
PiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9lbnNjcmlwdC9lbnNjcmlwdF8xLjYuNi5iYjxo
dHRwOi8vZW5zY3JpcHRfMS42LjYuYmI+DQo+IGluZGV4IDk2MTI5ODgwYS4uNjVmMWNjZmEwIDEw
MDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZW5zY3JpcHQvZW5zY3JpcHRf
MS42LjYuYmI8aHR0cDovL2Vuc2NyaXB0XzEuNi42LmJiPg0KPiArKysgYi9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvZW5zY3JpcHQvZW5zY3JpcHRfMS42LjYuYmI8aHR0cDovL2Vuc2NyaXB0XzEu
Ni42LmJiPg0KPiBAQCAtMTksNCArMTksNiBAQCBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0DQo+
ICBTUkNfVVJJW21kNXN1bV0gPSAiM2FjYzI0MmI4MjlhZGFjYWJjYWYyODUzM2YwNDlhZmQiDQo+
ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQ1NmJhZGE2OTM0ZDA1NWIzNGI2YzkwMzk5YWE4NTk3
NWU2NjQ1N2FjNWJmNTEzNDI3YWU3ZmM3N2Y1YzBiYiINCj4NCj4gK0NBQ0hFRF9DT05GSUdVUkVW
QVJTICs9ICJhY19jdl9wYXRoX1BFUkw9JHtiaW5kaXJ9L3BlcmwiDQo+ICsNCj4gIFJERVBFTkRT
XyR7UE59ID0gInBlcmwiDQo+IC0tDQo+IDIuMTEuMA0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2ZWwg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PG1haWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gaHR0
cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQt
ZGV2ZWwNCi0tDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPg0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg0K

