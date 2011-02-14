Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pp3pM-00059f-5K
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 20:11:16 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 030E5491283;
	Mon, 14 Feb 2011 20:10:09 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Mon, 14 Feb 2011 19:10:08 +0000
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
Date: Mon, 14 Feb 2011 20:10:05 +0100
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AF9A@exchange.intern.dresearch.de>
In-Reply-To: <AANLkTimD19GdMuFTnuZpw2Od22G3LXxmC1+_uVUtEkH7@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] libunwind: force gcc to be built first
Thread-Index: AcvMesvigpHzENCoS16S+3DIqULi5w==
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
	<4CA5B348.1000404@dresearch.de>
	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
	<4CA98B66.3060404@dresearch.de>
	<AANLkTi=mw3h2vqEav+yz2begWJVR++V6823_QmjdNqAg@mail.gmail.com>
	<4D58E883.8030606@dresearch.de>
	<AANLkTimD19GdMuFTnuZpw2Od22G3LXxmC1+_uVUtEkH7@mail.gmail.com>
From: "Sledz, Steffen" <sledz@dresearch.de>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Mon, 14 Feb 2011 19:11:16 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64
Content-class: urn:content-classes:message

QW0gMTQuMDIuMjAxMSAxODo1OCwgc2NocmllYiBLaGVtIFJhajoNCj4gT24gTW9uLCBGZWIgMTQs
IDIwMTEgYXQgMTI6MzIgQU0sIFN0ZWZmZW4gU2xlZHogPHNsZWR6QGRyZXNlYXJjaC5kZT4gd3Jv
dGU6DQo+PiBBbSAwNC4xMC4yMDEwIDE4OjAwLCBzY2hyaWViIEtoZW0gUmFqOg0KPj4+IE9uIE1v
biwgT2N0IDQsIDIwMTAgYXQgMTowOCBBTSwgVGhpbG8gRnJvbW0gPHQuZnJvbW1AZHJlc2VhcmNo
LmRlPiB3cm90ZToNCj4+Pj4gSGVsbG8gRnJhbnMsDQo+Pj4+DQo+Pj4+Pj4+IEkgdHJhY2tlZCBp
dCBkb3duIC0gbGlidW53aW5kIHB1Ymxpc2hlcyB1bndpbmQuaCwgYW5kIGdjYyB1c2VzIGFuDQo+
Pj4+Pj4+IGludGVybmFsDQo+Pj4+Pj4+IGZpbGUgb2YgdGhlIHNhbWUgbmFtZSB3aGlsZSBiZWlu
ZyBidWlsdC4NCj4+Pj4+Pg0KPj4+Pj4+IFllcyBnY2MgaGFzIGl0cyBvd24gdmVyc2lvbiBvZiBs
aWJ1bndpbmQgd2hpY2ggaXQgdXNlZCB1bmxlc3MNCj4+Pj4+PiBjb25maWd1cmVkIHdpdGggLS13
aXRoLXN5c3RlbS1saWJ1bndpbmQNCj4+Pj4+PiBJSVVDIHRoZSBwcm9ibGVtIGhhcHBlbnMgd2l0
aCB0YXJnZXQgZ2NjIG5vdCB3aXRoIGNyb3NzLWdjYy4gdGFyZ2V0DQo+Pj4+Pj4gZ2NjIGlzIGJ1
aWx0IHVzaW5nIGNyb3NzLWdjYyBhbmQNCj4+Pj4+PiA8c3lzcm9vdD4vdXNlL2luY2x1ZGUgY291
bGQgYmUgcHJlZmVycmVkIG92ZXIgdGhlIGxvY2F0aW9uIG9mDQo+Pj4+Pj4gbGlidW53aW5kLmgg
d2hpY2ggaXMgaW4gZ2NjIHNvdXJjZXMNCj4+Pj4+PiBJZiB0aGF0cyB0aGUgY2FzZSB0aGVuIHdl
IG5lZWQgdG8gZml4IGdjYyBidWlsZCB0byBub3QgbG9vayBpbnRvDQo+Pj4+Pj4gc3RhbmRhcmQg
c3lzcm9vdC91c3IvaW5jbHVkZSBidXQgcHJlZmVyDQo+Pj4+Pj4gdGhlIGxvY2FsIHVud2luZC5o
IHdoZW4gaXRzIHVzaW5nIGludGVybmFsIGxpYnVud2luZC4gVGhlIHByb2JsZW0NCj4+Pj4+PiB3
b3VsZCBub3Qgc2hvdyB1cCBpZiB0aGUgbGlidW53aW5kIHZlcnNpb25zDQo+Pj4+Pj4gd2VyZSBt
YXRjaGluZyBidXQgdGhhdCBtYXkgbm90IGJlIHRoZSBjYXNlIGFsd2F5cyBhbmQgSSBkb250IGtu
b3cgb2YNCj4+Pj4+PiBoYW5kIGhvdyB3ZSBjYW4gZml4IHRoZSBnY2MgY29uZmlndXJ5L2J1aWxk
DQo+Pj4+Pj4gdG8gaWdub3JlIGluc3RhbGxlZCB1bndpbmQuaA0KPj4+Pj4+DQo+Pj4+Pj4gWW91
IHdvcmthcm91bmQgd291bGQgb25seSB3b3JrIGlmIGJ1aWxkIHNlcXVlbmNlIHdhcyBmb2xsb3dl
ZCBpZiBzb21lDQo+Pj4+Pj4gb25lIGp1c3QgY2xlYW5lZCBnY2MgYW5kIHJlYnVpbGQgaXQNCj4+
Pj4+PiB0aGUgcHJvYmxlbSB3aWxsIHJlc3VyZmFjZS4NCj4+Pj4+Pg0KPj4+Pj4gVGhhbmtzIGZv
ciB0aGUgYW5hbHlzaXMgS2hlbS4NCj4+Pj4+IFRoaXMgaXMgaW5kZWVkIG1vcmUgb3IgbGVzcyB3
aGF0IEkgaGFkIGV4cGVjdGVkLg0KPj4+Pj4NCj4+Pj4+IEZvciBtZSB0aGlzIHBhdGNoIGdldHMg
YSBOQUsgYXMgaXQgZG9lcyBvbmx5IG1hc2tzIHRoZSBwcm9ibHZlbSBpbg0KPj4+Pj4gc29tZSBj
YXNlcyBidXQgbm90IHJlYWxseSBzb2x2ZXMgaXQuDQo+Pj4+DQo+Pj4+IFlvdSdyZSByaWdodCB3
aXRoIHRoaXMgYW5hbHlzaXM7IGhvd2V2ZXIsIHRoZSBwYXRjaCBlbmFibGVzIE9wZW5lbWJlZGRl
ZCB0bw0KPj4+PiBiZSBidWlsdCAqYXQgYWxsKi4gSWYgeW91IGNhcmUgbGVzcyBhYm91dCB3aGV0
aGVyIHlvdSdyZSBhYmxlIHRvIGFjdHVhbGx5DQo+Pj4+IGJ1aWxkIGFuZCBpZiB5b3UgaGF2ZSB0
aGUgdGltZSB0byB3YWl0IHVudGlsIHNvbWVvbmUgdmVudHVyZXMgZGVlcCBpbnRvIHRoZQ0KPj4+
PiBnY2MgYnVpbGQgYW5kIGZpeGVzIHRoZSBjYXVzZSwgdGhlbiB0aGlzIGlzIHRoZSB3YXkgdG8g
Z28uDQo+Pj4+DQo+Pj4+IEZvciB1cywgaG93ZXZlciwgdGhpcyBwYXRjaCBpcyBhIHZhbGlkIHdv
cmthcm91bmQuIEl0IHdpbGwgbWFrZSBPcGVuZW1iZWRkZWQNCj4+Pj4gd29yayBmb3IgdXMgdW50
aWwgdGhlIG9yaWdpbmFsIGlzc3VlIGlzIGZpeGVkLg0KPj4+DQo+Pj4gSSB0aGluayB3ZSBzaG91
bGQgdHJ5IHRvIGZpeCBpdCBpbiByaWdodCB3YXkuDQo+Pg0KPj4gUGluZyENCj4gDQo+IEkgdGhp
bmsgdGhpcyBwYXRjaCBkb2VzIG5vdCBmaXggdGhlIHByb2JsZW0gYnV0IGhpZGVzIGl0LiBJdCB3
aWxsIG5vdA0KPiBiZSB3b3J0aCB0byBnZXQgaXQgdXBzdHJlYW0NCg0KVGhhdCdzIHJpZ2h0Lg0K
DQpJIHJlYWQgeW91ciBjb21tZW50IGZyb20gb2N0b2JlciAxc3QgdGhhdCB5b3UgdHJ5IHRvIGZp
eCB0aGlzICJpbiB0aGUgcmlnaHQgd2F5IiBieSBmaXhpbmcgInRoZSBnY2MgYnVpbGQgdG8gbm90
IGxvb2sgaW50byBzdGFuZGFyZCBzeXNyb290L3Vzci9pbmNsdWRlIGJ1dCBwcmVmZXIgdGhlIGxv
Y2FsIHVud2luZC5oIHdoZW4gaXRzIHVzaW5nIGludGVybmFsIGxpYnVud2luZCIuDQoNClN0ZWZm
ZW4NCg0KLS0gDQpEUmVzZWFyY2ggRmFocnpldWdlbGVrdHJvbmlrIEdtYkgNCk90dG8tU2NobWly
Z2FsLVN0ci4gMywgMTAzMTkgQmVybGluLCBHZXJtYW55DQpUZWw6ICs0OSAzMCA1MTU5MzItMjM3
IG1haWx0bzpzbGVkekBEUmVzZWFyY2guZGUNCkZheDogKzQ5IDMwIDUxNTkzMi0yOTkNCkdlc2No
w6RmdHNmw7xocmVyOiBEci4gTWljaGFlbCBXZWJlciwgV2VybmVyIE3DtmdsZTsNCkFtdHNnZXJp
Y2h0IEJlcmxpbiBDaGFybG90dGVuYnVyZzsgSFJCIDEzMDEyMCBCOw0KVXN0Li1JRE5yLiBERTI3
Mzk1MjA1OA0K


