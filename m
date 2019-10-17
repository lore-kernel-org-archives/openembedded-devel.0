Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF4D7F6AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F35981816A;
	Thu, 17 Oct 2019 16:11:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id QCW45UhenDiI; Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9FFE6184A6;
	Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 808CE1E066;
	Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69B901E04F;
	Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from xbox05.axis.com (xbox05.axis.com [10.0.15.175])
	by thoth.se.axis.com (Postfix) with ESMTP id 5CFFC2F58;
	Thu, 17 Oct 2019 16:11:12 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by xbox05.axis.com (10.0.15.175)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 17 Oct 2019 16:11:12 +0200
Received: from XBOX03.axis.com (10.0.5.17) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 17 Oct 2019 16:11:11 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Thu, 17 Oct 2019 16:11:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tom Rini <trini@konsulko.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
Thread-Index: AQHVhPJHHb7YltMhkUWhTl2xMdK7lqde3lfw
Date: Thu, 17 Oct 2019 14:11:11 +0000
Message-ID: <a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
References: <20191017135309.32441-1-trini@konsulko.com>
In-Reply-To: <20191017135309.32441-1-trini@konsulko.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	=?utf-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <jsmoeller@linuxfoundation.org>
Subject: Re: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 14:11:14 -0000
X-Groupsio-MsgNum: 80195
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_a481c7b712504bb4a40364fab7ff1a0bXBOX03axiscom_"

--_002_a481c7b712504bb4a40364fab7ff1a0bXBOX03axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SnVzdCB0byBhZGQgdG8gdGhpcywgSSBoYXZlIGF0dGFjaGVkIGEgcmVjaXBlIGZvciBwaXBld2ly
ZSB0aGF0IHdlIHVzZWQgDQp0byB1c2UgKHdlIGhhdmUgbm90IHVzZWQgaXQgZm9yIGEgd2hpbGUg
c28gaXQgaXMgbm90IHVwLXRvLWRhdGUpLiBJdCANCnNob3VsZCBob3BlZnVsbHkgZ2l2ZSB5b3Ug
c29tZSBtb3JlIGlkZWFzLiBFLmcuLCBpdCB1c2VzIGF1dG9tYXRpYyANCnNwbGl0dGluZyBvZiBh
bGwgdGhlIHNwYSBhbmQgbW9kdWxlIHBhY2thZ2VzIHNpbWlsYXIgdG8gaG93IHRoZSBHU3RyZWFt
ZXIgDQpwbHVnaW5zIGFyZSBhdXRvbWF0aWNhbGx5IHNwbGl0IGludG8gc2VwYXJhdGUgcGFja2Fn
ZXMuDQoNCi8vUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBv
cGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1i
ZWRkZWQtDQo+IGRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxm
IE9mIFRvbSBSaW5pDQo+IFNlbnQ6IGRlbiAxNyBva3RvYmVyIDIwMTkgMTU6NTMNCj4gVG86IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBHZW9yZ2UgS2lh
Z2lhZGFraXMgPGdlb3JnZS5raWFnaWFkYWtpc0Bjb2xsYWJvcmEuY29tPjsgSmFuLVNpbW9uDQo+
IE3DtmxsZXIgPGpzbW9lbGxlckBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBbb2Vd
IFttZXRhLW9lXVtQQVRDSHYyXSBwaXBld2lyZTogSW5pdGlhbCBhZGQgb2YgMC4yLjcNCj4gDQo+
IEZyb206IEdlb3JnZSBLaWFnaWFkYWtpcyA8Z2VvcmdlLmtpYWdpYWRha2lzQGNvbGxhYm9yYS5j
b20+DQo+IA0KPiBBZGQgUEFDS0FHRUNPTkZJRyBvcHRpb25zIGZvciB0aGUgY3VycmVudGx5IGF2
YWlsYWJsZSBmZWF0dXJlcy4NCj4gDQo+IFtCYXNlZCBvbiBwaXBld2lyZS5pbmMgLyBwaXBld2ly
ZV9naXQuYmIgZnJvbSBtZXRhLWFnbC1kZXZlbC9tZXRhLQ0KPiBwaXBld2lyZV0NCj4gDQo+IENj
OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ21haWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4tU2ltb24gTcO2bGxlciA8anNtb2VsbGVyQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBLaWFnaWFkYWtpcyA8Z2VvcmdlLmtpYWdpYWRha2lzQGNv
bGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5j
b20+DQo+IC0tLQ0KPiAgLi4uL3BpcGV3aXJlL3BpcGV3aXJlX2dpdC5iYiAgICAgICAgICAgICAg
ICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2Vy
dGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRp
YS9waXBld2lyZS9waXBld2lyZV9naXQuYmINCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV9naXQuYmINCj4gYi9tZXRhLW9lL3Jl
Y2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV9naXQuYmINCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iY2IzMDE1ZjhiZGMNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2ly
ZV9naXQuYmINCj4gQEAgLTAsMCArMSw2NSBAQA0KPiArU1VNTUFSWSA9ICJNdWx0aW1lZGlhIHBy
b2Nlc3Npbmcgc2VydmVyIGZvciBMaW51eCINCj4gK0FVVEhPUiA9ICJXaW0gVGF5bWFucyA8d3Rh
eW1hbnNAcmVkaGF0LmNvbT4iDQo+ICtIT01FUEFHRSA9ICJodHRwczovL3BpcGV3aXJlLm9yZyIN
Cj4gK1NFQ1RJT04gPSAibXVsdGltZWRpYSINCj4gK0xJQ0VOU0UgPSAiTEdQTC0yLjEiDQo+ICtM
SUNfRklMRVNfQ0hLU1VNID0gIiBcDQo+ICsgICAgZmlsZTovL0xJQ0VOU0U7bWQ1PWQ4MTUzYzZl
NjU5ODZmODYyYTA1NTBjYTc0YTNlZDczIFwNCj4gKyAgICBmaWxlOi8vTEdQTDttZDU9MmQ1MDI1
ZDRhYTM0OTViZWZlZjhmMTcyMDZhNWIwYTEgXA0KPiArIg0KPiArREVQRU5EUyA9ICJhbHNhLWxp
YiBkYnVzIHVkZXYiDQo+ICtTUkNSRVYgPSAiMTRjMTFjMGZlNGQzNjZiYWQ0Y2ZlY2RlZTk3YjY2
NTJmZjllZDYzZCINCj4gK1BWID0gIjAuMi43Ig0KPiArDQo+ICtTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vUGlwZVdpcmUvcGlwZXdpcmUiDQo+ICsNCj4gK1MgPSAiJHtXT1JLRElSfS9naXQi
DQo+ICsNCj4gK2luaGVyaXQgbWVzb24gcGtnY29uZmlnIHN5c3RlbWQgbWFucGFnZXMNCj4gKw0K
PiArUEFDS0FHRUNPTkZJRyA/Pz0gIlwNCj4gKyAgICAke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RS
T19GRUFUVVJFUycsICdzeXN0ZW1kJywgZCl9IFwNCj4gKyAgICBnc3RyZWFtZXIgXA0KPiArIg0K
PiArDQo+ICtQQUNLQUdFQ09ORklHW3N5c3RlbWRdID0gIi1Ec3lzdGVtZD10cnVlLC1Ec3lzdGVt
ZD1mYWxzZSxzeXN0ZW1kIg0KPiArUEFDS0FHRUNPTkZJR1tnc3RyZWFtZXJdID0gIi1EZ3N0cmVh
bWVyPWVuYWJsZWQsLQ0KPiBEZ3N0cmVhbWVyPWRpc2FibGVkLGdsaWItMi4wIGdzdHJlYW1lcjEu
MCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIg0KPiArUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10g
PSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4bWwtcGFyc2VyLXBlcmwtDQo+IG5hdGl2ZSIN
Cj4gKw0KPiArUEFDS0FHRVMgPSsgIlwNCj4gKyAgICAke1BOfS1zcGEtcGx1Z2lucyBcDQo+ICsg
ICAgJHtQTn0tYWxzYSBcDQo+ICsgICAgJHtQTn0tY29uZmlnIFwNCj4gKyAgICBnc3RyZWFtZXIx
LjAtJHtQTn0gXA0KPiArICAgIGxpYiR7UE59IFwNCj4gKyAgICBsaWIke1BOfS1tb2R1bGVzIFwN
Cj4gKyINCj4gKw0KPiArUkRFUEVORFNfbGliJHtQTn0gKz0gImxpYiR7UE59LW1vZHVsZXMgJHtQ
Tn0tc3BhLXBsdWdpbnMiDQo+ICsNCj4gK0ZJTEVTXyR7UE59ID0gIlwNCj4gKyAgICAke3N5c2Nv
bmZkaXJ9L3BpcGV3aXJlL3BpcGV3aXJlLmNvbmYgXA0KPiArICAgICR7YmluZGlyfS9waXBld2ly
ZSogXA0KPiArICAgICR7c3lzdGVtZF91c2VyX3VuaXRkaXJ9LyogXA0KPiArIg0KPiArRklMRVNf
bGliJHtQTn0gPSAiXA0KPiArICAgICR7bGliZGlyfS9saWJwaXBld2lyZS0qLnNvLiogXA0KPiAr
Ig0KPiArRklMRVNfbGliJHtQTn0tbW9kdWxlcyA9ICJcDQo+ICsgICAgJHtsaWJkaXJ9L3BpcGV3
aXJlLSovKiBcDQo+ICsiDQo+ICtGSUxFU18ke1BOfS1zcGEtcGx1Z2lucyA9ICJcDQo+ICsgICAg
JHtiaW5kaXJ9L3NwYS0qIFwNCj4gKyAgICAke2xpYmRpcn0vc3BhLyogXA0KPiArIg0KPiArRklM
RVNfJHtQTn0tYWxzYSA9ICJcDQo+ICsgICAgJHtsaWJkaXJ9L2Fsc2EtbGliLyogXA0KPiArICAg
ICR7ZGF0YWRpcn0vYWxzYS9hbHNhLmNvbmYuZC81MC1waXBld2lyZS5jb25mIFwNCj4gKyINCj4g
K0ZJTEVTX2dzdHJlYW1lcjEuMC0ke1BOfSA9ICJcDQo+ICsgICAgJHtsaWJkaXJ9L2dzdHJlYW1l
ci0xLjAvKiBcDQo+ICsiDQo+ICsNCj4gK0NPTkZGSUxFU18ke1BOfSA9ICJcDQo+ICsgICAgJHtz
eXNjb25mZGlyfS9waXBld2lyZS9waXBld2lyZS5jb25mIFwNCj4gKyINCj4gLS0NCj4gMi4xNy4x
DQo+IA0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVsDQo=

--_002_a481c7b712504bb4a40364fab7ff1a0bXBOX03axiscom_
Content-Type: application/octet-stream; name="pipewire_git.bb"
Content-Description: pipewire_git.bb
Content-Disposition: attachment; filename="pipewire_git.bb"; size=2225;
	creation-date="Thu, 17 Oct 2019 14:06:31 GMT";
	modification-date="Thu, 17 Oct 2019 14:06:31 GMT"
Content-Transfer-Encoding: base64

U1VNTUFSWSA9ICJQaXBlV2lyZSBNZWRpYSBTZXJ2aWNlIgpERVNDUklQVElPTiA9ICJQaXBlV2ly
ZSBpcyBhIG11bHRpbWVkaWEgc2VydmVyIGZvciBMaW51eCBhbmQgb3RoZXIgVW5peCBsaWtlIG9w
ZXJhdGluZyBzeXN0ZW1zLiIKClNFQ1RJT04gPSAibXVsdGltZWRpYSIKCkxJQ0VOU0UgPSAiTEdQ
TC0yLjErIgpMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kODE1M2M2ZTY1
OTg2Zjg2MmEwNTUwY2E3NGEzZWQ3MyIKCkRFUEVORFMgPSAiYWxzYS1saWIgZGJ1cyBnbGliLTIu
MCBsaWJzZGwyIHVkZXYiCgpQViA9ICIwLjEuOCtnaXQke1NSQ1BWfSIKU1JDUkVWID0gIjE4MDRl
NDdhOTE2N2UzOGNlMzQwZDEwZGIyZWNhZDNiMzYzZjk3YWMiCgpTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vUGlwZVdpcmUvcGlwZXdpcmU7cHJvdG9jb2w9Z2l0IgoKUyA9ICIke1dPUktESVJ9
L2dpdCIKClBBQ0tBR0VDT05GSUcgPSAiZ3N0cmVhbWVyIgpQQUNLQUdFQ09ORklHW2dzdHJlYW1l
cl0gPSAiLURlbmFibGVfZ3N0cmVhbWVyPXRydWUsLURlbmFibGVfZ3N0cmVhbWVyPWZhbHNlLGdz
dHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLCIKCmluaGVyaXQgbWVzb24gcGtn
Y29uZmlnIHN5c3RlbWQKCmRvX2luc3RhbGxfYXBwZW5kX2NsYXNzLW5hdGl2ZSgpIHsKICAgICMg
QXZvaWQgYW4gZXJyb3IgZnJvbSByZWxvY2F0YWJsZV9uYXRpdmVfcGNmaWxlcygpLCB3aGljaCBh
cHBhcmVudGx5IGRvZXMKICAgICMgbm90IGV4cGVjdCBhbiBlbXB0eSAke2RhdGFkaXJ9L3BrZ2Nv
bmZpZyBkaXJlY3RvcnkgdG8gZXhpc3QuCiAgICBybWRpciAke0R9JHtkYXRhZGlyfS9wa2djb25m
aWcgfHwgOgp9CgpQQUNLQUdFU19EWU5BTUlDICs9ICJeJHtQTn0tbW9kdWxlLS4qICR7UE59LXNw
YS0uKiIKUEFDS0FHRV9CRUZPUkVfUE4gPSAiJHtQTn0tY29uZiAke1BOfS10b29scyBnc3RyZWFt
ZXIxLjAtcGx1Z2lucy0ke1BOfSIKCnB5dGhvbiBwb3B1bGF0ZV9wYWNrYWdlc19wcmVwZW5kKCkg
ewogICAgcGlwZXdpcmVfbGliZGlyID0gJyR7bGliZGlyfS9waXBld2lyZS0wLjEnCiAgICBwaXBl
d2lyZV9zcGFkaXIgPSAnJHtsaWJkaXJ9L3NwYScKCiAgICAjIFdlIG5lZWQgdG8gaGFuZGxlIG1v
ZHVsZXMgd2l0aCAtbmF0aXZlIGluIHRoZSBuYW1lLCBlLmcuLCBwcm90b2NvbC1uYXRpdmUKICAg
IGRvX3NwbGl0X3BhY2thZ2VzKGQsIHBpcGV3aXJlX2xpYmRpciwgJ2xpYnBpcGV3aXJlLW1vZHVs
ZS0oLiopLW5hdGl2ZVwuc28kJywgJyR7UE59LW1vZHVsZS0lc25hdGl2ZScsICdQaXBld2lyZSBt
b2R1bGUgJXMtbmF0aXZlJywgZXh0cmFfZGVwZW5kcz0nJykKCiAgICBkb19zcGxpdF9wYWNrYWdl
cyhkLCBwaXBld2lyZV9saWJkaXIsICdsaWJwaXBld2lyZS1tb2R1bGUtKC4qKVwuc28kJywgJyR7
UE59LW1vZHVsZS0lcycsICdQaXBld2lyZSBtb2R1bGUgJXMnLCBleHRyYV9kZXBlbmRzPScnKQoK
ICAgIGRvX3NwbGl0X3BhY2thZ2VzKGQsIHBpcGV3aXJlX3NwYWRpciwgJ2xpYnNwYS0oLiopXC5z
byQnLCAnJHtQTn0tc3BhLSVzJywgJ1BpcGV3aXJlIFNQQSBwbHVnaW4gJXMnLCByZWN1cnNpdmU9
VHJ1ZSwgZXh0cmFfZGVwZW5kcz0nJykKfQoKRklMRVNfJHtQTn0gKz0gIiR7c3lzdGVtZF91c2Vy
X3VuaXRkaXJ9IgpGSUxFU18ke1BOfS1jb25mICs9ICIke3N5c2NvbmZkaXJ9LyR7QlBOfSIKRklM
RVNfJHtQTn0tdG9vbHMgKz0gIiR7YmluZGlyfS9waXBld2lyZS1tb25pdG9yICR7YmluZGlyfS9z
cGEtaW5zcGVjdCAke2JpbmRpcn0vc3BhLW1vbml0b3IiCkZJTEVTX2dzdHJlYW1lcjEuMC1wbHVn
aW5zLSR7UE59ICs9ICIke2xpYmRpcn0vZ3N0cmVhbWVyLTEuMCIKCkNPTkZGSUxFU18ke1BOfS1j
b25mID0gIiR7c3lzY29uZmRpcn0vJHtCUE59IgoKU1lTVEVNRF9TRVJWSUNFXyR7UE59ID0gIiR7
QlBOfS5zZXJ2aWNlIgoKUkRFUEVORFNfJHtQTn0gPSAiJHtCUE59LWNvbmYgJHtCUE59LXNwYS1z
dXBwb3J0IgpSREVQRU5EU18ke1BOfS1jb25mID0gIiR7QlBOfS1tb2R1bGUtYXV0b2xpbmsgJHtC
UE59LW1vZHVsZS1jbGllbnQtbm9kZSAke0JQTn0tbW9kdWxlLWZsYXRwYWsgJHtCUE59LW1vZHVs
ZS1wcm90b2NvbG5hdGl2ZSAke0JQTn0tbW9kdWxlLXNwYS1tb25pdG9yICR7QlBOfS1tb2R1bGUt
c3VzcGVuZC1vbi1pZGxlICR7QlBOfS1zcGEtdjRsMiIKCkJCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
Igo=

--_002_a481c7b712504bb4a40364fab7ff1a0bXBOX03axiscom_--
