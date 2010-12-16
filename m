Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PTESr-0001Xp-Ti
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:05:54 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBGE4CW9014353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:04:12 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGE4Ccf008496
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:04:12 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGE4CrE025733
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:04:12 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 16 Dec 2010 08:04:11 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Dec 2010 08:04:10 -0600
Thread-Topic: [oe] [RFC] move openssl.cnf file into base openssl package
Thread-Index: AcucmEPq2nwq7QWNRBGTYFgvEYC2cAAkOqFA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E92ADA@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<201012152240.45068.roman@khimov.ru>
	<131E5DFBE7373E4C8D813795A6AA7F080329DB6BEA@dlee06.ent.ti.com>
	<201012152339.06515.roman@khimov.ru>
In-Reply-To: <201012152339.06515.roman@khimov.ru>
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
X-List-Received-Date: Thu, 16 Dec 2010 14:06:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFJvbWFu
IEkgS2hpbW92DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTUsIDIwMTAgMjozOSBQTQ0K
PiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtvZV0gW1JGQ10gbW92ZSBvcGVuc3NsLmNuZiBmaWxlIGludG8gYmFzZSBvcGVuc3Ns
IHBhY2thZ2UNCj4gDQo+INCSINGB0L7QvtCx0YnQtdC90LjQuCDQvtGCINCh0YDQtdC00LAgMTUg
0LTQtdC60LDQsdGA0Y8gMjAxMCAyMjo0NzowNSDQsNCy0YLQvtGAIE1hdXBpbiwgQ2hhc2Ug0L3Q
sNC/0LjRgdCw0Ls6DQo+ID4gPiBNaXNzZWQgdGhhdCBjaGFuZ2UuIFNlZW1zIHdyb25nIHRvIG1l
LiBBbmQgSSBzdGlsbCB0aGluayB0aGF0IGl0DQo+IGJlbG9uZ3MNCj4gPiA+IHRvDQo+ID4gPiBs
aWJjcnlwdG8sIG5vdCBvcGVuc3NsIHNpbmNlIHlvdSBjYW4gZWFzaWx5IG5vdCBpbnN0YWxsIG9w
ZW5zc2wgYmluYXJ5DQo+ID4gPiBhbmQgc3RpbGwgdXNlIGl0IHdpdGggdHVuZWQgb3BlbnNzbC5j
bmYgaW4geW91ciBhcHBzLg0KPiA+DQo+ID4gU28gaXQgc2VlbXMgbGlrZSB0aGVyZSBhcmUgdHdv
IHBhY2thZ2VzIHRoYXQgbmVlZCB0aGlzIGRlZmF1bHQNCj4gb3BlbnNzbC5jbmYNCj4gPiAgZmls
ZSwgdGhlIGxpYmNyeXB0byBhbmQgb3BlbnNzbCBwYWNrYWdlcy4gIFdvdWxkIGl0IHBlcmhhcHMg
YmUgYSBiZXR0ZXINCj4gPiAgaWRlYSB0byBwdWxsIHRoZSBjb25maWd1cmF0aW9uIGZpbGUgaW50
byBpdHMgb3duIHBhY2thZ2UgYW5kIHRoZW4gc2V0DQo+IHRoZQ0KPiA+ICBSREVQRU5EUyBmb3Ig
dGhlIGxpYmNyeXB0byBhbmQgb3BlbnNzbCBwYWNrYWdlcyB0byB1c2UgdGhlIG9wZW5zc2wNCj4g
PiAgY29uZmlndXJhdGlvbiBwYWNrYWdlPyBUaGF0IHdheSB5b3UgY2FuIHN0aWxsIGhhdmUgbXVs
dGlwbGUgdmVyc2lvbnMgb2YNCj4gPiAgbGliY3J5cHRvIChsaWtlIEtvZW4gd2FzIHRyeWluZyB0
byBkbykgYW5kIGhhdmUgdGhlIGRlZmF1bHQgZmlsZSBzaGFyZWQNCj4gPiAgYmV0d2VlbiBib3Ro
IHBhY2thZ2VzIHRoYXQgbmVlZCBpdC4NCj4gDQo+IG9wZW5zc2wgaXMgcmRlcGVuZGluZyBvbiBs
aWJjcnlwdG8gYW55d2F5IChpdCdzIGxpbmtlZCB3aXRoIGl0IGFuZCBJIGRvbid0DQo+IHRoaW5r
IGl0J2xsIGNoYW5nZSBhbnkgdGltZSBzb29uKS4gQnV0IGNvbmZpZ3MgZm9yIGRpZmZlcmVudCB2
ZXJzaW9ucyBjYW4NCj4gYmUNCj4gY29uZmxpY3RpbmcsIHNvIEknbSBub3Qgc3VyZSB0aGlzIGtp
bmQgb2YgYXBwcm9hY2ggc29sdmVzIGFueXRoaW5nLg0KDQpJIG5vdGljZWQgdGhhdC4gIEkgdGhp
bmsgdGhlIG9ubHkgdGhpbmcgdGhhdCBwdXR0aW5nIHRoaXMgaW50byBpdHMgb3duIHBhY2thZ2Ug
d291bGQgc29sdmUgaXMgYWRkcmVzc2luZyBLb2VuJ3MgY29tbWVudCBhYm91dCBoYXZpbmcgbXVs
dGlwbGUgdmVyc2lvbnMgb2YgbGliY3J5cHRvIGluc3RhbGxlZC4NCg0KS29lbiwgY2FuIHlvdSBj
b21tZW50IG9uIHlvdXIgY2hhbmdlIHRoYXQgbW92ZWQgdGhlIG9wZW5zc2wuY25mIGZpbGUgdG8g
dGhlIG1pc2MgcGFja2FnZT8gIERvIHlvdSBzdGlsbCBuZWVkIHRvIGJlIGFibGUgdG8gaW5zdGFs
bCBtdWx0aXBsZSB2ZXJzaW9ucyBvZiBsaWJjcnlwdG8/DQoNCj4gDQo+IC0tDQo+ICBodHRwOi8v
cm9tYW4ua2hpbW92LnJ1DQo+IG1haWx0bzogcm9tYW5Aa2hpbW92LnJ1DQo+IGdwZyAtLWtleXNl
cnZlciBoa3A6Ly9zdWJrZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgMHhFNUUwNTVDMw0K


