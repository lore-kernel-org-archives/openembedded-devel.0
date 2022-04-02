Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D029BC54EFE
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6555.1648858053719788788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 17:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EzFP1VOS;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648858054;
  x=1680394054;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6oU7WhwgXcckwSY+IsfvHwMLJqOWEcuU0ZiK8RrIlhs=;
  b=EzFP1VOS8phnzcV7tvgYxJyH6JsWVMDaS3TPvyX6Dh+vYfQZ0oHJYivy
   O/xPwGDk34adveebtXT8HmIS/CLvvDbm2JwkMPR+bwVkc5aOm5Rrf2F/x
   GPicx3Rdpbh6qpMNF9a+olSvYGez1eI9dCyXpaalCw9Ae5kOFZ+jB1LgN
   Q0eh8yTNSvsfgMZ4CWxlJZH3Uz6mEh4hZhDXRzfDmWTdQWimd09KCtTik
   X0Wmt+DwPC8Yu3Vyl/7ptyKtaUUg7/N+y+S+SV06cT6Ahmpyk1oI7Icax
   iSTiXAdAFs0p8RJwALHxy4Zpjx6nNQX0Bfd2zYY49B7Vdfq8b2v+5ltN1
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 15/15] Add me back to maintainers list
Thread-Topic: [oe] [PATCH 15/15] Add me back to maintainers list
Thread-Index: AQHYRhlWWo+YXg9wX0ipFaXAJdOi7azbvktQ
Date: Sat, 2 Apr 2022 00:07:31 +0000
Message-ID: <59f236e78a0748afaf9e7b3081093a0d@axis.com>
References: <20220401223705.1818622-1-schnitzeltony@gmail.com>
 <20220401223705.1818622-15-schnitzeltony@gmail.com>
In-Reply-To: <20220401223705.1818622-15-schnitzeltony@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96339

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgQW5kcmVhcyBNw7xsbGVyDQo+IFNlbnQ6IGRlbiAy
IGFwcmlsIDIwMjIgMDA6MzcNCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtvZV0gW1BBVENIIDE1LzE1XSBBZGQgbWUgYmFjayB0byBt
YWludGFpbmVycyBsaXN0DQoNCk1heSBJIHN1Z2dlc3QgY2hhbmdpbmcgdGhlIHN1YmplY3QgdG86
DQoNCm1ldGEteGZjZTogQWRkIEFuZHJlYXMgTcO8bGxlciBiYWNrIHRvIG1haW50YWluZXJzIGxp
c3QNCg0KYXMgaXQgaXMgaGFyZCB0byB0ZWxsIHdobyAibWUiIGlzIG90aGVyd2lzZSB3aGVuLCBl
LmcuLCBydW5uaW5nIA0KYGdpdCBsb2cgLS1vbmVsaW5lYC4gOykNCg0KPiANCj4gQ3JlYXRlZCB0
aGlzIGxheWVyIGEgZGVjYWRlIGFnbyBhbmQgbG92ZSBpdCBzdGlsbCA6KQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4NCj4gLS0t
DQo+ICBtZXRhLXhmY2UvUkVBRE1FIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLXhmY2UvUkVBRE1FIGIvbWV0YS14ZmNlL1JF
QURNRQ0KPiBpbmRleCAxZTlhY2M0NzEuLjNkNjE1ODYyOCAxMDA2NDQNCj4gLS0tIGEvbWV0YS14
ZmNlL1JFQURNRQ0KPiArKysgYi9tZXRhLXhmY2UvUkVBRE1FDQo+IEBAIC0xOSwzICsxOSw0IEBA
IFdoZW4gc2VuZGluZyBzaW5nbGUgcGF0Y2hlcywgcGxlYXNlIHVzaW5nIHNvbWV0aGluZyBsaWtl
Og0KPiAgZ2l0IHNlbmQtZW1haWwgLU0gLTEgLS10byBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyAtLXN1YmplY3QtcHJlZml4PSdtZXRhLXhmY2VdW1BBVENIJw0KPiAN
Cj4gIExheWVyIG1haW50YWluZXI6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0K
PiArTGF5ZXIgbWFpbnRhaW5lcjogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWls
LmNvbT4NCj4gLS0NCj4gMi4zNC4xDQoNCi8vUGV0ZXINCg0K

