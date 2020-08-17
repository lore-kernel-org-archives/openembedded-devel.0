Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.37488.1597641099221777836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2020 22:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PrGTMvuHj4N2xXeduW+PKxaTfdLdU4xEwuYKDnvCcOeM07+BWDPgccxL9QRdjJbU6gLLvnQKqf
 xupLWK8SFQJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="152283812"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="152283812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2020 22:11:38 -0700
IronPort-SDR: 5vYcegT2KFN/4Ue9IDn2jJR0a2ewXxODK4M8X65FVAydQArMoyQzTyt/UPUySsQMHTgR782ohL
 Y5qJxRmYpZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="333970714"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2020 22:11:37 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 13:11:36 +0800
Received: from pgsmsx105.gar.corp.intel.com (10.221.44.96) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 17 Aug 2020 13:11:36 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.186]) by
 PGSMSX105.gar.corp.intel.com ([169.254.4.108]) with mapi id 14.03.0439.000;
 Mon, 17 Aug 2020 13:11:36 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: Upgrade 1.51.03 -> 1.54.02
Thread-Topic: [oe] [meta-oe][PATCH] xmlrpc-c: Upgrade 1.51.03 -> 1.54.02
Thread-Index: AQHWdFN/zfhRTreAGkCv855L/yekKak7OvwA
Date: Mon, 17 Aug 2020 05:11:35 +0000
Message-ID: <d3996da2d15a35f70ec06b701085a4488af2f62c.camel@intel.com>
References: <20200817050132.4078162-1-arthur.she@linaro.org>
In-Reply-To: <20200817050132.4078162-1-arthur.she@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.146.165]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F62A59F48DCA77479A45421417522094@intel.com>
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIwLTA4LTE2IGF0IDIyOjAxIC0wNzAwLCBBcnRodXIgU2hlIHdyb3RlOg0KPiBV
cGdyYWRlIHRvIHJlbGVhc2UgMS41NC4wMjoNCj4gDQo+IC0gQnVpbGQ6IFVzZSAnY3VybC1jb25m
aWcnIGZvdW5kIGF0IGNvbmZpZ3VyZSB0aW1lLCBub3QgYXQgbWFrZSB0aW1lLg0KPiAtIEZpeCBi
dWc6ICd0b1ZhbHVlJyB3b24ndCBjb21waWxlIGZvciB2ZWN0b3Igb2YgdmVjdG9ycyBvciBtYXAg
b2YNCj4gdmVjdG9ycy4gVGhhbmtzIFlhbmcgQm8gLg0KPiAtIEZpeCB0aW55IG1lbW9yeSBsZWFr
IGluIHZpcnR1YWxseSBpbXBvc3NpYmxlIGxvdyBtZW1vcnkgc2l0dWF0aW9uLg0KPiANCj4gSXQg
YWxzbyBzb2x2ZWQgb25lIGlndC1ncHUtdG9vbHMgdGVzdCByZXN1bHRzIG1pc2xlYWRpbmcgaXNz
dWUgWzFdDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3Qt
Z3B1LXRvb2xzLy0vaXNzdWVzLzkyDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnRodXIgU2hlIDxh
cnRodXIuc2hlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgLi4uL3htbHJwYy1jL3htbHJwYy1jXzEu
NTQuMDIuYmIgICAgICAgICAgICAgIHwgNDkNCj4gKysrKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMveG1scnBjLWMveG1scnBjLQ0KPiBjXzEuNTQuMDIuYmINCj4g
DQoNClRoaXMgaXMgYWRkaW5nIGEgbmV3IHJlY2lwZSBpbnN0ZWFkIG9mIHVwZ3JhZGluZyB0aGUg
ZXhpc3Rpbmcgb25lLiBZb3UNCnByb2JhYmx5IGZvcmdvdCB0byBnaXQgcm0gdGhlIG9sZCBvbmU/
DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMveG1scnBjLWMveG1scnBjLWNfMS41NC4wMi5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy94bWxycGMtYy94bWxycGMtY18xLjU0LjAyLmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uYzFmMGI3OGNhDQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3htbHJwYy1jL3htbHJwYy1jXzEuNTQuMDIuYmIN
Cj4gQEAgLTAsMCArMSw0OSBAQA0KPiArREVTQ1JJUFRJT04gPSAiWE1MLVJQQyBmb3IgQy9DKysg
aXMgcHJvZ3JhbW1pbmcgbGlicmFyaWVzIGFuZA0KPiByZWxhdGVkIHRvb2xzIHRvIGhlbHAgeW91
IFwNCj4gK3dyaXRlIGFuIFhNTC1SUEMgc2VydmVyIG9yIGNsaWVudCBpbiBDIG9yIEMrKy4iDQo+
ICsNCj4gK0hPTUVQQUdFID0gImh0dHA6Ly94bWxycGMtYy5zb3VyY2Vmb3JnZS5uZXQvIg0KPiAr
TElDRU5TRSA9ICJCU0QgJiBNSVQiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9k
b2MvQ09QWUlORzttZDU9YWVmYmY4MWJhMDc1MGYwMjE3NmI2Zjg2NzUyZWE5NTEiDQo+ICsNCj4g
K1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9taXJyb3IveG1scnBjLWMuZ2l0IFwNCj4gKyAg
ICAgICAgICAgZmlsZTovLzAwMDEtdGVzdC1jcHAtc2VydmVyX2FieXNzLUZpeC1idWlsZC13aXRo
LWNsYW5nLQ0KPiBsaWJjLnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovLzAwMDItZml4LWZv
cm1hdHRpbmctaXNzdWVzLnBhdGNoIFwNCj4gKyAgICAgICAgICAgIg0KPiArDQo+ICsjUmVsZWFz
ZSAxLjU0LjAyDQo+ICtTUkNSRVYgPSAiODY0MDVjN2UxYmQ0ZjcwMjg3MjA0YTI4ZDI0MmExMDU0
ZGFhYjUyMCINCj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdC9zdGFibGUiDQo+ICsNCj4gK0RF
UEVORFMgPSAibGlieG1sMiINCj4gKw0KPiAraW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIGJp
bmNvbmZpZyBwa2djb25maWcNCj4gKw0KPiArVEFSR0VUX0NGTEFHUyArPSAiLVduby1uYXJyb3dp
bmciDQo+ICsNCj4gK0VYVFJBX09FTUFLRSArPSAiQ0NfRk9SX0JVSUxEPScke0JVSUxEX0NDfScg
XA0KPiArICAgICAgICAgICAgICAgICBMRF9GT1JfQlVJTEQ9JyR7QlVJTERfTER9JyBcDQo+ICsg
ICAgICAgICAgICAgICAgIENGTEFHU19GT1JfQlVJTEQ9JyR7QlVJTERfQ0ZMQUdTfScgXA0KPiAr
ICAgICAgICAgICAgICAgICBMREZMQUdTX0ZPUl9CVUlMRD0nJHtCVUlMRF9MREZMQUdTfScgXA0K
PiArICAgICAgICAgICAgICAgICAiDQo+ICsNCj4gK0VYVFJBX09FQ09ORiArPSAiLS1kaXNhYmxl
LWxpYnd3dy1jbGllbnQgLS1kaXNhYmxlLXdpbmluZXQtY2xpZW50Ig0KPiArDQo+ICtQQUNLQUdF
Q09ORklHID8/PSAiY3VybCBjcGx1c3BsdXMiDQo+ICsNCj4gK1BBQ0tBR0VDT05GSUdbYWJ5c3Nd
ID0gIi0tZW5hYmxlLWFieXNzLXNlcnZlciAtLWVuYWJsZS1hYnlzcy10aHJlYWRzIA0KPiAtLWVu
YWJsZS1hYnlzcy1vcGVuc3NsLC0tZGlzYWJsZS1hYnlzcy1zZXJ2ZXIgLS1kaXNhYmxlLWFieXNz
LXRocmVhZHMgDQo+IC0tZGlzYWJsZS1hYnlzcy1vcGVuc3NsLG9wZW5zc2wsIg0KPiArUEFDS0FH
RUNPTkZJR1tjcGx1c3BsdXNdID0gIi0tZW5hYmxlLWNwbHVzcGx1cywtLWRpc2FibGUtDQo+IGNw
bHVzcGx1cywsIg0KPiArUEFDS0FHRUNPTkZJR1tjdXJsXSA9ICItLWVuYWJsZS1jdXJsLWNsaWVu
dCwtLWRpc2FibGUtY3VybC0NCj4gY2xpZW50LGN1cmwsY3VybCINCj4gKw0KPiArZG9fY29uZmln
dXJlKCkgew0KPiArICAgICAgICBpbnN0YWxsIC1tIDA3NTUgJHtTVEFHSU5HX0RBVEFESVJfTkFU
SVZFfS9nbnUtDQo+IGNvbmZpZy9jb25maWcuZ3Vlc3MgJHtTfQ0KPiArICAgICAgICBpbnN0YWxs
IC1tIDA3NTUgJHtTVEFHSU5HX0RBVEFESVJfTkFUSVZFfS9nbnUtDQo+IGNvbmZpZy9jb25maWcu
c3ViICR7U30NCj4gKyAgICAgICAgYXV0b2NvbmYNCj4gKyAgICAgICAgb2VfcnVuY29uZg0KPiAr
ICAgICAgICAjIGxpY2Vuc2UgaXMgaW5jb21wYXRpYmxlIHdpdGggbGliL3V0aWwvZ2V0b3B0eC4q
DQo+ICsgICAgICAgIHJtIC1mdiAke1N9L3Rvb2xzL3R1cmJvY2hhcmdlci9tb2RfZ3ppcC5jDQo+
ICt9DQo+ICsNCj4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIg0KPiArDQo+ICtDTEVBTkJST0tF
TiA9ICIxIg0KPiANCg==
