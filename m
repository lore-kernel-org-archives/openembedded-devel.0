Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.7325.1586331636133728314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 00:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: przemyslaw.hawrylewicz.czarnowski@intel.com)
IronPort-SDR: xBC1jGvyn7VeTCxh7y+doX3B/jtVsscdFRiXzNnqIhQhfn2yjLpXp86P9Z0BMl1bpSqkGS9DcW
 cB27OxHOxCdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 00:40:34 -0700
IronPort-SDR: 48xkSQA/5TGM0AnV/DGArQA3qm8UCadsJLLkqKHRJedWFfDeAblpDH/NsVq4kXmXkkNUIbM0r7
 i0QDt9RFoGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="254719958"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
  by orsmga006.jf.intel.com with ESMTP; 08 Apr 2020 00:40:33 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 08:40:32 +0100
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 8 Apr 2020 08:40:32 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Wed, 8 Apr 2020 08:40:32 +0100
From: "Przemyslaw Czarnowski" <przemyslaw.hawrylewicz.czarnowski@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] Add nbdkit to extend backend possibilities of nbd.
Thread-Topic: [oe] [PATCH] Add nbdkit to extend backend possibilities of nbd.
Thread-Index: AQHWDPcP3M7Nm63sW0WzuA25k0KHLKht2MIA
Date: Wed, 8 Apr 2020 07:40:32 +0000
Message-ID: <908901c675ed4d919dae12181b7e2422@intel.com>
References: <20200407092347.5634-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
 <CAMKF1sqGQeok=Aey2VNibP9TjNo1S2EC56fOZ=7rgPC1vGnvAA@mail.gmail.com>
In-Reply-To: <CAMKF1sqGQeok=Aey2VNibP9TjNo1S2EC56fOZ=7rgPC1vGnvAA@mail.gmail.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
Return-Path: przemyslaw.hawrylewicz.czarnowski@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pk9uIFR1ZSwgQXByIDcsIDIwMjAgYXQgMjoyNCBBTSBQcnplbXlzbGF3IEN6YXJub3dza2kgPHBy
emVteXNsYXcuaGF3cnlsZXdpY3ouY3phcm5vd3NraUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ICtp
bmhlcml0IHBrZ2NvbmZpZyBweXRob24zbmF0aXZlIHBlcmxuYXRpdmUgcHl0aG9ubmF0aXZlIGF1
dG90b29scw0KDQo+ZG8gd2UgbmVlZCB0byBpbmhlcml0IHB5dGhvbm5hdGl2ZSBoZXJlID8gdGhp
cyB3b3VsZCBuZWVkIHB5MiBhbmQgd2UgZG8gbm90IGhhdmUgcHkyIGFueW1vcmUgaW4gY29yZSwg
c28gSSB3b3VsZCBhc2sgeW91IHRvIHNlZSBpZiB3ZSBjYW4gcmVtb3ZlIHRoaXMgZGVwZW5kZW5j
eSBvciBrZWVwIGl0IGRpc2FibGVkID5ieSBkZWZhdWx0Lg0KDQpTb3VuZHMgcmVhc29uYWJsZS4g
SSB3aWxsIHJlc3VibWl0IGFzIHNvb24gSSBoYXZlIG9jY2FzaW9uIHRvIHRlc3QgaXQuDQoNCi0t
IA0KQmVzdCByZWdhcmRzLA0KUHJ6ZW15c2xhdyBDemFybm93c2tpDQo=
