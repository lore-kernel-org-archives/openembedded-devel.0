Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 458D47825A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:07:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T17fYV016541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 18:07:41 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Mon, 28 Aug 2017 18:07:40 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] enscript: set the correct path for perl
Thread-Index: AQHTIBIWl1soNknKrkCf2zWEssrt96KahWeA
Date: Tue, 29 Aug 2017 01:07:39 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B889665@ALA-MBC.corp.ad.wrs.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
	<CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Aug 2017 01:07:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI4LCAyMDE3IDIz
OjI2DQo+IFRvOiBIdWFuZywgSmllIChKYWNraWUpDQo+IENjOiBvcGVuZW1iZWRlZC1kZXZlbA0K
PiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIGVuc2NyaXB0OiBzZXQgdGhlIGNv
cnJlY3QgcGF0aCBmb3IgcGVybA0KPiANCj4gT24gU3VuLCBBdWcgMjcsIDIwMTcgYXQgMTE6MDUg
UE0sICA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+IEZyb206IEphY2tp
ZSBIdWFuZyA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiBTZXQgdGhlIGNv
cnJlY3QgcGF0aCBmb3IgcGVybCBhbmQgYXZvaWQNCj4gPiBzZWFyY2hpbmcgdGhlIG9uZSBpbiBo
b3N0dG9vbHMgdGhhdCBjYXVzZQ0KPiA+IFFBIGlzc3VlOg0KPiA+DQo+ID4gfCBFUlJPUjogZW5z
Y3JpcHQtMS42LjYtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IC91c3IvYmluL2RpZmZwcA0K
PiA+ICAgY29udGFpbmVkIGluIHBhY2thZ2UgZW5zY3JpcHQgcmVxdWlyZXMNCj4gPiAgIC9idWls
ZGRpci90bXAvaG9zdHRvb2xzL3BlcmwsIGJ1dCBubyBwcm92aWRlcnMgZm91bmQgaW4gUkRFUEVO
RFNfZW5zY3JpcHQ/DQo+IFtmaWxlLXJkZXBzXQ0KPiA+DQo+IA0KPiBhbHJlYWR5IGZpeGVkIHdp
dGggaHR0cHM6Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9wYXRjaC8xNDMyODEvDQoNCkdv
dCBpdCwgdGhhbmtzIQ0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+
ICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZW5zY3JpcHQvZW5zY3JpcHRfMS42LjYuYmIgfCAy
ICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZW5zY3JpcHQvZW5zY3JpcHRfMS42LjYu
YmIgYi9tZXRhLQ0KPiBvZS9yZWNpcGVzLWV4dGVuZGVkL2Vuc2NyaXB0L2Vuc2NyaXB0XzEuNi42
LmJiDQo+ID4gaW5kZXggOTYxMjk4ODBhLi42NWYxY2NmYTAgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0
YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Vuc2NyaXB0L2Vuc2NyaXB0XzEuNi42LmJiDQo+ID4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Vuc2NyaXB0L2Vuc2NyaXB0XzEuNi42LmJiDQo+
ID4gQEAgLTE5LDQgKzE5LDYgQEAgaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dA0KPiA+ICBTUkNf
VVJJW21kNXN1bV0gPSAiM2FjYzI0MmI4MjlhZGFjYWJjYWYyODUzM2YwNDlhZmQiDQo+ID4gIFNS
Q19VUklbc2hhMjU2c3VtXSA9DQo+ICI2ZDU2YmFkYTY5MzRkMDU1YjM0YjZjOTAzOTlhYTg1OTc1
ZTY2NDU3YWM1YmY1MTM0MjdhZTdmYzc3ZjVjMGJiIg0KPiA+DQo+ID4gK0NBQ0hFRF9DT05GSUdV
UkVWQVJTICs9ICJhY19jdl9wYXRoX1BFUkw9JHtiaW5kaXJ9L3BlcmwiDQo+ID4gKw0KPiA+ICBS
REVQRU5EU18ke1BOfSA9ICJwZXJsIg0KPiA+IC0tDQo+ID4gMi4xMS4wDQo+ID4NCj4gPiAtLQ0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
T3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

