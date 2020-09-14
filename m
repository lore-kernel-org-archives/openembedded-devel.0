Received: from mail.innerrange.com.au (mail.innerrange.com.au [203.222.77.226])
 by mx.groups.io with SMTP id smtpd.web10.50187.1600043271334185412
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2020 17:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: innerrange.com, ip: 203.222.77.226, mailfrom: craig.mcqueen@innerrange.com)
Received: from ir-mail.corp.innerrange.com.au (192.168.4.15) by
 ir-mail.corp.innerrange.com.au (192.168.4.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 14 Sep 2020 10:27:44 +1000
Received: from ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f]) by
 ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f%2]) with mapi id
 15.01.1531.010; Mon, 14 Sep 2020 10:27:44 +1000
From: "Craig McQueen" <craig.mcqueen@innerrange.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>, akuster
	<akuster808@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [dunfell 11/20] samba: upgrade 4.10.15 -> 4.10.17
Thread-Topic: [oe] [dunfell 11/20] samba: upgrade 4.10.15 -> 4.10.17
Thread-Index: AQHWg6V7rWYtnX+5p0SLMPXWgOIe76ld+CyAgAlYbKA=
Date: Mon, 14 Sep 2020 00:27:44 +0000
Message-ID: <10d2f4b5abc24cc7832950f66092867b@innerrange.com>
References: <cover.1599324864.git.akuster808@gmail.com>
 <060d218f82af9070a8e79cefe1093f9b0e6bd7b8.1599324864.git.akuster808@gmail.com>
 <CALbNGRSguQ_U3S684j_2yiaMQYVeixaMj6Furkzk7wuZAwi=Bw@mail.gmail.com>
In-Reply-To: <CALbNGRSguQ_U3S684j_2yiaMQYVeixaMj6Furkzk7wuZAwi=Bw@mail.gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.150.62.251]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlc2RheSwgOCBTZXB0ZW1iZXIgMjAyMCA5OjMxIFBNLCBBbmRyZWFzIE3DvGxsZXIgd3Jv
dGU6DQo+IA0KPiBNYXliZSBJIG1lc3NlZCBzb21ldGhpbmcgYnV0IGl0IGZhaWxzIGZvciBtZSBp
IHJlY2VudCBkdW5mZWxsIHdpdGg6DQo+IHwgQ2hlY2tpbmcgZm9yIHN5c3RlbSBweWxkYi11dGls
LmNweXRob24tMzgtYXJtLWxpbnV4LWdudWVhYmkNCj4gKD49MS41LjggPD0xLjUuOTk5KSAgIDog
bm90IGZvdW5kDQo+IHwgRVJST1I6IFN5c3RlbSBsaWJyYXJ5IHB5bGRiLXV0aWwuY3B5dGhvbi0z
OC1hcm0tbGludXgtZ251ZWFiaSBvZg0KPiB2ZXJzaW9uIDEuNS44IG5vdCBmb3VuZCwgYW5kIGJ1
bmRsaW5nIGRpc2FibGVkDQo+IHwgV0FSTklORzogL2hvbWUvc3VwZXJhbmR5L3RtcC9vZS1jb3Jl
LWdsaWJjL3dvcmsvY29ydGV4YTl0MmhmLQ0KPiBuZW9uLW1vcnRzZ25hLWxpbnV4LWdudWVhYmkv
c2FtYmEvNC4xMC4xNy1yMC90ZW1wL3J1bi5kb19jb25maWd1cmUuMjk3ODY2NToxDQo+IGV4aXQg
MSBmcm9tICcke0NPTkZJR19DTUR9IC0tY3Jvc3MtYW5zd2Vycz0iJHtDUk9TU19BTlNXRVJTfSIn
DQo+IA0KPiBTdWdnZXN0aW9ucyB3ZWxjb21lDQo+IA0KPiBBbmRyZWFzDQoNCg0KSSdtIGhhdmlu
ZyB0aGUgc2FtZSBpc3N1ZS4gSSBzZWUgdGhhdCBvbiAyOS8wNy8yMDIwLCBZaSBaaGFvIHN1Ym1p
dHRlZCBhIHBhdGNoIHRvIHVwZGF0ZSBsaWJsZGIgZnJvbSAxLjUuNyB0byAxLjUuOCwgd2hpY2gg
bWlnaHQgYmUgdXNlZnVsIHRvIHRoaXMgaXNzdWUuIEJ1dCB0aGVuIHRoZSBzYW1iYSByZWNpcGUg
c3RpbGwgbmVlZHMgdG8gYWRkIGEgREVQRU5EUyBmb3IgaXQgSSBwcmVzdW1lLg0KDQotLSANCkNy
YWlnIE1jUXVlZW4NCg0K
