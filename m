Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P1Oiw-00006F-Ah
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 21:23:31 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8UJN4MC012880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:23:04 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o8UJN4Rt000423
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:23:04 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8UJN4Rk004010
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:23:04 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 30 Sep 2010 14:23:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Sep 2010 14:23:03 -0500
Thread-Topic: [oe] [PATCHv2] am-benchmarks: update to latest version
Thread-Index: ActgcOOuVIFnQU5gScmXQ09oMsYaAQAY20MA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310F20E9B@dlee06.ent.ti.com>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
	<1285803797.5168.3.camel@mattotaupa>
	<1285831520.3805.1.camel@mattotaupa>
In-Reply-To: <1285831520.3805.1.camel@mattotaupa>
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
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Thu, 30 Sep 2010 19:23:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gUGF1
bCBNZW56ZWwNCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAzMCwgMjAxMCAyOjI1IEFNDQo+
IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW29lXSBbUEFUQ0h2Ml0gYW0tYmVuY2htYXJrczogdXBkYXRlIHRvIGxhdGVzdCB2ZXJz
aW9uDQo+IA0KPiBBbSBEb25uZXJzdGFnLCBkZW4gMzAuMDkuMjAxMCwgMDE6NDMgKzAyMDAgc2No
cmllYiBQYXVsIE1lbnplbDoNCj4gDQo+ID4gQW0gTWl0dHdvY2gsIGRlbiAyOS4wOS4yMDEwLCAx
MjozNyAtMDUwMCBzY2hyaWViIENoYXNlIE1hdXBpbjoNCj4gPiA+ICogVXBkYXRlZCB0aGUgU1JD
UkVWIHRvIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGlzIHByb2plY3QNCj4gPiA+ICAgd2hpY2gg
aW5jbHVkZXMgc3VwcG9ydCBmb3IgbXVsdGlwbGUgcGxhdGZvcm1zLg0KPiA+ID4gKiBBZGQgQ09N
UEFUSUJMRV9NQUNISU5FIHNldHRpbmcgZm9yIHJlY2lwZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaGFzZSBNYXVwaW4gPGNoYXNlLm1hdXBpbkB0aS5jb20+DQo+ID4NCj4gPiBpdCB3
b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgYnJpZWZseSBub3RlIHdoYXQgY2hhbmdlZCBiZXR3
ZWVuIHRoZQ0KPiA+IHBhdGNoIGl0ZXJhdGlvbnMgYWZ0ZXIgYSAtLS0gbGluZSwgc28gdGhhdCBp
dCB3aWxsIGdldCByZW1vdmVkIHdoZW4gaXQNCj4gPiBpcyBjb21taXR0ZWQuIHYxIOKGkiB2Mg0K
PiA+DQo+ID4gUGxlYXNlIGFsc28gcmVtZW1iZXIgdG8gdXBkYXRlIHRoZSBwYXRjaCBxdWV1ZSBb
MV0gYXMgcGlja2VkIGFsbCBwYXRjaGVzDQo+ID4gZnJvbSB0aGUgcXVldWUgYW5kIHRoZW4gaGFk
IHRvIHJlbW92ZSB0aGUgZmlyc3QgdmVyc2lvbiBzaW5jZSBpdCB3YXMNCj4gPiBzdGlsbCBsaXN0
ZWQuDQo+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gIHJlY2lwZXMvdGkvYW0tYmVuY2htYXJrc19zdm4u
YmIgfCAgIDEzICsrKysrKysrKystLS0NCj4gPiA+ICAxIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL3JlY2lw
ZXMvdGkvYW0tYmVuY2htYXJrc19zdm4uYmIgYi9yZWNpcGVzL3RpL2FtLQ0KPiBiZW5jaG1hcmtz
X3N2bi5iYg0KPiA+ID4gaW5kZXggNTFhYzZhZi4uNmFiMjlmNSAxMDA2NDQNCj4gPiA+IC0tLSBh
L3JlY2lwZXMvdGkvYW0tYmVuY2htYXJrc19zdm4uYmINCj4gPiA+ICsrKyBiL3JlY2lwZXMvdGkv
YW0tYmVuY2htYXJrc19zdm4uYmINCj4gPiA+IEBAIC00LDE1ICs0LDIyIEBAIExJQ0VOU0UgPSAi
QlNEIg0KPiA+ID4gIFNFQ1RJT04gPSAic3lzdGVtIg0KPiA+ID4gIFBSSU9SSVRZID0gIm9wdGlv
bmFsIg0KPiA+ID4NCj4gPiA+IC1TUkNSRVYgPSAiMzMiDQo+ID4gPiAtUFYgPSAiMS4wIg0KPiA+
ID4gK1NSQ1JFViA9ICI1NiINCj4gPiA+ICtQViA9ICIxLjEiDQo+ID4gPiAgUFIgPSAicjErc3Zu
ciR7U1JDUFZ9Ig0KPiA+ID4NCj4gPiA+ICtDT01QQVRJQkxFX01BQ0hJTkUgPSAiKGRtMzY1fG9t
YXBsMTM4fG9tYXAzfHRpODE2eCkiDQo+ID4gPiArDQo+ID4gPiArQVJDSElURUNUVVJFX2RtMzY1
ID0gImFybTkiDQo+ID4gPiArQVJDSElURUNUVVJFX29tYXBsMTM4ID0gImFybTkiDQo+ID4gPiAr
QVJDSElURUNUVVJFX29tYXAzID0gImNvcnRleC1hOCINCj4gPiA+ICtBUkNISVRFQ1RVUkVfdGk4
MTZ4ID0gImNvcnRleC1hOCINCj4gPiA+ICsNCj4gPiA+ICBJTlNBTkVfU0tJUF8ke1BOfSA9ICJU
cnVlIg0KPiA+ID4NCj4gPiA+ICBTUkNfVVJJID0NCj4gInN2bjovL2dmb3JnZS50aS5jb20vc3Zu
L2FtX2JlbmNobWFya3MvO21vZHVsZT10cnVuaztwcm90bz1odHRwczt1c2VyPWFub24NCj4geW1v
dXM7cHN3ZD0nJyINCj4gPiA+DQo+ID4gPiAtUyA9ICIke1dPUktESVJ9L3RydW5rIg0KPiA+ID4g
K1MgPSAiJHtXT1JLRElSfS90cnVuay8ke0FSQ0hJVEVDVFVSRX0iDQo+ID4gPg0KPiA+ID4gIGRv
X2NvbXBpbGUoKSB7DQo+ID4gPiAgCSMgZG9uJ3QgYnVpbGQgZGVidWcgdmVyc2lvbg0KPiA+DQo+
ID4gSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvciB3aXRoIG1pbmltYWwtdWNsaWJjLiBUaGUgb3Ro
ZXIgZGlzdHJpYnV0aW9ucw0KPiA+IHN0aWxsIGJ1aWxkLiBUaGUgZXJyb3IgbG9va3MgZ2VuZXJp
YyB0aG91Z2guDQo+ID4NCj4gPiAgICAgICAgIEVSUk9SOiAnb2Uvb3BlbmVtYmVkZGVkL3JlY2lw
ZXMvdGkvYW0tYmVuY2htYXJrc19zdm4uYmInIGZhaWxlZA0KPiA+ICAgICAgICAgRVJST1I6IEZ1
bmN0aW9uIGRvX2NvbXBpbGUgZmFpbGVkDQo+ID4gICAgICAgICBb4oCmXQ0KPiA+ICAgICAgICAg
TG9nIGRhdGEgZm9sbG93czoNCj4gPiAgICAgICAgIHwgbWFrZTogKioqIE5vIHJ1bGUgdG8gbWFr
ZSB0YXJnZXQgYHJlbGVhc2UnLiAgU3RvcC4NCj4gPiAgICAgICAgIHwgRVJST1I6IEZ1bmN0aW9u
IGRvX2NvbXBpbGUgZmFpbGVkDQo+ID4gICAgICAgICBOT1RFOiBwYWNrYWdlIGFtLWJlbmNobWFy
a3MtMS4xLXIxK3N2bnI1NjogdGFzayBkb19jb21waWxlOg0KPiBGYWlsZWQNCj4gDQo+IEkgZ290
IHRoZSBzYW1lIGVycm9yIHdpdGggbWluaW1hbCAoZWdsaWJjKS4gQnV0IGl0IHdvcmtlZCB3aXRo
IMimbmdzdHLDtm0NCj4gMjAwOC4xLiBJIGRvIG5vdCBrbm93IHdoYXQgaXMgZ29pbmcgb24uDQoN
ClBhdWwsDQoNClRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMuICBGb3Igbm93IHdlIGFyZSBv
bmx5IHN1cHBvcnRpbmcgdGhpcyByZWNpcGUgb24gQW5nc3Ryb20uICBUaGlzIHJlY2lwZSB1c2Vz
IGZlYXR1cmVzIHN1Y2ggYXMgU09DX0ZBTUlMWSBpbiB0aGUgb3ZlcnJpZGVzIHRoYXQgYXJlIG5v
dCBhdmFpbGFibGUgaW4gYWxsIGRpc3RyaWJ1dGlvbnMgc3VjaCBhcyBtaW5pbWFsLiAgSW4gZmFj
dCwgSSBiZWxpZXZlIHRoaXMgaXMgd2hhdCBjYXVzZWQgeW91ciBwcm9ibGVtIGJlY2F1c2UgdGhl
IFMgZGlyZWN0b3J5IGlzIGJhc2VkIG9uIGFuIG92ZXJyaWRlIHdoaWNoIHVzZXMgU09DX0ZBTUlM
WS4gIEkgd2lsbCBhZGQgYSBub3RlIHRvIHRoaXMgYWZmZWN0IGFuZCBzZW5kIGFuIHVwZGF0ZWQg
cGF0Y2ggZm9yIHRoZSByZWNpcGUuDQoNCj4gDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBQYXVsDQo+
IA0KPiANCj4gPiBbMV0gaHR0cDovL3dpa2kub3BlbmVtYmVkZGVkLm5ldC9pbmRleC5waHAvUGF0
Y2h3b3JrDQo=


