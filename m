Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA7B16B067
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 04:40:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x684e1ft020853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jul 2019 21:40:01 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.194]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000;
	Sun, 7 Jul 2019 21:39:49 -0700
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: akuster808 <akuster808@gmail.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 1/2] keyutils: add new recipe for
	version 1.6.
Thread-Index: AQHVNTDXL6pp/1Wo3kambK3Y+VZVpaa/95iwgAB3loD//7R14A==
Date: Mon, 8 Jul 2019 04:39:48 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D19C4ECFF@ALA-MBD.corp.ad.wrs.com>
References: <20190708015236.42034-1-yongxin.liu@windriver.com>
	<afcf7ce5-1f2e-c5d1-fca9-a2fcda677b35@gmail.com>
	<597B109EC20B76429F71A8A97770610D19C4EB56@ALA-MBD.corp.ad.wrs.com>
	<300f0a37-4f44-7424-c3cb-95237fec6196@gmail.com>
In-Reply-To: <300f0a37-4f44-7424-c3cb-95237fec6196@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/2] keyutils: add new recipe for version 1.6.
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
X-List-Received-Date: Mon, 08 Jul 2019 04:40:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFrdXN0ZXI4MDggW21haWx0
bzpha3VzdGVyODA4QGdtYWlsLmNvbV0NCj4gU2VudDogTW9uZGF5LCBKdWx5IDgsIDIwMTkgMTA6
MDkNCj4gVG86IExpdSwgWW9uZ3hpbjsgcmFqLmtoZW1AZ21haWwuY29tOyBvcGVuZW1iZWRkZWQt
DQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21l
dGEtb2VdW1BBVENIIHYyIDEvMl0ga2V5dXRpbHM6IGFkZCBuZXcgcmVjaXBlIGZvcg0KPiB2ZXJz
aW9uIDEuNi4NCj4gDQo+IA0KPiANCj4gT24gNy83LzE5IDc6MDMgUE0sIExpdSwgWW9uZ3hpbiB3
cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogYWt1c3Rl
cjgwOCBbbWFpbHRvOmFrdXN0ZXI4MDhAZ21haWwuY29tXQ0KPiA+PiBTZW50OiBNb25kYXksIEp1
bHkgOCwgMjAxOSAwOTo1OQ0KPiA+PiBUbzogTGl1LCBZb25neGluOyByYWoua2hlbUBnbWFpbC5j
b207IG9wZW5lbWJlZGRlZC0NCj4gPj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
PiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggdjIgMS8yXSBrZXl1dGlsczogYWRk
IG5ldyByZWNpcGUgZm9yDQo+ID4+IHZlcnNpb24gMS42Lg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+
PiBPbiA3LzcvMTkgNjo1MiBQTSwgWW9uZ3hpbiBMaXUgd3JvdGU6DQo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBZb25neGluIExpdSA8eW9uZ3hpbi5saXVAd2luZHJpdmVyLmNvbT4NCj4gPj4+IC0tLQ0K
PiA+Pj4gIG1ldGEtb2UvcmVjaXBlcy1zZWN1cml0eS9rZXl1dGlscy9rZXl1dGlsc18xLjYuYmIg
fCAzOA0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspDQo+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVj
aXBlcy1zZWN1cml0eS9rZXl1dGlscy9rZXl1dGlsc18xLjYuYmINCj4gPj4+DQo+ID4+PiBkaWZm
IC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXNlY3VyaXR5L2tleXV0aWxzL2tleXV0aWxzXzEuNi5i
Yg0KPiBiL21ldGEtDQo+ID4+IG9lL3JlY2lwZXMtc2VjdXJpdHkva2V5dXRpbHMva2V5dXRpbHNf
MS42LmJiDQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5kZXggMDAwMDAwMDAw
Li4zYTI2YzkwMmENCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBiL21ldGEtb2UvcmVj
aXBlcy1zZWN1cml0eS9rZXl1dGlscy9rZXl1dGlsc18xLjYuYmINCj4gPj4gVGhpcyByZWNpcGUg
aXMgaW4gbWV0YS1zZWN1cml0eSBhbmQgY29udGFpbnMgcHRlc3RzLiBEaWQgeW91IHdhbnQgdGhl
DQo+ID4+IHB0ZXN0cyBhbmQgb3RoZXIgZml4ZXMgdG9vPw0KPiA+IFRoaXMgcmVjaXBlIGlzIGlu
dGVuZGVkIHRvIGJlIHVzZWQgYnkgb3RoZXIgcmVjaXBlcyBpbiBPRS4NCj4gPiBGb3Igb3RoZXIg
bGF5ZXJzLCBJIHRoaW5rIHRoZXkgY2FuIHVzZSB0aGVpciBvd24ga2V5dXRpbHMuDQo+IA0KPiBJ
IG1lYW4sIGl0IHNob3VsZCBtb3ZlIG91dCBvZiBtZXRhLXNlY3VyaXR5IHRvIG1ldGEtb2UuwqAg
QW5kIGlmIHlvdQ0KPiBkb24ndCB3YW50IHRvIGRvIHRoYXQsIHlvdSBzaG91bGQgcGljayB1cCB0
aGUgZml4ZXMuDQoNClRoYW5rcyBBcm1pbi4gSSB3aWxsIG1vdmUgaXQgZnJvbSBtZXRhLXNlY3Vy
aXR5IHRvIG1ldGEtb2UuDQoNCi0tWW9uZ3hpbg0KDQo+IA0KPiBQbGVhc2UgaGF2ZSBhIGxvb2sg
YW5kIGNvbXBhcmUuDQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dp
L21ldGEtc2VjdXJpdHkvdHJlZS9yZWNpcGVzLQ0KPiBzZWN1cml0eS9rZXl1dGlscy9rZXl1dGls
c18xLjYuYmINCj4gDQo+IC0gYXJtaW4NCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gWW9uZ3hp
bg0KPiA+DQo+ID4+IC0gYXJtaW4NCj4gPj4+IEBAIC0wLDAgKzEsMzggQEANCj4gPj4+ICtTVU1N
QVJZID0gIkxpbnV4IEtleSBNYW5hZ2VtZW50IFV0aWxpdGllcyINCj4gPj4+ICtERVNDUklQVElP
TiA9ICJUaGVzZSB0b29scyBhcmUgdXNlZCB0byBjb250cm9sIHRoZSBrZXkgbWFuYWdlbWVudA0K
PiA+PiBzeXN0ZW0gYnVpbHQgaW50byB0aGUgTGludXguIg0KPiA+Pj4gKw0KPiA+Pj4gK1NFQ1RJ
T04gPSAiYmFzZSINCj4gPj4+ICsNCj4gPj4+ICtMSUNFTlNFID0gIkxHUEx2Mi4xKyAmIEdQTHYy
LjArIg0KPiA+Pj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiA+PiAiZmlsZTovL0xJQ0VOQ0UuR1BM
O21kNT01ZjZlNzI4MjRmNWRhNTA1YzFmNGE3MTk3ZjAwNGI0NSBcDQo+ID4+PiArDQo+ID4+IGZp
bGU6Ly9MSUNFTkNFLkxHUEw7bWQ1PTdkMWNhY2FhM2VhNzUyYjcyZWE1ZTUyNWRmNTRhMjFmIg0K
PiA+Pj4gKw0KPiA+Pj4gK1BWID0gIjEuNitnaXQke1NSQ1BWfSINCj4gPj4+ICsNCj4gPj4+ICtT
UkNfVVJJID0gIlwNCj4gPj4+ICsNCj4gPj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2Rob3dlbGxzL2tleXV0aWxzLmdpdCBcDQo+ID4+PiArIg0KPiA+Pj4g
Kw0KPiA+Pj4gK1NSQ1JFViA9ICI0NzIzZjAxODVkMTFiMTNkZjI0M2FkM2NkNDFmYmRkZmVkNTNi
NWIxIg0KPiA+Pj4gKw0KPiA+Pj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4+PiArDQo+ID4+
PiArRVhUUkFfT0VNQUtFID0gIidDRkxBR1M9JHtDRkxBR1N9IC1XYWxsJyINCj4gPj4+ICsNCj4g
Pj4+ICtJTlNUQUxMX0ZMQUdTID0gIlwNCj4gPj4+ICsgICAgTElCRElSPSR7bGliZGlyfSBcDQo+
ID4+PiArICAgIFVTUkxJQkRJUj0ke2xpYmRpcn0gXA0KPiA+Pj4gKyAgICBCSU5ESVI9JHtiaW5k
aXJ9IFwNCj4gPj4+ICsgICAgU0JJTkRJUj0ke3NiaW5kaXJ9IFwNCj4gPj4+ICsgICAgRVRDRElS
PSR7c3lzY29uZmRpcn0gXA0KPiA+Pj4gKyAgICBTSEFSRURJUj0ke2RhdGFkaXJ9IFwNCj4gPj4+
ICsgICAgTUFORElSPSR7bWFuZGlyfSBcDQo+ID4+PiArICAgIElOQ0xVREVESVI9JHtpbmNsdWRl
ZGlyfSBcDQo+ID4+PiArICAgIERFU1RESVI9JHtEfSBcDQo+ID4+PiArIg0KPiA+Pj4gKw0KPiA+
Pj4gK2RvX2luc3RhbGwoKSB7DQo+ID4+PiArICAgIGNkICR7U30gJiYgb2VfcnVubWFrZSAke0lO
U1RBTExfRkxBR1N9IGluc3RhbGwNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArRklMRVNfJHtQ
Tn0gKz0gIiR7ZGF0YWRpcn0vcmVxdWVzdC1rZXktZGVidWcuc2giDQoNCg==

