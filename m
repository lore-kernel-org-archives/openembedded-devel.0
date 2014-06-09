Return-Path: <yaoxp@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C24E66101
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 00:50:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,1000,1392134400"; d="scan'208";a="31626845"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jun 2014 08:48:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s590oeV1019363
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jun 2014 08:50:41 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 9 Jun 2014 08:50:42 +0800
From: "yaoxp@cn.fujitsu.com" <yaoxp@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lvm2.inc: EXTRA_OECONF is been overwrited.
Thread-Index: AQHPgXC/qu4MmALELEChSwW7SNUV5JtjYj+AgASUKeA=
Date: Mon, 9 Jun 2014 00:50:41 +0000
Message-ID: <9AD1F2A584A7644C9605656D538412FEAA34CF@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1402049928-10313-2-git-send-email-yaoxp@cn.fujitsu.com>
	<lms6k7$tb1$1@ger.gmane.org>
In-Reply-To: <lms6k7$tb1$1@ger.gmane.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.206]
MIME-Version: 1.0
Subject: =?UTF-8?B?562U5aSNOiBbbWV0YS1vZV1bUEFUQ0hdIGx2bTIuaW5jOiBFWFRSQV9PRUNPTkYgaXMgYmVlbiBvdmVyd3JpdGVkLg==?=
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
X-List-Received-Date: Mon, 09 Jun 2014 00:50:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91DQoNCkkgd2lsbCBzZW5kIGEgbmV3IHBhdGNoDQoNCj4gDQo+IC0tLS0tQkVHSU4g
UEdQIFNJR05FRCBNRVNTQUdFLS0tLS0NCj4gSGFzaDogU0hBMQ0KPiANCj4gWWFvIFhpbnBhbiBz
Y2hyZWVmIG9wIDA2LTA2LTE0IDEyOjE4Og0KPiA+IEVYVFJBX09FQ09ORiBoYXMgYmVlbiBhc3Np
Z25lZCBiZWZvcmUg4oCYRVhUUkFfT0VDT05GID0NCj4gPiAiLS13aXRoLXVzcmxpYmRpcj0ke2xp
YmRpcn0i4oCZLiBjb2xsYXBzIHRoZSAyIGxpbmVzIGludG8gYSBzaW5nbGUNCj4gPiBFWFRSQV9P
RUNPTkYuDQo+IA0KPiBNaW5vciBuaXQ6IHRoZSBjb21taXQgc3VtbWFyeSBjb3VsZCBiZSB3cml0
dGVuIGFzDQo+IA0KPiAnbHZtMjogZG9uJ3Qgb3ZlcnJ3cml0ZSBFWFRSQV9PRUNPTkYNCj4gDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW8gWGlucGFuIDx5YW94cEBjbi5mdWppdHN1LmNvbT4g
LS0tDQo+ID4gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0yLmluYyB8IDIgKy0gMSBm
aWxlIGNoYW5nZWQsIDENCj4gPiBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2x2bTIuaW5jDQo+ID4g
Yi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2x2bTIuaW5jIGluZGV4IGM2YTllYzAuLjVm
NzdmZTYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0y
LmluYyArKysNCj4gPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMgQEAg
LTI4LDYgKzI4LDcgQEANCj4gRVhUUkFfT0VDT05GDQo+ID4gPSAiLS13aXRoLXVzZXI9IFwgLS1l
bmFibGUtcGtnY29uZmlnIFwgLS1lbmFibGUtZG1ldmVudGQgXA0KPiA+IC0td2l0aC11ZGV2LXBy
ZWZpeD0gXCArICAgICAgICAgICAgICAgIC0td2l0aC11c3JsaWJkaXI9JHtsaWJkaXJ9IFwgIg0K
PiA+DQo+ID4gUEFDS0FHRUNPTkZJRyArPSAiJHtAYmFzZV9jb250YWlucygnRElTVFJPX0ZFQVRV
UkVTJywgJ3NlbGludXgnLA0KPiA+ICdzZWxpbnV4JywgJycsIGQpfSIgQEAgLTQ3LDQgKzQ4LDMg
QEAgRklMRVNfJHtQTn0gKz0NCj4gPiAiJHtsaWJkaXJ9L2RldmljZS1tYXBwZXIvKi5zbyAke2Jh
c2VfbGliZGlyfS91ZGV2IiBGSUxFU18ke1BOfS1kYmcgKz0NCj4gPiAiJHtsaWJkaXJ9L2Rldmlj
ZS1tYXBwZXIvLmRlYnVnIg0KPiA+DQo+ID4gUkRFUEVORFNfJHtQTn0gPSAiYmFzaCIgLUVYVFJB
X09FQ09ORiA9ICItLXdpdGgtdXNybGliZGlyPSR7bGliZGlyfSINCj4gDQo+IFRoZSBwYXRjaCBp
dHNlbGYgbG9va3MgZ29vZC4NCj4gDQo+IHJlZ2FyZHMsDQo+IA0KPiBLb2VuDQo+IA0KPiANCj4g
LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCj4gVmVyc2lvbjogR251UEcgdjEuNC41IChE
YXJ3aW4pDQo+IENvbW1lbnQ6IEdQR1Rvb2xzIC0gaHR0cDovL2dwZ3Rvb2xzLm9yZw0KPiANCj4g
aUQ4REJRRlRrWjNITWt5R002NFJHcEVSQWpmaEFKNHMxdzkwS1R6UFlhakhJNkpvZTdDd3c4VkYv
QUNmZGdPDQo+IDUNCj4gM1BxRnA1MlFra2c0L1JPLzdXN1BDeXM9DQo+ID1SQmVZDQo+IC0tLS0t
RU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcg
bGlzdA0KPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1k
ZXZlbA0K

