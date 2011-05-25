Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QPExl-0005Ob-2f
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 16:21:29 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4PEIPgG013064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 09:18:25 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p4PEIP8J016818
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 09:18:25 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4PEIO94026834
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 09:18:24 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 25 May 2011 16:18:24 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 25 May 2011 16:18:20 +0200
Thread-Topic: [oe] [PATCH] wpa-gui-e: build the latest version from git sources
Thread-Index: Acwa5ei/Ds76usKISYGHX9HwiAe42QAAEQfg
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F03324D1F57@dnce02.ent.ti.com>
References: <y>	<1306328337-19285-1-git-send-email-eyalr@ti.com>
	<4DDD05E0.4070504@opendreambox.org>	<1306332204.10056.81.camel@mattotaupa>
	<irj2ot$fj8$1@dough.gmane.org>
In-Reply-To: <irj2ot$fj8$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] wpa-gui-e: build the latest version from git sources
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 14:21:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S29lbiwNCg0KRG8geW91IG1lYW4gdGhhdCB1c2luZyBTUkNSRVYgaW5zdGVhZCBvZiBTUkNQViBh
cyBiZWxvdyBpcyBvaywgb3Igc2hvdWxkIEkgYWxzbyByZW1vdmUgdGhlIFBWID0gIi4uLiI/DQoN
CitQViA9ICIwLjcuMyswLjguMC1yYyINCitQUl9hcHBlbmQgPSAiK2dpdCR7U1JDUkVWfSINCg0K
QmVzdCBSZWdhcmRzLA0KRXlhbA0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZ10gT24gQmVoYWxmIE9mDQo+IEtvZW4gS29vaQ0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAy
NSwgMjAxMSA1OjEzIFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0hdIHdwYS1ndWktZTogYnVpbGQgdGhl
IGxhdGVzdCB2ZXJzaW9uIGZyb20gZ2l0DQo+IHNvdXJjZXMNCj4gDQo+IC0tLS0tQkVHSU4gUEdQ
IFNJR05FRCBNRVNTQUdFLS0tLS0NCj4gSGFzaDogU0hBMQ0KPiANCj4gT24gMjUtMDUtMTEgMTY6
MDMsIFBhdWwgTWVuemVsIHdyb3RlOg0KPiA+IERlYXIgQW5kcmVhcywgZGVhciBFeWFsLA0KPiA+
DQo+ID4NCj4gPiBPbiBNaSwgMjAxMS0wNS0yNSBhdCAxNTozNiArMDIwMCwgQW5kcmVhcyBPYmVy
cml0dGVyIHdyb3RlOg0KPiA+DQo+ID4+IE9uIDA1LzI1LzIwMTEgMDI6NTggUE0sIEV5YWwgUmVp
emVyIHdyb3RlOg0KPiA+DQo+ID4gW+KApl0NCj4gPg0KPiA+Pj4gK1NSQ1JFViA9ICJiOGZiMDE3
MjcyZWQ0Nzk0MzM5OTc4YzlmYmMwZTc0NTcxYTQ0NzI4Ig0KPiA+Pj4gK1BSID0gInIwIg0KPiA+
Pg0KPiA+PiBQUiA9ICJyMCIgaXMgdGhlIGRlZmF1bHQgYW5kIGNhbiBiZSByZW1vdmVkLg0KPiA+
DQo+ID4gaXQgc2VlbXMgdGhlcmUgYXJlIGRpZmZlcmVudCBvcGluaW9ucyBvbiB0aGlzIHRvcGlj
LiBBdCBsZWFzdCB0aGUNCj4gbWFudWFsDQo+ID4gc2F5cyBkaWZmZXJlbnRseS4NCj4gPg0KPiA+
ICAgICAgICAgTm90ZQ0KPiA+DQo+ID4gICAgICAgICBJdCBpcyBnb29kIHByYWN0aWNlIHRvIGFs
d2F5cyBkZWZpbmUgUFIgaW4geW91ciByZWNpcGVzLCBldmVuDQo+ID4gICAgICAgICBmb3IgdGhl
ICJyMCIgcmVsZWFzZSwgc28gdGhhdCB3aGVuIGVkaXRpbmcgdGhlIHJlY2lwZSBpdCBpcw0KPiA+
ICAgICAgICAgY2xlYXIgdGhhdCB0aGUgUFIgbnVtYmVyIG5lZWRzIHRvIGJlIHVwZGF0ZWQuDQo+
ID4NCj4gPiAgICAgICAgIFlvdSBzaG91bGQgYWx3YXlzIGluY3JlbWVudCBQUiB3aGVuIG1vZGlm
eWluZyBhIHJlY2lwZS4NCj4gPiAgICAgICAgIFNvbWV0aW1lcyB0aGlzIGNhbiBiZSBhdm9pZGVk
IGlmIHRoZSBjaGFuZ2Ugd2lsbCBoYXZlIG5vDQo+IGVmZmVjdA0KPiA+ICAgICAgICAgb24gdGhl
IGFjdHVhbCBwYWNrYWdlcyBnZW5lcmF0ZWQgYnkgdGhlIHJlY2lwZSwgc3VjaCBhcw0KPiB1cGRh
dGluZw0KPiA+ICAgICAgICAgdGhlIFNSQ19VUkkgdG8gcG9pbnQgdG8gYSBuZXcgaG9zdC4gSWYg
aW4gYW55IGRvdWJ0IHRoZW4geW91DQo+ID4gICAgICAgICBzaG91bGQgaW5jcmVhc2UgdGhlIFBS
IHJlZ2FyZGxlc3Mgb2Ygd2hhdCBoYXMgYmVlbiBjaGFuZ2VkLg0KPiA+DQo+ID4gICAgICAgICBU
aGUgUFIgdmFsdWUgc2hvdWxkIG5ldmVyIGJlIGRlY3JlbWVudGVkLiBJZiB5b3UgYWNjaWRlbnRh
bGx5DQo+ID4gICAgICAgICBzdWJtaXQgYSBsYXJnZSBQUiB2YWx1ZSBmb3IgZXhhbXBsZSB0aGVu
IGl0IHNob3VsZCBiZSBsZWZ0IGF0DQo+ID4gICAgICAgICB0aGUgdmFsdWUgYW5kIGp1c3QgaW5j
cmVhc2VkIGZvciBuZXcgcmVsZWFzZXMsIG5vdCByZXNldCBiYWNrDQo+IHRvDQo+ID4gICAgICAg
ICBhIGxvd2VyIHZlcnNpb24uDQo+ID4NCj4gPj4+ICtQViA9ICIwLjcuMyswLjguMC1yYyINCj4g
Pj4+ICtQUl9hcHBlbmQgPSAiK2dpdHIke1NSQ1BWfSINCj4gPj4NCj4gPj4gU1JDUFYgc2hvdWxk
IG5vdCBiZSB1c2VkIGluIFBSIChldmVuIGlmIGl0J3MgYmVlbiBjb3BpZWQgZnJvbQ0KPiBhbm90
aGVyDQo+ID4+IHJlY2lwZSB3aGljaCBkb2VzIGl0IHdyb25nKS4NCj4gPg0KPiA+IEkgYW0gc3Rp
bGwgY29uZnVzZWQgYWJvdXQgdGhpcyBvbmUuIFRoYXQgaXMgd2h5IEkgc3RpbGwgaGF2ZSBub3QN
Cj4gPiBjb21taXR0ZWQgdGhlIHBrZy1jb25maWcgcGF0Y2ggeWV0IFsyXS4gQ291bGQgdGhlIHJp
Z2h0IHdheSBiZQ0KPiA+IGRvY3VtZW50ZWQgaW4gdGhlIG1hbnVhbC4NCj4gDQo+IEl0IGlzIGNv
bXBsZXRlbHkgT0sgdG8gdXNlIGl0IGluIFBSIGlmIHlvdSB3YW50IHRoZSBoYXNoIGluIFBSLCBi
dXQgbm90DQo+IFBWLg0KPiAtLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQ0KPiBWZXJzaW9u
OiBHbnVQRyB2MS40LjUgKERhcndpbikNCj4gDQo+IGlEOERCUUZOM1E1ZE1reUdNNjRSR3BFUkFo
d2hBS0NLeG8vSGRiallZOTBKSFdiZ3R5aUdDTXdMRlFDZ2lhUmENCj4gSEIxQU1STUZhUy9yNCtp
RjZTNndhNU09DQo+ID1YSTRkDQo+IC0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0KPiANCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9w
ZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K


