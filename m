Return-Path: <Jose.DiazdeGrenu@digi.com>
X-Greylist: delayed 395 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Jan 2018 12:12:02 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A75278931
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:12:02 +0000 (UTC)
Received: from [216.82.241.196] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta-8.messagelabs.com id E4/B8-05333-88E535A5;
	Mon, 08 Jan 2018 12:05:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42Jx8l0noNsRFxx
	lcGQKn8XFw0uZLX6+tXFg8ji3cQWjx/a1V5kCmKJYM/OS8isSWDPOPTrBXnBFoGLZ2oIGxh0C
	XYxcHEICKxklHn76ygjhLGaUODV3P3sXIycHm4C5xLTDB1lAEiICPYwSn5ZsYwZJCAvESTy/s
	RHMFhGIl9jxaiYLhG0ksfzSfbA4i4CKxL3uK2wgNq+Ar8SSKRfB4kICtRJdLycAbePg4BSwl1
	j8IQYkzCggK7Hy/GlGEJtZQFzi1pP5TCC2hICAxJI955khbFGJl4//sULYihJ3n5xlBhnDLKA
	psX6XPkSrosSU7ofsEFsFJU7OfMICsVVNom3OBOYJjCKzkGyYhdA9C0n3LCTdCxhZVjFqFKcW
	laUW6Rqa6iUVZaZnlOQmZuboGhpY6OWmFhcnpqfmJCYV6yXn525iBEZJPQMD4w7GA8/dDzFKc
	jApifKKOgdECfEl5adUZiQWZ8QXleakFh9ilOHgUJLgPRIbHCUkWJSanlqRlpkDjFeYtAQHj5
	II72yQNG9xQWJucWY6ROoUozHHk2vz/jJxPJv5uoFZiCUvPy9VSpx3MkipAEhpRmke3CBYGrn
	EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3BmQKT2ZeCdy+V0CnMAGd8m5fIMgpJYkIKakG
	Rne9xjLXFf4ZryPZVcqmzrsRG8TsIzCz8o/ux0WX/z3oOyv+vpyV+YQBzwFXcWUmjmUJNiFf3
	+goTBYKyRNPVLo36xiP5fuvFdwNvxUei/yM8hORmTvxxH7BNi7VAKs7dyoWMa46wXplcnjDwU
	Aj/ocMZt2eualzp3EfeX7E9vNUL27OJi5WJZbijERDLeai4kQAuQ0tUR4DAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-15.tower-46.messagelabs.com!1515413128!87736304!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1810 invoked from network); 8 Jan 2018 12:05:28 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-15.tower-46.messagelabs.com with SMTP;
	8 Jan 2018 12:05:28 -0000
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 8 Jan 2018 06:05:24 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Mon, 8 Jan 2018 13:05:23 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java][PATCH] openjdk-7: fix compile errors with current
	poky master (gcc6)
Thread-Index: AQHTiHfmC7rQ8quTT02S07Ax9CtdnaNp4L9A
Date: Mon, 8 Jan 2018 12:05:22 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01B5E467@dor-sms-xch01.digi.com>
References: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
	<fca0add8-d2b2-2ab1-02d1-d6232e668105@skidata.com>
In-Reply-To: <fca0add8-d2b2-2ab1-02d1-d6232e668105@skidata.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.11.101]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-7: fix compile errors with current poky master (gcc6)
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
X-List-Received-Date: Mon, 08 Jan 2018 12:12:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIEkgbWVhbnQgdG8gYXNrIHRvIG1lcmdlIHRoaXMgaW50byB0aGUgJ21vcnR5JyBicmFu
Y2guDQoNCkkgYW0gbm90IHVzZWQgdG8gdXNpbmcgbWFpbGluZyBsaXN0cyB0byBzZW5kIHBhdGNo
ZXMuIENvdWxkIHlvdSB0ZWxsIG1lIGhvdyB0byBpbmRpY2F0ZSB0aGUgZGVzdGluYXRpb24gYnJh
bmNoIHdoZW4gc2VuZGluZyBhIHBhdGNoPw0KDQpUaGFuayB5b3UNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgTGVpdG5lciBbbWFpbHRvOnJpY2hhcmQubGVpdG5l
ckBza2lkYXRhLmNvbV0gDQpTZW50OiBNb25kYXksIEphbnVhcnkgOCwgMjAxOCAxMjo1OCBQTQ0K
VG86IERpYXogZGUgR3JlbnUsIEpvc2UgPEpvc2UuRGlhemRlR3JlbnVAZGlnaS5jb20+OyBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFttZXRh
LWphdmFdW1BBVENIXSBvcGVuamRrLTc6IGZpeCBjb21waWxlIGVycm9ycyB3aXRoIGN1cnJlbnQg
cG9reSBtYXN0ZXIgKGdjYzYpDQoNCkhpIEpvc2UsDQoNCk9uIDAxLzA4LzIwMTggMTI6NDkgUE0s
IEpvc2UgRGlheiBkZSBHcmVudSB3cm90ZToNCj4gRnJvbTogUmljaGFyZCBMZWl0bmVyIDxyaWNo
YXJkLmxlaXRuZXJAc2tpZGF0YS5jb20+DQo+IA0KPiBVc2luZyB0aGUgY3VycmVudCBwb2t5IG1h
c3RlciBvcGVuamRrLTcgd2Fzbid0IGJ1aWxkYWJsZS4gVGhpcyBwYXRjaCANCj4gZml4ZXMgdGhv
c2UgcHJvYmxlbXMgYnkgYWRkaW5nIHRocmVlIG1vcmUgcGF0Y2hlcyB0byBvcGVuamRrLTcuDQo+
IA0KPiBUaGVzZSBwYXRjaGVzIGJhc2ljYWxseSBhZGQvZml4IEdDQzYgc3VwcG9ydC4gRnVydGhl
cm1vcmUgdGhlIA0KPiBMREZMQUdTX0hBU0hfU1RZTEUgdmFyaWFibGUgKHdoaWNoIHdhcyByZW1v
dmVkIGJ5IHRoZQ0KPiBpY2VkdGVhLWNyb3NzY29tcGlsZS1maXgucGF0Y2gpIGlzIHJlLWludHJv
ZHVjZWQgYW5kIHNldCB0byAiYm90aCIgZm9yIA0KPiBjb21wYXRpYmlsaXR5IHJlYXNvbnMuDQo+
IA0KPiBGb2xsb3dpbmcgdHdvIHBhdGNoZXMgd2VyZSBvcmlnaW5hbGx5IHdyaXR0ZW4gYnkgQWJk
dXIgUmVobWFuIGFuZCANCj4gdGFrZW4gZnJvbSBtZXRhLW1lbnRvciBbMV06DQo+IAlpY2VkdGVh
LWZsYWdzLXRvLWNvbXBpbGUtd2l0aC1HQ0MtNi5wYXRjaA0KPiAJaWNlZHRlYS1zcGVjaWZ5LW92
ZXJsb2FkZWQtdmFyaWFudC1vZi1mbW9kLnBhdGNoDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL01lbnRvckVtYmVkZGVkL21ldGEtbWVudG9yDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNo
YXJkIExlaXRuZXIgPHJpY2hhcmQubGVpdG5lckBza2lkYXRhLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEpvc2UgRGlheiBkZSBHcmVudSA8Sm9zZS5EaWF6ZGVHcmVudUBkaWdpLmNvbT4NCg0KQUZBSUsg
dGhpcyBwYXRjaCB3YXMgYWxyZWFkeSBtZXJnZWQgdG8gbWV0YS1qYXZhL21hc3Rlci4uLg0KU28g
d2h5IHRoZSByZXNlbmQ/DQoNCnJlZ2FyZHM7UmljaGFyZC5MDQo=

