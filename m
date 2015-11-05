Return-Path: <henry.bruce@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AEDDD75A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 19:21:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 05 Nov 2015 11:21:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="594711100"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2015 11:21:36 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.77]) by
	ORSMSX107.amr.corp.intel.com ([169.254.1.197]) with mapi id
	14.03.0248.002; Thu, 5 Nov 2015 11:21:35 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] openjdk-7 and gcc v5
Thread-Index: AdESnZ0dnPu3CKC7S3uLnmy1oEzhfgASRiOAAPAPEoAAApsgAABkMOyA
Date: Thu, 5 Nov 2015 19:21:33 +0000
Message-ID: <1446751249.32751.24.camel@intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
	<CAMKF1sqT-fxjZ5TPMrDEGjMq7MVttucqjDxUf7vp4zVdwusw2A@mail.gmail.com>
	<1446574645.32751.9.camel@intel.com>
	<E01AAF5B-5430-4028-948C-767910413B51@gmail.com>
In-Reply-To: <E01AAF5B-5430-4028-948C-767910413B51@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.173]
MIME-Version: 1.0
Subject: Re: openjdk-7 and gcc v5
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
X-List-Received-Date: Thu, 05 Nov 2015 19:21:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCCA0B813E494C42BDAB898FE958FF9E@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE1LTExLTAzIGF0IDExOjMyIC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiBP
biBOb3YgMywgMjAxNSwgYXQgMTA6MTggQU0sIEJydWNlLCBIZW5yeSA8aGVucnkuYnJ1Y2VAaW50
ZWwuY29tPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFRodSwgMjAxNS0xMC0yOSBhdCAxNzo0
MyAtMDcwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE9jdCAyOSwgMjAxNSBhdCA0
OjAwIFBNLCBCcnVjZSwgSGVucnkgPA0KPiA+ID4gaGVucnkuYnJ1Y2VAaW50ZWwuY29tPg0KPiA+
ID4gd3JvdGU6DQo+ID4gPiA+IE1hbnkgdGhhbmtzIHRvIGNvbnRyaWJ1dG9ycyB3aG8gZml4ZWQg
b3BlbmpkayBidWlsZCBpc3N1ZXMNCj4gPiA+ID4gaW50cm9kdWNlZCBieSBnY2MgdjUgYW5kIGZv
ciBtYWludGFpbmVycyBmb3IgcHVzaGluZyB0aGUNCj4gPiA+ID4gdXBkYXRlcy4NCj4gPiA+ID4g
SG93ZXZlciBvbmUgcHJvYmxlbSByZW1haW5zOiBvcGVuamRrIGJ1aWxkIGZhaWxzIGluDQo+ID4g
PiA+IG9wZW5qZGsvamRrL21ha2UvamF2YS9uaW8gZHVlIHRvIC1zdGF0aWMgY29tcGlsZXIgZmxh
ZyBiZWluZw0KPiA+ID4gPiB1c2VkDQo+ID4gPiA+IGluIGNvbmp1bmN0aW9uIHdpdGggLXB0aHJl
YWQgZ2l2aW5nIGVycm9yDQo+ID4gPiA+IC91c3IvYmluL2xkOiBjYW5ub3QgZmluZCAtbHB0aHJl
YWQNCj4gPiA+ID4gL3Vzci9iaW4vbGQ6IGNhbm5vdCBmaW5kIC1sYw0KPiA+ID4gPiANCj4gPiA+
IA0KPiA+ID4gaXRzIG5vdCBjbGVhciBob3cgdGhlIC1zdGF0aWMgZmxhZyBjYW4gY2F1c2UgdGhp
cy4gbWF5IGJlIGl0cw0KPiA+ID4gdXNpbmcNCj4gPiA+IENDIGZvciBMRCBvciB3aXNlIHZlcnNh
ID8NCj4gPiANCj4gPiBOb3QgY2xlYXIgdG8gbWUgZWl0aGVyLCBidXQgaWYgeW91IGNyZWF0ZSBh
IHNpbXBsZSBmaWxlLCBzYXkgdGVzdC5jDQo+ID4gDQo+ID4gaW50IG1haW4oKQ0KPiA+IHsNCj4g
PiAgcmV0dXJuIDA7DQo+ID4gfQ0KPiA+IA0KPiA+IGFuZCBjb21waWxlIHdpdGggZ2NjIHRlc3Qu
YyAtcHRocmVhZCAtc3RhdGljDQo+ID4gaXQgZmFpbHMgYXMgZm9sbG93cyB3aXRoIGdjYyB2NQ0K
PiA+IC91c3IvYmluL2xkOiBjYW5ub3QgZmluZCAtbHB0aHJlYWQNCj4gPiAvdXNyL2Jpbi9sZDog
Y2Fubm90IGZpbmQgLWxjDQo+ID4gDQo+ID4gYnV0IGNvbXBpbGVzIE9LIHdpdGggZWFybGllciB2
ZXJzaW9ucyBvZiBnY2MuDQo+IA0KPiBpc27igJl0IHRoaXMgZ2NjIG9uIHlvdXIgYnVpbGQgaG9z
dCA/DQoNClllcywgaXQgaXMgdGhlIGdjYyBvbiBteSBidWlsZCBob3N0LiANClRoZSBvcGVuamRr
IHJlY2lwZSBjYXVzZXMgdGhpcyBzcGVjaWZpYyBtYWtlZmlsZSB0byBidWlsZCB3aXRoDQoke0ND
X0ZPUl9CVUlMRH0gd2hpY2ggaXMgImdjYyIgbm90ICR7Q0N9LiANCg0KDQo+IA0KPiANCj4gPiAN
Cj4gPiA+IA0KPiA+ID4gPiBJIGZpeGVkIHRoaXMgYnkgcmVtb3ZpbmcgLXN0YXRpYyBmbGFnIGZy
b20gTWFrZWZpbGUuIE5vdCBzdXJlDQo+ID4gPiA+IG9mDQo+ID4gPiA+IHRoaXMgd2FzIHRoZSBy
aWdodCB0aGluZyB0byBkbyAoc28gSSBkaWRuJ3Qgc3VibWl0IHBhdGNoKSBidXQNCj4gPiA+ID4g
aXQNCj4gPiA+ID4gd29ya2VkIGZvciBtZS4NCj4gPiA+ID4gSSBhZGRlZCB0aGUgZm9sbG93aW5n
IHRvIHRoZSBhbiBvcGVuamRrIGJiYXBwZW5kIGFuZCBpdCBmaXhlZA0KPiA+ID4gPiB0aGUNCj4g
PiA+ID4gYnVpbGQgYW5kIHJlc3VsdGluZyBqcmUgaXMgcnVubmluZyBPSy4NCj4gPiA+ID4gDQo+
ID4gPiA+IGRvX2NvbmZpZ3VyZV9hcHBlbmQoKSB7DQo+ID4gPiA+ICAgICAgICBnY2MgLXYgMj4m
MSB8IGdyZXAgNVwuLg0KPiA+ID4gPiAgICAgICAgaWYgWyAiJD8iID09ICIwIiBdOyB0aGVuDQo+
ID4gPiANCj4gPiA+IHdoeSB0aGlzIGNoZWNrIGZvciBnY2MgPw0KPiA+IA0KPiA+IEl0IG9ubHkg
ZmFpbHMgd2l0aCBnY2MgdjUsIHNvIGlmIGl0J3Mgbm90IGJyb2tlbiwgZG9uJ3QgZml4IGl0Li4u
DQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gICAgICAgICAgICAgICAgc2VkIC1pIHMvLXN0YXRpYy8v
DQo+ID4gPiA+ICR7Qn0vb3Blbmpkay9qZGsvbWFrZS9qYXZhL25pby9NYWtlZmlsZQ0KPiA+ID4g
PiAgICAgICAgZmkNCj4gPiA+ID4gfQ0KPiA+ID4gPiANCj4gPiA+ID4gUmVnYXJkcywNCj4gPiA+
ID4gDQo+ID4gPiA+IEhlbnJ5IEJydWNlDQo+ID4gPiA+IA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+ID4gPiBP
cGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gPiA+IE9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldg0KPiA+ID4gPiBlbA0KPiA+
IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiANCj4gLS0gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJl
ZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWw=

