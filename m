Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Otfx1-0004sK-1j
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 14:10:06 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o89C9Fwn005359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:09:15 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o89C9FeR020659
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:09:15 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89C9Fot011804
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:09:15 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 9 Sep 2010 07:09:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Sep 2010 07:09:14 -0500
Thread-Topic: [oe] [PATCHv2] common_use_cases: add description of SOC_FAMILY
Thread-Index: ActPn5uFmaoCuOMZScy5CPn8K+BuOQAd822Q
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAA0F@dlee06.ent.ti.com>
References: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
	<1283982455.21233.48.camel@mattotaupa>
In-Reply-To: <1283982455.21233.48.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Thu, 09 Sep 2010 12:10:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFBhdWwg
TWVuemVsDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDA4LCAyMDEwIDQ6NDggUE0NCj4g
VG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbb2VdIFtQQVRDSHYyXSBjb21tb25fdXNlX2Nhc2VzOiBhZGQgZGVzY3JpcHRpb24gb2YN
Cj4gU09DX0ZBTUlMWQ0KPiANCj4gQW0gTWl0dHdvY2gsIGRlbiAwOC4wOS4yMDEwLCAxMzowMyAt
MDUwMCBzY2hyaWViIENoYXNlIE1hdXBpbjoNCj4gPiAqIEFkZGVkIGEgZGVzY3JpcHRpb24gb2Yg
dGhlIFNPQ19GQU1JTFkgdmFyaWFibGUgdGhhdA0KPiA+ICAgY2FuIGJlIHNldCBpbiB0aGUgbWFj
aGluZSBjb25maWd1cmF0aW9uIGZpbGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhc2Ug
TWF1cGluIDxjaGFzZS5tYXVwaW5AdGkuY29tPg0KPiA+IC0tLQ0KPiA+ICBkb2NzL3VzZXJtYW51
YWwvY2hhcHRlcnMvY29tbW9uX3VzZV9jYXNlcy54bWwgfCAgIDI0DQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAxIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDAgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy91c2VybWFudWFsL2NoYXB0ZXJz
L2NvbW1vbl91c2VfY2FzZXMueG1sDQo+IGIvZG9jcy91c2VybWFudWFsL2NoYXB0ZXJzL2NvbW1v
bl91c2VfY2FzZXMueG1sDQo+ID4gaW5kZXggZDg2ZDBjYS4uZWY4MWI5NSAxMDA2NDQNCj4gPiAt
LS0gYS9kb2NzL3VzZXJtYW51YWwvY2hhcHRlcnMvY29tbW9uX3VzZV9jYXNlcy54bWwNCj4gPiAr
KysgYi9kb2NzL3VzZXJtYW51YWwvY2hhcHRlcnMvY29tbW9uX3VzZV9jYXNlcy54bWwNCj4gPiBA
QCAtOTQsNiArOTQsMzAgQEAgU1JDREFURSA9ICIyMDA2MTAxNCINCj4gPiAgICAgICAgICA8L2xp
c3RpdGVtPg0KPiA+ICAgICAgICA8L2l0ZW1pemVkbGlzdD48L3BhcmE+DQo+ID4NCj4gPiArICAg
IDxwYXJhPlRoZXJlIGFyZSBhbHNvIHNvbWUgb3B0aW9uYWwgdmFyaWFibGVzIHRoYXQgY2FuIGJl
IGRlZmluZWQ6DQo+ID4gKyAgICA8aXRlbWl6ZWRsaXN0Pg0KPiA+ICsgICAgPGxpc3RpdGVtPg0K
PiA+ICsgICAgICAgICAgPHBhcmE+PGNvbW1hbmQ+U09DX0ZBTUlMWTwvY29tbWFuZD4gZGVzY3Jp
YmVzIGEgZmFtaWx5IG9mDQo+IHByb2Nlc3NvcnMNCj4gPiArICAgICAgICAgICAgdGhhdCBhbGwg
c2hhcmUgY29tbW9uIGZlYXR1cmVzIHN1Y2ggYXMga2VybmVsIHZlcnNpb25zLA0KPiA+ICsgICAg
ICAgICAgICBib290bG9hZGVycywgZXRjLiAgVGhpcyBpcyB1c2VkIHRvIGFsbG93IG92ZXJyaWRl
cyBmb3IgYQ0KPiB3aG9sZQ0KPiANCj4gSSB0aGluayBhIGZ1bGwgc3RvcCBpcyByZXF1aXJlZCBl
dmVuIGlmIHRoZXJlIGlzIGFuIGFiYnJldmlhdGlvbiBpbg0KPiBmcm9udCBvZiBpdC4g4oaSIGV0
Yy4uDQoNClBhdWwsDQoNCkknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFy
ZSBhc2tpbmcgdG8gaGF2ZSBmaXhlZC4gIEFyZSB5b3Ugc2F5aW5nIHlvdSB3YW50IGl0IHRvIGJl
IGV0Yy4uIGluc3RlYWQgb2YgZXRjLg0KDQpKdXN0IHdhbnQgdG8gY2xhcmlmeSBiZWZvcmUgSSBy
ZW1ha2UgdGhpcyBwYXRjaC4NCg0KPiANCj4gW+KApl0NCj4gDQo+IFdpdGggdGhpcyBmaXhlZDoN
Cj4gDQo+IEFja2VkLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJAdXNlcnMuc291cmNlZm9y
Z2UubmV0Pg0KPiANCj4gDQo+IFRoYW5rcyBmb3IgaW1wcm92aW5nIHRoZSBkb2N1bWVudGF0aW9u
LA0KPiANCj4gUGF1bA0K


