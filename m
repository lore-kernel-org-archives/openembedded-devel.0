Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PSxLD-0006U6-RD
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 20:48:48 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBFJl7nK007609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:47:07 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBFJl7gq007398
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:47:07 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBFJl7ej016732
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:47:07 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 15 Dec 2010 13:47:07 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Dec 2010 13:47:05 -0600
Thread-Topic: [oe] [RFC] move openssl.cnf file into base openssl package
Thread-Index: AcuckBqK7vtUfMRbRrKY908ZRmr/4AAABxnw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BEA@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<201012152240.45068.roman@khimov.ru>
In-Reply-To: <201012152240.45068.roman@khimov.ru>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
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
X-List-Received-Date: Wed, 15 Dec 2010 19:48:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFJvbWFu
IEkgS2hpbW92DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTUsIDIwMTAgMTo0MSBQTQ0K
PiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtvZV0gW1JGQ10gbW92ZSBvcGVuc3NsLmNuZiBmaWxlIGludG8gYmFzZSBvcGVuc3Ns
IHBhY2thZ2UNCj4gDQo+INCSINGB0L7QvtCx0YnQtdC90LjQuCDQvtGCINCh0YDQtdC00LAgMTUg
0LTQtdC60LDQsdGA0Y8gMjAxMCAyMTozODowNyDQsNCy0YLQvtGAIE1hdXBpbiwgQ2hhc2Ug0L3Q
sNC/0LjRgdCw0Ls6DQo+ID4gRnJvbSB0aGUgbG9nIEkgc2VlIHRoYXQgdGhlIG9wZW5zc2wuY25m
IGZpbGUgd2FzIG9yaWdpbmFsbHkgYWRkZWQgdG8gdGhlDQo+ID4gIGxpYmNyeXB0byBwYWNrYWdl
IHNpbmNlIGl0IHdhcyBhY2Nlc3NlZCBkaXJlY3RseSBmcm9tIGxpYmNyeXB0byAoY29tbWl0DQo+
ID4gIGY5NWE5NTQzNWNhNzllN2I5OTQyYjZlMzIxZDMwZTI2NGM3Mjg3OTEpLiAgSSB0aGVuIHNl
ZSB0aGF0IGl0IHdhcw0KPiBtb3ZlZA0KPiA+ICB0aGUgZmlsZSB0byB0aGUgbWlzYyBwYWNrYWdl
IHRvIG1ha2UgZGlmZmVyZW50IGxpYmNyeXB0byB2ZXJzaW9ucw0KPiBwYXJhbGxlbA0KPiA+ICBp
bnN0YWxsYWJsZSAoY29tbWl0IDI2YjdkNjUxNDExMWQ1YWMwMTcxYzE4MzRmYTg1ZDQ1NzZkNzgz
YmYpIGJ1dCBubw0KPiBvdGhlcg0KPiA+ICBqdXN0aWZpY2F0aW9uIGFzIHRvIHdoeSB0aGUgLmNu
ZiB3YXMgcGxhY2VkIGluIHRoZSBtaXNjIGluc3RlYWQgb2YgYmFzZQ0KPiA+ICBwYWNrYWdlLg0K
PiA+DQo+ID4gSSBoYXZlIGEgcGF0Y2ggdG8gbW92ZSB0aGUgb3BlbnNzbC5jbmYgZmlsZSBpbnRv
IHRoZSBvcGVuc3NsIHBhY2thZ2UgYnV0DQo+IEkNCj4gPiAgd2FudGVkIHRvIGJldHRlciB1bmRl
cnN0YW5kIHdoeSB0aGlzIGZpbGUgd2FzIG5vdCBhbHJlYWR5IGluIHRoZQ0KPiBvcGVuc3NsDQo+
ID4gIHBhY2thZ2UgYmVmb3JlIHN1Ym1pdHRpbmcgbXkgcGF0Y2guDQo+IA0KPiBNaXNzZWQgdGhh
dCBjaGFuZ2UuIFNlZW1zIHdyb25nIHRvIG1lLiBBbmQgSSBzdGlsbCB0aGluayB0aGF0IGl0IGJl
bG9uZ3MNCj4gdG8NCj4gbGliY3J5cHRvLCBub3Qgb3BlbnNzbCBzaW5jZSB5b3UgY2FuIGVhc2ls
eSBub3QgaW5zdGFsbCBvcGVuc3NsIGJpbmFyeSBhbmQNCj4gc3RpbGwgdXNlIGl0IHdpdGggdHVu
ZWQgb3BlbnNzbC5jbmYgaW4geW91ciBhcHBzLg0KDQpTbyBpdCBzZWVtcyBsaWtlIHRoZXJlIGFy
ZSB0d28gcGFja2FnZXMgdGhhdCBuZWVkIHRoaXMgZGVmYXVsdCBvcGVuc3NsLmNuZiBmaWxlLCB0
aGUgbGliY3J5cHRvIGFuZCBvcGVuc3NsIHBhY2thZ2VzLiAgV291bGQgaXQgcGVyaGFwcyBiZSBh
IGJldHRlciBpZGVhIHRvIHB1bGwgdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBpbnRvIGl0cyBvd24g
cGFja2FnZSBhbmQgdGhlbiBzZXQgdGhlIFJERVBFTkRTIGZvciB0aGUgbGliY3J5cHRvIGFuZCBv
cGVuc3NsIHBhY2thZ2VzIHRvIHVzZSB0aGUgb3BlbnNzbCBjb25maWd1cmF0aW9uIHBhY2thZ2U/
ICBUaGF0IHdheSB5b3UgY2FuIHN0aWxsIGhhdmUgbXVsdGlwbGUgdmVyc2lvbnMgb2YgbGliY3J5
cHRvIChsaWtlIEtvZW4gd2FzIHRyeWluZyB0byBkbykgYW5kIGhhdmUgdGhlIGRlZmF1bHQgZmls
ZSBzaGFyZWQgYmV0d2VlbiBib3RoIHBhY2thZ2VzIHRoYXQgbmVlZCBpdC4NCg0KPiANCj4gLS0N
Cj4gIGh0dHA6Ly9yb21hbi5raGltb3YucnUNCj4gbWFpbHRvOiByb21hbkBraGltb3YucnUNCj4g
Z3BnIC0ta2V5c2VydmVyIGhrcDovL3N1YmtleXMucGdwLm5ldCAtLXJlY3Yta2V5cyAweEU1RTA1
NUMzDQo=


