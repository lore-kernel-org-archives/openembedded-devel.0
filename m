Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PSFze-0006h3-RF
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 22:31:40 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBDLU2vk023588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 15:30:02 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBDLU1C2020250
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 15:30:01 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBDLU1j2018312
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 15:30:01 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 13 Dec 2010 15:30:01 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Dec 2010 15:30:00 -0600
Thread-Topic: [oe] [PATCH 4/4] ti-pru-sw-examples: fix package run-time
	dependencies
Thread-Index: Acua9cf6NkysIt6tQJWJ4cyPGiq5dQAFvFuA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329DB67AF@dlee06.ent.ti.com>
References: <1292246420-5969-1-git-send-email-m-watkins@ti.com>
	<1292265819.4146.43.camel@mattotaupa>
In-Reply-To: <1292265819.4146.43.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] ti-pru-sw-examples: fix package run-time dependencies
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
X-List-Received-Date: Mon, 13 Dec 2010 21:31:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFBhdWwg
TWVuemVsDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTMsIDIwMTAgMTI6NDQgUE0NCj4gVG86
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbb2VdIFtQQVRDSCA0LzRdIHRpLXBydS1zdy1leGFtcGxlczogZml4IHBhY2thZ2UgcnVuLXRp
bWUNCj4gZGVwZW5kZW5jaWVzDQo+IA0KPiBBbSBNb250YWcsIGRlbiAxMy4xMi4yMDEwLCAwNzoy
MCAtMDYwMCBzY2hyaWViIE1lbGlzc2EgV2F0a2luczoNCj4gPiAqIFRoaXMgcGFja2FnZSBkZXBl
bmRzIG9uIHRoZSB0aS1wcnUtc3ctZWRtYS1kcml2ZXIgYW5kDQo+ID4gICBrZXJuZWwtbW9kdWxl
LXVpby1wcnUgbW9kdWxlcyBhdCBydW4tdGltLiAgQWRkZWQgdGhlc2UgcGFja2FnZXMNCj4gDQo+
IHRpbSplKg0KPiANCj4gPiAgIHRvIHRoZSBSREVQRU5EUy4NCj4gPiAqIEJ1bXAgUFINCj4gPiAq
IFVwZGF0ZSBTUkNfUkVWDQo+IA0KPiBTUkNSRVYNCj4gDQo+ID4gKiBVcGRhdGUgQ09NUEFUSUJM
RV9NQUNISU5FDQo+IA0KPiBJbiBhbGwgeW91ciBmb3VyIHBhdGNoZXMgeW91IHVwZGF0ZSBgU1JD
UkVWYCBhbmQgYENPTVBBVElCTEVfTUFDSElORWAuDQo+IENvdWxkIHlvdSBwbGVhc2UgZmFjdG9y
IHRoYXQgb3V0IGludG8gc2VwYXJhdGUgcGF0Y2hlcy4gKEF0IGxlYXN0IG5leHQNCj4gdGltZS4p
DQo+IA0KPiBJIGRvIG5vdCBrbm93IGFueXRoaW5nIGFib3V0IHRoaXMgcHJvZ3JhbSwgYnV0IHdo
eSBpcw0KPiBgQ09NUEFUSUJMRV9NQUNISU5FYCBjaGFuZ2VkPyBXYXMgaXQgaW5jb3JyZWN0bHkg
c2V0IGZyb20gdGhlIGJlZ2lubmluZw0KPiBvciBkaWQgc29tZXRoaW5nIGNoYW5nZSB1cHN0cmVh
bS4NCg0KQ09NUEFUSUJMRV9NQUNISU5FIHdhcyBiZWluZyBkZWZpbmVkIGZvciBvbWFwbDEzOCAo
dGhlIFNPQ19GQU1JTFkpIGFuZCBhbTE4MHgtZXZtICh3aGljaCBpcyBhIG1lbWJlciBvZiB0aGF0
IFNPQ19GQU1JTFkpLiAgVGhlcmVmb3JlIHRoZSB1c2Ugb2YgYW0xODB4LWV2bSB3YXMgcmVkdW5k
YW50Lg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbGlzc2EgV2F0a2lucyA8bS13YXRraW5z
QHRpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFzZSBNYXVwaW4gPENoYXNlLk1hdXBpbkB0
aS5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiAgcmVjaXBlcy90aS90aS1wcnUtc3ctZXhhbXBsZXNf
MS4wMC4wMC5iYiB8ICAgIDkgKysrKystLS0tDQo+ID4gIDEgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ICBtb2RlIGNoYW5nZSAxMDA3NTUgPT4gMTAw
NjQ0IHJlY2lwZXMvdGkvdGktcHJ1LXN3LWV4YW1wbGVzXzEuMDAuMDAuYmINCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9yZWNpcGVzL3RpL3RpLXBydS1zdy1leGFtcGxlc18xLjAwLjAwLmJiIGIvcmVj
aXBlcy90aS90aS0NCj4gcHJ1LXN3LWV4YW1wbGVzXzEuMDAuMDAuYmINCj4gPiBvbGQgbW9kZSAx
MDA3NTUNCj4gPiBuZXcgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCBhOTIzOWY4Li4wMmMzMzc2DQo+
ID4gLS0tIGEvcmVjaXBlcy90aS90aS1wcnUtc3ctZXhhbXBsZXNfMS4wMC4wMC5iYg0KPiA+ICsr
KyBiL3JlY2lwZXMvdGkvdGktcHJ1LXN3LWV4YW1wbGVzXzEuMDAuMDAuYmINCj4gPiBAQCAtMSwx
NCArMSwxNSBAQA0KPiA+ICBERVNDUklQVElPTiA9ICJQUlUgc3cgZXhhbXBsZSBhcHBsaWNhdGlv
bnMiDQo+ID4gIEhPTUVQQUdFID0gImh0dHBzOi8vZ2ZvcmdlLnRpLmNvbS9nZi9wcm9qZWN0L3By
dV9zdy8iDQo+ID4gIExJQ0VOU0UgPSAiQlNEIg0KPiA+IC1ERVBFTkRTID0gInRpLXBydS1zdy1h
cHAtbG9hZGVyIHRpLXBydS1zdy1lZG1hLWxpYnJhcnkiDQo+ID4gLVBSID0gInIwK3N2bnIke1NS
Q1BWfSINCj4gPiArREVQRU5EUyArPSAidGktcHJ1LXN3LWFwcC1sb2FkZXIgdGktcHJ1LXN3LWVk
bWEtbGlicmFyeSINCj4gPiArUkRFUEVORFMgKz0gInRpLXBydS1zdy1lZG1hLWRyaXZlciBrZXJu
ZWwtbW9kdWxlLXVpby1wcnUiDQo+ID4gK1BSID0gInIxK3N2bnIke1NSQ1BWfSINCj4gPg0KPiA+
IC1DT01QQVRJQkxFX01BQ0hJTkUgPSAib21hcGwxMzh8YW0xODB4LWV2bSINCj4gPiArQ09NUEFU
SUJMRV9NQUNISU5FID0gIm9tYXBsMTM4Ig0KPiA+DQo+ID4gIFNSQ19VUkkgPQ0KPiAic3ZuOi8v
Z2ZvcmdlLnRpLmNvbS9zdm4vcHJ1X3N3Lzttb2R1bGU9dHJ1bms7cHJvdG89aHR0cHM7dXNlcj1h
bm9ueW1vdXM7cA0KPiBzd2Q9JyciDQo+ID4NCj4gPiAtU1JDUkVWID0gIjE4Ig0KPiA+ICtTUkNS
RVYgPSAiMjAiDQo+ID4gIFMgPSAiJHtXT1JLRElSfS90cnVuayINCj4gPg0KPiA+ICBkb19jb21w
aWxlICgpIHsNCj4gDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBQYXVsDQo=


