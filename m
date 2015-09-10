Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BF80873232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:34:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2015 08:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,505,1437462000"; d="scan'208";a="766345327"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2015 08:33:54 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 10 Sep 2015 08:33:52 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.207]) by
	FMSMSX109.amr.corp.intel.com ([169.254.15.192]) with mapi id
	14.03.0224.002; Thu, 10 Sep 2015 08:33:52 -0700
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH]] toybox: upgrade to 0.6.0
Thread-Index: AQHQ50/55gu+Cf2fakGHqwrzXGZPAZ42YuUA
Date: Thu, 10 Sep 2015 15:33:52 +0000
Message-ID: <1441899228.12956.8.camel@intel.com>
References: <1441398373-21244-1-git-send-email-alejandro.joya.cruz@intel.com>
In-Reply-To: <1441398373-21244-1-git-send-email-alejandro.joya.cruz@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.128.56]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH]] toybox: upgrade to 0.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 15:34:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE4E1C43E8AD584A8E7C786E721741BC@intel.com>
Content-Transfer-Encoding: base64

U29tZSBmZWVkYmFjayBvbiB0aGlzLg0KDQpPbiB2aWUsIDIwMTUtMDktMDQgYXQgMjA6MjYgKzAw
MDAsIEpveWEgQ3J1eiwgQWxlamFuZHJvIHdyb3RlOg0KPiBDaGFuZ2UgU1JDX1VSSSBzaW5jZSBw
YXRjaCBpcyBub3QgbG9uZ2VyIG5lZWQgaXQuDQo+IFVwZGF0ZSB0aGUgY2hlY2tzdW0gZm9yIHBh
Y2thZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGVqYW5kcm8gSm95YSA8YWxlamFuZHJvLmpv
eWEuY3J1ekBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLWNvcmUvdG95Ym94
L3t0b3lib3hfMC41LjIuYmIgPT4gdG95Ym94XzAuNi4wLmJifSB8IDkgKysrKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAgcmVuYW1l
IG1ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC97dG95Ym94XzAuNS4yLmJiID0+IHRveWJveF8w
LjYuMC5iYn0gKDkwJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29yZS90
b3lib3gvdG95Ym94XzAuNS4yLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvdG95Ym94L3RveWJv
eF8wLjYuMC5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDkwJQ0KPiByZW5hbWUgZnJvbSBtZXRhLW9l
L3JlY2lwZXMtY29yZS90b3lib3gvdG95Ym94XzAuNS4yLmJiDQo+IHJlbmFtZSB0byBtZXRhLW9l
L3JlY2lwZXMtY29yZS90b3lib3gvdG95Ym94XzAuNi4wLmJiDQo+IGluZGV4IGJjZDZhNzIuLmRh
MDMyMDAgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL3RveWJveC90b3lib3hf
MC41LjIuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvdG95Ym94L3RveWJveF8wLjYu
MC5iYg0KPiBAQCAtMSwxMCArMSwxMSBAQA0KPiAgU1VNTUFSWSA9ICJUb3lib3ggY29tYmluZXMg
Y29tbW9uIHV0aWxpdGllcyB0b2dldGhlciBpbnRvIGEgc2luZ2xlIGV4ZWN1dGFibGUuIg0KPiAg
SE9NRVBBR0UgPSAiaHR0cDovL3d3dy5sYW5kbGV5Lm5ldC90b3lib3gvIg0KPiAgDQo+IC1TUkNf
VVJJID0gImh0dHA6Ly93d3cubGFuZGxleS5uZXQvdG95Ym94L2Rvd25sb2Fkcy8ke0JQTn0tJHtQ
Vn0udGFyLmd6IFwNCj4gLSAgICBmaWxlOi8vMDAwMS1NYXRjaC1wYXRocy13aXRoLWJ1c3lib3gu
cGF0Y2giDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiYjVkMTI0Mjc2N2M0MTFiNjlkY2Q3MTdkYTFj
MjE4YjIiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGVjN2Y2NDMzZWUwZTEzMGYyMjRmYzYz
NzYwYjM0N2FkMDU3MjI4MGM0ZGUzMmYxYWFlZmJlZTgxM2E3OWEwMCINCj4gK1NSQ19VUkkgPSAi
aHR0cDovL3d3dy5sYW5kbGV5Lm5ldC90b3lib3gvZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIu
Z3oiDQo+ICsNCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICI3ZjRhNmM4OWU1NmM0OGUzMzUwZTYxMWY1
YjM2YzJjZiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNmUyNjk0ZDE5YWMwOGYxYzM0MTZk
NWIyYTAyYTMxZDQ0NWRiMmVkOThkZWM4OTc2MTQzMGNkZmYyYzk3MTBkIg0KPiArDQo+ICANCj4g
IExJQ0VOU0UgPSAiQlNELTAtQ2xhdXNlIg0KPiAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9ZjBiOGIzZGQ2NDMxYmNhYTI0NWRhMGEwOGJkMGQ1MTEiDQoNCg==

