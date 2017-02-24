Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 206CF774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:33:40 +0000 (UTC)
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
	by relay1.mentorg.com with esmtp 
	id 1chOQn-0004f8-R6 from Joe_MacDonald@mentor.com ;
	Fri, 24 Feb 2017 14:33:41 -0800
Received: from svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) by
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Fri, 24 Feb 2017 14:33:38 -0800
Received: from svr-orw-mbx-04.mgc.mentorg.com ([fe80::4967:8f7f:4a15:68a4]) by
	SVR-ORW-MBX-04.mgc.mentorg.com ([fe80::4967:8f7f:4a15:68a4%22]) with
	mapi id 15.00.1210.000; Fri, 24 Feb 2017 14:33:38 -0800
From: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH v2] Samba: use built-in libtevent
Thread-Index: AQHSju4K15wNtcOph0y/7r8JxquUkw==
Date: Fri, 24 Feb 2017 22:33:38 +0000
Message-ID: <f9cd7853-8802-4b7d-a16c-01d35461b7e5@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 22:33:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVhaC4gIElmIHlvdSdyZSBuZWFyIGEga2V5Ym9hcmQsIHBsZWFzZSBnbyBhaGVhZCBhbmQgcmV2
ZXJ0IG90aGVyd2lzZSBJJ2xsIGdldCB0byBpbiBsYXRlciBvbiB0b25pZ2h0Lg0KDQpPbiBGZWIg
MjQsIDIwMTcgNTowMSBQTSwgTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPiB3
cm90ZToNCkpvZT8NCg0KT24gRnJpLCBGZWIgMjQsIDIwMTcgYXQgMTA6MzcgUE0sIEFuZHJlYXMg
TcO8bGxlciA8c2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbTxtYWlsdG86c2Nobml0emVsdG9u
eUBnb29nbGVtYWlsLmNvbT4+IHdyb3RlOg0KT24gTW9uLCBGZWIgMjAsIDIwMTcgYXQgNTowOCBQ
TSwgU3pvbWJhdGhlbHlpIEd5w7ZyZ3kgPGd5dXJjb0BmcmVlbWFpbC5odTxtYWlsdG86Z3l1cmNv
QGZyZWVtYWlsLmh1Pj4gd3JvdGU6DQo+IEhpLA0KPg0KPiBJZiB0aGVyZSYjMzk7cyBubyBzb2x1
dGlvbiB0byByZXNvbHZlIHRoZSBjb25mbGljdCBiZXR3ZWVuIHRoZSBpbnRlcm5hbCB0ZXZlbnQg
YW5kIHRoZSBleHRlcm5hbCBvbmUsIHRoZW4gbWF5YmUgcHV0dGluZyB0aGUgbGlidGV2ZW50LWlu
dGVybmFsLmggZnJvbSB0aGUgZXh0ZXJuYWwgbGliIHRvIHRoZSBzYW1iYSB0cmVlIHdvdWxkIGJl
IGEgd2F5IHRvIGdvLg0KPg0KPiBCciwNCj4gR3nDtnJneQ0KPiAtLS0tLS0tLSBFcmVkZXRpIGxl
dsOpbCAtLS0tLS0tLQ0KPiBGZWxhZMOzOiBBbmRyZWFzIE3DvGxsZXIgJmx0O3NjaG5pdHplbHRv
bnkmIzY0O2dvb2dsZW1haWwuY29tPGh0dHA6Ly9nb29nbGVtYWlsLmNvbT4mZ3Q7DQo+IETDoXR1
bTogMjAxNyBmZWJydcOhciAyMCAxMjo1MjoxOA0KPiBUw6FyZ3k6IFJlOiBbb2VdIFttZXRhLW5l
dHdvcmtpbmddW1BBVENIIHYyXSBTYW1iYTogdXNlIGJ1aWx0LWluIGxpYnRldmVudA0KPiBDw61t
emV0dDogb3BlbmVtYmVkZGVkLWRldmVsJiM2NDtsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnPiAmbHQ7b3BlbmVtYmVkZGVkLWRldmVsJiM2NDtsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnPiZndDsNCj4N
Cj4gJmd0OyBJbiBsYXN0IGJ1aWxkIEkmIzM5O3ZlIG5vdGljZWQgb25seSB0aGlzIG5ldyBpc3N1
ZSByZWxhdGVkIHRvIHNhbWJhOg0KPiAmZ3Q7DQo+ICZndDsgY3RkYi0yLjUuNjogY3RkYiByZGVw
ZW5kcyBvbiBzYW1iYSwgYnV0IGl0IGlzbiYjMzk7dCBhIGJ1aWxkIGRlcGVuZGVuY3ksIG1pc3Np
bmcgc2FtYmEgaW4gREVQRU5EUyBvciBQQUNLQUdFQ09ORklHPyBbYnVpbGQtZGVwc10NCj4gJmd0
Ow0KPiAmZ3Q7IE1heWJlIHRoaXMgZGVwZW5kZW5jeSB3YXMgY3JlYXRlZCBmcm9tIHNhbWJhIGJl
aW5nIGxpYmxkYiBwcm92aWRlciBpbg0KPiAmZ3Q7IHRoaXMgYnVpbGQuDQo+ICZndDsNCj4gJmd0
OyBndmZzIGFuZCB3aG9sZSBtZXRhLWdub21lIGxheWVycyBpcyBzdGlsbCBpbmNsdWRlZCBpbiBt
eSB3b3JsZCwgbWF5YmUgaXQNCj4gJmd0OyBkaWRuJiMzOTt0IGZhaWwgYmVjYXVzZSBzb21lIGd2
ZnMgZGVwZW5kZW5jeSB3YXMgYWxyZWFkeSBmYWlsaW5nIG9yIG9uZSBvZg0KPiAmZ3Q7IHNhbWJh
IHJlbGF0ZWQgY2hhbmdlcyBpbiBtYXN0ZXItbmV4dCBpcyBmaXhpbmcgdGhpcyBvbmUuDQo+ICZn
dDsNCj4gU29tZSBiYWNrZ3JvdW5kOiBEdXJpbmcgbGFzdCB3ZWVrZW5kIEkgcHJlcGFyZWQgYSBz
ZXJpZXMgYmFzZWQgb24NCj4gbWFzdGVyLW5leHQgdW5ibGFja2xpc3RpbmcuIEZpcnN0IHRhcmdl
dCBpcyB0byBidWlsZCBhIHhmY2UtaW1hZ2UNCj4gYWdhaW4gWzFdLiBMYXN0IHN0ZXAgeWVzdGVy
ZGF5IGV2ZW5pbmcgc2hvdWxkIGJlIHJlYmFzaW5nIGFnYWluc3QNCj4gbGF0ZXN0IG1hc3Rlci1u
ZXh0IGFuZCBydW4gYSB0ZXN0IGJ1aWxkLiBUaGF0IGZhaWxlZCBmb3IgZ3ZmcyAtIHNvIEkNCj4g
c3RvcHBlZCBzZW5kaW5nIHN0dWZmLiBOb3cgSSBrbm93IHdoeSBndmZzIGZhaWxzLi4uDQo+DQo+
IEhvdyBkbyB3ZSBwcm9jZWVkIHdpdGggdGhpcyBwYXRjaD8NCj4NCj4gWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9zY2huaXR6ZWx0b255L21ldGEtb3BlbmVtYmVkZGVkL3RyZWUvd29yay0yMDE3LTAy
DQo+DQpKdXN0IG5vdGljZXMgdGhhdCB0aGlzIHBhdGNoIG1hZGUgaXQgaW50byBtYXN0ZXIgYnJl
YWtpbmcgYXQgbGVhc3QgZ3Zmcy4gUmV2ZXJ0Pw0KDQpBbmRyZWFzDQotLQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1kZXZlbCBt
YWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1h
aWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCmh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVs
DQoNCg0K

