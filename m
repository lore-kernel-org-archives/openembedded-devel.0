Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PTFaa-0003rr-PK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 16:17:54 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBGFGDBD026977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 09:16:13 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBGFGC8P000716
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 09:16:12 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGFGCvP006942
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 09:16:12 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 16 Dec 2010 09:16:12 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Dec 2010 09:16:11 -0600
Thread-Topic: [oe] [RFC] move openssl.cnf file into base openssl package
Thread-Index: AcudMKo+5deyCtIWSa+7w+So7UpTMgAA3YWw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E92B0A@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<201012161732.17976.khimov@altell.ru>
	<131E5DFBE7373E4C8D813795A6AA7F080329E92AE9@dlee06.ent.ti.com>
	<201012161756.57857.khimov@altell.ru>
In-Reply-To: <201012161756.57857.khimov@altell.ru>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move openssl.cnf file into base openssl package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Dec 2010 15:17:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gUm9t
YW4gSSBLaGltb3YNCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE2LCAyMDEwIDg6NTcgQU0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbb2VdIFtSRkNdIG1vdmUgb3BlbnNzbC5jbmYgZmlsZSBpbnRvIGJhc2Ugb3BlbnNz
bCBwYWNrYWdlDQo+IA0KPiDQkiDRgdC+0L7QsdGJ0LXQvdC40Lgg0L7RgiDQp9C10YLQstC10YDQ
syAxNiDQtNC10LrQsNCx0YDRjyAyMDEwIDE3OjMwOjU4INCw0LLRgtC+0YAgTWF1cGluLCBDaGFz
ZQ0KPiDQvdCw0L/QuNGB0LDQuzoNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmddIE9uIEJlaGFsZg0KPiBPZg0KPiA+ID4gUm9tYW4gSSBLaGltb3YNCj4gPiA+
IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxNiwgMjAxMCA4OjMyIEFNDQo+ID4gPiBUbzogb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJl
OiBbb2VdIFtSRkNdIG1vdmUgb3BlbnNzbC5jbmYgZmlsZSBpbnRvIGJhc2Ugb3BlbnNzbA0KPiBw
YWNrYWdlDQo+ID4gPg0KPiA+ID4g0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0KfQtdGC0LLQ
tdGA0LMgMTYg0LTQtdC60LDQsdGA0Y8gMjAxMCAxNzoxMDozNyDQsNCy0YLQvtGAIEtvZW4gS29v
aQ0KPiDQvdCw0L/QuNGB0LDQuzoNCj4gPiA+ID4gPj4+IFNvIGl0IHNlZW1zIGxpa2UgdGhlcmUg
YXJlIHR3byBwYWNrYWdlcyB0aGF0IG5lZWQgdGhpcyBkZWZhdWx0DQo+ID4gPiA+ID4+DQo+ID4g
PiA+ID4+IG9wZW5zc2wuY25mDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+PiAgZmlsZSwgdGhlIGxp
YmNyeXB0byBhbmQgb3BlbnNzbCBwYWNrYWdlcy4gIFdvdWxkIGl0IHBlcmhhcHMgYmUNCj4gYQ0K
PiA+ID4gPiA+Pj4gIGJldHRlciBpZGVhIHRvIHB1bGwgdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBp
bnRvIGl0cyBvd24gcGFja2FnZQ0KPiA+ID4gPiA+Pj4gIGFuZCB0aGVuIHNldA0KPiA+ID4gPiA+
Pg0KPiA+ID4gPiA+PiB0aGUNCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4+ICBSREVQRU5EUyBmb3Ig
dGhlIGxpYmNyeXB0byBhbmQgb3BlbnNzbCBwYWNrYWdlcyB0byB1c2UgdGhlDQo+IG9wZW5zc2wN
Cj4gPiA+ID4gPj4+ICBjb25maWd1cmF0aW9uIHBhY2thZ2U/IFRoYXQgd2F5IHlvdSBjYW4gc3Rp
bGwgaGF2ZSBtdWx0aXBsZQ0KPiA+ID4NCj4gPiA+IHZlcnNpb25zDQo+ID4gPg0KPiA+ID4gPiA+
Pj4gIG9mIGxpYmNyeXB0byAobGlrZSBLb2VuIHdhcyB0cnlpbmcgdG8gZG8pIGFuZCBoYXZlIHRo
ZSBkZWZhdWx0DQo+ID4gPiA+ID4+PiAgZmlsZSBzaGFyZWQgYmV0d2VlbiBib3RoIHBhY2thZ2Vz
IHRoYXQgbmVlZCBpdC4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gb3BlbnNzbCBpcyByZGVwZW5k
aW5nIG9uIGxpYmNyeXB0byBhbnl3YXkgKGl0J3MgbGlua2VkIHdpdGggaXQNCj4gYW5kIEkNCj4g
PiA+ID4gPj4gZG9uJ3QgdGhpbmsgaXQnbGwgY2hhbmdlIGFueSB0aW1lIHNvb24pLiBCdXQgY29u
ZmlncyBmb3INCj4gZGlmZmVyZW50DQo+ID4gPiA+ID4+IHZlcnNpb25zIGNhbiBiZQ0KPiA+ID4g
PiA+PiBjb25mbGljdGluZywgc28gSSdtIG5vdCBzdXJlIHRoaXMga2luZCBvZiBhcHByb2FjaCBz
b2x2ZXMNCj4gYW55dGhpbmcuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJIG5vdGljZWQgdGhhdC4g
IEkgdGhpbmsgdGhlIG9ubHkgdGhpbmcgdGhhdCBwdXR0aW5nIHRoaXMgaW50byBpdHMNCj4gPiA+
ID4gPiBvd24gcGFja2FnZSB3b3VsZCBzb2x2ZSBpcyBhZGRyZXNzaW5nIEtvZW4ncyBjb21tZW50
IGFib3V0IGhhdmluZw0KPiA+ID4gPiA+IG11bHRpcGxlIHZlcnNpb25zIG9mIGxpYmNyeXB0byBp
bnN0YWxsZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBLb2VuLCBjYW4geW91IGNvbW1lbnQgb24g
eW91ciBjaGFuZ2UgdGhhdCBtb3ZlZCB0aGUgb3BlbnNzbC5jbmYNCj4gZmlsZQ0KPiA+ID4NCj4g
PiA+IHRvDQo+ID4gPg0KPiA+ID4gPiA+IHRoZSBtaXNjIHBhY2thZ2U/ICBEbyB5b3Ugc3RpbGwg
bmVlZCB0byBiZSBhYmxlIHRvIGluc3RhbGwNCj4gbXVsdGlwbGUNCj4gPiA+ID4gPiB2ZXJzaW9u
cyBvZiBsaWJjcnlwdG8/DQo+ID4gPiA+DQo+ID4gPiA+IFllcywgSSBzdGlsbCBuZWVkIHRvIGJl
IGFibGUgdG8gZG8gdGhhdCwgY291bGRuJ3QgeW91IGp1c3QgYWRkIGFuDQo+ID4gPiA+IHJyZWNv
bW1lbmQgZm9yIC1taXNjPw0KPiA+ID4NCj4gPiA+IFRvIGdldCBhbGwgLW1pc2Mgc3R1ZmY/IEkn
ZCBvcHQgZm9yIHB1dHRpbmcgb3BlbnNzbC5jbmYgaW4gaXRzIG93bg0KPiA+ID4gcGFja2FnZSBh
bmQNCj4gPiA+IHNldHRpbmcgaXQgYXMgUlJFQ09NTUVORFMgZm9yIGxpYmNyeXB0byBpbiB0aGF0
IGNhc2UuDQo+ID4NCj4gPiBBZ3JlZWQuICBBbHRob3VnaCB3b3VsZCB5b3Ugc2F5IFJSRUNPTU1F
TkRTIG9yIFJERVBFTkRTPw0KPiANCj4gSSd2ZSBqdXN0IHNhaWQgYWJvdmUsIFJSRUNPTU1FTkRT
LiBNb3N0IGFwcGxpY2F0aW9ucyB1c2luZyBsaWJjcnlwdG8gY2FuDQo+IHdvcmsNCj4gd2l0aG91
dCBhIGRlZmF1bHQgY29uZmlnIGZpbGUuIFRoZXkgZXZlbiB3b3JrZWQgZm9yIGEgbG9uZyB0aW1l
IGJlZm9yZQ0KPiBJJ3ZlDQo+IHBhY2thZ2VkIGl0LiBCdXQgeW91IGdldCBpdCBpbnN0YWxsZWQg
YnkgZGVmYXVsdCB3aXRoIFJSRUNPTU1FTkRTLCBhbmQNCj4gb25seSBpZg0KPiB5b3Uga25vdyB3
aGF0IHlvdSdyZSBkb2luZyB5b3UgYWRkIGl0IGluIEJBRF9SRUNPTU1FTkRBVElPTlMgb3IgZGVs
ZXRlIGl0DQo+IGluDQo+IHNvbWUgb3RoZXIgd2F5Lg0KPiANCj4gU3BlYWtpbmcgb2Ygd2hpY2gs
IGl0IHNob3VsZCBhbHNvIGJlIGxpc3RlZCBpbiBDT05GRklMRVMsIG1pc3NlZCB0aGF0IGluDQo+
IE1hcmNoLg0KDQpJJ2xsIHN1Ym1pdCBhIHBhdGNoIGZvciB0aGlzIHRvZGF5LiAgVGhhbmtzIGZv
ciB0aGUgaW5wdXQuDQoNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxpbnV4
dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K


