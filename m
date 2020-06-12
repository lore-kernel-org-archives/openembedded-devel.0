Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.16296.1591953616634943733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: N4aeFcXJ2CyiVnfsCI279FyWOnWyaWML/+Sr/stVain5FDHbUBmQE4JY2NEknbV2JLimcr4rTG
 7pTsMqomS3Sw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 02:20:15 -0700
IronPort-SDR: fJV5N70wNFMyjkK5d5LAprGTMGS6cUsvl6wvDyqc/v3sdH9CIjcYL5KJwMIcsz6JWT+Zr5ff/4
 GAZXW2AqdA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="scan'208";a="315086063"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2020 02:20:14 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 KMSMSX156.gar.corp.intel.com ([169.254.1.204]) with mapi id 14.03.0439.000;
 Fri, 12 Jun 2020 17:20:13 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ross@burtonini.com" <ross@burtonini.com>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
CC: "denis@denix.org" <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
Thread-Topic: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
Thread-Index: AQHWPmp6KO+sRIz9OUiN4HpAQOIHOKjP382AgABuqACAAOvagIACtzEAgABA5oA=
Date: Fri, 12 Jun 2020 09:20:12 +0000
Message-ID: <b27b1907c0cbc522137a2f9f5fd8794cd8459d8d.camel@intel.com>
References: <20200609142957.187352-1-arthur.she@linaro.org>
	 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
	 <20200609215534.GW17660@denix.org>
	 <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
	 <CAJ8hLzHt24_OpYUf92=qHpypsb3UpXuOhUm4MAoGoi23h1zh+g@mail.gmail.com>
In-Reply-To: <CAJ8hLzHt24_OpYUf92=qHpypsb3UpXuOhUm4MAoGoi23h1zh+g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.145.38]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <47E9F37CDD707F4CA326B622CB0A5755@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA2LTExIGF0IDIyOjI3IC0wNzAwLCBBcnRodXIgU2hlIHdyb3RlOg0KPiBI
aSBSb3NzLCBEZW55cywNCj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KPiBJJ3ZlIHRhbGtl
ZCB0byB0aGUgbWV0YS1pbnRlbCBtYWludGFpbmVyLg0KPiBIZSBhZ3JlZXMgdG8gcmVtb3ZlIGl0
IGZyb20gbWV0YS1pbnRlbCBhbmQgdXNlIHRoaXMgb25lIGluc3RlYWQsIG9uY2UNCj4gaXQgZ2V0
cyBtZXJnZWQuDQoNCkFjdHVhbGx5IEkgaGFkIHJlcXVlc3RlZCB0aGF0IGl0IGJlIHNlbnQgdG8g
b2UtY29yZSBsaXN0IHRvIHNlZWsNCm90aGVycycgb3BpbmlvbiBvbiB3aGV0aGVyIGl0IGNhbiBi
ZSBpbmNsdWRlZCB0aGVyZSBzaW5jZSB0aGlzIHByb3ZpZGVzDQphIGNvcmUgdmFsaWRhdGlvbiBm
dW5jdGlvbmFsaXR5IHRoYXQgaXMgYXBwbGljYWJsZSBub3QganVzdCB0byBhIHNpbmdsZQ0KYXJj
aCBhbmQgaXMgdXNlZCBieSBhbGwuIEkgd291bGQgaGF2ZSBiZWVuIGFibGUgdG8gcmVtb3ZlIGl0
IGZyb20gbWV0YS0NCmludGVsIGluIHRoYXQgY2FzZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=
