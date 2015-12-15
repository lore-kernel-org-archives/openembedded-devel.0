Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 399296FFDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:06:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBFA6sZ3019152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 02:06:54 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.84]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Tue, 15 Dec 2015 02:06:53 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] openjdk-7 and gcc v5
Thread-Index: AdESnZ0dnPu3CKC7S3uLnmy1oEzhfgASRiOAAPAPEoAAApsgAABkMOyAB7dRoyA=
Date: Tue, 15 Dec 2015 10:06:52 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C76C405@ALA-MBA.corp.ad.wrs.com>
References: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
	<CAMKF1sqT-fxjZ5TPMrDEGjMq7MVttucqjDxUf7vp4zVdwusw2A@mail.gmail.com>
	<1446574645.32751.9.camel@intel.com>
	<E01AAF5B-5430-4028-948C-767910413B51@gmail.com>
	<1446751249.32751.24.camel@intel.com>
In-Reply-To: <1446751249.32751.24.camel@intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.144]
MIME-Version: 1.0
Subject: Re: openjdk-7 and gcc v5
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
X-List-Received-Date: Tue, 15 Dec 2015 10:06:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC1k
ZXZlbC0NCj4gYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgQnJ1
Y2UsIEhlbnJ5DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMDYsIDIwMTUgMzoyMiBBTQ0KPiBU
bzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtvZV0gb3Blbmpkay03IGFuZCBnY2MgdjUNCj4gDQo+IE9uIFR1ZSwgMjAxNS0xMS0wMyBh
dCAxMTozMiAtMDgwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiBPbiBOb3YgMywgMjAxNSwgYXQg
MTA6MTggQU0sIEJydWNlLCBIZW5yeSA8aGVucnkuYnJ1Y2VAaW50ZWwuY29tPg0KPiA+ID4gd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gT24gVGh1LCAyMDE1LTEwLTI5IGF0IDE3OjQzIC0wNzAwLCBLaGVt
IFJhaiB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBPY3QgMjksIDIwMTUgYXQgNDowMCBQTSwgQnJ1
Y2UsIEhlbnJ5IDwNCj4gPiA+ID4gaGVucnkuYnJ1Y2VAaW50ZWwuY29tPg0KPiA+ID4gPiB3cm90
ZToNCj4gPiA+ID4gPiBNYW55IHRoYW5rcyB0byBjb250cmlidXRvcnMgd2hvIGZpeGVkIG9wZW5q
ZGsgYnVpbGQgaXNzdWVzDQo+ID4gPiA+ID4gaW50cm9kdWNlZCBieSBnY2MgdjUgYW5kIGZvciBt
YWludGFpbmVycyBmb3IgcHVzaGluZyB0aGUNCj4gPiA+ID4gPiB1cGRhdGVzLg0KPiA+ID4gPiA+
IEhvd2V2ZXIgb25lIHByb2JsZW0gcmVtYWluczogb3BlbmpkayBidWlsZCBmYWlscyBpbg0KPiA+
ID4gPiA+IG9wZW5qZGsvamRrL21ha2UvamF2YS9uaW8gZHVlIHRvIC1zdGF0aWMgY29tcGlsZXIg
ZmxhZyBiZWluZw0KPiA+ID4gPiA+IHVzZWQNCj4gPiA+ID4gPiBpbiBjb25qdW5jdGlvbiB3aXRo
IC1wdGhyZWFkIGdpdmluZyBlcnJvcg0KPiA+ID4gPiA+IC91c3IvYmluL2xkOiBjYW5ub3QgZmlu
ZCAtbHB0aHJlYWQNCj4gPiA+ID4gPiAvdXNyL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxjDQo+ID4g
PiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gaXRzIG5vdCBjbGVhciBob3cgdGhlIC1zdGF0aWMgZmxh
ZyBjYW4gY2F1c2UgdGhpcy4gbWF5IGJlIGl0cw0KPiA+ID4gPiB1c2luZw0KPiA+ID4gPiBDQyBm
b3IgTEQgb3Igd2lzZSB2ZXJzYSA/DQo+ID4gPg0KPiA+ID4gTm90IGNsZWFyIHRvIG1lIGVpdGhl
ciwgYnV0IGlmIHlvdSBjcmVhdGUgYSBzaW1wbGUgZmlsZSwgc2F5IHRlc3QuYw0KPiA+ID4NCj4g
PiA+IGludCBtYWluKCkNCj4gPiA+IHsNCj4gPiA+ICByZXR1cm4gMDsNCj4gPiA+IH0NCj4gPiA+
DQo+ID4gPiBhbmQgY29tcGlsZSB3aXRoIGdjYyB0ZXN0LmMgLXB0aHJlYWQgLXN0YXRpYw0KPiA+
ID4gaXQgZmFpbHMgYXMgZm9sbG93cyB3aXRoIGdjYyB2NQ0KPiA+ID4gL3Vzci9iaW4vbGQ6IGNh
bm5vdCBmaW5kIC1scHRocmVhZA0KPiA+ID4gL3Vzci9iaW4vbGQ6IGNhbm5vdCBmaW5kIC1sYw0K
PiA+ID4NCj4gPiA+IGJ1dCBjb21waWxlcyBPSyB3aXRoIGVhcmxpZXIgdmVyc2lvbnMgb2YgZ2Nj
Lg0KPiA+DQo+ID4gaXNu4oCZdCB0aGlzIGdjYyBvbiB5b3VyIGJ1aWxkIGhvc3QgPw0KPiANCj4g
WWVzLCBpdCBpcyB0aGUgZ2NjIG9uIG15IGJ1aWxkIGhvc3QuDQo+IFRoZSBvcGVuamRrIHJlY2lw
ZSBjYXVzZXMgdGhpcyBzcGVjaWZpYyBtYWtlZmlsZSB0byBidWlsZCB3aXRoDQo+ICR7Q0NfRk9S
X0JVSUxEfSB3aGljaCBpcyAiZ2NjIiBub3QgJHtDQ30uDQoNCkkgdGhpbmsgaXQncyBub3QgcmVs
YXRlZCB0byB0aGUgZ2NjIHZlcnNpb24sIEkgbWV0IHRoaXMgZXJyb3IgaW4gbXkgaG9zdCB3aXRo
DQpnY2MgNC40LjcsIGl0J3MgYmVjYXVzZSB0aGUgc3RhdGljIGxpYnJhcnkgbGlicHRocmVhZC5h
IGlzIG5vdCBpbnN0YWxsZWQuDQoNClRoZSAiLXN0YXRpYyIgb3B0aW9uIHdhcyBhZGRlZCBieSB0
aGUgcGF0Y2ggaWNlZHRlYS1qZGstYnVpbGQtbmlvLWdlbnNvci1nZW51Yy1nZW5zYy1zdGF0aWMu
cGF0Y2gNCndoaWNoIEkgdGhpbmsgaXMgaW5hcHByb3ByaWF0ZSBhbmQgbm8gZXZpZGVuY2Ugb3Ig
Y29tbWVudHMgZXhwbGFpbmluZyB3aHkgaXQgbmVlZHMgc3RhdGljIGJ1aWxkcywNCnNvIEkgc2Vu
dCBhIHBhdGNoIHRvIGRyb3AgdGhlIHBhdGNoLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4g
DQo+ID4NCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiBJIGZpeGVkIHRoaXMgYnkgcmVt
b3ZpbmcgLXN0YXRpYyBmbGFnIGZyb20gTWFrZWZpbGUuIE5vdCBzdXJlDQo+ID4gPiA+ID4gb2YN
Cj4gPiA+ID4gPiB0aGlzIHdhcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gKHNvIEkgZGlkbid0IHN1
Ym1pdCBwYXRjaCkgYnV0DQo+ID4gPiA+ID4gaXQNCj4gPiA+ID4gPiB3b3JrZWQgZm9yIG1lLg0K
PiA+ID4gPiA+IEkgYWRkZWQgdGhlIGZvbGxvd2luZyB0byB0aGUgYW4gb3BlbmpkayBiYmFwcGVu
ZCBhbmQgaXQgZml4ZWQNCj4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiBidWlsZCBhbmQgcmVzdWx0
aW5nIGpyZSBpcyBydW5uaW5nIE9LLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZG9fY29uZmlndXJl
X2FwcGVuZCgpIHsNCj4gPiA+ID4gPiAgICAgICAgZ2NjIC12IDI+JjEgfCBncmVwIDVcLi4NCj4g
PiA+ID4gPiAgICAgICAgaWYgWyAiJD8iID09ICIwIiBdOyB0aGVuDQo+ID4gPiA+DQo+ID4gPiA+
IHdoeSB0aGlzIGNoZWNrIGZvciBnY2MgPw0KPiA+ID4NCj4gPiA+IEl0IG9ubHkgZmFpbHMgd2l0
aCBnY2MgdjUsIHNvIGlmIGl0J3Mgbm90IGJyb2tlbiwgZG9uJ3QgZml4IGl0Li4uDQo+ID4gPg0K
PiA+ID4gPg0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgIHNlZCAtaSBzLy1zdGF0aWMvLw0KPiA+
ID4gPiA+ICR7Qn0vb3Blbmpkay9qZGsvbWFrZS9qYXZhL25pby9NYWtlZmlsZQ0KPiA+ID4gPiA+
ICAgICAgICBmaQ0KPiA+ID4gPiA+IH0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFJlZ2FyZHMsDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBIZW5yeSBCcnVjZQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLS0N
Cj4gPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+ID4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiA+ID4gPiBP
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiA+IGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRl
dg0KPiA+ID4gPiA+IGVsDQo+ID4gPiAtLQ0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5n
IGxpc3QNCj4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1kZXZlbA0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxp
c3QNCj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVk
LWRldmVsDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

