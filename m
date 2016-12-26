Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D575D60290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 01:43:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14253462"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Dec 2016 09:43:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EDF2F46704BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 09:43:37 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Mon, 26 Dec 2016 09:43:42 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-jethro] [meta-xfce][PATCH] imsettings: move to
	correct directory
Thread-Index: AQHSXNiMdTdEPC0UpUW5vlxSwZ5KLqEU921A///T4ACABKzm0A==
Date: Mon, 26 Dec 2016 01:43:41 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE5B87B9@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE5B81EC@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20161223101558.GA3294@jama>
In-Reply-To: <20161223101558.GA3294@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: EDF2F46704BE.ACADA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct directory
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
X-List-Received-Date: Mon, 26 Dec 2016 01:43:52 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

DQo+IEl0J3MgbmVlZGVkIGluIGtyb2dvdGggYXMgd2VsbCwgaXNuJ3QgaXQ/
DQoNCkknbSBzb3JyeSBJIGRpZG4ndCBub3RpY2Uga3JvZ290aC4gWWVzLCBU
aGlzIHBhdGNoJ3MgbmVlZGVkIGluIGtyb2dvdGggYXMgd2VsbC4NCg0KDQpC
ZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRl
ZC0NCj4gZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBP
biBCZWhhbGYgT2YgTWFydGluIEphbnNhDQo+IFNlbnQ6IEZyaWRheSwgRGVj
ZW1iZXIgMjMsIDIwMTYgNjoxNiBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtv
ZV0gW29lLWpldGhyb10gW21ldGEteGZjZV1bUEFUQ0hdIGltc2V0dGluZ3M6
IG1vdmUgdG8gY29ycmVjdA0KPiBkaXJlY3RvcnkNCj4gDQo+IE9uIEZyaSwg
RGVjIDIzLCAyMDE2IGF0IDA0OjU3OjU4QU0gKzAwMDAsIExlaSwgTWFvaHVp
IHdyb3RlOg0KPiA+IEhpIGFybWluDQo+ID4NCj4gPiBQbGVhc2UgbWVyZ2Ug
dGhpcyBwYXRjaCB0byBqZXRocm8uDQo+IA0KPiBJdCdzIG5lZWRlZCBpbiBr
cm9nb3RoIGFzIHdlbGwsIGlzbid0IGl0Pw0KPiANCj4gPg0KPiA+IEJlc3Qg
cmVnYXJkcy4NCj4gPiBMZWkNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExlaSwgTWFvaHVpDQo+ID4gPiBT
ZW50OiBGcmlkYXksIERlY2VtYmVyIDIzLCAyMDE2IDEyOjQzIFBNDQo+ID4g
PiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiA+IENjOiBMZWksIE1hb2h1aQ0KPiA+ID4gU3ViamVjdDogW29l
LWpldGhyb10gW21ldGEteGZjZV1bUEFUQ0hdIGltc2V0dGluZ3M6IG1vdmUg
dG8gY29ycmVjdA0KPiA+ID4gZGlyZWN0b3J5DQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3Uu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4uL2ltc2V0dGluZ3MveyA9PiBp
bXNldHRpbmdzfS9ndGstaXMtcmVxdWlyZWQtYnktbm90aWZ5LnBhdGNoDQo+
IHwgMA0KPiA+ID4gIC4uLi9tdWx0aS1saW5lLUFDTE9DQUxfQU1GTEFHUy1p
c25vdC1zdXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0KPiB8IDANCj4g
PiA+ICBtZXRhLXhmY2UvcmVjaXBlcy1leHRlbmRlZC97ID0+IGltc2V0dGlu
Z3N9L2ltc2V0dGluZ3NfMS42LjguYmINCj4gfCAwDQo+ID4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pICBy
ZW5hbWUNCj4gPiA+IG1ldGEteGZjZS9yZWNpcGVzLSBleHRlbmRlZC9pbXNl
dHRpbmdzL3sgPT4NCj4gPiA+IGltc2V0dGluZ3N9L2d0ay1pcy1yZXF1aXJl
ZC1ieS1ub3RpZnkucGF0Y2ggKDEwMCUpIHJlbmFtZQ0KPiA+ID4gbWV0YS14
ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy97ID0+IGltc2V0dGlu
Z3N9L211bHRpLWxpbmUtDQo+ID4gPiBBQ0xPQ0FMX0FNRkxBR1MtaXNub3Qt
c3VwcG9ydGVkLWJ5LWF1dG9yZWNvbmYucGF0Y2ggKDEwMCUpICByZW5hbWUN
Cj4gPiA+IG1ldGEtIHhmY2UvcmVjaXBlcy1leHRlbmRlZC97ID0+IGltc2V0
dGluZ3N9L2ltc2V0dGluZ3NfMS42LjguYmINCj4gPiA+ICgxMDAlKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEvbWV0YS14ZmNlL3JlY2lw
ZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9ndGstaXMtcmVxdWlyZWQtYnktDQo+
ID4gPiBub3RpZnkucGF0Y2gNCj4gPiA+IGIvbWV0YS14ZmNlL3JlY2lwZXMt
ZXh0ZW5kZWQvaW1zZXR0aW5ncy9pbXNldHRpbmdzL2d0ay1pcy0NCj4gPiA+
IHJlcXVpcmVkLWJ5LW5vdGlmeS5wYXRjaA0KPiA+ID4gc2ltaWxhcml0eSBp
bmRleCAxMDAlDQo+ID4gPiByZW5hbWUgZnJvbQ0KPiA+ID4gbWV0YS14ZmNl
L3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9ndGstaXMtcmVxdWlyZWQt
YnktDQo+ID4gPiBub3RpZnkucGF0Y2gNCj4gPiA+IHJlbmFtZSB0bw0KPiA+
ID4gbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9pbXNl
dHRpbmdzL2d0ay1pcy1yZXF1aXJlZC1ieS0NCj4gPiA+IG5vdGlmeS5wYXRj
aA0KPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gYS9tZXRhLXhmY2UvcmVjaXBl
cy1leHRlbmRlZC9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NBTF9BTUZM
QUdTLQ0KPiA+ID4gaXNub3Qtc3VwcG9ydGVkLWJ5LWF1dG9yZWNvbmYucGF0
Y2ggYi9tZXRhLXhmY2UvcmVjaXBlcy0NCj4gPiA+IGV4dGVuZGVkL2ltc2V0
dGluZ3MvaW1zZXR0aW5ncy9tdWx0aS1saW5lLUFDTE9DQUxfQU1GTEFHUy1p
c25vdC1zdXBwDQo+ID4gPiBvcnRlZC1ieS0NCj4gPiA+IGF1dG9yZWNvbmYu
cGF0Y2gNCj4gPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiA+ID4gcmVu
YW1lIGZyb20NCj4gPiA+IG1ldGEteGZjZS9yZWNpcGVzLWV4dGVuZGVkL2lt
c2V0dGluZ3MvbXVsdGktbGluZS1BQ0xPQ0FMX0FNRkxBR1MtDQo+ID4gPiBp
c25vdC1zdXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0KPiA+ID4gcmVu
YW1lIHRvDQo+ID4gPiBtZXRhLXhmY2UvcmVjaXBlcy1leHRlbmRlZC9pbXNl
dHRpbmdzL2ltc2V0dGluZ3MvbXVsdGktbGluZS0NCj4gPiA+IEFDTE9DQUxf
QU1GTEFHUy1pc25vdC1zdXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0K
PiA+ID4gZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLWV4dGVuZGVk
L2ltc2V0dGluZ3NfMS42LjguYmIgYi9tZXRhLQ0KPiA+ID4geGZjZS9yZWNp
cGVzLWV4dGVuZGVkL2ltc2V0dGluZ3MvaW1zZXR0aW5nc18xLjYuOC5iYg0K
PiA+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+ID4gPiByZW5hbWUgZnJv
bSBtZXRhLXhmY2UvcmVjaXBlcy1leHRlbmRlZC9pbXNldHRpbmdzXzEuNi44
LmJiDQo+ID4gPiByZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5k
ZWQvaW1zZXR0aW5ncy9pbXNldHRpbmdzXzEuNi44LmJiDQo+ID4gPiAtLQ0K
PiA+ID4gMS44LjQuMg0KPiA+DQo+ID4NCj4gPg0KPiA+IC0tDQo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gT3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBo
dHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5lbWJlZGRlZC1kZXZlbA0KPiANCj4gLS0NCj4gTWFydGluICdKYU1h
JyBKYW5zYSAgICAgamFiYmVyOiBNYXJ0aW4uSmFuc2FAZ21haWwuY29tDQoK
Cg==

