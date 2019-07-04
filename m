Return-Path: <jonathan.yong@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jul 2019 00:38:12 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 415AE7CE73
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2019 00:38:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2019 17:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; 
	d="scan'208,217";a="175100750"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2019 17:31:04 -0700
Received: from pgsmsx113.gar.corp.intel.com ([169.254.6.230]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.22]) with mapi id
	14.03.0439.000; Thu, 4 Jul 2019 08:31:03 +0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] Backport 'multiconfig' -> 'mc' patch to warrior?
Thread-Index: AdUxuiVEBGurEFcbS6mdNT4Tnkyy0///sqiA//8n9NA=
Date: Thu, 4 Jul 2019 00:31:02 +0000
Message-ID: <A2839490D87BE64781D1FF17AA14CEC30B9E0CED@pgsmsx113.gar.corp.intel.com>
References: <A2839490D87BE64781D1FF17AA14CEC30B9D7183@pgsmsx113.gar.corp.intel.com>
	<CA+chaQd4X1oUPYuhD1HA2g1y03Mik=uqreeRmxCR0ykD4JQZ6w@mail.gmail.com>
In-Reply-To: <CA+chaQd4X1oUPYuhD1HA2g1y03Mik=uqreeRmxCR0ykD4JQZ6w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Backport 'multiconfig' -> 'mc' patch to warrior?
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
X-List-Received-Date: Thu, 04 Jul 2019 00:38:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0ssIHdpbGwgZG8gdGhhdC4gV2lsbCB0aGVyZSBhdCBsZWFzdCBiZSB3YXJuaW5ncyBhYm91dCB0
aGUgY2hhbmdlIGluIHRoZSBjb21pbmcgT0UtQ29yZSB2ZXJzaW9ucyB0byBjaGFuZ2UgdGhlIHJl
Y2lwZSBjb250ZW50cz8NCg0KRnJvbTogTWFydGluIEphbnNhIFttYWlsdG86bWFydGluLmphbnNh
QGdtYWlsLmNvbV0NClNlbnQ6IFRodXJzZGF5LCBKdWx5IDQsIDIwMTkgMDM6MzYNClRvOiBZb25n
LCBKb25hdGhhbiA8am9uYXRoYW4ueW9uZ0BpbnRlbC5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIEJhY2twb3J0ICdt
dWx0aWNvbmZpZycgLT4gJ21jJyBwYXRjaCB0byB3YXJyaW9yPw0KDQo+IFRoZSB3YXJyaW9yIGJy
YW5jaCBpcyBicm9rZW4gd2l0aCBiaXRiYWtlIG1hc3RlciBicmFuY2gNCg0KVGhpcyBpcyB1bnN1
cHBvcnRlZCBjb21iaW5hdGlvbiwgc28gaXQncyBub3QgYnJva2VuLiBXaHkgZG9uJ3QgeW91IHVz
ZSBiaXRiYWtlIDEuNDIgd2hpY2ggaXMgY29tcGF0aWJsZSB3aXRoIHdhcnJpb3I/DQoNCk9uIFdl
ZCwgSnVsIDMsIDIwMTkgYXQgNjoyMSBQTSBZb25nLCBKb25hdGhhbiA8am9uYXRoYW4ueW9uZ0Bp
bnRlbC5jb208bWFpbHRvOmpvbmF0aGFuLnlvbmdAaW50ZWwuY29tPj4gd3JvdGU6DQpIaSBhbGws
DQoNCkNhbiBzb21lb25lIHBsZWFzZSBiYWNrcG9ydCB0aGUgZm9sbG93aW5nIHBhdGNoIGZyb20g
T0UtQ29yZSBtYXN0ZXIgdG8gd2Fycmlvcj8NCg0KY29tbWl0IDhhNmY3YzFlNDU1MTU2OTY2ZjQ2
NzAwODY0NWZlZjE0ZGI2NzljY2YNCkF1dGhvcjogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Pg0KRGF0ZTogICBGcmkgSnVuIDcgMTM6NDU6MTcgMjAxOSArMDEwMA0KDQogICAg
bXVsdGljb25maWc6IEFkYXB0IHRvIGJpdGJha2Ugc3dpdGNoICdtdWx0aWNvbmZpZycgLT4gJ21j
Jw0KDQogICAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Pg0KDQpUaGUgd2FycmlvciBicmFuY2ggaXMgYnJva2VuIHdpdGggYml0YmFrZSBtYXN0ZXIg
YnJhbmNoLCBhbmQgSSB3YW50IHRvIGF2b2lkIG5lZWRpbmcgdG8gY2hhbmdlIGFsbCBteSBsb2Nh
bCByZWNpcGVzIHdoZW4gdGhlIHRpbWUgY29tZXMgdG8gdXBncmFkZSB0byB6ZXVzLg0KVGhhbmtz
Lg0KDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Ck9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWRldmVsDQo=

