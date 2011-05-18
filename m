Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QMbsG-0000Nh-79
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 10:12:56 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QMbpS-0000Bz-FZ from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 01:10:02 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 18 May 2011 10:10:00 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A505BF106C@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1305639830.4065.65.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH v2] ust: Add new recipe for 0.12 version
Thread-Index: AcwUmIAgO5XBrnCDTF6eYG20eABhKgAmcDbg
References: <1305639196-6624-1-git-send-email-noor_ahsan@mentor.com>
	<1305639830.4065.65.camel@mattotaupa>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] ust: Add new recipe for 0.12 version
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
X-List-Received-Date: Wed, 18 May 2011 08:12:56 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNClNhbWUgc3R1ZmYgYXBwbHkgaGVyZSBhcyB3ZWxsLg0KDQpJIGFtIG5vdCBzdXJl
IHdoZXRoZXIgYW55Ym9keSBlbHNlIGlzIHVzaW5nIG9sZGVyIHZlcnNpb24gb3Igbm90IHdpbGwg
bm90IGRlbGV0ZSB0aGUgb2xkZXIgdmVyc2lvbi4gSSB0ZXN0ZWQgdGhpcyByZWNpcGUgd2l0aCAN
CkRJU1RSTyA9ICJhbmdzdHJvbmctMjAxMC54Ig0KTUFDSElORSA9ICJiZWFnbGVib2FyZCINCg0K
VGhlIG9sZGVyIHZlcnNpb24gZG9lcyBub3Qgc3VwcG9ydCBhcm0gYW5kIG9sZGVyIHJlY2lwZSB0
aHJvd3MgdGhlIGVycm9yIGluIGRvX2NvbXBpbGUuIE5ld2VyIHZlcnNpb24gaGFzIGJldHRlciBz
dXBwb3J0IG9mIEFSTS4NCg0KUmVnYXJkcywNCk5vb3INCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnXSBPbiBCZWhhbGYgT2YgUGF1bCBNZW56ZWwNClNlbnQ6IFR1ZXNkYXksIE1heSAxNywg
MjAxMSA2OjQ0IFBNDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbb2VdIFtQQVRDSCB2Ml0gdXN0OiBBZGQgbmV3IHJlY2lwZSBmb3Ig
MC4xMiB2ZXJzaW9uDQoNCkFtIERpZW5zdGFnLCBkZW4gMTcuMDUuMjAxMSwgMTg6MzMgKzA1MDAg
c2NocmllYiBOb29yIEFoc2FuOg0KPiAqIEFkZCBuZXcgcmVjaXBlIG9mIHVzdCBmb3IgMC4xMiB2
ZXJzaW9uDQoNClRoZSBzYW1lIGNvbW1lbnRzIGFuZCBxdWVzdGlvbnMgYXMgaW4gbXkgb3RoZXIg
bWFpbCBhcHBseSBoZXJlIHRvby4NClBsZWFzZSBzZW5kIGEgcmVwbHkgd2l0aCB0aGUgcmVzcGVj
dGl2ZSBhbnN3ZXJzLg0KDQo+IFNpZ25lZC1vZmYtYnk6IE5vb3IgQWhzYW4gPG5vb3JfYWhzYW5A
bWVudG9yLmNvbT4NCj4gLS0tDQo+ICByZWNpcGVzL2x0dG5nL3VzdF8wLjEyLmJiIHwgICAgNCAr
KysrDQo+ICAxIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzL2x0dG5nL3VzdF8wLjEyLmJiIGIvcmVjaXBlcy9s
dHRuZy91c3RfMC4xMi5iYiBuZXcgDQo+IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMC4u
MWVmYjg1Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMvbHR0bmcvdXN0XzAuMTIu
YmINCj4gQEAgLTAsMCArMSw0IEBADQo+ICtyZXF1aXJlICR7UE59LmluYw0KPiArDQo+ICtTUkNf
VVJJW21kNXN1bV0gPSAiZmFlNmUzMjRhNTYwMTY2NThjNWI4M2VjMTRiYTAwNDMiDQo+ICtTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMjE1YjA1ZjQ3ZDBjOWUzYTI5MzQ5MjZhN2QxNGZhOWM2NzAyNWRi
OTE3YzNhMWY2NDFkZjQwYjA4MzE0YWIwYyINCg0KQWNrZWQtYnk6IFBhdWwgTWVuemVsIDxwYXVs
ZXBhbnRlckB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQoNCg0KVGhhbmtzLA0KDQpQYXVsDQo=


