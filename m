Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D747878341
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:21:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H2LSnD005415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 19:21:28 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Wed, 16 Aug 2017 19:21:28 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] vlock: add new recipe
Thread-Index: AQHTFrLekOr51oYL/kyFY5Uy42p7CqKHtrvggAB6BgD//4wLIIAAiJ0A//+MJxA=
Date: Thu, 17 Aug 2017 02:21:27 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B8654B9@ALA-MBD.corp.ad.wrs.com>
References: <20170816053740.24934-1-jackie.huang@windriver.com>
	<CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8652B2@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sqf3=F9S2EymZnJ2N77=qx1-svNAVU+t7rd9qvnFxctvQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B86538C@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sqyUfoFveEtU2D1WfcJ3n7TiZSWiPJL9=P31guR3Ss4hw@mail.gmail.com>
In-Reply-To: <CAMKF1sqyUfoFveEtU2D1WfcJ3n7TiZSWiPJL9=P31guR3Ss4hw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.91]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] vlock: add new recipe
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
X-List-Received-Date: Thu, 17 Aug 2017 02:21:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTcsIDIwMTcg
MTA6MTYNCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVs
DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCB2Ml0gdmxvY2s6IGFkZCBuZXcg
cmVjaXBlDQo+IA0KPiBPbiBXZWQsIEF1ZyAxNiwgMjAxNyBhdCA2OjEyIFBNLCBIdWFuZywgSmll
IChKYWNraWUpDQo+IDxKYWNraWUuSHVhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4NCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLaGVtIFJhaiBb
bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0NCj4gPj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAx
NywgMjAxNyAwOTowMg0KPiA+PiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiA+PiBDYzogb3Bl
bmVtYmVkZWQtZGV2ZWwNCj4gPj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIHYy
XSB2bG9jazogYWRkIG5ldyByZWNpcGUNCj4gPj4NCj4gPj4gT24gV2VkLCBBdWcgMTYsIDIwMTcg
YXQgNTo0OCBQTSwgSHVhbmcsIEppZSAoSmFja2llKQ0KPiA+PiA8SmFja2llLkh1YW5nQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPiA+PiA+DQo+ID4+ID4NCj4gPj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gPj4gRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFp
bC5jb21dDQo+ID4+ID4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTcsIDIwMTcgMDE6MTINCj4g
Pj4gPj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gPj4gPj4gQ2M6IG9wZW5lbWJlZGVkLWRl
dmVsDQo+ID4+ID4+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCB2Ml0gdmxvY2s6
IGFkZCBuZXcgcmVjaXBlDQo+ID4+ID4+DQo+ID4+ID4+IE9uIFR1ZSwgQXVnIDE1LCAyMDE3IGF0
IDEwOjM3IFBNLCAgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPj4gPj4g
PiBGcm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+PiA+
PiA+DQo+ID4+ID4+ID4gdmxvY2sgaXMgYSBwcm9ncmFtIHRvIGxvY2sgb25lIG9yIG1vcmUNCj4g
Pj4gPj4gPiBzZXNzaW9ucyBvbiB0aGUgTGludXggY29uc29sZS4NCj4gPj4gPj4gPg0KPiA+PiA+
PiA+IFNpZ25lZC1vZmYtYnk6IEphY2tpZSBIdWFuZyA8amFja2llLmh1YW5nQHdpbmRyaXZlci5j
b20+DQo+ID4+ID4+ID4gLS0tDQo+ID4+ID4+ID4gIC4uLi92bG9jay92bG9jay0yLjIuMy9kaXNh
YmxlX3Zsb2NrcmMucGF0Y2ggICAgICAgIHwgIDM3ICsrKysrKysNCj4gPj4gPj4gPiAgLi4uL3Zs
b2NrL3Zsb2NrLTIuMi4zL3Zsb2NrLW5vX3RhbGx5LnBhdGNoICAgICAgICAgfCAxMDcNCj4gPj4g
Pj4gKysrKysrKysrKysrKysrKysrKysrDQo+ID4+ID4+ID4gIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L3Zsb2NrL3Zsb2NrLTIuMi4zL3Zsb2NrX3BhbSAgIHwgICAzICsNCj4gPj4gPj4gPiAgLi4uL3Zs
b2NrL3Zsb2NrLTIuMi4zL3Zsb2NrX3BhbV90YWxseTJfcmVzZXQucGF0Y2ggfCAgMTkgKysrKw0K
PiA+PiA+PiA+ICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxvY2svdmxvY2tfMi4yLjMuYmIg
ICAgICB8ICA1OSArKysrKysrKysrKysNCj4gPj4gPj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMjUg
aW5zZXJ0aW9ucygrKQ0KPiA+PiA+PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3Zsb2NrL3Zsb2NrLQ0KPiA+PiA+PiAyLjIuMy9kaXNhYmxlX3Zsb2NrcmMu
cGF0Y2gNCj4gPj4gPj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1leHRl
bmRlZC92bG9jay92bG9jay0NCj4gMi4yLjMvdmxvY2stDQo+ID4+ID4+IG5vX3RhbGx5LnBhdGNo
DQo+ID4+ID4+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
dmxvY2svdmxvY2stDQo+ID4+IDIuMi4zL3Zsb2NrX3BhbQ0KPiA+PiA+PiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Zsb2NrL3Zsb2NrLQ0KPiA+PiA+PiAy
LjIuMy92bG9ja19wYW1fdGFsbHkyX3Jlc2V0LnBhdGNoDQo+ID4+ID4+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxvY2svdmxvY2tfMi4yLjMuYmINCj4g
Pj4gPj4gPg0KPiA+PiA+PiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
dmxvY2svdmxvY2stDQo+ID4+IDIuMi4zL2Rpc2FibGVfdmxvY2tyYy5wYXRjaA0KPiA+PiA+PiBi
L21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC92bG9jay92bG9jay0yLjIuMy9kaXNhYmxlX3Zsb2Nr
cmMucGF0Y2gNCj4gPj4gPj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiA+PiA+IGluZGV4
IDAwMDAwMDAwMC4uZWUwZDA3NGRlDQo+ID4+ID4+ID4gLS0tIC9kZXYvbnVsbA0KPiA+PiA+PiA+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC92bG9jay92bG9jay0NCj4gMi4yLjMvZGlz
YWJsZV92bG9ja3JjLnBhdGNoDQo+ID4+ID4+ID4gQEAgLTAsMCArMSwzNyBAQA0KPiA+PiA+PiA+
ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dDQo+ID4+ID4+
ID4gKw0KPiA+PiA+PiA+ICt3cml0dGVuIGJ5OiBKZWZmIFBvbGsgPGplZmYucG9sa0B3aW5kcml2
ZXIuY29tPg0KPiA+PiA+Pg0KPiA+PiA+PiBJIHRoaW5rIGEgU09CIGlzIGJldHRlciB0aGFuIGlu
dmVudGluZyBhbm90aGVyIHRhZy4NCj4gPj4gPg0KPiA+PiA+IEkganVzdCBmb2xsb3cgdGhlIGd1
aWRlbGluZToNCj4gPj4gPg0KPiA+Pg0KPiBodHRwOi8vd3d3Lm9wZW5lbWJlZGRlZC5vcmcvd2lr
aS9Db21taXRfUGF0Y2hfTWVzc2FnZV9HdWlkZWxpbmVzI0ltcA0KPiA+PiBvcnRpbmdfZnJvbV9F
bHNld2hlcmUNCj4gPj4gPg0KPiA+PiA+ICIiIg0KPiA+PiA+IEl0IGlzIGFsc28gbmVjZXNzYXJ5
IHRvIGRvY3VtZW50IHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhlIGNoYW5nZS4gWW91DQo+IHNo
b3VsZA0KPiA+PiBpbmRpY2F0ZSB0aGUgb3JpZ2luYWwgYXV0aG9yIGJ5IHNpbXBseSBzdGF0aW5n
ICJ3cml0dGVuIGJ5IiBvciAicG9zdGVkIHRvIHRoZSAuLi4NCj4gPj4gbWFpbGluZyBsaXN0IGJ5
Ii4gWW91IG11c3Qgbm90IGFkZCBhIFNpZ25lZC1vZmYtYnk6IHRhZyBsaW5lIHdpdGggdGhlaXIg
bmFtZSwNCj4gb25seQ0KPiA+PiB0aGUgb3JpZ2luYWwgYXV0aG9yIG1heSBhZGQgdGhlaXIgb3du
IFNpZ25lZC1vZmYtYnk6IHRhZyBsaW5lLg0KPiA+PiA+ICIiIg0KPiA+PiA+DQo+ID4+DQo+ID4+
IEkgd2Fzbid0IHN1Z2dlc3RpbmcgdGhhdCB5b3UgYWRkIFNPQiBmb3Igc29tZW9uZSBlbHNlLiBJ
IHdhcyBzdWdnZXN0aW5nIHRvDQo+ID4+IG5vdCBoYXZlIG9yaWdpbmFsIGF1dGhvciBhdHRyaWJ1
dGlvbiBzbyBjbG9zZSB0byB0aGUgZm9ybWF0IGZvcg0KPiA+PiBTaWduZWQtb2ZmLWJ5LCB0ZXN0
ZWQtb2ZmLWJ5IGV0Yy4gU29tZXRoaW5nIGxpa2UNCj4gPj4NCj4gPj4gT3JpZ2luYWwgUGF0Y2gg
ZnJvbTogPCBzb3VyY2UgPg0KPiA+Pg0KPiA+PiB3aGVyZSBzb3VyY2UgaXMgcHVibGljbHkgbGlz
dGVkIFVSTCB3aGVyZSB0aGUgcGF0Y2ggaXMgcG9zdGVkLg0KPiA+DQo+ID4gSSBnb3QgdGhlIHBh
dGNoIGZyb20gb3VyIGludGVybmFsIGxheWVyIGFuZCB0aGUgYXV0aG9yIGlzIG5vIGxvbmdlciBp
biBvdXINCj4gY29tcGFueSwNCj4gPiB3aGF0IGlzIHRoZSBzdWdnZXN0aW5nIHdheSBpZiBJIGNh
bid0IGZpbmQgYSBwdWJsaWMgVVJMIGZvciB0aGlzPw0KPiA+DQo+IA0KPiB5b3UgaGF2ZSB0byBj
b25zdWx0IHlvdXIgY29tcGFueSdzIHVwc3RyZWFtaW5nIHBvbGljeS4NCg0KT2ssIHRoYW5rcyEN
Cg0KVGhhbmtzLA0KSmFja2llDQoNCj4gDQo+IA0KPiA+IFRoYW5rcywNCj4gPiBKYWNraWUNCj4g
Pg0KPiA+Pg0KPiA+Pg0KPiA+PiA+IFRoYW5rcywNCj4gPj4gPiBKYWNraWUNCg==

