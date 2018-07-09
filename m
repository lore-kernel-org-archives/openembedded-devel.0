Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD8874EBF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 06:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D2CEA18293;
	Mon,  9 Jul 2018 08:58:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qyxevok1YFtW; Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B6E8918055;
	Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3F781A05B;
	Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E5C21A058;
	Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 81CFB2A9E;
	Mon,  9 Jul 2018 08:58:08 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 9 Jul 2018 08:58:08 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 9 Jul 2018 08:58:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
Thread-Index: AQHUFC1en3hrElszPEm0gBTg7h6/DKSAqMOAgAEjJoCAAF6YgIAD42UAgAAbRwCAAEmHgP//4dqAgAAmXAA=
Date: Mon, 9 Jul 2018 06:58:08 +0000
Message-ID: <df1945d103d444ada773567805d1c763@XBOX02.axis.com>
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
	<CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
	<5B42C73E.6070009@windriver.com>
	<CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
	<8f9048e33461462790467523f3b89fdf@XBOX02.axis.com>
	<5B430283.6060202@windriver.com>
In-Reply-To: <5B430283.6060202@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 06:58:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFl1LCBN
aW5nbGkNCj4gU2VudDogZGVuIDkganVsaSAyMDE4IDA4OjM3DQo+IFRvOiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IEtoZW0gUmFqDQo+IDxyYWoua2hl
bUBnbWFpbC5jb20+DQo+IENjOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQ
QVRDSF0gaW96b25lMzogVXBncmFkZSB0byA0ODINCj4gDQo+IE9uIDIwMTjlubQwN+aciDA55pel
IDE0OjM3LCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPj4gW21haWx0bzpvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0Bs
aXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYNCj4gT2YNCj4gPj4gS2hlbSBSYWoNCj4g
Pj4gU2VudDogZGVuIDkganVsaSAyMDE4IDA2OjAyDQo+ID4+IFRvOiBZdSwgTWluZ2xpIDxtaW5n
bGkueXVAd2luZHJpdmVyLmNvbT4NCj4gPj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVsIDxvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPj4gU3ViamVjdDogUmU6IFtv
ZV0gW21ldGEtb2VdW1BBVENIXSBpb3pvbmUzOiBVcGdyYWRlIHRvIDQ4Mg0KPiA+Pg0KPiA+PiBP
biBTdW4sIEp1bCA4LCAyMDE4IGF0IDc6MjkgUE0gWXUsIE1pbmdsaSA8bWluZ2xpLnl1QHdpbmRy
aXZlci5jb20+DQo+ID4+IHdyb3RlOg0KPiA+Pj4gT24gMjAxOOW5tDA35pyIMDbml6UgMjM6MDEs
IEtoZW0gUmFqIHdyb3RlOg0KPiA+Pj4+IE9uIEZyaSwgSnVsIDYsIDIwMTggYXQgMjoyNyBBTSBZ
dSwgTWluZ2xpDQo+IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4NCj4gPj4+IHdyb3RlOg0KPiA+
Pj4+PiBPbiAyMDE45bm0MDfmnIgwNuaXpSAwMDowMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4+Pj4+
PiBPbiBXZWQsIEp1bCA0LCAyMDE4IGF0IDExOjU0IFBNIDxtaW5nbGkueXVAd2luZHJpdmVyLmNv
bT4gd3JvdGU6DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55
dUB3aW5kcml2ZXIuY29tPg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVXBkYXRlIExJQ19GSUxFU19D
SEtTVU0gYXMgdGhlIGZpbGUgaW96b25lLmMNCj4gPj4+Pj4+PiB1c2VkIGZvciBMSUNfRklMRVNf
Q0hLU1VNIHVwZGF0ZWQNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFBsZWFzZSBkZXNj
cmliZSB3aGF0IGhhcyBjaGFuZ2VkIHRoYXQgaXMgY2F1c2luZyB0aGUgY2hlY2tzdW1zDQo+IHRv
DQo+ID4+Pj4+PiBjaGFuZ2UuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBzb3VyY2UgZmlsZSBpb3pv
bmUuYyBjaGFuZ2VkIGhhcyBjYXVzaW5nIHRoZSBjaGVja3N1bSBjaGFuZ2UuDQo+ID4+Pj4+IEkg
aGF2ZSBhbHJlYWR5IG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+Pj4+DQo+
ID4+Pj4gQ29tbWl0IG1lc3NhZ2UgZG9lcyBub3Qgc2F5IHdoYXQgY2hhbmdlZCwgIFdlIGFscmVh
ZHkga25vdw0KPiA+Pj4+IHNvbWV0aGluZyBoYXMgY2hhbmdlZCB0aGF0cyBjYXVzaW5nIHRoZSBj
aGVja3N1bSBjaGFuZ2UgYnV0IGhlcmUNCj4gd2UNCj4gPj4+PiB1c3VhbGx5IGRvY3VtZW50IHdo
YXQgY2hhbmdlZCBzcGVjaWZpY2FsbHksIHB1cnBvc2UgaXMgdG8gbGV0DQo+IHVzZXJzDQo+ID4+
Pj4ga25vdyBvZiBhbnkgY2hhbmdlIGluIGxpY2Vuc2luZyByZXF1aXJlbWVudHMgdGhhdCB0aGV5
IG5lZWQgdG8gYmUNCj4gPj4+PiBhd2FyZSBvZg0KPiA+Pj4NCj4gPj4+IFRoYW5rcyBLaGVtIQ0K
PiA+Pj4NCj4gPj4+IEkgd2lsbCB0cnkgdG8gbGlzdCB0aGUgY2hhbmdlcyBpbiBWMiBidXQgYWN0
dWFsbHkgdGhlIGZpbGUgaW96b25lLmMNCj4gPj4+IHVzZWQgZm9yIGNoZWNrc3VtIGlzIHNvdXJj
ZSBmaWxlLiBJdCBoYXMgc28gbXVjaCBjb2RlIGNoYW5nZXMNCj4gdW5saWtlDQo+ID4+PiBzb21l
IHBhY2thZ2VzIHVzZSBDT1BZUklHSFQgZmlsZSBvciBSRUFETUUubWQgZmlsZSBmb3IgY2hlY2tz
dW0uDQo+ID4+DQo+ID4+IE9rIHRoYXTigJlzIHByb2JhYmx5IG5vdCBpZGVhbCB0aGVuLiBJdCB3
b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCB1c2UNCj4gdGhlDQo+ID4+IG5lZWRlZCBsaW5lcyBmcm9t
IGNoZWNrc3VtDQo+ID4NCj4gPiBQbGVhc2Ugbm90ZSB0aGF0IGl0IGlzIG9ubHkgbGluZSAzNy00
OCBhbmQgMjYwLTI2NiBvZiBpb3pvbmUuYyB0aGF0DQo+IGFyZSB1c2VkDQo+ID4gdG8gY2FsY3Vs
YXRlIHRoZSBjaGVja3N1bXMuIEhvd2V2ZXIsIEkgZ3Vlc3MgdGhhdCB0aGF0IGR1ZSB0byB0aGUN
Cj4gZmFjdCB0aGVyZQ0KPiA+IGlzIHNvdXJjZSBpbiBiZXR3ZWVuIGxpbmUgNDggYW5kIDI2MCwg
c29tZSBsaW5lcyBoYXZlIGJlZW4NCj4gYWRkZWQvcmVtb3ZlZCwgc28NCj4gPiB0aGF0IHRoZSBs
aW5lIG51bWJlcnMgdXNlZCBpbiB0aGUgY2hlY2tzdW0gY2FsY3VsYXRpb24gYXJlIG5vdyBvZmYN
Cj4gKG9yIHRoZXkNCj4gPiB3ZXJlIG9mZiBhbHJlYWR5IGJlZm9yZSkuIExvb2tpbmcgYXQgdGhl
IGN1cnJlbnQgc291cmNlLCBteSBndWVzcyBpcw0KPiB0aGF0DQo+ID4gbGluZXMgMjYwLTI2NiBz
aG91bGQgYmUgY2hhbmdlZCB0byAyNjktMjc1Lg0KPiANCj4gPg0KPiA+IFNvbWVvbmUgc2hvdWxk
IHJlYWxseSBhc2sgdXBzdHJlYW0gdG8gaW5jbHVkZSBhIExJQ0VOU0UgZmlsZS4uLi4NCj4gDQo+
IFRoYW5rcyBQZXRlciENCj4gDQo+IEl0J3MgYmV0dGVyIHRvIGluY2x1ZGUgYSBMSUNFTlNFIGZp
bGUuDQo+IA0KPiBCdXQgbm93LCBob3cgYWJvdXQganVzdCB1c2UgMzctNDggbGluZXMgdG8gY2Fs
Y3VsYXRlIHRoZSBjaGVja3N1bT8NCj4gDQo+IEhpIEtoZW0sDQo+IFdoYXQncyB5b3VyIG9waW5p
b24/DQo+IA0KPiBUaGFua3MsDQoNClRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGxpY2Vuc2UgaW5m
b3JtYXRpb24gaXMgcmVhbGx5IGF0IGxpbmVzIDI2OS0yNzUuIA0KQW5kIGF0IGxpbmVzIDM3LTQ4
LiBXaGljaCBpcyBhIG1lc3MuLi4NCg0KPiA+Pj4gVGhhbmtzLA0KPiA+Pj4NCj4gPj4+Pg0KPiA+
Pj4+Pg0KPiA+Pj4+PiBUaGFua3MsDQo+ID4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+DQo+ID4+Pj4+Pj4g
LS0tDQo+ID4+Pj4+Pj4gICAgIC4uLi9pb3pvbmUzL3tpb3pvbmUzXzQ2NS5iYiA9PiBpb3pvbmUz
XzQ4Mi5iYn0NCj4gfCA2ICsrKy0tLQ0KPiA+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pj4+Pj4+ICAgICByZW5hbWUgbWV0YS1v
ZS9yZWNpcGVzLWJlbmNobWFyay9pb3pvbmUzL3tpb3pvbmUzXzQ2NS5iYiA9Pg0KPiBpb3pvbmUz
XzQ4Mi5iYn0gKDk1JSkNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IGRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180NjUuYmINCj4gYi9tZXRhLW9lL3Jl
Y2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPj4+Pj4+PiBzaW1pbGFy
aXR5IGluZGV4IDk1JQ0KPiA+Pj4+Pj4+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1iZW5j
aG1hcmsvaW96b25lMy9pb3pvbmUzXzQ2NS5iYg0KPiA+Pj4+Pj4+IHJlbmFtZSB0byBtZXRhLW9l
L3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPj4+Pj4+PiBpbmRl
eCAxOTFiOTM0MjUuLjA5MzA2ZTA0NCAxMDA2NDQNCj4gPj4+Pj4+PiAtLS0gYS9tZXRhLW9lL3Jl
Y2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180NjUuYmINCj4gPj4+Pj4+PiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPj4+Pj4+
PiBAQCAtNCwxNCArNCwxNCBAQCBBVVRIT1IgPSAiRG9uIENhcHBzIDxkb24uY2FwcHMyQHZlcml6
b24ubmV0PiwNCj4gV2lsbGlhbSBELiBOb3Jjb3R0IDx3bm9yY290dEB1cy5vcg0KPiA+Pj4+Pj4+
ICAgU0VDVElPTiA9ICJjb25zb2xlL3Rlc3RzIg0KPiA+Pj4+Pj4+ICAgTElDRU5TRSA9ICJpb3pv
bmUzIg0KPiA+Pj4+Pj4+ICAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vaW96b25lLmM7
YmVnaW5saW5lPTM3O2VuZGxpbmU9NDg7bWQ1PTczMzEyNjAwOTE4NjhkY2FkMGY5ZWRlYTczDQo+
IDViNWY0YiBcDQo+ID4+Pj4+Pj4gLQ0KPiBmaWxlOi8vaW96b25lLmM7YmVnaW5saW5lPTI2MDtl
bmRsaW5lPTI2NjttZDU9NzdmOWVlNTFlNDViNTdhN2U3NTE5YzRmYQ0KPiAwYjRmMDBiIFwNCj4g
Pj4+Pj4+PiArDQo+IGZpbGU6Ly9pb3pvbmUuYztiZWdpbmxpbmU9MjYwO2VuZGxpbmU9MjY2O21k
NT0wYWE0ODhmZDEzOWVhYzA3OGJlNmVjYTg2DQo+IGUxNDM1ZTggXA0KPiA+Pj4+Pj4+ICAgIg0K
PiA+Pj4+Pj4+ICAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lmlvem9uZS5vcmcvc3JjL2N1cnJlbnQv
JHtCUE59XyR7UFZ9LnRhcg0KPiBcDQo+ID4+Pj4+Pj4gICAgICAgZmlsZTovL3BhcmFsbGVsaXNt
LnBhdGNoIFwNCj4gPj4+Pj4+PiAgICAgICBmaWxlOi8vY29weXJpZ2h0LnR4dCBcDQo+ID4+Pj4+
Pj4gICAiDQo+ID4+Pj4+Pj4gLVNSQ19VUklbbWQ1c3VtXSA9ICJjOTI0ZTVlNDZmYjFjZjgxNDVm
NDIwZThlNTdlYjk1NCINCj4gPj4+Pj4+PiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjJlM2Q3
MjkxNmU3ZDczNDBhN2M1MDVmYzBjM2QyODU1M2ZjYzVmZjJkYWY0MWQ4MTEzNjhlNTViZDRlNmEy
OTMiDQo+ID4+Pj4+Pj4gK1NSQ19VUklbbWQ1c3VtXSA9ICIzMWNhMWQzZDI4YmMzNzVjMjBhMjgw
ODIxN2NmMjEyYyINCj4gPj4+Pj4+PiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjI3MzNmZWI2
M2M5NmY3NzE3N2M2OGYzZDkzOGYyMjk0ZDUzOTRkODU1NGIyNzY3YzQ1Y2JlMTM4YjJmM2FlMzAi
DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiAgIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImlvem9uZTNf
KD9QPHB2ZXI+XGQrKS50YXIiDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiAtLQ0KPiA+Pj4+Pj4+IDIu
MTcuMQ0KPiA+DQo+ID4gLy9QZXRlcg0KDQovL1BldGVyDQoNCg==

