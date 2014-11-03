Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0108.outbound.protection.outlook.com [65.55.169.108])
	by mail.openembedded.org (Postfix) with ESMTP id F2B7265C87
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 18:40:42 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 18:40:40 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 18:40:40 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [oe] php: museum.php.net is broken - change recipe SRC_URI?
Thread-Index: Ac/3Z5ppbk7ICAEwTw+FbzLtrZYhaAAFbV0AAAA0flAABJPwgAAA44oA
Date: Mon, 3 Nov 2014 18:40:40 +0000
Message-ID: <10fd3d410b8a453f9df7b32114add897@BLUPR05MB037.namprd05.prod.outlook.com>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
	<4253192.vXvCSCqcaf@peggleto-mobl5.ger.corp.intel.com>
	<39739be97a8540f388f124d4b3167ec2@BLUPR05MB037.namprd05.prod.outlook.com>
	<5457C365.7020406@pr.hu>
In-Reply-To: <5457C365.7020406@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01410F420086AE0141108F
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB037;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(13464003)(51704005)(377454003)(377424004)(189002)(97736003)(93886004)(87936001)(2656002)(46102003)(40100003)(122556002)(108616004)(77096003)(62966003)(105586002)(33646002)(4396001)(107046002)(77156002)(76576001)(95666004)(21056001)(99286002)(106356001)(15395725005)(64706001)(99396003)(120916001)(16799955002)(20776003)(66066001)(15202345003)(16601075003)(31966008)(74316001)(92566001)(575784001)(86362001)(19580395003)(19580405001)(15975445006)(76176999)(54356999)(50986999)(101416001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB037;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: php: museum.php.net is broken - change recipe SRC_URI?
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
X-List-Received-Date: Mon, 03 Nov 2014 18:40:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Wm9sdGFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVu
ZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbg0KPiBCZWhh
bGYgT2YgQm9zem9ybWVueWkgWm9sdGFuDQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMDMsIDIw
MTQgMTowMyBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc7IFBhdWwgRWdnbGV0b24NCj4gQ2M6IGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0DQo+IFN1
YmplY3Q6IFJlOiBbb2VdIHBocDogbXVzZXVtLnBocC5uZXQgaXMgYnJva2VuIC0gY2hhbmdlIHJl
Y2lwZSBTUkNfVVJJPw0KPiANCj4gMjAxNC0xMS0wMyAxNzowOCBrZWx0ZXrDqXNzZWwsIEJyeWFu
IEV2ZW5zb24gw61ydGE6DQo+ID4gUGF1bCwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBQYXVsIEVnZ2xldG9uIFttYWlsdG86cGF1bC5lZ2dsZXRvbkBs
aW51eC5pbnRlbC5jb21dDQo+ID4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMDMsIDIwMTQgMTA6
NDYgQU0NCj4gPj4gVG86IEJyeWFuIEV2ZW5zb24NCj4gPj4gQ2M6IE1hcnRpbiBKYW5zYTsga29l
bkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ7IG9wZW5lbWJlZGRlZC0NCj4gPj4gZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW29lXSBwaHA6IG11c2V1bS5waHAu
bmV0IGlzIGJyb2tlbiAtIGNoYW5nZSByZWNpcGUNCj4gU1JDX1VSST8NCj4gPj4NCj4gPj4gSGkg
QnJ5YW4sDQo+ID4+DQo+ID4+IE9uIE1vbmRheSAwMyBOb3ZlbWJlciAyMDE0IDE0OjAzOjQyIEJy
eWFuIEV2ZW5zb24gd3JvdGU6DQo+ID4+PiBUaGUgb2ZmaWNpYWwgUEhQIGFyY2hpdmFsIHZlcnNp
b24gZG93bmxvYWQgc2l0ZSwNCj4gPj4+IGh0dHA6Ly9tdXNldW0ucGhwLm5ldCwgaGFzIGJlZW4g
ZG93biBhdCBsZWFzdCBzaW5jZSB0aGUgYmVnaW5uaW5nIG9mDQo+ID4+PiBPY3RvYmVyLiAgVGhp
cyBpcyBhIHByb2JsZW0gZm9yIGRhaXN5IGFuZCBvbGRlciBicmFuY2hlcyBpZiBhIGJ1aWxkDQo+
ID4+PiBhdHRlbXB0cyB0byBmZXRjaCBQSFAuICBJIGV4cGVjdCB0aGlzIHNpdGUgd2lsbCBiZSBi
YWNrIHVwIGFnYWluDQo+ID4+PiBzb21ldGltZSwgYnV0IGZyb20gcmVhZGluZyB0aGUgY29udmVy
c2F0aW9uIG9uIHRoZSByZWxhdGVkIFBIUCBidWcNCj4gPj4+IHJlcG9ydCAoaHR0cHM6Ly9idWdz
LnBocC5uZXQvYnVnLnBocD9pZD02ODEzMCkgSSBkbyBub3QgYmVsaWV2ZQ0KPiA+Pj4gaHR0cDov
L211c2V1bS5waHAubmV0IGNhbiBiZSB2aWV3ZWQgdG8gYmUgYSByZWxpYWJsZSBhcmNoaXZlIGlu
IHRoZQ0KPiA+Pj4gZnV0dXJlLiAgSSBzZWUgdGhhdCBkaXp6eSBjaGFuZ2VkIHRoZSBTUkNfVVJJ
IHRvIHVzZQ0KPiA+Pj4gaHR0cDovL3d3dy5waHAubmV0L2Rpc3RyaWJ1dGlvbnMgZm9yIHRoZSBt
YWluIGRvd25sb2FkLiAgSSBkaWQgc29tZQ0KPiA+Pj4gdGVzdGluZyBhbmQgaXQgYXBwZWFycyB0
aGF0IFBIUCB2ZXJzaW9ucyB0aGF0IGFyZSBhYm91dCBhIHllYXIgb2xkDQo+ID4+PiBvciBsZXNz
IGFyZSBhdmFpbGFibGUgZnJvbSBodHRwOi8vd3d3LnBocC5uZXQvZGlzdHJpYnV0aW9ucy4gIFNv
IHdlDQo+ID4+PiBjYW4gYXNzdW1lIHRoYXQgYSB5ZWFyIGZyb20gbm93IHRoZSBkaXp6eSBicmFu
Y2ggU1JDX1VSSSB3aWxsIG5lZWQNCj4gPj4+IHRvIGNoYW5nZQ0KPiA+PiB0byBzb21ldGhpbmcg
ZWxzZS4NCj4gPj4+IEknZCBwcm9wb3NlIGNoYW5naW5nIHRoZSBTUkNfVVJJIHRvIHNvbWV0aGlu
ZyB0aGF0IHdpbGwgbm90IGNoYW5nZQ0KPiA+Pj4gb3ZlciB0aW1lLiAgTXkgc3VnZ2VzdGlvbiB3
b3VsZCBiZSB0aGUgUEhQIGRpc3RyaWJ1dGlvbnMgR2l0DQo+ID4+PiByZXBvc2l0b3J5IGxvY2F0
ZWQNCj4gPj4+IGhlcmU6IGh0dHA6Ly9naXQucGhwLm5ldC8/cD13ZWIvcGhwLWRpc3RyaWJ1dGlv
bnMuZ2l0O2E9c3VtbWFyeS4NCj4gPj4+IFRoaXMgaXMgdGhlIHBhdGggc3VnZ2VzdGVkIGluIHRo
ZSByZWxhdGVkIFBIUCBidWcgbWVudGlvbmVkIGVhcmxpZXIuDQo+ID4+PiBUaGUgZGlzYWR2YW50
YWdlIGlzIHRoYXQgdGhlIFNSQ19VUkkgd291bGQgcmVmZXIgdG8gYSBmaWxlIG9uIGENCj4gPj4+
IHNwZWNpZmljIHRhZywgc28gdGhlIFNSQ19VUkkgd291bGQgYmUgc3BlY2lmaWMgZm9yIGVhY2gg
UEhQIHZlcnNpb24uDQo+ID4+Pg0KPiA+Pj4gQW55IGZ1cnRoZXIgc3VnZ2VzdGlvbnMgb24gaG93
IHRvIGhhbmRsZSB0aGlzPyAgSWYgdGhlIFNSQ19VUkkgZG9lcw0KPiA+Pj4gZ2V0IHVwZGF0ZWQs
IGhvdyBtYW55IGJyYW5jaGVzIGJhY2sgc2hvdWxkIHRoZSBjaGFuZ2UgYmUgbWFkZT8NCj4gPj4g
U28gd2UgZG8gaGF2ZSBtaXJyb3JzIHRoYXQgY2FuIGhlbHAgd2l0aCB0aGlzLCB1bmZvcnR1bmF0
ZWx5IHdpdGggdGhlDQo+ID4+IE9FIG1pcnJvciAoYXMgb3Bwb3NlZCB0byB0aGUgWW9jdG8gUHJv
amVjdCBvbmUpLCBpdHMgcG9wdWxhdGlvbiBpcw0KPiA+PiBub3QgYXV0b21hdGljLCBzbyB5b3Ug
aGF2ZSB0byByZXF1ZXN0IHRoYXQgbmV3IGFyY2hpdmVzIGdldCBhZGRlZC4NCj4gPj4gSSdtIG5v
dCBzdXJlIGl0IHdvdWxkIGJlIHByYWN0aWNhbCB0byBjaGFuZ2UgdGhpcyBlaXRoZXIuDQo+ID4+
DQo+ID4+IFdoeSBwaHAgdGhpbmtzIGl0J3MgYSBnb29kIGlkZWEgdG8gZGlzdHJpYnV0ZSB0aGVz
ZSB0YXJiYWxscyBpbiBhDQo+ID4+IHNpbmdsZSBwbGFjZSBpbiBhIGdpdCByZXBvc2l0b3J5IGJ1
dCBub3QgaW4gYSBzaW1wbGUgZmxhdCBIVFRQIGxvY2F0aW9uIGlzIGEgYml0DQo+IGJleW9uZCBt
ZS4NCj4gPj4gRmV0Y2hpbmcgZGlyZWN0bHkgZnJvbSBnaXQgaW4gdGhpcyBzaXR1YXRpb24gd291
bGRuJ3QgYmUgaWRlYWwgYXMNCj4gPj4gaXQnbGwgZW5kIHVwIGVmZmVjdGl2ZWx5IGZldGNoaW5n
IGFsbCBvZiB0aGUgYmluYXJpZXMgZG93biB3aGVuDQo+ID4+IGNsb25pbmcgdGhlIHJlcG87IGhv
d2V2ZXIgSSBndWVzcyB5b3UgY291bGQgZG93bmxvYWQgYSBzaW5nbGUgZmlsZSB3aXRoOg0KPiA+
Pg0KPiA+PiBTUkNfVVJJID0NCj4gPj4gImh0dHA6Ly9naXQucGhwLm5ldC8/cD13ZWIvcGhwLWRp
c3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC0NCj4gPj4gJHtQVn0udGFyLnh6Ig0KPiA+IE5v
dCBleGFjdGx5LiAgSXQgbG9va3MgbGlrZSB0aGUgb2xkIHZlcnNpb25zIHRoYXQgYXJlIG5vIGxv
bmdlciBzdXBwb3J0ZWQgZ2V0DQo+IGRlbGV0ZWQgZnJvbSBwaHAtZGlzdHJpYnV0aW9ucy5naXQs
IHNvIEhFQUQgZG9lc24ndCBoYXZlIGtub3dsZWRnZSBvZiBhbGwNCj4gUEhQIHZlcnNpb25zLiAg
Rm9yIGV4YW1wbGUsIHRoaXMgbGluazogaHR0cDovL2dpdC5waHAubmV0Lz9wPXdlYi9waHAtDQo+
IGRpc3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC01LjQuMjIudGFyLmJ6MiBhcyBvZiB0b2Rh
eSB3aWxsIGRvd25sb2FkIHBocC0NCj4gNS40LjIyLiAgQnV0IHRoaXMgbGluazogaHR0cDovL2dp
dC5waHAubmV0Lz9wPXdlYi9waHAtDQo+IGRpc3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC01
LjQuMjEudGFyLmJ6MiBqdXN0IHJlcG9ydHMgdGhhdCBpdCBjYW5ub3QgZmluZA0KPiB0aGUgZmls
ZS4NCj4gPg0KPiA+IEFzIGZhciBhcyBmZXRjaGluZyBwaHAtNS40LjE0ICh2ZXJzaW9uIHVzZWQg
Zm9yIGRhaXN5IGFuZCBvbGRlcikgSSB0aGluayB0aGlzDQo+IFVSTCB3aWxsIHdvcms6IGh0dHA6
Ly9naXQucGhwLm5ldC8/cD13ZWIvcGhwLQ0KPiBkaXN0cmlidXRpb25zLmdpdDthPWJsb2I7Zj1w
aHAtDQo+IDUuNC4xNC50YXIuYnoyO2g9MGQ5NTBmMTc5ZDU4NmJiMWQwZTg3OWUwZDRhYTNhNTE0
MGU4ZDVmNTtoYj0zZGQyZjEyDQo+IDYwOWZjOGE3MzBkN2NmMzQxYTkzMmY2YzdiMjQxZjAzYy4g
IFVnbHksIGJ1dCBpdCB3b3Jrcy4NCj4gDQo+IFdoYXQncyB3cm9uZyB3aXRoIHRoaXM/DQo+IA0K
PiBTUkNfVVJJID0NCj4gImh0dHA6Ly9waHAubmV0L2dldC9waHAtDQo+ICR7UFZ9LnRhci5iejIv
ZnJvbS90aGlzL21pcnJvcjtkb3dubG9hZGZpbGVuYW1lPXBocC0ke1BWfS50YXIuYnoyIg0KDQpG
aXJzdCwgSSBjYW4ndCBnZXQgdGhpcyBTUkNfVVJJIHRvIHdvcmsgd2l0aCB0aGUgImRvd25sb2Fk
ZmlsZW5hbWUiIGFkZGl0aW9uIHRvIHRoZSBTUkNfVVJJLiAgSSBjYW4gZ2V0IHBocC01LjQuMzMg
ZnJvbSBodHRwOi8vcGhwLm5ldC9nZXQvcGhwLTUuNC4zMy50YXIuYnoyL2Zyb20vdGhpcy9taXJy
b3IuICBIb3dldmVyLCB0aGlzIGxvY2F0aW9uIGhhcyB0aGUgc2FtZSBwcm9ibGVtIGFzIHRoZSBT
UkNfVVJJIG9uIHRoZSBkaXp6eSBicmFuY2g7IFBIUCB2ZXJzaW9ucyB0aGF0IGFyZSBvbGRlciB0
aGFuIGEgeWVhciBhcmUgbm8gbG9uZ2VyIGF2YWlsYWJsZSBvbiB0aGUgcGhwLm5ldCBtaXJyb3Jz
LiAgTm90IGEgcHJvYmxlbSAoeWV0KSBmb3IgZGl6enkgb3IgbWFzdGVyIGJyYW5jaGVzIGFzIHRo
ZXNlIGJyYW5jaGVzIGFyZSB1c2luZyBhIG1vcmUgcmVjZW50IHZlcnNpb24gb2YgUEhQLiAgRm9y
IGRhaXN5IGFuZCBvbGRlciBicmFuY2hlcyB0aGF0IGFyZSB1c2luZyA1LjQuMTQsIHRoaXMgU1JD
X1VSSSBkb2VzIG5vdCB3b3JrLg0KDQpSZWdhcmRzLA0KQnJ5YW4gDQo=

