Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OuA8L-0000OC-UQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:23:44 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8AKMv22002700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:22:57 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o8AKMuBZ003867
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:22:56 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8AKMuic015571
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:22:56 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 10 Sep 2010 15:22:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Sep 2010 15:22:55 -0500
Thread-Topic: [oe] [PATCHv2] jpeg_8b: Allow using older versions of automake
Thread-Index: ActRIo4PN0M9FUvcTCq2aMDoX29ljAAApWHQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAF54@dlee06.ent.ti.com>
References: <1284141740-24059-1-git-send-email-chase.maupin@ti.com>
	<20100910192032.GK28148@denix.org> <1284148307.3787.4.camel@mattotaupa>
In-Reply-To: <1284148307.3787.4.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 10 Sep 2010 20:23:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFBhdWwg
TWVuemVsDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDEwLCAyMDEwIDI6NTIgUE0NCj4gVG86
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbb2VdIFtQQVRDSHYyXSBqcGVnXzhiOiBBbGxvdyB1c2luZyBvbGRlciB2ZXJzaW9ucyBvZg0K
PiBhdXRvbWFrZQ0KPiANCj4gRGVhciBDaGFzZSwNCj4gDQo+IA0KPiBBbSBGcmVpdGFnLCBkZW4g
MTAuMDkuMjAxMCwgMTU6MjAgLTA0MDAgc2NocmllYiBEZW55cyBEbXl0cml5ZW5rbzoNCj4gPiBP
biBGcmksIFNlcCAxMCwgMjAxMCBhdCAwMTowMjoyMFBNIC0wNTAwLCBDaGFzZSBNYXVwaW4gd3Jv
dGU6DQo+ID4gPiBGcm9tOiBDaGFzZSA8Y2hhc2VAY2hhc2UtbGFwdG9wLihub25lKT4NCj4gDQo+
IHBsZWFzZSBzZXQgdXAgR2l0IG9uIHlvdXIgbGFwdG9wIHdpdGggdGhlIGZvbGxvd2luZyBjb21t
YW5kLg0KPiANCj4gICAgIGdpdCBjb25maWcgdXNlci5uYW1lIENoYXNlIE1hdXBpbg0KPiAgICAg
Z2l0IGNvbmZpZyB1c2VyLmVtYWlsIGNoYXNlbWF1cGluMDNAZ21haWwuY29tDQoNClBhdWwsDQoN
CkknbSBub3Qgc3VyZSBob3cgdGhhdCBGcm9tIGxpbmUgZ290IGluIHRoaXMgbWFpbC4gIE15IG90
aGVyIHBhdGNoZXMgZG9uJ3QgaGF2ZSBpdC4gIEkgaGF2ZSBteSBnaXQgY29uZmlnIHNldCBmb3Ig
dXNlci5lbWFpbCBjaGFzZS5tYXVwaW5AdGkuY29tIChldmVuIHRob3VnaCBJIHNlbmQgdGhyb3Vn
aCBhIGdtYWlsIGFjY291bnQgYmVjYXVzZSBJJ20gbm90IHRyeWluZyB0byBoaWRlIHRoYXQgdGhl
c2UgcGF0Y2hlcyBhcmUgZnJvbSBzb21lb25lIGF0IFRJKS4gIFRoZSB3ZWlyZCB0aGluZyBpcyB0
aGF0IG15IGxhcHRvcCBpcyBteSBXaW5kb3dzIFBDIGFuZCBJIGRvbid0IHNlbmQgcGF0Y2hlcyBm
cm9tIGl0LiAgUGVyaGFwcyB0aGlzIHNudWNrIGluIGJlY2F1c2UgSSByZXNwb25kZWQgdG8gdGhl
IHRocmVhZCBmcm9tIG15IFdpbmRvd3MgUEMgKG91dGxvb2spLg0KDQo+IA0KPiA+ID4gKiBBZGRl
ZCBwYXRjaCB0byBhbGxvdyB1c2luZyBvbGRlciB2ZXJzaW9ucyBvZiBhdXRvbWFrZSBzdWNoDQo+
ID4gPiAgIGFzIDEuMTAuMyB3aGVuIGJ1aWxkaW5nIGpwZWcgdmVyc2lvbiA4Yi4NCj4gPiA+ICog
T25seSB1c2UgdGhlIEFNX1NJTEVOVF9SVUxFUyBpZiBpdCBpcyBhdmFpbGFibGUuDQo+ID4gPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhc2UgTWF1cGluIDxjaGFzZS5tYXVwaW5AdGkuY29tPg0K
PiA+DQo+ID4gQWNrZWQtYnk6IERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+DQo+
IA0KPiBUbyBnZXQgdGhlIHN0YXRzIHJpZ2h0LCBtYXliZSB0aGUgb25lIHdobyBpcyBwdXNoaW5n
IHRoaXMgY2FuIGZpeCB0aGlzDQo+IHVwIGJ5IGRlbGV0aW5nIHRoZSBGcm9tOiBsaW5lIGluIHRo
ZSBtZXNzYWdlIGJvZHkuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBQYXVsDQo+IA0KPiA+ID4gLS0t
DQo+ID4gPiAgLi4uaWd1cmUtbWFrZS1qcGVnLXdvcmstd2l0aC1vbGRlci1hdXRvdG9vbHMucGF0
Y2ggfCAgIDMwDQo+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgcmVjaXBlcy9qcGVnL2pw
ZWdfOGIuYmIgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsrKy0NCj4gPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvanBlZy9qcGVnLThiLzAwMDEtY29uZmlndXJlLW1h
a2UtanBlZy0NCj4gd29yay13aXRoLW9sZGVyLWF1dG90b29scy5wYXRjaA0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9yZWNpcGVzL2pwZWcvanBlZy04Yi8wMDAxLWNvbmZpZ3VyZS1tYWtlLWpw
ZWctd29yay13aXRoLQ0KPiBvbGRlci1hdXRvdG9vbHMucGF0Y2ggYi9yZWNpcGVzL2pwZWcvanBl
Zy04Yi8wMDAxLWNvbmZpZ3VyZS1tYWtlLWpwZWctDQo+IHdvcmstd2l0aC1vbGRlci1hdXRvdG9v
bHMucGF0Y2gNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAwMDAw
Li5kZDZmZDUyDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9yZWNpcGVzL2pwZWcv
anBlZy04Yi8wMDAxLWNvbmZpZ3VyZS1tYWtlLWpwZWctd29yay13aXRoLW9sZGVyLQ0KPiBhdXRv
dG9vbHMucGF0Y2gNCj4gPiA+IEBAIC0wLDAgKzEsMzAgQEANCj4gPiA+ICtGcm9tIGU5ZTc3ZWU5
OTk1NTNmOWI5NGRlMDI4ODY4OGEwYmRjNjBiOTJlMGYgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAy
MDAxDQo+ID4gPiArRnJvbTogQ2hhc2UgTWF1cGluIDxjaGFzZS5tYXVwaW5AdGkuY29tPg0KPiA+
ID4gK0RhdGU6IFR1ZSwgMTcgQXVnIDIwMTAgMDg6MzA6NTYgLTA1MDANCj4gPiA+ICtTdWJqZWN0
OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbWFrZSBqcGVnIHdvcmsgd2l0aCBvbGRlciBhdXRvdG9vbHMN
Cj4gPiA+ICsNCj4gPiA+ICsqIE9ubHkgdXNlIHRoZSBBTV9TSUxFTlRfUlVMRVMgdmFyaWFibGUg
aWYgaXQgaXMgZGVmaW5lZC4gIE9sZGVyDQo+ID4gPiArICB2ZXJzaW9ucyBvZiBhdXRvbWFrZSBk
b24ndCBzdXBwb3J0IHRoaXMgb3B0aW9uLg0KPiA+ID4gKw0KPiA+ID4gK1NpZ25lZC1vZmYtYnk6
IENoYXNlIE1hdXBpbiA8Y2hhc2UubWF1cGluQHRpLmNvbT4NCj4gPiA+ICstLS0NCj4gPiA+ICsg
Y29uZmlndXJlLmFjIHwgICAgMyArKy0NCj4gPiA+ICsgMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb25zKC0pDQo+ID4gPiArDQo+ID4gPiArZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYw0KPiA+ID4gK2luZGV4IDk2ZGExM2IuLjlhNThjNTEg
MTAwNjQ0DQo+ID4gPiArLS0tIGEvY29uZmlndXJlLmFjDQo+ID4gPiArKysrIGIvY29uZmlndXJl
LmFjDQo+ID4gPiArQEAgLTI2LDcgKzI2LDggQEAgQU1fSU5JVF9BVVRPTUFLRShbLVdhbGwgLVdl
cnJvciBhbnNpMmtuciBuby1kaXN0DQo+IGZvcmVpZ25dKQ0KPiA+ID4gKyAjIE1ha2UgLS1lbmFi
bGUtc2lsZW50LXJ1bGVzIHRoZSBkZWZhdWx0Lg0KPiA+ID4gKyAjIFRvIGdldCB2ZXJib3NlIGJ1
aWxkIG91dHB1dCB5b3UgbWF5IGNvbmZpZ3VyZQ0KPiA+ID4gKyAjIHdpdGggLS1kaXNhYmxlLXNp
bGVudC1ydWxlcyBvciB1c2UgIm1ha2UgVj0xIi4NCj4gPiA+ICstQU1fU0lMRU5UX1JVTEVTKFt5
ZXNdKQ0KPiA+ID4gKysjIG9ubHkgdXNlIGlmIGF2YWlsYWJsZQ0KPiA+ID4gKyttNF9pZmRlZihb
QU1fU0lMRU5UX1JVTEVTXSwgW0FNX1NJTEVOVF9SVUxFUyhbeWVzXSldKQ0KPiA+ID4gKw0KPiA+
ID4gKyAjIFRoaXMgaXMgcmVxdWlyZWQgd2hlbiB1c2luZyB0aGUgZGUtQU5TSS1maWNhdGlvbiBm
ZWF0dXJlLg0KPiA+ID4gKyBBTV9DX1BST1RPVFlQRVMNCj4gPiA+ICstLQ0KPiA+ID4gKzEuNy4w
LjQNCj4gPiA+ICsNCj4gPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzL2pwZWcvanBlZ184Yi5iYiBi
L3JlY2lwZXMvanBlZy9qcGVnXzhiLmJiDQo+ID4gPiBpbmRleCA0MjUxY2E2Li42ODhkY2Q4IDEw
MDY0NA0KPiA+ID4gLS0tIGEvcmVjaXBlcy9qcGVnL2pwZWdfOGIuYmINCj4gPiA+ICsrKyBiL3Jl
Y2lwZXMvanBlZy9qcGVnXzhiLmJiDQo+ID4gPiBAQCAtMiwxMiArMiwxNSBAQCBERVNDUklQVElP
TiA9ICJsaWJqcGVnIGlzIGEgbGlicmFyeSBmb3IgaGFuZGxpbmcgdGhlDQo+IEpQRUcgKEpGSUYp
IGltYWdlIGZvcm1hdC4iDQo+ID4gPiAgTElDRU5TRSA9ICJqcGVnIg0KPiA+ID4gIFNFQ1RJT04g
PSAibGlicyINCj4gPiA+ICBQUklPUklUWSA9ICJyZXF1aXJlZCINCj4gPiA+IC1QUiA9ICJyMCIN
Cj4gPiA+ICtQUiA9ICJyMSINCj4gPiA+DQo+ID4gPiAgIyBUT0RPOiByZWFsbHkgbmVlZGVkPw0K
PiA+ID4gIFJQUk9WSURFU18ke1BOfSA9ICJqcGVnIg0KPiA+ID4NCj4gPiA+IC1TUkNfVVJJID0g
Imh0dHA6Ly93d3cuaWpnLm9yZy9maWxlcy9qcGVnc3JjLnYke1BWfS50YXIuZ3oiDQo+ID4gPiAr
U1JDX1VSSSA9ICJcDQo+ID4gPiArICAgIGh0dHA6Ly93d3cuaWpnLm9yZy9maWxlcy9qcGVnc3Jj
LnYke1BWfS50YXIuZ3ogXA0KPiA+ID4gKyAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtbWFrZS1q
cGVnLXdvcmstd2l0aC1vbGRlci1hdXRvdG9vbHMucGF0Y2ggXA0KPiA+ID4gKyAgICAiDQo+ID4g
PiAgUyA9ICIke1dPUktESVJ9L2pwZWctJHtQVn0iDQo+ID4gPg0KPiA+ID4gIGluaGVyaXQgYXV0
b3Rvb2xzDQo+ID4gPiAtLQ0KPiA+ID4gMS43LjAuNA0KDQo=


