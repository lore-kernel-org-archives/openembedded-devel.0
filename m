Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.11805.1597379736836397168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xZRNC40Tu0sXg3L2tSvO0F5H09usHpT8KMn4Rim3ASxVbl1tszvRxBgZV/Tz9/fc1QcA3q26Jw
 09PmUrrdZPzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="133878832"
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="133878832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 21:35:35 -0700
IronPort-SDR: v4JbPSJtRzsG94wnw/B0u1+4dU0FADEVyfv1dEdIaNdkrKLfJqLQtieVSk+q3Pt3qOMKngYl1W
 WddU5amuzIrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="335484327"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2020 21:35:35 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 12:35:34 +0800
Received: from pgsmsx111.gar.corp.intel.com (10.108.55.200) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 12:35:34 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.186]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.97]) with mapi id 14.03.0439.000;
 Fri, 14 Aug 2020 12:35:34 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][ 6/9] opencl-icd-loader: Update beyond 2020.06.16
Thread-Topic: [oe] [meta-oe][ 6/9] opencl-icd-loader: Update beyond
 2020.06.16
Thread-Index: AQHWcHMMjkZZY9B8VUq8t4nTO1Tx4ak2eqeAgAADEQCAAAP2AA==
Date: Fri, 14 Aug 2020 04:35:33 +0000
Message-ID: <dc637efcc46ac5231be41a714700e47556b1dd23.camel@intel.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
	 <20200812063711.2758315-6-raj.khem@gmail.com>
	 <788ba2642e9ffc12c44454664795d484395450b8.camel@intel.com>
	 <CAMKF1sqhY1xG9YfBzOm72-RyEn2cmAnvtOig5gj_e0HaTz2fvQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqhY1xG9YfBzOm72-RyEn2cmAnvtOig5gj_e0HaTz2fvQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.70.141]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <56190423DFC0354FBB18B82E34E23A8A@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA4LTEzIGF0IDIxOjIxIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VGh1LCBBdWcgMTMsIDIwMjAgYXQgOToxMCBQTSBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gVHVlLCAyMDIwLTA4LTExIGF0IDIzOjM3IC0wNzAw
LCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IExpY2Vuc2UtVXBkYXRlOiBMaWNlbnNlIGlzIG5vdyBh
cGFjaGUtMi4wIGFzIHBlciBbMV0NCj4gPiA+IA0KPiA+ID4gRml4ZXMgYnVpbGQgd2loIGdjYzEw
DQo+ID4gPiBBZGQgbmV3IGRlcGVuZGVuY3kgb24gb2NsLWljZA0KPiA+IA0KPiA+IFdoeSBkb2Vz
IGl0IG5lZWQgdG8gZGVwZW5kIG9uIG9jbC1pY2Q/DQo+IA0KPiBJdCBuZWVkcyBoZWFkZXJzIGZy
b20gaXQuDQo+IA0KDQpUaGUgaGVhZGVycyBzaG91bGQgY29tZSBmcm9tIG9wZW5jbC1oZWFkZXJz
LiBGb3IgdGhlIG1pc3NpbmcgaGVhZGVyLCB3ZQ0Kd2lsbCBuZWVkIHRvIHVwZ3JhZGUgb3BlbmNs
LWhlYWRlcnMgcmVjaXBlIHRvby4gVGhpcyBERVBFTkRTIGlzDQppbmNvcnJlY3QuDQoNClRoYW5r
cywNCg0KQW51ag0KDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IEFudWoNCj4gPiANCj4gPiA+IEdh
dGhlciBpbnN0YWxsIGFydGlmYWN0cyBmcm9tIG5ldyBsb2NhdGlvbnMNCj4gPiA+IA0KPiA+ID4g
WzFdDQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL09wZW5DTC1JQ0QtTG9h
ZGVyL2NvbW1pdC80NGYzODRhZTYyNDY3NWQ2YjBiOTJjZTM5YTk3Y2I3ZjQ4OTlkOTJhDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICAuLi4vb3BlbmNsL29wZW5jbC1pY2QtbG9hZGVyX2dpdC5iYiAgICAg
ICAgICAgIHwgMTggKysrKysrKysrKw0KPiA+ID4gLS0tLQ0KPiA+ID4gLS0tLQ0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29wZW5jbC1pY2Qt
bG9hZGVyX2dpdC5iYg0KPiA+ID4gYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb3BlbmNs
LWljZC1sb2FkZXJfZ2l0LmJiDQo+ID4gPiBpbmRleCA3YzQ5YzhkNTUyLi4zYjlkMDUwNTY5IDEw
MDY0NA0KPiA+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29wZW5jbC1pY2Qt
bG9hZGVyX2dpdC5iYg0KPiA+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29w
ZW5jbC1pY2QtbG9hZGVyX2dpdC5iYg0KPiA+ID4gQEAgLTEsMjQgKzEsMjcgQEANCj4gPiA+ICBT
VU1NQVJZICA9ICJPcGVuQ0wgSUNEIExvYWRlciINCj4gPiA+ICBERVNDUklQVElPTiA9ICJPcGVu
Q0wgY29tcHV0ZSBJQ0QgTG9hZGVyIGZyb20gS2hyb25vcyBHcm91cCINCj4gPiA+IC1MSUNFTlNF
ICA9ICJLaHJvbm9zIg0KPiA+ID4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiA+ID4gImZpbGU6Ly9M
SUNFTlNFLnR4dDttZDU9ZWM3MjQ3MzJjZTczMjY5NDg2NTc0YzcxOGVmMGM3OWIiDQo+ID4gPiAr
TElDRU5TRSAgPSAiQXBhY2hlLTIuMCINCj4gPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiA+
ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciDQo+
ID4gPiAgU0VDVElPTiA9ICJiYXNlIg0KPiA+ID4gDQo+ID4gPiArREVQRU5EUyArPSAib3BlbmNs
LWhlYWRlcnMgb2NsLWljZCINCj4gPiA+ICsNCj4gPiA+ICBpbmhlcml0IHBrZ2NvbmZpZyBjbWFr
ZQ0KPiA+ID4gDQo+ID4gPiAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPiA+IC1TUkNSRVYgPSAi
YjM0MmZmN2I3ZjcwYTRiM2YyY2ZjNTMyMTVhZjhmYTIwYWRjM2Q4NiINCj4gPiA+ICtQViA9ICIy
MDIwLjA2LjE2K2dpdCR7U1JDUFZ9Ig0KPiA+ID4gK1NSQ1JFViA9ICI4NjJlZWJlN2NhNzMzYzM5
ODMzNGE4ZGI4NDgxMTcyYTdkM2EzYzQ3Ig0KPiA+ID4gIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9LaHJvbm9zR3JvdXAvT3BlbkNMLUlDRC1Mb2FkZXIuZ2l0Ig0KPiA+ID4gDQo+ID4gPiAg
ZG9faW5zdGFsbCAoKSB7DQo+ID4gPiAgICAgICBpbnN0YWxsIC1kICR7RH0ke2JpbmRpcn0NCj4g
PiA+IC0gICAgIGluc3RhbGwgLW0gMDc1NSAke0J9L2Jpbi9pY2RfbG9hZGVyX3Rlc3QgJHtEfSR7
YmluZGlyfS8NCj4gPiA+ICsgICAgIGluc3RhbGwgLW0gMDc1NSAke0J9L3Rlc3QvbG9hZGVyX3Rl
c3QvaWNkX2xvYWRlcl90ZXN0DQo+ID4gPiAke0R9JHtiaW5kaXJ9Lw0KPiA+ID4gICAgICAgY2hy
cGF0aCAtZCAke0R9JHtiaW5kaXJ9L2ljZF9sb2FkZXJfdGVzdA0KPiA+ID4gICAgICAgaW5zdGFs
bCAtZCAke0R9JHtsaWJkaXJ9DQo+ID4gPiAtICAgICBpbnN0YWxsIC1tIDA2NDQgJHtCfS9saWIv
bGliSWNkTG9nLnNvICR7RH0ke2xpYmRpcn0vDQo+ID4gPiAtICAgICBpbnN0YWxsIC1tIDA2NDQg
JHtCfS9saWIvbGliT3BlbkNMRHJpdmVyU3R1Yi5zbw0KPiA+ID4gJHtEfSR7bGliZGlyfS8NCj4g
PiA+ICsgICAgIGluc3RhbGwgLW0gMDY0NCAke0J9L3Rlc3QvbG9nL2xpYkljZExvZy5zbyAke0R9
JHtsaWJkaXJ9Lw0KPiA+ID4gKyAgICAgaW5zdGFsbCAtbSAwNjQ0DQo+ID4gPiAke0J9L3Rlc3Qv
ZHJpdmVyX3N0dWIvbGliT3BlbkNMRHJpdmVyU3R1Yi5zbw0KPiA+ID4gJHtEfSR7bGliZGlyfS8N
Cj4gPiA+ICAgICAgIGNocnBhdGggLWQgJHtEfSR7bGliZGlyfS9saWJPcGVuQ0xEcml2ZXJTdHVi
LnNvDQo+ID4gPiAtICAgICBpbnN0YWxsIC1tIDA2NDQgJHtCfS9saWIvbGliT3BlbkNMLnNvLjEu
MiAke0R9JHtsaWJkaXJ9Lw0KPiA+ID4gKyAgICAgaW5zdGFsbCAtbSAwNjQ0ICR7Qn0vbGliT3Bl
bkNMLnNvLjEuMiAke0R9JHtsaWJkaXJ9Lw0KPiA+ID4gICAgICAgY2QgJHtEfSR7bGliZGlyfQ0K
PiA+ID4gICAgICAgbG4gLXMgbGliT3BlbkNMLnNvLjEuMiBsaWJPcGVuQ0wuc28uMQ0KPiA+ID4g
ICAgICAgbG4gLXMgbGliT3BlbkNMLnNvLjEgbGliT3BlbkNMLnNvDQo+ID4gPiBAQCAtNDEsNSAr
NDQsNCBAQCBGSUxFU18ke1BOfS1kZXYgPSAiIFwNCj4gPiA+ICBGSUxFU19saWJpY2Rsb2cgPSAi
JHtsaWJkaXJ9L2xpYkljZExvZy5zbyINCj4gPiA+ICBGSUxFU19saWJpY2Rsb2ctZGJnID0gIiR7
bGliZGlyfS8uZGVidWcvbGliSWNkTG9nLnNvIg0KPiA+ID4gDQo+ID4gPiAtREVQRU5EUyA9ICJv
cGVuY2wtaGVhZGVycyINCj4gPiA+ICBSREVQRU5EU18ke1BOfSA9ICJsaWJpY2Rsb2ciDQo+ID4g
PiANCg==
