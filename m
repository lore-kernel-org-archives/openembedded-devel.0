Return-Path: <raphael.freudiger@siemens.com>
X-Greylist: delayed 1429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Mar 2018 07:45:23 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB13782CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 07:45:23 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2F7LVkr032382
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 15 Mar 2018 08:21:31 +0100
Received: from DEFTHW99ERLMSX.ww902.siemens.net
	(defthw99erlmsx.ww902.siemens.net [139.22.70.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w2F7L5dE027793
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 15 Mar 2018 08:21:27 +0100
Received: from DENBGAT9ERCMSX.ww902.siemens.net (139.22.70.82) by
	DEFTHW99ERLMSX.ww902.siemens.net (139.22.70.136) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 15 Mar 2018 08:21:13 +0100
Received: from DENBGAT9EI4MSX.ww902.siemens.net ([169.254.7.159]) by
	DENBGAT9ERCMSX.ww902.siemens.net ([139.22.70.82]) with mapi id
	14.03.0361.001; Thu, 15 Mar 2018 08:21:13 +0100
From: "Freudiger, Raphael" <raphael.freudiger@siemens.com>
To: =?utf-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: [oe] [meta-qt4] Cmake Could NOT find Qt4,	missing:
	QT_MOC_EXECUTABLE
Thread-Index: AQHTsLpVUy/dtP6lBk2H3bLAoPvu2KPQ71bg
Date: Thu, 15 Mar 2018 07:21:11 +0000
Message-ID: <03259859A79F5D4AAE6C5B1111FD3EA60142A1CD@DENBGAT9EI4MSX.ww902.siemens.net>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
	<CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
	<CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
	<CAEhQi8kJsaGWaHSTB9mwWSCJ+wCSGEpDXb3V6SWeCLmT56zCwA@mail.gmail.com>
	<2bb3d54e-cbee-a3f9-6608-9650c7fbe87a@linux.intel.com>
	<CAEhQi8=c9=mHHBGi4AM_KEVeFToOA7JGMGmexUk3BJMPELgMDg@mail.gmail.com>
In-Reply-To: <CAEhQi8=c9=mHHBGi4AM_KEVeFToOA7JGMGmexUk3BJMPELgMDg@mail.gmail.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.39]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt4] Cmake Could NOT find Qt4, missing: QT_MOC_EXECUTABLE
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
X-List-Received-Date: Thu, 15 Mar 2018 07:45:24 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHBhdGhlcyB0aGF0IHFtYWtlIHJldHVybnMgYXJlIGRlZmluZWQgYXQgY29tcGlsZSB0aW1l
IG9mIHF0NC1uYXRpdmUuIEFzIGFsbCByZWNpcGVzIGhhdmUgdGhlaXIgb3duIHN5c3Jvb3Qgbm93
IGl0IGNhbm5vdCBrbm93IHRoZSBjb3JyZWN0IHBhdGggYW55bW9yZS4NCkJ1dCBjbWFrZSBxdWVy
aWVzIHFtYWtlIGZvciB0aGUgYmluYXJ5IHBhdGgsIHdoaWNoIHdpbGwgcmV0dXJuIHRoZSB3cm9u
ZyBwYXRoLg0KRm9yIG1lIGl0IHdvcmtlZCB0byBzZXQgUVRfQklOQVJZX0RJUiBpbiB0aGUgcmVj
aXBlIHVzaW5nIHF0NCBleHBsaWNpdGx5Lg0KQ21ha2Ugd2lsbCB0aGVuIHNlYXJjaCB0aGlzIGRp
cmVjdG9yeSBmb3IgbW9jLCByY2MsIGV0Yy4gaW5zdGVhZCBvZiB0aGUgcGF0aCByZXR1cm5lZCBi
eSBxbWFrZS4NCg0KRVhUUkFfT0VDTUFLRV9hcHBlbmQgPSAiICAtRFFUX0JJTkFSWV9ESVI9JHtS
RUNJUEVfU1lTUk9PVF9OQVRJVkV9L3Vzci9iaW4iDQoNClJlZ2FyZHMNClJhcGhhZWwgRnJldWRp
Z2VyDQoNCj4gT24gMDIvMjgvMjAxOCAwNjozMyBQTSwgTcOlbnMgWmlnaGVyIHdyb3RlOg0KPiAN
Cj4gVGhpcyBpcyBzb21lIGxlZ2FjeSB0aGUgcGxhbmUgaXMgdG8gcmVtb3ZlIGl0IHNob3J0bHku
IFJlZ2FyZGluZyBwYXRjaGVzLCBJIGFtDQo+IHN0aWxsIG5vdCBzdXJlIHdoYXQgdGhlIHByb2Js
ZW0gaXMgc2luY2UgdGhpcyBvY2N1cmVkIHdoZW4gbW92aW5nIHRvIHJvY2tvLiBJZiBhbnkNCj4g
aWRlYXMgdGhhdCBjYW4gcG9pbnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiBJIGNhbiBzdXBw
bHkgcGF0Y2hlcy4NCj4gDQo+IEJyDQo+IE1hbnMgWmlnaGVyDQo+IA0KPiBPbiBGZWIgMjgsIDIw
MTggMTc6MjMsICJBbGV4YW5kZXIgS2FuYXZpbiIgPA0KPiBhbGV4YW5kZXIua2FuYXZpbkBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gPiBPbiAwMi8yMi8yMDE4IDAxOjA0IFBNLCBNw6Vu
cyBaaWdoZXIgd3JvdGU6DQo+ID4NCj4gPj4gVGhpcyBzb2x2ZWQgbXkgcHJvYmxlbSBJIHN0aWxs
IGNvdWxkbid0IGZpZ3VyZSBvdXQgaWYgdGhlIHF0NC1uYXRpdmUNCj4gPj4gaXMgYWN0dWFsbHkg
YnJva2VuIG9yIGlmIHRoaXMgaXMgdGhlIHdheSBpdCBzaG91bGQgd29yayBub3cgdGhhdCBlYWNo
DQo+ID4+IHJlY2lwZSBoYXZlIGl0J3Mgb3duIHN5c3Jvb3QuDQo+ID4+DQo+ID4NCj4gPiBEbyB5
b3UgaGF2ZSBhIFF0NSB0cmFuc2l0aW9uIHBsYW4/IG1ldGEtcXQ0IGlzIG5vdCBtYWludGFpbmVk
IG9yDQo+ID4gdGVzdGVkIHJlZ3VsYXJseSBhbnltb3JlLCBhcyB0aGVyZSBpcyBubyB1cHN0cmVh
bSBzdXBwb3J0LiBJZiBpdA0KPiA+IGJyZWFrcywgcGF0Y2hlcyB3ZWxjb21lLg0KPiA+DQo+ID4g
QWxleA0KPiA+DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

