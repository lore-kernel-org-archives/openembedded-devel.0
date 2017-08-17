Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 812E87837C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 00:48:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H0mt9m010966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 17:48:55 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.209]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Wed, 16 Aug 2017 17:48:55 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] vlock: add new recipe
Thread-Index: AQHTFrLekOr51oYL/kyFY5Uy42p7CqKHtrvg
Date: Thu, 17 Aug 2017 00:48:54 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B8652B2@ALA-MBD.corp.ad.wrs.com>
References: <20170816053740.24934-1-jackie.huang@windriver.com>
	<CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
In-Reply-To: <CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Aug 2017 00:48:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTcsIDIwMTcg
MDE6MTINCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVs
DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCB2Ml0gdmxvY2s6IGFkZCBuZXcg
cmVjaXBlDQo+IA0KPiBPbiBUdWUsIEF1ZyAxNSwgMjAxNyBhdCAxMDozNyBQTSwgIDxqYWNraWUu
aHVhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNr
aWUuaHVhbmdAd2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IHZsb2NrIGlzIGEgcHJvZ3JhbSB0byBs
b2NrIG9uZSBvciBtb3JlDQo+ID4gc2Vzc2lvbnMgb24gdGhlIExpbnV4IGNvbnNvbGUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vdmxvY2svdmxvY2stMi4yLjMvZGlzYWJsZV92bG9ja3Jj
LnBhdGNoICAgICAgICB8ICAzNyArKysrKysrDQo+ID4gIC4uLi92bG9jay92bG9jay0yLjIuMy92
bG9jay1ub190YWxseS5wYXRjaCAgICAgICAgIHwgMTA3DQo+ICsrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAuLi4vcmVjaXBlcy1leHRlbmRlZC92bG9jay92bG9jay0yLjIuMy92bG9ja19wYW0g
ICB8ICAgMyArDQo+ID4gIC4uLi92bG9jay92bG9jay0yLjIuMy92bG9ja19wYW1fdGFsbHkyX3Jl
c2V0LnBhdGNoIHwgIDE5ICsrKysNCj4gPiAgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Zsb2Nr
L3Zsb2NrXzIuMi4zLmJiICAgICAgfCAgNTkgKysrKysrKysrKysrDQo+ID4gIDUgZmlsZXMgY2hh
bmdlZCwgMjI1IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2Uv
cmVjaXBlcy1leHRlbmRlZC92bG9jay92bG9jay0NCj4gMi4yLjMvZGlzYWJsZV92bG9ja3JjLnBh
dGNoDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxv
Y2svdmxvY2stMi4yLjMvdmxvY2stDQo+IG5vX3RhbGx5LnBhdGNoDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxvY2svdmxvY2stMi4yLjMvdmxvY2tf
cGFtDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxv
Y2svdmxvY2stDQo+IDIuMi4zL3Zsb2NrX3BhbV90YWxseTJfcmVzZXQucGF0Y2gNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC92bG9jay92bG9ja18yLjIu
My5iYg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC92bG9j
ay92bG9jay0yLjIuMy9kaXNhYmxlX3Zsb2NrcmMucGF0Y2gNCj4gYi9tZXRhLW9lL3JlY2lwZXMt
ZXh0ZW5kZWQvdmxvY2svdmxvY2stMi4yLjMvZGlzYWJsZV92bG9ja3JjLnBhdGNoDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAuLmVlMGQwNzRkZQ0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvdmxvY2svdmxv
Y2stMi4yLjMvZGlzYWJsZV92bG9ja3JjLnBhdGNoDQo+ID4gQEAgLTAsMCArMSwzNyBAQA0KPiA+
ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dDQo+ID4gKw0K
PiA+ICt3cml0dGVuIGJ5OiBKZWZmIFBvbGsgPGplZmYucG9sa0B3aW5kcml2ZXIuY29tPg0KPiAN
Cj4gSSB0aGluayBhIFNPQiBpcyBiZXR0ZXIgdGhhbiBpbnZlbnRpbmcgYW5vdGhlciB0YWcuDQoN
CkkganVzdCBmb2xsb3cgdGhlIGd1aWRlbGluZToNCmh0dHA6Ly93d3cub3BlbmVtYmVkZGVkLm9y
Zy93aWtpL0NvbW1pdF9QYXRjaF9NZXNzYWdlX0d1aWRlbGluZXMjSW1wb3J0aW5nX2Zyb21fRWxz
ZXdoZXJlDQoNCiIiIg0KSXQgaXMgYWxzbyBuZWNlc3NhcnkgdG8gZG9jdW1lbnQgdGhlIG9yaWdp
bmFsIGF1dGhvciBvZiB0aGUgY2hhbmdlLiBZb3Ugc2hvdWxkIGluZGljYXRlIHRoZSBvcmlnaW5h
bCBhdXRob3IgYnkgc2ltcGx5IHN0YXRpbmcgIndyaXR0ZW4gYnkiIG9yICJwb3N0ZWQgdG8gdGhl
IC4uLiBtYWlsaW5nIGxpc3QgYnkiLiBZb3UgbXVzdCBub3QgYWRkIGEgU2lnbmVkLW9mZi1ieTog
dGFnIGxpbmUgd2l0aCB0aGVpciBuYW1lLCBvbmx5IHRoZSBvcmlnaW5hbCBhdXRob3IgbWF5IGFk
ZCB0aGVpciBvd24gU2lnbmVkLW9mZi1ieTogdGFnIGxpbmUuDQoiIiINCg0KVGhhbmtzLA0KSmFj
a2llDQo=

