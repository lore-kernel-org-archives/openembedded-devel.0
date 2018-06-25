Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E332F74A03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 16:47:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5PGlliR027782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jun 2018 09:47:47 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.237]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0399.000;
	Mon, 25 Jun 2018 09:47:46 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-gnome][PATCH 1/1] metacity: allow for warnings
	during compilation
Thread-Index: AQHUC03MlRkVLXrFHUKHCEgLqKUqFaRvBA+AgAIs9QA=
Date: Mon, 25 Jun 2018 16:47:46 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F35015D5@ALA-MBD.corp.ad.wrs.com>
References: <20180623235626.228940-1-joe.slater@windriver.com>
	<CAMKF1sqObyS4hW4hLGA=TynF+A5TSYZZvRshtMg4wDzfvdz9ng@mail.gmail.com>
In-Reply-To: <CAMKF1sqObyS4hW4hLGA=TynF+A5TSYZZvRshtMg4wDzfvdz9ng@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.215]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/1] metacity: allow for warnings during compilation
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
X-List-Received-Date: Mon, 25 Jun 2018 16:47:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSB0byB0YWtlIGFuIGFjdGlvbiB0byBjb3ZlciB1
cCBhbiBpc3N1ZSByYXRoZXIgdGhhbiBuZWVkDQp0byBkbyBzb21ldGhpbmcgdG8gZXhwb3NlIGl0
LCBidXQgZWl0aGVyIHdheSBnaXZlcyB5b3UgYSBjaG9pY2UuDQoNCkpvZQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFpbC5j
b21dIA0KU2VudDogU2F0dXJkYXksIEp1bmUgMjMsIDIwMTggNTozMSBQTQ0KVG86IFNsYXRlciwg
Sm9zZXBoDQpDYzogb3BlbmVtYmVkZWQtZGV2ZWwNClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLWdu
b21lXVtQQVRDSCAxLzFdIG1ldGFjaXR5OiBhbGxvdyBmb3Igd2FybmluZ3MgZHVyaW5nIGNvbXBp
bGF0aW9uDQoNCk9uIFNhdCwgSnVuIDIzLCAyMDE4IGF0IDQ6NTYgUE0gSm9lIFNsYXRlciA8am9l
LnNsYXRlckB3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4NCj4gQWRkIGEgUEFDS0FHRUNPTkZJRyBv
cHRpb24gd2hpY2ggbGV0cyB1cyBwZXJtaXQgd2FybmluZ3MgZHVyaW5nDQo+IGNvbXBpbGF0aW9u
IHVudGlsIHdhcm5pbmdzIGZyb20gbmV3IGNvbXBpbGVyIHZlcnNpb25zIGFyZQ0KPiBkZWFsdCB3
aXRoLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZl
ci5jb20+DQo+IC0tLQ0KPiAgbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL21ldGFjaXR5L21ldGFj
aXR5XzMuMjguMC5iYiB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9tZXRhY2l0eS9t
ZXRhY2l0eV8zLjI4LjAuYmIgYi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvbWV0YWNpdHkvbWV0
YWNpdHlfMy4yOC4wLmJiDQo+IGluZGV4IGNlOTdhODAuLjk0OGMyZjEgMTAwNjQ0DQo+IC0tLSBh
L21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9tZXRhY2l0eS9tZXRhY2l0eV8zLjI4LjAuYmINCj4g
KysrIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL21ldGFjaXR5L21ldGFjaXR5XzMuMjguMC5i
Yg0KPiBAQCAtMjMsNiArMjMsMTEgQEAgU1JDUkVWID0gImMwZDRiMmZjMGZjZDZmMmQzYzM3ZGE5
MzU5MjNmOWU5ZWQ1ZWI5OWYiDQo+DQo+ICBFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS14aW5l
cmFtYSINCj4NCj4gK1BBQ0tBR0VDT05GSUcgPz0gIiINCj4gKw0KDQpzaW5jZSB3ZSBkZWZhdWx0
ZWQgdG8gZ2NjOCBpbiBvZS1jb3JlLCBwZXJoYXBzIGl0cyBiZXR0ZXIgdG8gdHVybiBpdCBvbg0K
YnkgZGVmYXVsdC4NCg0KPiArIyBlbmFibGUgYXMgbmVjY2Vzc2FyeSB1bnRpbCBuZXcgd2Fybmlu
Z3MgYXJlIGRlYWx0IHdpdGgNCj4gK1BBQ0tBR0VDT05GSUdbbm9XZXJyb3JdID0gIi0tZGlzYWJs
ZS1XZXJyb3IsLCwiDQo+ICsNCj4gIGRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgew0KPiAgICAgIGNk
ICR7U30NCj4gICAgICBhY2xvY2FsIC0taW5zdGFsbCB8fCBleGl0IDENCj4gLS0NCj4gMi43LjQN
Cj4NCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K

