Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.14049.1591940333961531883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CRi3ZFxbcLYBwSOlvYg9aDfLw520kcVzYXhevyLHS5QL7QRM14MZuUtJsIpA2rZ7eT0kJAU3zE
 VqA10vgPlmcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:38:52 -0700
IronPort-SDR: zE5szNDUdE2fEO9zmO6J51VrY4Jt1ygUmOhjEK8P2BrwuoUVTnUFcBIb1F314iEQRs76/OkeVL
 ewm/usY2d7tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="474085963"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2020 22:38:51 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.204]) with mapi id 14.03.0439.000;
 Fri, 12 Jun 2020 13:38:50 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ross@burtonini.com" <ross@burtonini.com>, "denis@denix.org"
	<denis@denix.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
Thread-Topic: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
Thread-Index: AQHWPmp6KO+sRIz9OUiN4HpAQOIHOKjP382AgABuqACAAOvagIACuj0A
Date: Fri, 12 Jun 2020 05:38:49 +0000
Message-ID: <394872f63a9f700f8abcf7054662f2cbc2f8d56f.camel@intel.com>
References: <20200609142957.187352-1-arthur.she@linaro.org>
	 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
	 <20200609215534.GW17660@denix.org>
	 <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
In-Reply-To: <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.145.38]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <44C333231E450044BE40285BF8B31C73@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA2LTEwIGF0IDEyOjU5ICswMTAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gVHVlLCA5IEp1biAyMDIwIGF0IDIyOjU1LCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVu
aXgub3JnPg0KPiB3cm90ZToNCj4gPiBIdWg/DQo+IA0KPiBTbyB0aGF0IHdhcyB0aGUgbGluZSB0
aGF0IHRvbGQgbWUgdGhlIHJlY2lwZSB3YXMgYmFzaWNhbGx5IGNvcGllZA0KPiBmcm9tDQo+IHRo
ZSBmaWxlIGluIG1ldGEtaW50ZWw6DQo+IA0KPiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
Y2dpdC9jZ2l0LmNnaS9tZXRhLWludGVsL3RyZWUvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRv
b2xzL2lndC1ncHUtdG9vbHNfMS4yNS5iYg0KPiANCj4gQnV0IGl0IGFwcGVhcnMgdGhhdCB0aGUg
aW5jbHVzaW9uIG9mIHRoZSB4b3JnLWFwcC5pbmMgZmlsZSBoYXMgYmVlbg0KPiByZW1vdmVkLiBJ
ZiB0aGUgcmVjaXBlIGhhcyBiZWVuIG1hZGUgc3RhbmRhbG9uZSB0aGVuIGNydWZ0IGxpa2UgdGhh
dA0KPiBuZWVkcyB0byBiZSBmaXhlZC4NCj4gDQoNCklzIHRoaXMgcmVjaXBlIHNvbWV0aGluZyB0
aGF0IGNhbiBiZSBpbmNsdWRlZCBpbiBvZS1jb3JlPw0KDQpUaGFua3MsDQoNCkFudWoNCg==
