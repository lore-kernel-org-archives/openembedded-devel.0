Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9493B770CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:39:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41290366"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2018 15:39:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3FE8E4B41ED0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:39:07 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0399.000; Wed, 20 Jun 2018 15:39:08 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] opensaf:Modified PACKAGECONFIG
	to fix the following error:
Thread-Index: AQHT/Jt5bMv5lXoAdEaC5fD77up6NqRo2kjg
Date: Wed, 20 Jun 2018 07:39:12 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD0170F9E9A6@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527371712-739-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1527371712-739-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3FE8E4B41ED0.AC044
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking][PATCH] opensaf:Modified PACKAGECONFIG to fix the following error:
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
X-List-Received-Date: Wed, 20 Jun 2018 07:39:11 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

UGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IFN1bmRheSwgTWF5IDI3LCAyMDE4IDU6
NTUgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiBMZWksIE1hb2h1aQ0KPiBTdWJqZWN0OiBbb2Vd
IFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBvcGVuc2FmOk1vZGlmaWVkIFBB
Q0tBR0VDT05GSUcgdG8gZml4DQo+IHRoZSBmb2xsb3dpbmcgZXJyb3I6DQo+
IA0KPiB8IGNvbmZpZ3VyZTogZXJyb3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRz
IChsaWJ2aXJ0KSB3ZXJlIG5vdCBtZXQ6DQo+IHwNCj4gfCBObyBwYWNrYWdl
ICdsaWJ2aXJ0JyBmb3VuZA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVpIE1h
b2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1l
dGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvb3BlbnNhZi9vcGVuc2Fm
XzUuMTguMDIuYmIgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvb3BlbnNhZi9v
cGVuc2FmXzUuMTguMDIuYmIgYi9tZXRhLQ0KPiBuZXR3b3JraW5nL3JlY2lw
ZXMtZGFlbW9ucy9vcGVuc2FmL29wZW5zYWZfNS4xOC4wMi5iYg0KPiBpbmRl
eCA0YjU1NmNlLi5jYTBhZTQyIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1kYWVtb25zL29wZW5zYWYvb3BlbnNhZl81LjE4LjAy
LmJiDQo+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMv
b3BlbnNhZi9vcGVuc2FmXzUuMTguMDIuYmINCj4gQEAgLTM4LDkgKzM4LDEw
IEBAIFNZU1RFTURfU0VSVklDRV8ke1BOfSArPSAib3BlbnNhZmQuc2Vydmlj
ZSINCj4gIFNZU1RFTURfQVVUT19FTkFCTEUgPSAiZGlzYWJsZSINCj4gDQo+
ICBQQUNLQUdFQ09ORklHW3N5c3RlbWRdID0gIiwsc3lzdGVtZCINCj4gLVBB
Q0tBR0VDT05GSUdbb3BlbmhwaV0gPSAiLS13aXRoLWhwaS1pbnRlcmZhY2U9
QjAzIC0tZW5hYmxlLWFpcy1wbG0sLG9wZW5ocGkiDQo+ICtQQUNLQUdFQ09O
RklHW29wZW5ocGldID0gIi0td2l0aC1ocGktaW50ZXJmYWNlPUIwMywsb3Bl
bmhwaSINCj4gK1BBQ0tBR0VDT05GSUdbcGxtXSA9ICItLWVuYWJsZS1haXMt
cGxtLC0tZGlzYWJsZS1haXMtcGxtLGxpYnZpcnQgb3BlbmhwaSINCj4gDQo+
IC1QQUNLQUdFQ09ORklHX2FwcGVuZCA9ICIke0BiYi51dGlscy5jb250YWlu
cygnRElTVFJPX0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCAnDQo+IHN5c3RlbWQn
LCAnJywgZCl9Ig0KPiArUEFDS0FHRUNPTkZJRyA/PSAiJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgJw0KPiBz
eXN0ZW1kJywgJycsIGQpfSINCj4gDQo+ICBQS0dMSUJESVI9IiR7bGliZGly
fSINCj4gDQo+IC0tDQo+IDEuOS4xDQoNCgoK

