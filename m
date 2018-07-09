Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A28374C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 06:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8D43C18286;
	Mon,  9 Jul 2018 08:37:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 20DCBjDM6SH4; Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A7142182B0;
	Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 941FE1A05B;
	Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 884021A058;
	Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 7C03C2CDA;
	Mon,  9 Jul 2018 08:37:51 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 9 Jul 2018 08:37:51 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 9 Jul 2018 08:37:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "Yu, Mingli" <mingli.yu@windriver.com>
Thread-Topic: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
Thread-Index: AQHUFC1en3hrElszPEm0gBTg7h6/DKSAqMOAgAEjJoCAAF6YgIAD42UAgAAbRwCAAEmHgA==
Date: Mon, 9 Jul 2018 06:37:51 +0000
Message-ID: <8f9048e33461462790467523f3b89fdf@XBOX02.axis.com>
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
	<CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
	<5B42C73E.6070009@windriver.com>
	<CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
In-Reply-To: <CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 06:37:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IEtoZW0g
UmFqDQo+IFNlbnQ6IGRlbiA5IGp1bGkgMjAxOCAwNjowMg0KPiBUbzogWXUsIE1pbmdsaSA8bWlu
Z2xpLnl1QHdpbmRyaXZlci5jb20+DQo+IENjOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtt
ZXRhLW9lXVtQQVRDSF0gaW96b25lMzogVXBncmFkZSB0byA0ODINCj4gDQo+IE9uIFN1biwgSnVs
IDgsIDIwMTggYXQgNzoyOSBQTSBZdSwgTWluZ2xpIDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gT24gMjAxOOW5tDA35pyIMDbml6UgMjM6MDEsIEtoZW0gUmFqIHdyb3Rl
Og0KPiA+ID4gT24gRnJpLCBKdWwgNiwgMjAxOCBhdCAyOjI3IEFNIFl1LCBNaW5nbGkgPG1pbmds
aS55dUB3aW5kcml2ZXIuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4+IE9uIDIwMTjlubQwN+aciDA2
5pelIDAwOjAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+Pj4gT24gV2VkLCBKdWwgNCwgMjAxOCBh
dCAxMTo1NCBQTSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+ID4+Pj4NCj4g
PiA+Pj4+IEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+DQo+ID4gPj4+
Pg0KPiA+ID4+Pj4gVXBkYXRlIExJQ19GSUxFU19DSEtTVU0gYXMgdGhlIGZpbGUgaW96b25lLmMN
Cj4gPiA+Pj4+IHVzZWQgZm9yIExJQ19GSUxFU19DSEtTVU0gdXBkYXRlZA0KPiA+ID4+Pj4NCj4g
PiA+Pj4NCj4gPiA+Pj4gUGxlYXNlIGRlc2NyaWJlIHdoYXQgaGFzIGNoYW5nZWQgdGhhdCBpcyBj
YXVzaW5nIHRoZSBjaGVja3N1bXMgdG8NCj4gPiA+Pj4gY2hhbmdlLg0KPiA+ID4+DQo+ID4gPj4g
VGhlIHNvdXJjZSBmaWxlIGlvem9uZS5jIGNoYW5nZWQgaGFzIGNhdXNpbmcgdGhlIGNoZWNrc3Vt
IGNoYW5nZS4NCj4gPiA+PiBJIGhhdmUgYWxyZWFkeSBtZW50aW9uIGl0IGluIHRoZSBjb21taXQg
bWVzc2FnZS4NCj4gPiA+DQo+ID4gPiBDb21taXQgbWVzc2FnZSBkb2VzIG5vdCBzYXkgd2hhdCBj
aGFuZ2VkLCAgV2UgYWxyZWFkeSBrbm93DQo+ID4gPiBzb21ldGhpbmcgaGFzIGNoYW5nZWQgdGhh
dHMgY2F1c2luZyB0aGUgY2hlY2tzdW0gY2hhbmdlIGJ1dCBoZXJlIHdlIA0KPiA+ID4gdXN1YWxs
eSBkb2N1bWVudCB3aGF0IGNoYW5nZWQgc3BlY2lmaWNhbGx5LCBwdXJwb3NlIGlzIHRvIGxldCB1
c2VycyANCj4gPiA+IGtub3cgb2YgYW55IGNoYW5nZSBpbiBsaWNlbnNpbmcgcmVxdWlyZW1lbnRz
IHRoYXQgdGhleSBuZWVkIHRvIGJlIA0KPiA+ID4gYXdhcmUgb2YNCj4gPg0KPiA+IFRoYW5rcyBL
aGVtIQ0KPiA+DQo+ID4gSSB3aWxsIHRyeSB0byBsaXN0IHRoZSBjaGFuZ2VzIGluIFYyIGJ1dCBh
Y3R1YWxseSB0aGUgZmlsZSBpb3pvbmUuYw0KPiA+IHVzZWQgZm9yIGNoZWNrc3VtIGlzIHNvdXJj
ZSBmaWxlLiBJdCBoYXMgc28gbXVjaCBjb2RlIGNoYW5nZXMgdW5saWtlIA0KPiA+IHNvbWUgcGFj
a2FnZXMgdXNlIENPUFlSSUdIVCBmaWxlIG9yIFJFQURNRS5tZCBmaWxlIGZvciBjaGVja3N1bS4N
Cj4gDQo+IE9rIHRoYXTigJlzIHByb2JhYmx5IG5vdCBpZGVhbCB0aGVuLiBJdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8ganVzdCB1c2UgdGhlDQo+IG5lZWRlZCBsaW5lcyBmcm9tIGNoZWNrc3VtDQoNClBs
ZWFzZSBub3RlIHRoYXQgaXQgaXMgb25seSBsaW5lIDM3LTQ4IGFuZCAyNjAtMjY2IG9mIGlvem9u
ZS5jIHRoYXQgYXJlIHVzZWQgDQp0byBjYWxjdWxhdGUgdGhlIGNoZWNrc3Vtcy4gSG93ZXZlciwg
SSBndWVzcyB0aGF0IHRoYXQgZHVlIHRvIHRoZSBmYWN0IHRoZXJlIA0KaXMgc291cmNlIGluIGJl
dHdlZW4gbGluZSA0OCBhbmQgMjYwLCBzb21lIGxpbmVzIGhhdmUgYmVlbiBhZGRlZC9yZW1vdmVk
LCBzbyANCnRoYXQgdGhlIGxpbmUgbnVtYmVycyB1c2VkIGluIHRoZSBjaGVja3N1bSBjYWxjdWxh
dGlvbiBhcmUgbm93IG9mZiAob3IgdGhleSANCndlcmUgb2ZmIGFscmVhZHkgYmVmb3JlKS4gTG9v
a2luZyBhdCB0aGUgY3VycmVudCBzb3VyY2UsIG15IGd1ZXNzIGlzIHRoYXQgDQpsaW5lcyAyNjAt
MjY2IHNob3VsZCBiZSBjaGFuZ2VkIHRvIDI2OS0yNzUuDQoNClNvbWVvbmUgc2hvdWxkIHJlYWxs
eSBhc2sgdXBzdHJlYW0gdG8gaW5jbHVkZSBhIExJQ0VOU0UgZmlsZS4uLi4NCg0KPiA+IFRoYW5r
cywNCj4gPg0KPiA+ID4NCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcywNCj4gPiA+Pg0KPiA+ID4+Pg0K
PiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNv
bT4NCj4gPiA+Pj4+IC0tLQ0KPiA+ID4+Pj4gICAgLi4uL2lvem9uZTMve2lvem9uZTNfNDY1LmJi
ID0+IGlvem9uZTNfNDgyLmJifSAgICAgICAgICAgICAgfCA2ICsrKy0tLQ0KPiA+ID4+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+Pj4+
ICAgIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMve2lvem9uZTNfNDY1
LmJiID0+IGlvem9uZTNfNDgyLmJifSAoOTUlKQ0KPiA+ID4+Pj4NCj4gPiA+Pj4+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180NjUuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPiA+Pj4+
IHNpbWlsYXJpdHkgaW5kZXggOTUlDQo+ID4gPj4+PiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lw
ZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180NjUuYmINCj4gPiA+Pj4+IHJlbmFtZSB0byBt
ZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPiA+Pj4+
IGluZGV4IDE5MWI5MzQyNS4uMDkzMDZlMDQ0IDEwMDY0NA0KPiA+ID4+Pj4gLS0tIGEvbWV0YS1v
ZS9yZWNpcGVzLWJlbmNobWFyay9pb3pvbmUzL2lvem9uZTNfNDY1LmJiDQo+ID4gPj4+PiArKysg
Yi9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lvem9uZTMvaW96b25lM180ODIuYmINCj4gPiA+
Pj4+IEBAIC00LDE0ICs0LDE0IEBAIEFVVEhPUiA9ICJEb24gQ2FwcHMgPGRvbi5jYXBwczJAdmVy
aXpvbi5uZXQ+LCBXaWxsaWFtIEQuIE5vcmNvdHQgPHdub3Jjb3R0QHVzLm9yDQo+ID4gPj4+PiAg
U0VDVElPTiA9ICJjb25zb2xlL3Rlc3RzIg0KPiA+ID4+Pj4gIExJQ0VOU0UgPSAiaW96b25lMyIN
Cj4gPiA+Pj4+ICBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9pb3pvbmUuYztiZWdpbmxpbmU9
Mzc7ZW5kbGluZT00ODttZDU9NzMzMTI2MDA5MTg2OGRjYWQwZjllZGVhNzM1YjVmNGIgXA0KPiA+
ID4+Pj4gLSAgICBmaWxlOi8vaW96b25lLmM7YmVnaW5saW5lPTI2MDtlbmRsaW5lPTI2NjttZDU9
NzdmOWVlNTFlNDViNTdhN2U3NTE5YzRmYTBiNGYwMGIgXA0KPiA+ID4+Pj4gKyAgICBmaWxlOi8v
aW96b25lLmM7YmVnaW5saW5lPTI2MDtlbmRsaW5lPTI2NjttZDU9MGFhNDg4ZmQxMzllYWMwNzhi
ZTZlY2E4NmUxNDM1ZTggXA0KPiA+ID4+Pj4gICINCj4gPiA+Pj4+ICBTUkNfVVJJID0gImh0dHA6
Ly93d3cuaW96b25lLm9yZy9zcmMvY3VycmVudC8ke0JQTn1fJHtQVn0udGFyIFwNCj4gPiA+Pj4+
ICAgICAgZmlsZTovL3BhcmFsbGVsaXNtLnBhdGNoIFwNCj4gPiA+Pj4+ICAgICAgZmlsZTovL2Nv
cHlyaWdodC50eHQgXA0KPiA+ID4+Pj4gICINCj4gPiA+Pj4+IC1TUkNfVVJJW21kNXN1bV0gPSAi
YzkyNGU1ZTQ2ZmIxY2Y4MTQ1ZjQyMGU4ZTU3ZWI5NTQiDQo+ID4gPj4+PiAtU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjJlM2Q3MjkxNmU3ZDczNDBhN2M1MDVmYzBjM2QyODU1M2ZjYzVmZjJkYWY0MWQ4
MTEzNjhlNTViZDRlNmEyOTMiDQo+ID4gPj4+PiArU1JDX1VSSVttZDVzdW1dID0gIjMxY2ExZDNk
MjhiYzM3NWMyMGEyODA4MjE3Y2YyMTJjIg0KPiA+ID4+Pj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNzMzZmViNjNjOTZmNzcxNzdjNjhmM2Q5MzhmMjI5NGQ1Mzk0ZDg1NTRiMjc2N2M0NWNiZTEz
OGIyZjNhZTMwIg0KPiA+ID4+Pj4gIA0KPiA+ID4+Pj4gIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
Imlvem9uZTNfKD9QPHB2ZXI+XGQrKS50YXIiDQo+ID4gPj4+PiAgDQo+ID4gPj4+PiAtLQ0KPiA+
ID4+Pj4gMi4xNy4xDQoNCi8vUGV0ZXINCg0K

