Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.11570.1597378227144537069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VJjPbOZwseFJH0E+pP4TpkFX9P5YnyMXFPpG7xf2iyXHAQWewqH+ZfRrAsEFHsVEccfLArOEh9
 zRDc1eAnC0iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="172402545"
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="172402545"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 21:10:25 -0700
IronPort-SDR: SMpF2vaQF3NHKQFP5bpxcSlNl0LV6yTd+xErnQ5LXeUx/beuBvJcWqwLG3V7MCNKlqOWU0aBX/
 sPS4Rsbd/W2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="325611286"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 21:10:25 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 12:10:24 +0800
Received: from kmsmsx151.gar.corp.intel.com (172.21.73.86) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 12:10:24 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.186]) by
 KMSMSX151.gar.corp.intel.com ([169.254.10.121]) with mapi id 14.03.0439.000;
 Fri, 14 Aug 2020 12:10:24 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][ 6/9] opencl-icd-loader: Update beyond 2020.06.16
Thread-Topic: [oe] [meta-oe][ 6/9] opencl-icd-loader: Update beyond
 2020.06.16
Thread-Index: AQHWcHMMjkZZY9B8VUq8t4nTO1Tx4ak2eqeA
Date: Fri, 14 Aug 2020 04:10:23 +0000
Message-ID: <788ba2642e9ffc12c44454664795d484395450b8.camel@intel.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
	 <20200812063711.2758315-6-raj.khem@gmail.com>
In-Reply-To: <20200812063711.2758315-6-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.70.141]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <46E0BFD8CE1C0945A96A192A86CE76CE@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA4LTExIGF0IDIzOjM3IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gTGlj
ZW5zZS1VcGRhdGU6IExpY2Vuc2UgaXMgbm93IGFwYWNoZS0yLjAgYXMgcGVyIFsxXQ0KPiANCj4g
Rml4ZXMgYnVpbGQgd2loIGdjYzEwDQo+IEFkZCBuZXcgZGVwZW5kZW5jeSBvbiBvY2wtaWNkDQoN
CldoeSBkb2VzIGl0IG5lZWQgdG8gZGVwZW5kIG9uIG9jbC1pY2Q/DQoNClRoYW5rcywNCg0KQW51
ag0KDQo+IEdhdGhlciBpbnN0YWxsIGFydGlmYWN0cyBmcm9tIG5ldyBsb2NhdGlvbnMNCj4gDQo+
IFsxXSANCj4gaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9PcGVuQ0wtSUNELUxvYWRl
ci9jb21taXQvNDRmMzg0YWU2MjQ2NzVkNmIwYjkyY2UzOWE5N2NiN2Y0ODk5ZDkyYQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAu
Li4vb3BlbmNsL29wZW5jbC1pY2QtbG9hZGVyX2dpdC5iYiAgICAgICAgICAgIHwgMTggKysrKysr
KysrKy0tLS0NCj4gLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3Bl
bmNsL29wZW5jbC1pY2QtbG9hZGVyX2dpdC5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL29w
ZW5jbC9vcGVuY2wtaWNkLWxvYWRlcl9naXQuYmINCj4gaW5kZXggN2M0OWM4ZDU1Mi4uM2I5ZDA1
MDU2OSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29wZW5jbC1p
Y2QtbG9hZGVyX2dpdC5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3Bl
bmNsLWljZC1sb2FkZXJfZ2l0LmJiDQo+IEBAIC0xLDI0ICsxLDI3IEBADQo+ICBTVU1NQVJZICA9
ICJPcGVuQ0wgSUNEIExvYWRlciINCj4gIERFU0NSSVBUSU9OID0gIk9wZW5DTCBjb21wdXRlIElD
RCBMb2FkZXIgZnJvbSBLaHJvbm9zIEdyb3VwIg0KPiAtTElDRU5TRSAgPSAiS2hyb25vcyINCj4g
LUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1lYzcyNDczMmNl
NzMyNjk0ODY1NzRjNzE4ZWYwYzc5YiINCj4gK0xJQ0VOU0UgID0gIkFwYWNoZS0yLjAiDQo+ICtM
SUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0
NzliZDg5ODY5NjhmNDMyNyINCj4gIFNFQ1RJT04gPSAiYmFzZSINCj4gIA0KPiArREVQRU5EUyAr
PSAib3BlbmNsLWhlYWRlcnMgb2NsLWljZCINCj4gKw0KPiAgaW5oZXJpdCBwa2djb25maWcgY21h
a2UNCj4gIA0KPiAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gLVNSQ1JFViA9ICJiMzQyZmY3Yjdm
NzBhNGIzZjJjZmM1MzIxNWFmOGZhMjBhZGMzZDg2Ig0KPiArUFYgPSAiMjAyMC4wNi4xNitnaXQk
e1NSQ1BWfSINCj4gK1NSQ1JFViA9ICI4NjJlZWJlN2NhNzMzYzM5ODMzNGE4ZGI4NDgxMTcyYTdk
M2EzYzQ3Ig0KPiAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9PcGVu
Q0wtSUNELUxvYWRlci5naXQiDQo+ICANCj4gIGRvX2luc3RhbGwgKCkgew0KPiAgCWluc3RhbGwg
LWQgJHtEfSR7YmluZGlyfQ0KPiAtCWluc3RhbGwgLW0gMDc1NSAke0J9L2Jpbi9pY2RfbG9hZGVy
X3Rlc3QgJHtEfSR7YmluZGlyfS8NCj4gKwlpbnN0YWxsIC1tIDA3NTUgJHtCfS90ZXN0L2xvYWRl
cl90ZXN0L2ljZF9sb2FkZXJfdGVzdA0KPiAke0R9JHtiaW5kaXJ9Lw0KPiAgCWNocnBhdGggLWQg
JHtEfSR7YmluZGlyfS9pY2RfbG9hZGVyX3Rlc3QNCj4gIAlpbnN0YWxsIC1kICR7RH0ke2xpYmRp
cn0NCj4gLQlpbnN0YWxsIC1tIDA2NDQgJHtCfS9saWIvbGliSWNkTG9nLnNvICR7RH0ke2xpYmRp
cn0vDQo+IC0JaW5zdGFsbCAtbSAwNjQ0ICR7Qn0vbGliL2xpYk9wZW5DTERyaXZlclN0dWIuc28g
JHtEfSR7bGliZGlyfS8NCj4gKwlpbnN0YWxsIC1tIDA2NDQgJHtCfS90ZXN0L2xvZy9saWJJY2RM
b2cuc28gJHtEfSR7bGliZGlyfS8NCj4gKwlpbnN0YWxsIC1tIDA2NDQgJHtCfS90ZXN0L2RyaXZl
cl9zdHViL2xpYk9wZW5DTERyaXZlclN0dWIuc28NCj4gJHtEfSR7bGliZGlyfS8NCj4gIAljaHJw
YXRoIC1kICR7RH0ke2xpYmRpcn0vbGliT3BlbkNMRHJpdmVyU3R1Yi5zbw0KPiAtCWluc3RhbGwg
LW0gMDY0NCAke0J9L2xpYi9saWJPcGVuQ0wuc28uMS4yICR7RH0ke2xpYmRpcn0vDQo+ICsJaW5z
dGFsbCAtbSAwNjQ0ICR7Qn0vbGliT3BlbkNMLnNvLjEuMiAke0R9JHtsaWJkaXJ9Lw0KPiAgCWNk
ICR7RH0ke2xpYmRpcn0NCj4gIAlsbiAtcyBsaWJPcGVuQ0wuc28uMS4yIGxpYk9wZW5DTC5zby4x
DQo+ICAJbG4gLXMgbGliT3BlbkNMLnNvLjEgbGliT3BlbkNMLnNvDQo+IEBAIC00MSw1ICs0NCw0
IEBAIEZJTEVTXyR7UE59LWRldiA9ICIgXA0KPiAgRklMRVNfbGliaWNkbG9nID0gIiR7bGliZGly
fS9saWJJY2RMb2cuc28iDQo+ICBGSUxFU19saWJpY2Rsb2ctZGJnID0gIiR7bGliZGlyfS8uZGVi
dWcvbGliSWNkTG9nLnNvIg0KPiAgDQo+IC1ERVBFTkRTID0gIm9wZW5jbC1oZWFkZXJzIg0KPiAg
UkRFUEVORFNfJHtQTn0gPSAibGliaWNkbG9nIg0KPiANCg==
