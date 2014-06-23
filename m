Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id CB6EE65FE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 18:16:24 +0000 (UTC)
Received: from STOEXMBX02.domain01.net ([10.11.10.9]) by
	STOEXHUB02.domain01.net ([10.12.10.2]) with mapi;
	Mon, 23 Jun 2014 20:16:24 +0200
From: Anders Darander <anders@chargestorm.se>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 23 Jun 2014 20:16:19 +0200
Thread-Topic: [oe] [meta-webserver][PATCH 2/2] webmin: split out webmin themes
Thread-Index: Ac+PDz1SjUdDbdqCQLu9DvSRurUHSw==
Message-ID: <3CA8711B0C62CA4E99607A9BA14BD439768AAE73E1@STOEXMBX02.domain01.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded -- Devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 2/2] webmin: split out webmin themes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jun 2014 18:16:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiAyMyBKdW4gMjAxNCAxOTo0MCwgTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwu
Y29tPiB3cm90ZToNCj4gSXQgaXNuJ3QgY2F1c2VkIGJ5IHlvdXIgcGF0Y2gsIGJ1dCBjdXJyZW50
IHdlYm1pbiByZWNpcGUNCj4gaXMgaW5oZXJpdHRpbmcgYWxsYXJjaCBhbmQgdGhlbiBhZGRpbmcg
cnVudGltZSBkZXBlbmRlbmN5DQo+IG9uIFRVTkVfUEtHQVJDSCBwZXJsLCBzbyBpdCdzIGNhdXNp
bmcgd2VibWluIHJlYnVpbGRzIGV2ZXJ5DQo+IHRpbWUgTUFDSElORSBpcyBjaGFuZ2VkICh0byBN
QUNISU5FIHdpdGggZGlmZmVyZW50IFRVTkVfUEtHQVJDSCkNCg0KSSBndWVzcyB0aGF0IHRoZSBv
bmx5IHdvcmtpbmcgc29sdXRpb24gd2UgaGF2ZSB0b2RheSBpcyB0byByZW1vdmUgYWxsYXJjaCwg
Y29ycmVjdD8NCg0KSWYgc28sIHN1cmUgSSBjYW4gc3BpbiBhIHBhdGNoIGFuZCBzZW5kIGl0IHRv
bW9ycm93Lg0KDQpUaG91Z2gsIEkgZ3Vlc3MgdGhhdCB3ZSBzb29uZXIgb3IgbGF0ZXIgaGF2ZSB0
byBjb21lIHVwIHdpdGggYSB3YXkgdG8gbGV0IGFsbGFyY2ggcGFja2FnZXMgc2FmZWx5IGRlcGVu
ZCAvIHJlY29tbWVuZCBUVU5FX1BLR0FSQ0ggcGFja2FnZXMuDQoNCj4gRVJST1I6IHdlYm1pbiBk
aWZmZXJlbnQgc2lnbmF0dXJlIGZvciB0YXNrIGRvX3BhY2thZ2Vfd3JpdGVfaXBrLnNpZ2RhdGEg
YmV0d2VlbiBxZW11eDg2Y29weSBhbmQgcWVtdWFybQ0KPiBIYXNoIGZvciBkZXBlbmRlbnQgdGFz
ayB3ZWJtaW5fMS42MjAuYmIuZG9fcGFja2FnZSBjaGFuZ2VkIGZyb20gMWE0ZWUwNzUzZWZmOWE4
ZTM5MmU4NTFiNmJiZTI1MmQgdG8gMzY1NzhkOTBkNTg2NjI0OGRhNmFmYWE1MGZkNTg2YTENCj4g
SGFzaCBmb3IgZGVwZW5kZW50IHRhc2sgcGVybF81LjE0LjMuYmIuZG9fcGFja2FnZWRhdGEgY2hh
bmdlZCBmcm9tIGM3Zjk1MjgxMmYxODljNjA4ZTE0ZTA4NjI4MDdhZTI3IHRvIDI0YjlmZjFkZTRm
MDQ2MzMzZDI5MmFhOTc2NzNhOGQyDQo+IEhhc2ggZm9yIGRlcGVuZGVudCB0YXNrIHdlYm1pbl8x
LjYyMC5iYi5kb19wYWNrYWdlZGF0YSBjaGFuZ2VkIGZyb20gYmQxYjE3Yzk1N2Q0MDkxYTBmNmQz
ZmY2YTlhY2IwZmUgdG8gYjU4NGU1YTZhOTBlZWIzMjAwNDZjNDU3YjAzYTYwN2YNCj4NCj4gUGxl
YXNlIGZpeCBpdCBpZiB5b3UgY2FyZSBhYm91dCB3ZWJtaW4uDQoNCk5vdCB0aGF0IEkgcmVhbGx5
IGNhdHMgdGhhdCBtdWNoIGFib3V0IHdlYm1pbi4gSXQncyByYXRoZXIgdGhhdCB3ZSd2ZSBoYWQg
dGhlIG5lZWQgdG8gcXVpY2tseSBjb21lIHVwIHdpdGggYSBjb25maWd1cmF0aW9uIGludGVyZmFj
ZSBmb3IgYSBwcm9kdWN0IGluIGEgY2VydGFpbiBwcm9qZWN0LiBBbmQgd2VibWluIHNlZW1lZCBs
aWtlIGEgcHJldHR5IGVhc3kgYW5kIHF1aWNrIHNvbHV0aW9uLiBTbyBvYnZpb3VzbHkgSSB3YW50
ZWQgdG8gcmVtb3ZlIHRoZSBzaXplIG9mIHRoZSBwYWNrYWdlLi4uDQoNCkJ1dCBsaWtlIEkgc2Fp
ZCBhYm92ZSwgb2YgdGhlIGN1cnJlbnRseSBiZXN0IHNvbHV0aW9uIGlzIHRvIHJlbW92ZSBhbGxh
cmNoLCBJJ2xsIHNwaW4gYSBwYXRjaCBmb3Igb3VyIHRvbW9ycm93Lg0KDQpDaGVlcnMsDQpBbmRl
cnMNCg0KLS0NCkNoYXJnZVN0b3JtIEFCIC8gZVN0b3JtDQo=

