Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PTEsq-0002YR-UI
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:32:42 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBGEV1ob007901
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:31:01 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGEV16L020577
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:31:01 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGEV0tJ010284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:31:00 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 16 Dec 2010 08:31:00 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Dec 2010 08:30:58 -0600
Thread-Topic: [oe] [RFC] move openssl.cnf file into base openssl package
Thread-Index: AcudLTY3xqzcJoGZRAuKXxOuOMK1nQAAF82Q
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E92AE9@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329E92ADA@dlee06.ent.ti.com>
	<ied6kt$dqa$1@dough.gmane.org> <201012161732.17976.khimov@altell.ru>
In-Reply-To: <201012161732.17976.khimov@altell.ru>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
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
X-List-Received-Date: Thu, 16 Dec 2010 14:32:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gUm9t
YW4gSSBLaGltb3YNCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE2LCAyMDEwIDg6MzIgQU0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbb2VdIFtSRkNdIG1vdmUgb3BlbnNzbC5jbmYgZmlsZSBpbnRvIGJhc2Ugb3BlbnNz
bCBwYWNrYWdlDQo+IA0KPiDQkiDRgdC+0L7QsdGJ0LXQvdC40Lgg0L7RgiDQp9C10YLQstC10YDQ
syAxNiDQtNC10LrQsNCx0YDRjyAyMDEwIDE3OjEwOjM3INCw0LLRgtC+0YAgS29lbiBLb29pINC9
0LDQv9C40YHQsNC7Og0KPiA+ID4+PiBTbyBpdCBzZWVtcyBsaWtlIHRoZXJlIGFyZSB0d28gcGFj
a2FnZXMgdGhhdCBuZWVkIHRoaXMgZGVmYXVsdA0KPiA+ID4+IG9wZW5zc2wuY25mDQo+ID4gPj4N
Cj4gPiA+Pj4gIGZpbGUsIHRoZSBsaWJjcnlwdG8gYW5kIG9wZW5zc2wgcGFja2FnZXMuICBXb3Vs
ZCBpdCBwZXJoYXBzIGJlIGENCj4gPiA+Pj4gIGJldHRlciBpZGVhIHRvIHB1bGwgdGhlIGNvbmZp
Z3VyYXRpb24gZmlsZSBpbnRvIGl0cyBvd24gcGFja2FnZSBhbmQNCj4gPiA+Pj4gIHRoZW4gc2V0
DQo+ID4gPj4gdGhlDQo+ID4gPj4+ICBSREVQRU5EUyBmb3IgdGhlIGxpYmNyeXB0byBhbmQgb3Bl
bnNzbCBwYWNrYWdlcyB0byB1c2UgdGhlIG9wZW5zc2wNCj4gPiA+Pj4gIGNvbmZpZ3VyYXRpb24g
cGFja2FnZT8gVGhhdCB3YXkgeW91IGNhbiBzdGlsbCBoYXZlIG11bHRpcGxlDQo+IHZlcnNpb25z
DQo+ID4gPj4+ICBvZiBsaWJjcnlwdG8gKGxpa2UgS29lbiB3YXMgdHJ5aW5nIHRvIGRvKSBhbmQg
aGF2ZSB0aGUgZGVmYXVsdCBmaWxlDQo+ID4gPj4+ICBzaGFyZWQgYmV0d2VlbiBib3RoIHBhY2th
Z2VzIHRoYXQgbmVlZCBpdC4NCj4gPiA+Pg0KPiA+ID4+IG9wZW5zc2wgaXMgcmRlcGVuZGluZyBv
biBsaWJjcnlwdG8gYW55d2F5IChpdCdzIGxpbmtlZCB3aXRoIGl0IGFuZCBJDQo+ID4gPj4gZG9u
J3QgdGhpbmsgaXQnbGwgY2hhbmdlIGFueSB0aW1lIHNvb24pLiBCdXQgY29uZmlncyBmb3IgZGlm
ZmVyZW50DQo+ID4gPj4gdmVyc2lvbnMgY2FuIGJlDQo+ID4gPj4gY29uZmxpY3RpbmcsIHNvIEkn
bSBub3Qgc3VyZSB0aGlzIGtpbmQgb2YgYXBwcm9hY2ggc29sdmVzIGFueXRoaW5nLg0KPiA+ID4N
Cj4gPiA+IEkgbm90aWNlZCB0aGF0LiAgSSB0aGluayB0aGUgb25seSB0aGluZyB0aGF0IHB1dHRp
bmcgdGhpcyBpbnRvIGl0cyBvd24NCj4gPiA+IHBhY2thZ2Ugd291bGQgc29sdmUgaXMgYWRkcmVz
c2luZyBLb2VuJ3MgY29tbWVudCBhYm91dCBoYXZpbmcgbXVsdGlwbGUNCj4gPiA+IHZlcnNpb25z
IG9mIGxpYmNyeXB0byBpbnN0YWxsZWQuDQo+ID4gPg0KPiA+ID4gS29lbiwgY2FuIHlvdSBjb21t
ZW50IG9uIHlvdXIgY2hhbmdlIHRoYXQgbW92ZWQgdGhlIG9wZW5zc2wuY25mIGZpbGUNCj4gdG8N
Cj4gPiA+IHRoZSBtaXNjIHBhY2thZ2U/ICBEbyB5b3Ugc3RpbGwgbmVlZCB0byBiZSBhYmxlIHRv
IGluc3RhbGwgbXVsdGlwbGUNCj4gPiA+IHZlcnNpb25zIG9mIGxpYmNyeXB0bz8NCj4gPg0KPiA+
IFllcywgSSBzdGlsbCBuZWVkIHRvIGJlIGFibGUgdG8gZG8gdGhhdCwgY291bGRuJ3QgeW91IGp1
c3QgYWRkIGFuDQo+ID4gcnJlY29tbWVuZCBmb3IgLW1pc2M/DQo+IA0KPiBUbyBnZXQgYWxsIC1t
aXNjIHN0dWZmPyBJJ2Qgb3B0IGZvciBwdXR0aW5nIG9wZW5zc2wuY25mIGluIGl0cyBvd24gcGFj
a2FnZQ0KPiBhbmQNCj4gc2V0dGluZyBpdCBhcyBSUkVDT01NRU5EUyBmb3IgbGliY3J5cHRvIGlu
IHRoYXQgY2FzZS4NCg0KQWdyZWVkLiAgQWx0aG91Z2ggd291bGQgeW91IHNheSBSUkVDT01NRU5E
UyBvciBSREVQRU5EUz8gIE9uIHRoZSBvbmUgaGFuZCB5b3UgY291bGQgc3BlY2lmeSBhIGNvbmYg
ZmlsZSBhdCBhbm90aGVyIGxvY2F0aW9uLCBidXQgaW4gdGhlIGNhc2Ugb2YgcnVubmluZyAib3Bl
bnNzbCByZXEiIHdpdGggbm8gY29uZiBmaWxlIGluc3RhbGxlZCB0aGUgY29tbWFuZCBmYWlscywg
c28gd291bGQgeW91IHNheSB5b3UgUkVERVBFTkQgaW5zdGVhZCBvbiB0aGUgY29uZiBmaWxlPw0K
DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1i
aW4vbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==


