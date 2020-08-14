Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.11587.1597378321048297691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ji5Wjr09TPvq1qNmQCkxJrR/NFv2VHR98i4lZykpWPLbqNOLPKOhN/m027EnRTs2kSxTo9Ukso
 yZ8nx/jyFIvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="155467253"
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="155467253"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 21:12:00 -0700
IronPort-SDR: LBSq3XdgZyFV6wXlcRqcHYGoMDJDoPsUK30hjNofjRRUbkJlAtoFtAq11VBvTxnrWAKsXbeGij
 cJBa/ns7YJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="325611472"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 21:11:59 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 12:11:58 +0800
Received: from kmsmsx153.gar.corp.intel.com (172.21.73.88) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 12:11:58 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.186]) by
 KMSMSX153.gar.corp.intel.com ([169.254.5.77]) with mapi id 14.03.0439.000;
 Fri, 14 Aug 2020 12:11:58 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
Thread-Topic: [oe] [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
Thread-Index: AQHWcH1Yk/VektO6qUysPxX/xjmza6k2ewKA
Date: Fri, 14 Aug 2020 04:11:57 +0000
Message-ID: <e2199f620db08e5bd16d79b01f3c3df805676313.camel@intel.com>
References: <20200812075055.3512737-1-raj.khem@gmail.com>
In-Reply-To: <20200812075055.3512737-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.70.141]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DE79D781916A74A8487CAB7A32B695A@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA4LTEyIGF0IDAwOjUwIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gTGlj
ZW5zZS1VcGRhdGU6IFVwZGF0ZSBjb3B5cmlnaHRzIFsxXQ0KPiANCj4gSW5zdGFsbCBDTC9jbF9p
Y2QuaCBhcyBpdHMgbmVlZGVkIGJ5IG9wZW5jbC1pY2QtbG9hZGVyDQo+IA0KPiBEbyBub3QgcHJv
dmlkZSBsaWJPcGVuQ0wuc28gdGhlc2UgYXJlIGFscndhZHkgcHJvdmlkZWQgYnkgT3BlbkNMIDEu
Mg0KPiBJbnN0YWxsYWJsZSBDbGllbnQgRHJpdmVyDQoNCkFyZW4ndCBib3RoIG9mIHRoZXNlIGRp
ZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgb2YgbGliT3BlbkNMPyBQcm9qZWN0DQpkZXBlbmRpbmcg
b24gb2NsLWljZCBzaG91bGRuJ3QgbmVlZCB0byBkZXBlbmQgb24gb3BlbmNsLWljZC1sb2FkZXIg
SQ0KdGhpbmsuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiBbMV0gDQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9PQ0wtZGV2L29jbC1pY2QvY29tbWl0LzM5MjAyMDU3MzZhZmJiNjc3MjllOWM3M2M3
YjRjNmZkYjNmY2IzMjcjZGlmZi03MTE2ZWYwNzA1ODg1MzQzYzllMWIyMTcxYTA2YmUwZQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+
IHYyOiBGaXggbGlicmFyeSBjb25mbGljdHMgYW5kIGxpY2Vuc2UgY2hlY2tzdW1zDQo+IA0KPiAg
bWV0YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29jbC1pY2RfZ2l0LmJiIHwgMTAgKysrKysrKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb2NsLWljZF9naXQu
YmIgYi9tZXRhLQ0KPiBvZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29jbC1pY2RfZ2l0LmJiDQo+IGlu
ZGV4IGQxNGVjNTNlM2QuLmE2NWM3NjE4YjggMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBl
cy1jb3JlL29wZW5jbC9vY2wtaWNkX2dpdC5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtY29y
ZS9vcGVuY2wvb2NsLWljZF9naXQuYmINCj4gQEAgLTMsMTIgKzMsMTIgQEAgREVTQ1JJUFRJT04g
PSAiT3BlbiBTb3VyY2UgYWx0ZXJuYXRpdmUgdG8gdmVuZG9yDQo+IHNwZWNpZmljIE9wZW5DTCBJ
Q0QgbG9hZGVycy4iDQo+ICANCj4gICMgVGhlIExJQ0VOU0UgaXMgQlNEIDItQ2xhdXNlICJTaW1w
bGlmaWVkIiBMaWNlbnNlDQo+ICBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSINCj4gLUxJQ19GSUxF
U19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1PTIzMjI1N2JiZjczMjAzMjA3MjVjYTk1
MjlkMzc4MmFiIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vQ09QWUlORzttZDU9
MTIzOGQ1YmNjYmI2YmRhMzA2NTRlNDhkY2MwYTU1NGIiDQo+ICANCj4gIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9PQ0wtZGV2L29jbC1pY2QuZ2l0O3Byb3RvY29sPWh0dHBzIg0KPiAgDQo+
ICBQViA9ICIyLjIuMTIrZ2l0JHtTUkNQVn0iDQo+IC1TUkNSRVYgPSAiYWY3OWFlYmU0NjQ5ZjMw
ZGJkNzExYzFiZjZmYzY2MWVhYzZlNWYwMSINCj4gK1NSQ1JFViA9ICJhOWU1N2IxOTlmZjFlOGQw
M2ZhM2U1YzUzYzU1NDRkZTNkYzcyZmU2Ig0KPiAgDQo+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
PiAgDQo+IEBAIC0xNiw0ICsxNiwxMCBAQCBpbmhlcml0IGF1dG90b29scw0KPiAgDQo+ICBERVBF
TkRTID0gInJ1YnktbmF0aXZlIg0KPiAgDQo+ICsNCj4gK2RvX2luc3RhbGxfYXBwZW5kKCkgew0K
PiArICAgIGluc3RhbGwgLURtIDA2NDQgJHtTfS9raHJvbm9zLWhlYWRlcnMvQ0wvY2xfaWNkLmgN
Cj4gJHtEfSR7aW5jbHVkZWRpcn0vQ0wvY2xfaWNkLmgNCj4gKyAgICBybSAtcmYgJHtEfSR7bGli
ZGlyfS9saWJPcGVuQ0wuc28qDQo+ICt9DQo+ICsNCj4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
Ig0KPiANCg==
