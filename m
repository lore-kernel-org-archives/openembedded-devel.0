Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2693872F5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 02:06:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16837832"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Mar 2017 10:06:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C2C04D14A5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:06:09 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Wed, 22 Mar 2017 10:06:09 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-jethro] [meta-xfce][PATCH] imsettings: move to
	correct directory
Thread-Index: AQHSXNiMdTdEPC0UpUW5vlxSwZ5KLqEU921A///T4ACABKzm0ICHKe2Q
Date: Wed, 22 Mar 2017 02:06:08 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01275E54DB@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE5B81EC@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20161223101558.GA3294@jama>
	<1B56A49860EB2D45ADE3731B15C959FDFE5B87B9@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE5B87B9@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4C2C04D14A5E.AC216
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
X-List-Received-Date: Wed, 22 Mar 2017 02:06:18 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGmBQw0KDQpXaHkgdGhpcyBwYXRjaCBoYXNuJ3QgYmVlbiBtZXJnZWQgdG8g
amV0aHJvIGFuZCBrcm9nb3RoIGJyYW5jaD8NCg0KQmVzdCByZWdhcmRzDQpM
ZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtDQo+IGRldmVsLWJvdW5jZXNA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIExlaSwgTWFv
aHVpDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMjYsIDIwMTYgOTo0NCBB
TQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW29lLWpldGhyb10gW21ldGEt
eGZjZV1bUEFUQ0hdIGltc2V0dGluZ3M6IG1vdmUgdG8gY29ycmVjdA0KPiBk
aXJlY3RvcnkNCj4gDQo+IA0KPiA+IEl0J3MgbmVlZGVkIGluIGtyb2dvdGgg
YXMgd2VsbCwgaXNuJ3QgaXQ/DQo+IA0KPiBJJ20gc29ycnkgSSBkaWRuJ3Qg
bm90aWNlIGtyb2dvdGguIFllcywgVGhpcyBwYXRjaCdzIG5lZWRlZCBpbiBr
cm9nb3RoIGFzIHdlbGwuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzDQo+IExl
aQ0KPiANCj4gDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNl
c0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gW21haWx0bzpvcGVuZW1i
ZWRkZWQtIGRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10g
T24gQmVoYWxmDQo+ID4gT2YgTWFydGluIEphbnNhDQo+ID4gU2VudDogRnJp
ZGF5LCBEZWNlbWJlciAyMywgMjAxNiA2OjE2IFBNDQo+ID4gVG86IG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gU3Vi
amVjdDogUmU6IFtvZV0gW29lLWpldGhyb10gW21ldGEteGZjZV1bUEFUQ0hd
IGltc2V0dGluZ3M6IG1vdmUgdG8NCj4gPiBjb3JyZWN0IGRpcmVjdG9yeQ0K
PiA+DQo+ID4gT24gRnJpLCBEZWMgMjMsIDIwMTYgYXQgMDQ6NTc6NThBTSAr
MDAwMCwgTGVpLCBNYW9odWkgd3JvdGU6DQo+ID4gPiBIaSBhcm1pbg0KPiA+
ID4NCj4gPiA+IFBsZWFzZSBtZXJnZSB0aGlzIHBhdGNoIHRvIGpldGhyby4N
Cj4gPg0KPiA+IEl0J3MgbmVlZGVkIGluIGtyb2dvdGggYXMgd2VsbCwgaXNu
J3QgaXQ/DQo+ID4NCj4gPiA+DQo+ID4gPiBCZXN0IHJlZ2FyZHMuDQo+ID4g
PiBMZWkNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gPiA+IEZyb206IExlaSwgTWFvaHVpDQo+ID4gPiA+IFNlbnQ6
IEZyaWRheSwgRGVjZW1iZXIgMjMsIDIwMTYgMTI6NDMgUE0NCj4gPiA+ID4g
VG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gPiA+IENjOiBMZWksIE1hb2h1aQ0KPiA+ID4gPiBTdWJqZWN0OiBb
b2UtamV0aHJvXSBbbWV0YS14ZmNlXVtQQVRDSF0gaW1zZXR0aW5nczogbW92
ZSB0bw0KPiA+ID4gPiBjb3JyZWN0IGRpcmVjdG9yeQ0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24u
ZnVqaXRzdS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2ltc2V0
dGluZ3MveyA9PiBpbXNldHRpbmdzfS9ndGstaXMtcmVxdWlyZWQtYnktbm90
aWZ5LnBhdGNoDQo+ID4gfCAwDQo+ID4gPiA+DQo+ID4gPiA+IC4uLi9tdWx0
aS1saW5lLUFDTE9DQUxfQU1GTEFHUy1pc25vdC1zdXBwb3J0ZWQtYnktYXV0
b3JlY29uZi5wYXRjaA0KPiA+IHwgMA0KPiA+ID4gPiAgbWV0YS14ZmNlL3Jl
Y2lwZXMtZXh0ZW5kZWQveyA9PiBpbXNldHRpbmdzfS9pbXNldHRpbmdzXzEu
Ni44LmJiDQo+ID4gfCAwDQo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDAg
aW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkgIHJlbmFtZQ0KPiA+ID4g
PiBtZXRhLXhmY2UvcmVjaXBlcy0gZXh0ZW5kZWQvaW1zZXR0aW5ncy97ID0+
DQo+ID4gPiA+IGltc2V0dGluZ3N9L2d0ay1pcy1yZXF1aXJlZC1ieS1ub3Rp
ZnkucGF0Y2ggKDEwMCUpIHJlbmFtZQ0KPiA+ID4gPiBtZXRhLXhmY2UvcmVj
aXBlcy1leHRlbmRlZC9pbXNldHRpbmdzL3sgPT4gaW1zZXR0aW5nc30vbXVs
dGktbGluZS0NCj4gPiA+ID4gQUNMT0NBTF9BTUZMQUdTLWlzbm90LXN1cHBv
cnRlZC1ieS1hdXRvcmVjb25mLnBhdGNoICgxMDAlKSAgcmVuYW1lDQo+ID4g
PiA+IG1ldGEtIHhmY2UvcmVjaXBlcy1leHRlbmRlZC97ID0+IGltc2V0dGlu
Z3N9L2ltc2V0dGluZ3NfMS42LjguYmINCj4gPiA+ID4gKDEwMCUpDQo+ID4g
PiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9tZXRhLXhmY2Uv
cmVjaXBlcy1leHRlbmRlZC9pbXNldHRpbmdzL2d0ay1pcy1yZXF1aXJlZC1i
eS0NCj4gPiA+ID4gbm90aWZ5LnBhdGNoDQo+ID4gPiA+IGIvbWV0YS14ZmNl
L3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9pbXNldHRpbmdzL2d0ay1p
cy0NCj4gPiA+ID4gcmVxdWlyZWQtYnktbm90aWZ5LnBhdGNoDQo+ID4gPiA+
IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiA+ID4gPiByZW5hbWUgZnJvbQ0K
PiA+ID4gPiBtZXRhLXhmY2UvcmVjaXBlcy1leHRlbmRlZC9pbXNldHRpbmdz
L2d0ay1pcy1yZXF1aXJlZC1ieS0NCj4gPiA+ID4gbm90aWZ5LnBhdGNoDQo+
ID4gPiA+IHJlbmFtZSB0bw0KPiA+ID4gPiBtZXRhLXhmY2UvcmVjaXBlcy1l
eHRlbmRlZC9pbXNldHRpbmdzL2ltc2V0dGluZ3MvZ3RrLWlzLXJlcXVpcmVk
LWINCj4gPiA+ID4geS0NCj4gPiA+ID4gbm90aWZ5LnBhdGNoDQo+ID4gPiA+
IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9tZXRhLXhmY2UvcmVjaXBlcy1leHRl
bmRlZC9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NBTF9BTUZMQUdTDQo+
ID4gPiA+IC0gaXNub3Qtc3VwcG9ydGVkLWJ5LWF1dG9yZWNvbmYucGF0Y2gg
Yi9tZXRhLXhmY2UvcmVjaXBlcy0NCj4gPiA+ID4gZXh0ZW5kZWQvaW1zZXR0
aW5ncy9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NBTF9BTUZMQUdTLWlz
bm90LXN1DQo+ID4gPiA+IHBwDQo+ID4gPiA+IG9ydGVkLWJ5LQ0KPiA+ID4g
PiBhdXRvcmVjb25mLnBhdGNoDQo+ID4gPiA+IHNpbWlsYXJpdHkgaW5kZXgg
MTAwJQ0KPiA+ID4gPiByZW5hbWUgZnJvbQ0KPiA+ID4gPiBtZXRhLXhmY2Uv
cmVjaXBlcy1leHRlbmRlZC9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NB
TF9BTUZMQUdTLQ0KPiA+ID4gPiBpc25vdC1zdXBwb3J0ZWQtYnktYXV0b3Jl
Y29uZi5wYXRjaA0KPiA+ID4gPiByZW5hbWUgdG8NCj4gPiA+ID4gbWV0YS14
ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9pbXNldHRpbmdzL211
bHRpLWxpbmUtDQo+ID4gPiA+IEFDTE9DQUxfQU1GTEFHUy1pc25vdC1zdXBw
b3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5nc18xLjYu
OC5iYg0KPiA+ID4gPiBiL21ldGEtIHhmY2UvcmVjaXBlcy1leHRlbmRlZC9p
bXNldHRpbmdzL2ltc2V0dGluZ3NfMS42LjguYmINCj4gPiA+ID4gc2ltaWxh
cml0eSBpbmRleCAxMDAlDQo+ID4gPiA+IHJlbmFtZSBmcm9tIG1ldGEteGZj
ZS9yZWNpcGVzLWV4dGVuZGVkL2ltc2V0dGluZ3NfMS42LjguYmINCj4gPiA+
ID4gcmVuYW1lIHRvDQo+ID4gPiA+IG1ldGEteGZjZS9yZWNpcGVzLWV4dGVu
ZGVkL2ltc2V0dGluZ3MvaW1zZXR0aW5nc18xLjYuOC5iYg0KPiA+ID4gPiAt
LQ0KPiA+ID4gPiAxLjguNC4yDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4g
PiAtLQ0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWls
aW5nIGxpc3QNCj4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiA+
DQo+ID4gLS0NCj4gPiBNYXJ0aW4gJ0phTWEnIEphbnNhICAgICBqYWJiZXI6
IE1hcnRpbi5KYW5zYUBnbWFpbC5jb20NCj4gDQo+IA0KPiAtLQ0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLWRldmVsDQoKCg==

