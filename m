Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QvnCl-00051l-4L
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 11:23:31 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Qvn8B-0002Xp-Fz from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 02:18:47 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 23 Aug 2011 11:18:44 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A54FA@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1314090730.3688.9.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH v2][meta-oe] lmbench: Added new recipe for 3.0-a9
	version
Thread-Index: AcxhdNN3OZK/cl61S/mIW3K42Ks53wAALK/w
References: <1314088478-8681-1-git-send-email-noor_ahsan@mentor.com>
	<1314090730.3688.9.camel@mattotaupa>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-oe] lmbench: Added new recipe for 3.0-a9 version
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
X-List-Received-Date: Tue, 23 Aug 2011 09:23:31 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGksDQoNClNvcnJ5IEkgZGlkIG5vdCBzZWUgeW91ciBjb21tZW50IG9uIG15IHByZXZpb3VzIHBh
dGNoLiBJJ2xsIGluY29ycG9yYXRlIHRoZW0gaW4gbmV4dCB2ZXJzaW9uLiBUaGFua3MuDQoNClJl
Z2FyZHMsDQpOb29yIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9w
ZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0
bzpvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBC
ZWhhbGYgT2YNCj4gUGF1bCBNZW56ZWwNCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDIzLCAyMDEx
IDI6MTIgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtQQVRDSCB2Ml1bbWV0YS1vZV0gbG1iZW5jaDogQWRkZWQg
bmV3IHJlY2lwZSBmb3INCj4gMy4wLWE5IHZlcnNpb24NCj4gDQo+IERlYXIgTm9vciwNCj4gDQo+
IA0KPiBBbSBEaWVuc3RhZywgZGVuIDIzLjA4LjIwMTEsIDEzOjM0ICswNTAwIHNjaHJpZWIgTm9v
ciwgQWhzYW46DQo+ID4gRnJvbTogTm9vciBBaHNhbiA8bm9vcl9haHNhbkBtZW50b3IuY29tPg0K
PiA+DQo+ID4gKiBBZGRlZCBuZXcgcmVjaXBlIGZvciAzLjAtYTkgdmVyc2lvbi4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE5vb3IgQWhzYW4gPG5vb3JfYWhzYW5AbWVudG9yLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2xtYmVuY2gvbG1iZW5jaC0zLjAtYTkvbG1iZW5jaC1ydW4gICAgICAgICAg
ICAgfCAgIDIzICsrKw0KPiA+ICAuLi4vbG1iZW5jaC9sbWJlbmNoLTMuMC1hOS9vYmV5LXJhbmxp
Yi5wYXRjaCAgICAgICB8ICAgMjUgKysrDQo+ID4gIC4uLi9sbWJlbmNoLTMuMC1hOS9yZW5hbWUt
bGluZS1iaW5hcnkucGF0Y2ggICAgICAgIHwgICAxMSArKw0KPiA+ICAuLi4vbG1iZW5jaC0zLjAt
YTkvdXBkYXRlLXJlc3VsdHMtc2NyaXB0LnBhdGNoICAgICB8ICAxNTUNCj4gKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgLi4uL3JlY2lwZXMtYmVuY2htYXJrL2xtYmVuY2gvbG1iZW5jaF8zLjAt
YTkuYmIgICAgfCAgIDc1ICsrKysrKysrKysNCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAyODkgaW5z
ZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4gDQo+IFvigKZdDQo+IA0KPiBOQUNLLiBJIGFt
IHNvcnJ5LCBidXQgbmVpdGhlciBUb23igJlzIG5vciBtaW5lIHJldmlldyBjb21tZW50cyBhcmUN
Cj4gaW5jbHVkZWQuDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gUGF1bA0K


