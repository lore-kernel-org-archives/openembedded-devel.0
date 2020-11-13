Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.15216.1605234090395350328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: KxojQjXokS59tcEAPGFp5zOr7CZhlKQXu7O2d/1HNQtgJ1kH3n9eN0wfO2zIdV7gHXwH2uGOR4
 xImCDuZG9OEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="169632048"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="169632048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 18:21:29 -0800
IronPort-SDR: JKrGRw4VzNkWcwFEhnZ1F+xoqffXZU4ydAnnJ/cwBhvv0mQ1VQzmfU/VNii8ebT90EapegUMkc
 UKJVksRhFWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="474504847"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga004.jf.intel.com with ESMTP; 12 Nov 2020 18:21:28 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 10:21:27 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Fri, 13 Nov 2020 10:21:27 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "scott.branden@broadcom.com"
	<scott.branden@broadcom.com>
Subject: Re: [oe] all external kernel modules fail to compile with with poky and linux 5.10-rc1
Thread-Topic: [oe] all external kernel modules fail to compile with with poky
 and linux 5.10-rc1
Thread-Index: AQHWuU+pyH9Oqh7OgEaENhKeAQn4qqnEzqOA
Date: Fri, 13 Nov 2020 02:21:27 +0000
Message-ID: <dcffe9e8b3a47c0e0edaf91a294f92dcc4085553.camel@intel.com>
References: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com>
In-Reply-To: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A86FF714BEB54245867A8DF36618A8E5@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTExLTEyIGF0IDE1OjU3IC0wODAwLCBTY290dCBCcmFuZGVuIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gSXQgYXBwZWFycyB0aGUgYWxsIGV4dGVybmFs
IG1vZHVsZXMgZmFpbCB0byBjb21waWxlIGlmIHlvdSB0cnkgdXNpbmcNCj4gdGhlIDUuMTAtcmMx
IG9yIGxhdGVyIGtlcm5lbCBkdWUgdG8gdGhpcyBjb21taXQ6DQo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
P2lkPTU5NmIwNDc0ZDNkOWIxMjQyZWFiNzEzZjg0ZDg4NzNmOTg4N2Q5ODANCj4gDQo+IEhhcyBh
bnlvbmUgdHJpZWQgdG8gY29tcGlsZSB0aGUgbGF0ZXN0IGtlcm5lbCBvciBoYXMgYSBmaXggZm9y
IHlvY3RvPw0KDQpDYW4geW91IGNoZWNrIGlmIHRoaXMgcmVzb2x2ZXMgdGhlIHByb2JsZW06DQoN
Cmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3Nh
Z2UvMTQ0NTM5DQoNClRoYW5rcywNCg0KQW51ag0K
