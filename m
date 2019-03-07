Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF0F7CE44
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:55:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2019 17:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,450,1544515200"; d="scan'208";a="131913153"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga003.jf.intel.com with ESMTP; 06 Mar 2019 17:55:35 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.205]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.61]) with mapi id
	14.03.0415.000; Thu, 7 Mar 2019 09:55:34 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "open.source@oleksandr-kravchuk.com" <open.source@oleksandr-kravchuk.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
Thread-Index: AQHU1IhdQQWcVUhjfkGdpANcqcYcGKX+4oWA
Date: Thu, 7 Mar 2019 01:55:33 +0000
Message-ID: <cd9f781dba6a8afc0b6336c5af133303f136efe2.camel@intel.com>
References: <20190307015059.18407-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190307015059.18407-1-open.source@oleksandr-kravchuk.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.22.38]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 01:55:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AA1C042622A0B4392ADA25ACACC520B@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTAzLTA3IGF0IDAyOjUwICswMTAwLCBPbGVrc2FuZHIgS3JhdmNodWsgd3Jv
dGU6DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBLcmF2Y2h1ayA8b3Blbi5zb3VyY2VAb2xl
a3NhbmRyLWtyYXZjaHVrLmNvbQ0KPiA+DQo+IC0tLQ0KPiAgLi4uL3t3aXJlc2hhcmtfMi42LjYu
YmIgPT4gd2lyZXNoYXJrXzMuMC4wLmJifSAgICAgICB8IDEyICsrKysrLS0tLS0NCj4gLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ICByZW5h
bWUgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC93aXJlc2hhcmsve3dpcmVzaGFya18y
LjYuNi5iYiANCj4gPT4gd2lyZXNoYXJrXzMuMC4wLmJifSAoODklKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLQ0KPiBzdXBwb3J0L3dpcmVzaGFyay93aXJlc2hh
cmtfMi42LjYuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy0NCj4gc3VwcG9ydC93aXJlc2hh
cmsvd2lyZXNoYXJrXzMuMC4wLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggODklDQo+IHJlbmFtZSBm
cm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLQ0KPiBzdXBwb3J0L3dpcmVzaGFyay93aXJlc2hh
cmtfMi42LjYuYmINCj4gcmVuYW1lIHRvIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLQ0KPiBzdXBw
b3J0L3dpcmVzaGFyay93aXJlc2hhcmtfMy4wLjAuYmINCj4gaW5kZXggNDY5OWY2Nzk4Li5kOTQw
YTQ1NjcgMTAwNjQ0DQo+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvd2ly
ZXNoYXJrL3dpcmVzaGFya18yLjYuNi5iYg0KPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1zdXBwb3J0L3dpcmVzaGFyay93aXJlc2hhcmtfMy4wLjAuYmINCj4gQEAgLTQsMjIgKzQsMjAg
QEAgU0VDVElPTiA9ICJuZXQiDQo+ICBMSUNFTlNFID0gIkdQTC0yLjAiDQo+ICBMSUNfRklMRVNf
Q0hLU1VNID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT02ZTI3MTIzNGJhMWExM2M2ZTUxMmU3NmI5
NGFjMmY3NyINCj4gIA0KPiAtREVQRU5EUyA9ICJwY3JlIGV4cGF0IGdsaWItMi4wIGdsaWItMi4w
LW5hdGl2ZSBsaWJnY3J5cHQgbGliZ3BnLQ0KPiBlcnJvciBsaWJ4bWwyIGJpc29uLW5hdGl2ZSIN
Cj4gK0RFUEVORFMgPSAicGNyZSBleHBhdCBnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgbGliZ2Ny
eXB0IGxpYmdwZy0NCj4gZXJyb3IgbGlieG1sMiBiaXNvbi1uYXRpdmUgZ2l0Ig0KPiAgDQo+ICBE
RVBFTkRTX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiIHdpcmVzaGFyay1uYXRpdmUgY2hycGF0aC0N
Cj4gcmVwbGFjZW1lbnQtbmF0aXZlICINCj4gIA0KPiAtU1JDX1VSSSA9ICINCj4gaHR0cHM6Ly8x
LmFzLmRsLndpcmVzaGFyay5vcmcvc3JjL2FsbC12ZXJzaW9ucy8ke0JQfS50YXIueHogXA0KPiAt
ICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtbGlibS10by1saW5rLWZvci1mbW9kLUFQSS5wYXRj
aCBcDQo+IC0gICAgICAgICAgIg0KPiArU1JDX1VSSSA9ICJodHRwczovLzEuZXUuZGwud2lyZXNo
YXJrLm9yZy9zcmMvd2lyZXNoYXJrLSR7UFZ9LnRhci54eiINCj4gIA0KDQpZb3UgZm9yZ290IHRv
IHJlbW92ZSB0aGUgYWN0dWFsIHBhdGNoIGZpbGU/DQo=

