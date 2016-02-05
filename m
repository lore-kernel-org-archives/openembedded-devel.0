Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2D11A7717B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 22:15:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Feb 2016 14:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,402,1449561600"; d="scan'208";a="647917710"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Feb 2016 14:15:26 -0800
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 5 Feb 2016 14:15:25 -0800
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.208]) by
	FMSMSX151.amr.corp.intel.com ([169.254.7.190]) with mapi id
	14.03.0248.002; Fri, 5 Feb 2016 14:15:25 -0800
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] toybox: upgrade to 0.7.0
Thread-Index: AQHRXkX5PhcgXq8B5UeNcO0OyLO0BJ8dK5+AgAFjdAA=
Date: Fri, 5 Feb 2016 22:15:25 +0000
Message-ID: <1454710544.32454.33.camel@intel.com>
References: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
	<CAMKF1spJ+xeuV_iiyswkfWSkFiQ84t0qBDQsesrGBCyWiO5yHQ@mail.gmail.com>
	<FEF0A910-0CCF-49A5-9CA0-75D50E23BDA0@gmail.com>
In-Reply-To: <FEF0A910-0CCF-49A5-9CA0-75D50E23BDA0@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.128.72]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] toybox: upgrade to 0.7.0
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
X-List-Received-Date: Fri, 05 Feb 2016 22:15:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F1B4260B5276D45B46C8DB7000DD48B@intel.com>
Content-Transfer-Encoding: base64

T24ganVlLCAyMDE2LTAyLTA0IGF0IDE3OjAzIC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiBP
biBGZWIgMiwgMjAxNiwgYXQgOTo0MyBQTSwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4g
d3JvdGU6DQo+ID4gDQo+ID4gT24gVHVlLCBGZWIgMiwgMjAxNiBhdCA2OjExIFBNLCBBbGVqYW5k
cm8gSm95YQ0KPiA+IDxhbGVqYW5kcm8uam95YS5jcnV6QGludGVsLmNvbT4gd3JvdGU6DQo+ID4g
PiArQ0ZMQUdTX3ByZXBlbmQgPSAiLUkgJHtTVEFHSU5HX0RJUl9IT1NUfSR7aW5jbHVkZWRpcl9u
YXRpdmV9Ig0KPiA+IA0KPiA+IHdoeSBpcyBhIG5hdGl2ZSBpbmNsdWRlIGRpciBuZWVkZWQgaGVy
ZSA/DQo+IA0KPiANCj4gdGhpcyBpcyBzYW1lIGFzIFNUQUdJTkdfSU5DRElSIGFuZCB0aGF0IHNo
b3VsZCBiZSBhdXRvbWF0aWNhbGx5IGFkZGVkDQo+IHZpYSBjb21waWxlciBzbyBJIHdvbmRlciB3
aHkgaXRzIG5lZWRlZC4NCg0KeWVzIHRoaXMgaXMgbmVlZCBpdCBzaW5jZSB0aGUgbWFrZSBidWls
ZGVyIGlzIHJlYWxseSAgYmFzaWMgZm9yIHRoaXMNCnBhY2thZ2UuDQoNCmRvIHlvdSBzdWdnZXN0
IGNoYW5nZSB0aGUgdXNlIG9mDQogJHtTVEFHSU5HX0RJUl9IT1NUfSR7aW5jbHVkZWRpcl9uYXRp
dmV9IHRvICR7U1RBR0lOR19JTkNESVJ9IHRoZW4/DQoNCj4gDQo+IC0tIA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2
ZWwgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWRldmVs

