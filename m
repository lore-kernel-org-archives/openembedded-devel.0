Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0105.outbound.protection.outlook.com [157.56.111.105])
	by mail.openembedded.org (Postfix) with ESMTP id 088A87169F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 15:36:16 +0000 (UTC)
Received: from BY2PR05MB048.namprd05.prod.outlook.com (10.242.34.156) by
	BY2PR05MB048.namprd05.prod.outlook.com (10.242.34.156) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Fri, 7 Nov 2014 15:36:15 +0000
Received: from BY2PR05MB048.namprd05.prod.outlook.com ([169.254.9.151]) by
	BY2PR05MB048.namprd05.prod.outlook.com ([169.254.9.151]) with mapi id
	15.01.0016.006; Fri, 7 Nov 2014 15:36:14 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] PRINC migration questions
Thread-Index: Ac/6ioposBgxHVLQTxCI6lQhvHJI4gADaaEAAABOhpA=
Date: Fri, 7 Nov 2014 15:36:14 +0000
Message-ID: <63ce226621b249b89737c73d94150d68@BY2PR05MB048.namprd05.prod.outlook.com>
References: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
	<20141107143618.GE2444@jama>
In-Reply-To: <20141107143618.GE2444@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 008CB87800871C008CB9C5
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR05MB048;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(51704005)(189002)(51914003)(24454002)(164054003)(199003)(13464003)(76176999)(54356999)(99396003)(19580405001)(97736003)(19580395003)(554214002)(110136001)(101416001)(33646002)(87936001)(50986999)(120916001)(2656002)(21056001)(86362001)(46102003)(31966008)(92566001)(4396001)(2351001)(107046002)(105586002)(76576001)(99286002)(77156002)(62966003)(122556002)(108616004)(77096003)(74316001)(20776003)(64706001)(95666004)(106356001)(66066001)(40100003)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR05MB048;
	H:BY2PR05MB048.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: Re: PRINC migration questions
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
X-List-Received-Date: Fri, 07 Nov 2014 15:36:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWFydGluLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVu
ZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbg0KPiBCZWhh
bGYgT2YgTWFydGluIEphbnNhDQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMDcsIDIwMTQgOToz
NiBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
U3ViamVjdDogUmU6IFtvZV0gUFJJTkMgbWlncmF0aW9uIHF1ZXN0aW9ucw0KPiANCj4gT24gRnJp
LCBOb3YgMDcsIDIwMTQgYXQgMDE6MzE6MDJQTSArMDAwMCwgQnJ5YW4gRXZlbnNvbiB3cm90ZToN
Cj4gPiBBbGwsDQo+ID4NCj4gPiBJIGFtIG9uIHBva3kvZHlsYW4gYW5kIGhhdmUgbm90IHlldCBz
dGFydGVkIHVzaW5nIHRoZSBQUiBzZXJ2ZXIuICBJIHJlYWxseSBkbw0KPiB3YW50IHRvIHN0YXJ0
IHVzaW5nIHRoZSBQUiBzZXJ2ZXIgYW5kIHN0b3AgdXNpbmcgUFJJTkMuICBIb3dldmVyLCBldmVu
IG1vcmUNCj4gc28gSSByZWFsbHkgZG9uJ3Qgd2FudCB0byBicmVhayBteSBwYWNrYWdlIGZlZWRz
LiAgSSB3YW50IHRvIG1ha2Ugc3VyZSBJIGRvDQo+IG15IG1pZ3JhdGlvbiBjb3JyZWN0bHkgYW5k
IEkgZG9uJ3QgZG8gc29tZXRoaW5nIHRoYXQgbG9va3MgbGlrZSBpdCB3b3JrcyBva2F5DQo+IG9u
bHkgdG8gZmluZCBvdXQgaXQgY2F1c2VzIHByb2JsZW1zIGxhdGVyLiAgV2l0aCB0aGF0IGluIG1p
bmQsIEkgYW0gbG9va2luZyBmb3INCj4gYWR2aWNlIG9uIHRoZSBwcm9wZXIgd2F5IHRvIG1pZ3Jh
dGUgYXdheSBmcm9tIHVzaW5nIFBSSU5DLg0KPiA+DQo+ID4gTGV0J3Mgc2F5IEkgaGF2ZSBhIC5i
YmFwcGVuZCBpbiBteSBwcml2YXRlIGxheWVyIHdpdGggdGhlIGxpbmU6DQo+ID4NCj4gPiBQUklO
QyA6PSAiJHtAaW50KFBSSU5DKSArIDR9Ig0KPiA+DQo+ID4gVGhlIG1haW5saW5lIGxheWVyJ3Mg
LmJiIGhhcyB0aGUgbGluZToNCj4gPg0KPiA+IFBSID0gIiR7SU5DX1BSfS4wIg0KPiA+DQo+ID4g
QW5kIHRoZSBtYWlubGluZSBsYXllcidzIC5pbmMgaGFzIHRoZSBsaW5lOg0KPiA+DQo+ID4gSU5D
X1BSID0gInI4Ig0KPiA+DQo+ID4gSW4gdGhpcyBzY2VuYXJpbywgdGhlIHJlc3VsdGluZyBQUiB3
aWxsIGJlICJyMTIuMCIuICBOb3cgbGV0J3Mgc2F5IEkgd2FudCB0byBzdGFydA0KPiB1c2luZyB0
aGUgUFIgc2VydmVyIGFuZCBnZXQgcmlkIG9mIFBSSU5DIGluIHRoaXMgcmVjaXBlLiAgVGhlIHJl
c3VsdGluZyBwYWNrYWdlDQo+IGNvbnRlbnRzIGFyZSB0byBiZSB0aGUgc2FtZSwgc28gSSB3YW50
IHRoZSByZXN1bHRpbmcgUFIgdG8gYmUgInIxMi4wIi4gIEZyb20NCj4gc29tZSBsaW1pdGVkIHRl
c3RpbmcsIGlmIEkgc3RhcnQgdGhlIFBSIHNlcnZlciBhbmQgcmVtb3ZlIHRoZSBQUklOQyBsaW5l
IGZyb20NCj4gbXkgLmJiYXBwZW5kIHRoZSByZXN1bHRpbmcgUFIgaXMgInI4LjAiLiAgU28gaW4g
bXkgLmJiYXBwZW5kIHNob3VsZCBJIGNoYW5nZQ0KPiB0aGUgUFJJTkMgbGluZSB0bzoNCj4gPg0K
PiA+IElOQ19QUiA9ICJyMTIiDQo+ID4NCj4gPiBPciBzaG91bGQgSSBjaGFuZ2UgaXQgdG8gc29t
ZXRoaW5nIGVsc2U/ICBJZiBJIGNoYW5nZSBpdCB0byBhIGhhcmRjb2RlZCB2YWx1ZSwNCj4gdGhl
biBJJ2xsIGhhdmUgdG8gYmUgY2FyZWZ1bCBhYm91dCB3aGF0IHRvIGRvIGlmIHRoZSBtYWlubGlu
ZSByZWNpcGUgY2hhbmdlcw0KPiBJTkNfUFIuICBIb3cgaGF2ZSBvdGhlciBwZW9wbGUgaGFuZGxl
ZCB0aGlzIHNpdHVhdGlvbj8NCj4gDQo+IFBSIHNlcnZpY2Ugd29uJ3QgeW91IGhlbHAgYXQgYWxs
IHdpdGggdGhpcyAoaXQgYWRkcyBhbm90aGVyIC5OIHRvIFBSIHZhbHVlLCBzbyBpdA0KPiBjYW5u
b3QgZml4IHdoZW4gdGhlIGxldmVsIG9mIC5OIGdvZXMgYmFja3dhcmRzKS4NCj4gDQo+IFRoZSBv
bmx5IHJlYWxseSB3b3JraW5nIHNvbHV0aW9uIGlzIHRvIGluY3JlbWVudCBJTkNfUFIvUFIgdmFs
dWVzIGluDQo+IHVwc3RyZWFtIHJlY2lwZXMgYXRvbWljYWxseSB3aXRoIFBSSU5DIGRyb3AgaW4g
eW91ciBsYXllcnMuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4gIEp1c3QgYSBm
ZXcgbW9yZSBxdWVzdGlvbnMgdG8gbWFrZSBzdXJlIEkgZ2V0IHRoaXMgcmlnaHQuICBXZSBoYXZl
IGEgbG9jYWwgR2l0IHNlcnZlciB3aGljaCBoYXMgY2xvbmVzIG9mIGFsbCB0aGUgWW9jdG8vb2Ug
bGF5ZXJzIHRoYXQgd2UgYXJlIHVzaW5nLiAgU28geW91ciBzdWdnZXN0aW9uIGZvciB0aGUgZXhh
bXBsZSBzY2VuYXJpbyB3b3VsZCBiZSB0bzoNCjEuIFJlbW92ZSBQUklOQyByZWZlcmVuY2UgZnJv
bSBvdXIgLmJiYXBwZW5kDQoyLiBDaGFuZ2UgLmluYyBpbiBtYWlubGluZSByZWNpcGUgdG8gSU5D
X1BSID0gInIxMiINCjMuIFB1c2ggY2hhbmdlcyB0byBvdXIgbG9jYWwgR2l0IHJlcG9zaXRvcmll
cy4NCg0KVGhlbiBpZiBsYXRlciBJIHdlcmUgdG8gbWVyZ2UgaW4gdXBkYXRlcyBmcm9tIHRoZSBv
ZmZpY2lhbCBsYXllcnMsIHRoZXJlIHdvdWxkIGJlIGEgbWVyZ2UgY29uZmxpY3QgYW5kIEkgd291
bGQga25vdyBhdCBtZXJnZSB0aW1lIHRoYXQgSSBuZWVkIHRvIGluc3BlY3QgSU5DX1BSIGZvciBi
ZWluZyB0aGUgY29ycmVjdCB2YWx1ZS4gIERvZXMgdGhhdCBzb3VuZCByaWdodD8NCg0KPiBGb3Ig
UFIgc2VydmljZSBtaWdyYXRpb24gdGhlIG1vcmUgaW1wb3J0YW50IHBhcnQgaXMgdG8gY29ycmVj
dGx5IG1pZ3JhdGUNCj4gTE9DQUxDT1VOVCBudW1iZXJzICh1c2VkIGluIFNSQ1BWcyksIGVzcGVj
aWFsbHkgaWYgeW91J3JlIGFsc28gY2hhbmdpbmcNCj4gcGFja2FnZSBhcmNoaXRlY3R1cmUgKGUu
Zy4gdDIgc3VmZml4IGFkZGVkIGluIGRhaXN5IG9yIHNlbGVjdGluZyBkaWZmZXJlbnQNCj4gREVG
QVVMVFRVTkUgYW5kIGFsbCB5b3VyIExPQ0FMQ09VTlRzIGluIFBSIHNlcnZlciBEQiB3aWxsIHJl
c2V0IHRvIDAsDQo+IGJlY2F1c2Ugb2YgZGlmZmVyZW50IGRiIGtleSB0byBmaW5kIHRoZW0uIEx1
Y2tpbHkgeW91IGNhbiBwcmUtcG9wdWxhdGUgdGhlbQ0KPiB3aXRoIHNpbmdsZSBTUUwgY29tbWFu
ZCBpZiB5b3UgcmVhbGl6ZSB0aGlzIHNpdHVhdGlvbiBiZWZvcmUgZmlyc3QgYnVpbGQuDQo+IA0K
DQpPSywgbm93IEknbSBjb25mdXNlZC4gIEkgc2VlIG5vIHJlZmVyZW5jZSB0byBMT0NBTENPVU5U
IGFueXdoZXJlIGluIHRoZSBZb2N0byBQcm9qZWN0IE1lZ2EgTWFudWFsLiAgVGhlIG9ubHkgcmVm
ZXJlbmNlIEkgc2VlIHRvIExPQ0FMQ09VTlQgaXMgb24gdGhlIFBSIFNlcnZpY2Ugd2lraSB3aGlj
aCBzdGF0ZXMgdGhhdCB5b3UgY2FuIGNhbGwgImJpdGJha2UtcHJzZXJ2LXRvb2wgbWlncmF0ZV9s
b2NhbGNvdW50IiB0byBtaWdyYXRlIExPQ0FMQ09VTlRzIHRvIEFVVE9JTkNzIChhbmQgQVVUT0lO
QyBpcyBhbm90aGVyIHZhcmlhYmxlIEkgY2Fubm90IGZpbmQgbWVudGlvbmVkIGFueXdoZXJlIGVs
c2UpLiAgU28gSSBkb24ndCBmdWxseSB1bmRlcnN0YW5kIGhvdyB0byByZWNvZ25pemUgaWYgSSBu
ZWVkIHRvIG1pZ3JhdGUgTE9DQUxDT1VOVCBudW1iZXJzIG9yIHdoYXQgdGhlIFNRTCBjb21tYW5k
IHdvdWxkIGJlIHRvIHBlcmZvcm0gdGhlIG1pZ3JhdGlvbi4gIEJ1dCBpdCBzb3VuZHMgbGlrZSB0
aGlzIGlzIGEgcHJldHR5IGltcG9ydGFudCBwaWVjZSB0byBnZXQgcmlnaHQgZHVyaW5nIG1pZ3Jh
dGlvbi4gIENvdWxkIHlvdSBleHBsYWluIHRoaXMgcGllY2UgZm9yIFBSIHNlcnZpY2UgbWlncmF0
aW9uIGluIG1vcmUgZGV0YWlsLCBvciBwb2ludCBtZSB0byB0aGUgcHJvcGVyIHBsYWNlIGluIHRo
ZSBkb2N1bWVudGF0aW9uIHRoYXQgZGVzY3JpYmVzIHRoaXMgcGFydCBvZiBtaWdyYXRpb24/DQoN
ClRoYW5rcywNCkJyeWFuIA0KDQo=

