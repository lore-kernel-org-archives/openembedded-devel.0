Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0114.outbound.protection.outlook.com [157.56.110.114])
	by mail.openembedded.org (Postfix) with ESMTP id AAC5F60E49
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 16:08:39 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB040.namprd05.prod.outlook.com (10.255.210.156) with Microsoft
	SMTP Server (TLS) id 15.1.6.9; Mon, 3 Nov 2014 16:08:37 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 16:08:37 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] php: museum.php.net is broken - change recipe SRC_URI?
Thread-Index: Ac/3Z5ppbk7ICAEwTw+FbzLtrZYhaAAFbV0AAAA0flA=
Date: Mon, 3 Nov 2014 16:08:37 +0000
Message-ID: <39739be97a8540f388f124d4b3167ec2@BLUPR05MB037.namprd05.prod.outlook.com>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
	<4253192.vXvCSCqcaf@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <4253192.vXvCSCqcaf@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00B5DA990086AA00B5DBE6
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB040;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(377454003)(199003)(24454002)(13464003)(51704005)(15202345003)(87936001)(16799955002)(2656002)(4396001)(101416001)(74316001)(76176999)(77156002)(77096003)(50986999)(54356999)(21056001)(108616004)(76576001)(15975445006)(110136001)(106356001)(575784001)(86362001)(20776003)(64706001)(31966008)(122556002)(33646002)(92566001)(46102003)(99396003)(120916001)(105586002)(19580405001)(16601075003)(19580395003)(66066001)(107046002)(40100003)(95666004)(97736003)(62966003)(99286002)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB040;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Nov 2014 16:08:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGF1bCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIEVnZ2xl
dG9uIFttYWlsdG86cGF1bC5lZ2dsZXRvbkBsaW51eC5pbnRlbC5jb21dDQo+IFNlbnQ6IE1vbmRh
eSwgTm92ZW1iZXIgMDMsIDIwMTQgMTA6NDYgQU0NCj4gVG86IEJyeWFuIEV2ZW5zb24NCj4gQ2M6
IE1hcnRpbiBKYW5zYTsga29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ7IG9wZW5lbWJlZGRlZC0N
Cj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBwaHA6
IG11c2V1bS5waHAubmV0IGlzIGJyb2tlbiAtIGNoYW5nZSByZWNpcGUgU1JDX1VSST8NCj4gDQo+
IEhpIEJyeWFuLA0KPiANCj4gT24gTW9uZGF5IDAzIE5vdmVtYmVyIDIwMTQgMTQ6MDM6NDIgQnJ5
YW4gRXZlbnNvbiB3cm90ZToNCj4gPiBUaGUgb2ZmaWNpYWwgUEhQIGFyY2hpdmFsIHZlcnNpb24g
ZG93bmxvYWQgc2l0ZSwNCj4gPiBodHRwOi8vbXVzZXVtLnBocC5uZXQsIGhhcyBiZWVuIGRvd24g
YXQgbGVhc3Qgc2luY2UgdGhlIGJlZ2lubmluZyBvZg0KPiA+IE9jdG9iZXIuICBUaGlzIGlzIGEg
cHJvYmxlbSBmb3IgZGFpc3kgYW5kIG9sZGVyIGJyYW5jaGVzIGlmIGEgYnVpbGQNCj4gPiBhdHRl
bXB0cyB0byBmZXRjaCBQSFAuICBJIGV4cGVjdCB0aGlzIHNpdGUgd2lsbCBiZSBiYWNrIHVwIGFn
YWluDQo+ID4gc29tZXRpbWUsIGJ1dCBmcm9tIHJlYWRpbmcgdGhlIGNvbnZlcnNhdGlvbiBvbiB0
aGUgcmVsYXRlZCBQSFAgYnVnDQo+ID4gcmVwb3J0IChodHRwczovL2J1Z3MucGhwLm5ldC9idWcu
cGhwP2lkPTY4MTMwKSBJIGRvIG5vdCBiZWxpZXZlDQo+ID4gaHR0cDovL211c2V1bS5waHAubmV0
IGNhbiBiZSB2aWV3ZWQgdG8gYmUgYSByZWxpYWJsZSBhcmNoaXZlIGluIHRoZQ0KPiA+IGZ1dHVy
ZS4gIEkgc2VlIHRoYXQgZGl6enkgY2hhbmdlZCB0aGUgU1JDX1VSSSB0byB1c2UNCj4gPiBodHRw
Oi8vd3d3LnBocC5uZXQvZGlzdHJpYnV0aW9ucyBmb3IgdGhlIG1haW4gZG93bmxvYWQuICBJIGRp
ZCBzb21lDQo+ID4gdGVzdGluZyBhbmQgaXQgYXBwZWFycyB0aGF0IFBIUCB2ZXJzaW9ucyB0aGF0
IGFyZSBhYm91dCBhIHllYXIgb2xkIG9yDQo+ID4gbGVzcyBhcmUgYXZhaWxhYmxlIGZyb20gaHR0
cDovL3d3dy5waHAubmV0L2Rpc3RyaWJ1dGlvbnMuICBTbyB3ZSBjYW4NCj4gPiBhc3N1bWUgdGhh
dCBhIHllYXIgZnJvbSBub3cgdGhlIGRpenp5IGJyYW5jaCBTUkNfVVJJIHdpbGwgbmVlZCB0byBj
aGFuZ2UNCj4gdG8gc29tZXRoaW5nIGVsc2UuDQo+ID4NCj4gPiBJJ2QgcHJvcG9zZSBjaGFuZ2lu
ZyB0aGUgU1JDX1VSSSB0byBzb21ldGhpbmcgdGhhdCB3aWxsIG5vdCBjaGFuZ2UNCj4gPiBvdmVy
IHRpbWUuICBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRoZSBQSFAgZGlzdHJpYnV0aW9ucyBHaXQN
Cj4gPiByZXBvc2l0b3J5IGxvY2F0ZWQNCj4gPiBoZXJlOiBodHRwOi8vZ2l0LnBocC5uZXQvP3A9
d2ViL3BocC1kaXN0cmlidXRpb25zLmdpdDthPXN1bW1hcnkuICBUaGlzDQo+ID4gaXMgdGhlIHBh
dGggc3VnZ2VzdGVkIGluIHRoZSByZWxhdGVkIFBIUCBidWcgbWVudGlvbmVkIGVhcmxpZXIuICBU
aGUNCj4gPiBkaXNhZHZhbnRhZ2UgaXMgdGhhdCB0aGUgU1JDX1VSSSB3b3VsZCByZWZlciB0byBh
IGZpbGUgb24gYSBzcGVjaWZpYw0KPiA+IHRhZywgc28gdGhlIFNSQ19VUkkgd291bGQgYmUgc3Bl
Y2lmaWMgZm9yIGVhY2ggUEhQIHZlcnNpb24uDQo+ID4NCj4gPiBBbnkgZnVydGhlciBzdWdnZXN0
aW9ucyBvbiBob3cgdG8gaGFuZGxlIHRoaXM/ICBJZiB0aGUgU1JDX1VSSSBkb2VzDQo+ID4gZ2V0
IHVwZGF0ZWQsIGhvdyBtYW55IGJyYW5jaGVzIGJhY2sgc2hvdWxkIHRoZSBjaGFuZ2UgYmUgbWFk
ZT8NCj4gDQo+IFNvIHdlIGRvIGhhdmUgbWlycm9ycyB0aGF0IGNhbiBoZWxwIHdpdGggdGhpcywg
dW5mb3J0dW5hdGVseSB3aXRoIHRoZSBPRQ0KPiBtaXJyb3IgKGFzIG9wcG9zZWQgdG8gdGhlIFlv
Y3RvIFByb2plY3Qgb25lKSwgaXRzIHBvcHVsYXRpb24gaXMgbm90IGF1dG9tYXRpYywNCj4gc28g
eW91IGhhdmUgdG8gcmVxdWVzdCB0aGF0IG5ldyBhcmNoaXZlcyBnZXQgYWRkZWQuIEknbSBub3Qg
c3VyZSBpdCB3b3VsZCBiZQ0KPiBwcmFjdGljYWwgdG8gY2hhbmdlIHRoaXMgZWl0aGVyLg0KPiAN
Cj4gV2h5IHBocCB0aGlua3MgaXQncyBhIGdvb2QgaWRlYSB0byBkaXN0cmlidXRlIHRoZXNlIHRh
cmJhbGxzIGluIGEgc2luZ2xlIHBsYWNlIGluDQo+IGEgZ2l0IHJlcG9zaXRvcnkgYnV0IG5vdCBp
biBhIHNpbXBsZSBmbGF0IEhUVFAgbG9jYXRpb24gaXMgYSBiaXQgYmV5b25kIG1lLg0KPiBGZXRj
aGluZyBkaXJlY3RseSBmcm9tIGdpdCBpbiB0aGlzIHNpdHVhdGlvbiB3b3VsZG4ndCBiZSBpZGVh
bCBhcyBpdCdsbCBlbmQgdXANCj4gZWZmZWN0aXZlbHkgZmV0Y2hpbmcgYWxsIG9mIHRoZSBiaW5h
cmllcyBkb3duIHdoZW4gY2xvbmluZyB0aGUgcmVwbzsgaG93ZXZlcg0KPiBJIGd1ZXNzIHlvdSBj
b3VsZCBkb3dubG9hZCBhIHNpbmdsZSBmaWxlIHdpdGg6DQo+IA0KPiBTUkNfVVJJID0gImh0dHA6
Ly9naXQucGhwLm5ldC8/cD13ZWIvcGhwLWRpc3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC0N
Cj4gJHtQVn0udGFyLnh6Ig0KDQpOb3QgZXhhY3RseS4gIEl0IGxvb2tzIGxpa2UgdGhlIG9sZCB2
ZXJzaW9ucyB0aGF0IGFyZSBubyBsb25nZXIgc3VwcG9ydGVkIGdldCBkZWxldGVkIGZyb20gcGhw
LWRpc3RyaWJ1dGlvbnMuZ2l0LCBzbyBIRUFEIGRvZXNuJ3QgaGF2ZSBrbm93bGVkZ2Ugb2YgYWxs
IFBIUCB2ZXJzaW9ucy4gIEZvciBleGFtcGxlLCB0aGlzIGxpbms6IGh0dHA6Ly9naXQucGhwLm5l
dC8/cD13ZWIvcGhwLWRpc3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC01LjQuMjIudGFyLmJ6
MiBhcyBvZiB0b2RheSB3aWxsIGRvd25sb2FkIHBocC01LjQuMjIuICBCdXQgdGhpcyBsaW5rOiBo
dHRwOi8vZ2l0LnBocC5uZXQvP3A9d2ViL3BocC1kaXN0cmlidXRpb25zLmdpdDthPWJsb2I7Zj1w
aHAtNS40LjIxLnRhci5iejIganVzdCByZXBvcnRzIHRoYXQgaXQgY2Fubm90IGZpbmQgdGhlIGZp
bGUuDQoNCkFzIGZhciBhcyBmZXRjaGluZyBwaHAtNS40LjE0ICh2ZXJzaW9uIHVzZWQgZm9yIGRh
aXN5IGFuZCBvbGRlcikgSSB0aGluayB0aGlzIFVSTCB3aWxsIHdvcms6IGh0dHA6Ly9naXQucGhw
Lm5ldC8/cD13ZWIvcGhwLWRpc3RyaWJ1dGlvbnMuZ2l0O2E9YmxvYjtmPXBocC01LjQuMTQudGFy
LmJ6MjtoPTBkOTUwZjE3OWQ1ODZiYjFkMGU4NzllMGQ0YWEzYTUxNDBlOGQ1ZjU7aGI9M2RkMmYx
MjYwOWZjOGE3MzBkN2NmMzQxYTkzMmY2YzdiMjQxZjAzYy4gIFVnbHksIGJ1dCBpdCB3b3Jrcy4N
Cg0KV291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIHN0YXJ0IGNsb25pbmcgdGhlIHNvdXJjZSBH
aXQgcmVwb3NpdG9yeSBhdCBodHRwczovL2dpdC5waHAubmV0L3JlcG9zaXRvcnkvcGhwLXNyYy5n
aXQgaW5zdGVhZCBvZiB0aGUgdGFyYmFsbD8gIEl0IHdvdWxkIGRvd25sb2FkIGEgbG90IG1vcmUg
ZGF0YSwgYnV0IGF0IGxlYXN0IHdlIHNob3VsZCBiZSBhYmxlIHRvIHVzZSBhIHNpbmdsZSBTUkNf
VVJJIGZvciBlYWNoIG1pbm9yIFBIUCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KQnJ5YW4NCg0K

