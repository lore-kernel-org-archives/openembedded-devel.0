Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD31C74C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 21:59:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7RLxS8p028045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 14:59:28 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.79]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0415.000;
	Mon, 27 Aug 2018 14:59:27 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/1] php: specify no valgrind
Thread-Index: AQHUO+gy0kiRFzYc0kyqJ+7XfjsIS6TUKnmg
Date: Mon, 27 Aug 2018 21:59:27 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F3688B69@ALA-MBD.corp.ad.wrs.com>
References: <20180824193454.146236-1-joe.slater@windriver.com>
	<CAMKF1spEy0_3DdinAzP4qxv_heCXHwsqBmdtYfRMV3a+nJms=w@mail.gmail.com>
In-Reply-To: <CAMKF1spEy0_3DdinAzP4qxv_heCXHwsqBmdtYfRMV3a+nJms=w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.215]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: specify no valgrind
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
X-List-Received-Date: Mon, 27 Aug 2018 21:59:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBhbHRob3VnaCB0aGF0IGlzIGFuIGVuaGFuY2VtZW50LiAgICBKb2UNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwu
Y29tXSANClNlbnQ6IEZyaWRheSwgQXVndXN0IDI0LCAyMDE4IDE6MjIgUE0NClRvOiBTbGF0ZXIs
IEpvc2VwaA0KQ2M6IG9wZW5lbWJlZGVkLWRldmVsDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1v
ZV1bUEFUQ0ggMS8xXSBwaHA6IHNwZWNpZnkgbm8gdmFsZ3JpbmQNCg0KT24gRnJpLCBBdWcgMjQs
IDIwMTggYXQgMTI6MzUgUE0gSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPiB3
cm90ZToNCj4NCj4gY29uZmlndXJlIHdpbGwgbG9vayBieSBkZWZhdWx0IGZvciB2YWxncmluZC5o
IGluIHNvbWUgaG9zdCBkaXJlY3Rvcmllcy4NCj4gV2Ugb3ZlcnJpZGUgdGhpcyBieSBzZXR0aW5n
IC0td2l0aC12YWxncmluZD1uby4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9l
LnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29s
cy9waHAvcGhwLmluYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+
DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGhwL3BocC5pbmMgYi9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGhwL3BocC5pbmMNCj4gaW5kZXggNDIzMWZjYy4uZWYw
M2U2NiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BocC9waHAuaW5j
DQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9waHAvcGhwLmluYw0KPiBAQCAtNDcs
NiArNDcsNyBAQCBFWFRSQV9PRUNPTkYgPSAiLS1lbmFibGUtbWJzdHJpbmcgXA0KPiAgICAgICAg
ICAgICAgICAgIC0tZW5hYmxlLXdkZHggXA0KPiAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLWZw
bSBcDQo+ICAgICAgICAgICAgICAgICAgLS1lbmFibGUtemlwIFwNCj4gKyAgICAgICAgICAgICAg
ICAtLXdpdGgtdmFsZ3JpbmQ9bm8gXA0KDQpwZXJoYXBzIHR1cm5pbmcgaXQgaW50byBhIHBhY2th
Z2Vjb25maWcgaXMgYmV0dGVyLg0KDQo+ICAgICAgICAgICAgICAgICAgLS13aXRoLWxpYmRpcj0k
e2Jhc2VsaWJ9IFwNCj4gICAgICAgICAgICAgICAgICAtLXdpdGgtZ2V0dGV4dD0ke1NUQUdJTkdf
TElCRElSfS8uLiBcDQo+ICAgICAgICAgICAgICAgICAgLS13aXRoLXpsaWI9JHtTVEFHSU5HX0xJ
QkRJUn0vLi4gXA0KPiAtLQ0KPiAyLjcuNA0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGlu
ZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVk
LWRldmVsDQo=

