Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE71C7C049
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:43:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A7gwRV002993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 23:43:09 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.249]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0415.000;
	Wed, 9 Jan 2019 23:42:48 -0800
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH V2] pmdk: fix install error
Thread-Index: AQHUqKcTDdK+CMtDJkyOgTzIs6MepaWolQCA//+IJPA=
Date: Thu, 10 Jan 2019 07:42:47 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D129EDEF0@ALA-MBD.corp.ad.wrs.com>
References: <20190110053633.40604-1-yongxin.liu@windriver.com>
	<CALbNGRQoS517_VZR081ZYTJOj=hzxJeMuNw2tBo0WqOBcUbTgg@mail.gmail.com>
In-Reply-To: <CALbNGRQoS517_VZR081ZYTJOj=hzxJeMuNw2tBo0WqOBcUbTgg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] pmdk: fix install error
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
X-List-Received-Date: Thu, 10 Jan 2019 07:43:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZWFzIE3DvGxsZXIgW21h
aWx0bzpzY2huaXR6ZWx0b255QGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIEphbnVhcnkg
MTAsIDIwMTkgMTQ6NDYNCj4gVG86IExpdSwgWW9uZ3hpbg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2
ZWwNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIFYyXSBwbWRrOiBmaXggaW5z
dGFsbCBlcnJvcg0KPiANCj4gT24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgNjo0MCBBTSBZb25neGlu
IExpdSA8eW9uZ3hpbi5saXVAd2luZHJpdmVyLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBJbnN0
YWxsIGZpbGVzIHRvIC91c3IgaW5zdGVhZCBvZiAvdXNyL2xvY2FsIGJ5IHJlcGxhY2luZw0KPiA+
IFBSRUZJWD0ke3ByZWZpeH0gd2l0aCBwcmVmaXg9JHtwcmVmaXh9Lg0KPiA+IFJlbW92ZSB1bm5l
Y2Vzc2FyeSBmaWxlcyB3aGljaCBhcmUgb25seSBmb3IgZGVidWdnaW5nLg0KPiA+IFNldCBGSUxF
UyB0byBwYWNrYWdlIC91c3IvZXRjL2Jhc2hfY29tcGxldGlvbi5kL3BtZW1wb29sLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3hpbiBMaXUgPHlvbmd4aW4ubGl1QHdpbmRyaXZlci5jb20+
DQo+ID4gLS0tDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGtfMS40LjIu
YmIgfCAyMCArKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtZXh0ZW5kZWQvcG1kay9wbWRrXzEuNC4yLmJiIGIvbWV0YS0NCj4gb2UvcmVjaXBl
cy1leHRlbmRlZC9wbWRrL3BtZGtfMS40LjIuYmINCj4gPiBpbmRleCAzZGEyMmE5NzAuLjhjM2Vh
ZDJlZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcG1kay9wbWRr
XzEuNC4yLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1ka18x
LjQuMi5iYg0KPiA+IEBAIC0zNCwyNSArMzQsMTMgQEAgRVhUUkFfT0VNQUtFID0gIkhPU1RfU1lT
PScke0hPU1RfU1lTfScNCj4gRVhUUkFfQ0ZMQUdTPScke1NFTEVDVEVEX09QVElNSVpBVElPTn0n
Ig0KPiA+ICAjIEZpeCB0aGUgbWlzc2luZyBmdHMgbGlicyB3aGVuIHVzaW5nIG11c2wNCj4gPiAg
RVhUUkFfT0VNQUtFX2FwcGVuZF9saWJjLW11c2wgPSAiIEVYVFJBX0xJQlM9Jy1sZnRzJyINCj4g
Pg0KPiA+IC1kb19pbnN0YWxsKCkgew0KPiA+IC0gICAgICAgb2VfcnVubWFrZSBQUkVGSVg9JHtw
cmVmaXh9IERFU1RESVI9JHtEfSBpbnN0YWxsDQo+ID4gLQ0KPiA+IC0gICAgICAgIyBDb3B5IHRo
ZXNlIGludG8gdGhlIHN0YW5kYXJkIGRpcmVjdG9yaWVzDQo+ID4gLSAgICAgICBpbnN0YWxsIC1k
ICR7RH0ke2JpbmRpcn0vDQo+ID4gLSAgICAgICBtdiAke0R9L3Vzci9sb2NhbC9iaW4vcG1lbXBv
b2wgJHtEfSR7YmluZGlyfS8NCj4gPiAtICAgICAgIG12ICR7RH0vdXNyL2xvY2FsL2Jpbi9kYXhp
byAke0R9JHtiaW5kaXJ9Lw0KPiA+IC0NCj4gPiAtICAgICAgIGluc3RhbGwgLWQgJHtEfSR7bGli
ZGlyfQ0KPiA+IC0gICAgICAgbXYgJHtEfS91c3IvbG9jYWwvbGliLypzbyogJHtEfSR7bGliZGly
fS8NCj4gPiArRklMRVNfJHtQTn0gPSAiL3Vzci9ldGMiDQo+IF4gVGhpcyBsb29rcyB3cm9uZzog
U2VlbXMgY29uZmlnIHBhdGggaXMgcHJlZml4ZWQgdG9vDQoNCldpdGhvdXQgdGhpcyBJIGdvdCB0
aGUgZm9sbG93aW5nIHdhcm5pbmcuDQoNCiAgICBXQVJOSU5HOiBwbWRrLTEuNC4yLXIwIGRvX3Bh
Y2thZ2U6IFFBIElzc3VlOiBwbWRrOiBGaWxlcy9kaXJlY3RvcmllcyB3ZXJlIGluc3RhbGxlZCBi
dXQgbm90IHNoaXBwZWQgaW4gYW55IHBhY2thZ2U6DQogICAgICAvdXNyL2V0Yw0KICAgICAgL3Vz
ci9ldGMvYmFzaF9jb21wbGV0aW9uLmQNCiAgICAgIC91c3IvZXRjL2Jhc2hfY29tcGxldGlvbi5k
L3BtZW1wb29sDQogICAgUGxlYXNlIHNldCBGSUxFUyBzdWNoIHRoYXQgdGhlc2UgaXRlbXMgYXJl
IHBhY2thZ2VkLiBBbHRlcm5hdGl2ZWx5IGlmIHRoZXkgYXJlIHVubmVlZGVkLCBhdm9pZCBpbnN0
YWxsaW5nIHRoZW0gb3IgZGVsZXRlIHRoZW0gd2l0aGluIGRvX2luc3RhbGwuDQogICAgcG1kazog
MyBpbnN0YWxsZWQgYW5kIG5vdCBzaGlwcGVkIGZpbGVzLiBbaW5zdGFsbGVkLXZzLXNoaXBwZWRd
DQoNCldpdGggaXQsIHRoZSBpc3N1ZSBpcyBnb25lLiBBbmQgdGhvc2UgZmlsZXMgY2FuIGJlIHNo
aXBwZWQgaW4gUlBNIHBhY2thZ2VzLg0KDQogICAgJCBycG0gLXFwbCBwbWRrLTEuNC4yLXIwLnNr
eWxha2VfYXZ4NTEyXzY0LnJwbSANCiAgICAvdXNyDQogICAgL3Vzci9iaW4NCiAgICAvdXNyL2Jp
bi9kYXhpbw0KICAgIC91c3IvYmluL3BtZW1wb29sDQogICAgL3Vzci9ldGMNCiAgICAvdXNyL2V0
Yy9iYXNoX2NvbXBsZXRpb24uZA0KICAgIC91c3IvZXRjL2Jhc2hfY29tcGxldGlvbi5kL3BtZW1w
b29sDQoNCkkgc2VlIHNpbWlsYXIgdXNhZ2UsIHN1Y2ggYXMgIm1ldGEtb3BlbmVtYmVkZGVkL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpby11dGlscy9saW8tdXRpbHNfNC4xLmJiOkZJTEVTXyR7
UE59ICs9ICIke3NiaW5kaXJ9LyogL2V0Yy9pbml0LmQvKiAvZXRjL3RhcmdldC8qIiINCg0KDQpU
aGFua3MsDQpZb25neGluDQoNCj4gPg0KPiA+IC0gICAgICAgaW5zdGFsbCAtZCAke0R9JHtsaWJk
aXJ9L3BrZ2NvbmZpZw0KPiA+IC0gICAgICAgbXYgJHtEfS91c3IvbG9jYWwvbGliL3BrZ2NvbmZp
Zy8qLnBjICR7RH0ke2xpYmRpcn0vcGtnY29uZmlnLw0KPiA+IC0NCj4gPiAtICAgICAgIGluc3Rh
bGwgLWQgJHtEfSR7aW5jbHVkZWRpcn0NCj4gPiAtICAgICAgIG12ICR7RH0vdXNyL2xvY2FsL2lu
Y2x1ZGUvKiAke0R9JHtpbmNsdWRlZGlyfS8NCj4gPiArZG9faW5zdGFsbCgpIHsNCj4gPiArICAg
ICAgIG9lX3J1bm1ha2UgcHJlZml4PSR7cHJlZml4fSBERVNURElSPSR7RH0gaW5zdGFsbA0KPiA+
DQo+ID4gICAgICAgICAjIFJlbW92ZSB1bmVlZGVkIGZpbGVzDQo+ID4gLSAgICAgICBybSAtcmYg
JHtEfS91c3IvbG9jYWwvDQo+ID4gKyAgICAgICBybSAtcmYgJHtEfS91c3IvbGliNjQvcG1ka19k
ZWJ1Zw0KPiA+ICB9DQo+ID4NCj4gPiAgIyBJbmNsdWRlIHRoZXNlIGJ5IGRlZmF1bHQgb3RoZXJ3
aXNlIHRoZSBTREsgaXMgbm90IHZlcnkgdXNlZnVsDQo+ID4gLS0NCj4gPiAyLjE0LjQNCj4gQW5k
cmVhcw0K

