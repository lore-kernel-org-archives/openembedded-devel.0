Return-Path: <csmiley@icontrol.com>
X-Greylist: delayed 1945 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Jan 2015 00:56:15 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0108.outbound.protection.outlook.com [65.55.169.108])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA3671633
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 00:56:15 +0000 (UTC)
Received: from BN1PR05MB044.namprd05.prod.outlook.com (10.255.202.154) by
	BN1PR05MB042.namprd05.prod.outlook.com (10.255.202.147) with Microsoft
	SMTP Server (TLS) id 15.1.53.17; Thu, 15 Jan 2015 00:23:49 +0000
Received: from BN1PR05MB044.namprd05.prod.outlook.com ([169.254.12.14]) by
	BN1PR05MB044.namprd05.prod.outlook.com ([169.254.12.14]) with mapi id
	15.01.0053.000; Thu, 15 Jan 2015 00:23:49 +0000
From: Colin Smiley <csmiley@icontrol.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, "Alex
	de Cabo" <alejandro.de-cabo-garcia@congatec.com>, Max Krummenacher
	<max.oss.09@gmail.com>, Henning Heinold <heinold@inf.fu-berlin.de>
Thread-Topic: [oe] Query on meta-java layer openjdk-7-jre build
Thread-Index: AQHQMFUhIJi5tkepc0OlnLBIPLSk0pzATxEA//+evYA=
Date: Thu, 15 Jan 2015 00:23:49 +0000
Message-ID: <D0DC62E4.8BDA%csmiley@icontrol.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
In-Reply-To: <CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [63.239.122.42]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=csmiley@icontrol.com; 
x-dmarcaction-test: None
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1PR05MB042;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BN1PR05MB042;
x-forefront-prvs: 0457F11EAF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(24454002)(189002)(51704005)(377454003)(199003)(479174004)(2656002)(46102003)(230783001)(97736003)(36756003)(76176999)(87936001)(16601075003)(86362001)(64706001)(54356999)(50986999)(66066001)(101416001)(93886004)(106116001)(106356001)(105586002)(19580395003)(19580405001)(107886001)(99286002)(122556002)(2950100001)(2900100001)(92566002)(40100003)(62966003)(77156002)(1720100001)(102836002)(15975445007)(68736005)(94096001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR05MB042;
	H:BN1PR05MB044.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: icontrol.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: icontrol.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2015 00:23:49.4864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56af53c7-f954-4c24-b63a-3d793c349485
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR05MB042
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Thu, 15 Jan 2015 00:56:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E94E04BA3BB9394CBA213C3FDE0FC907@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

DQpFYXJsaWVyIHRoaXMgd2VlaywgSeKAmWQgc2VudCBhbiBlbWFpbCB0byB0aGUgbGlzdCBhYm91
dCBteSBwcm9ibGVtcyBnZXR0aW5nDQpvcGVuamRrLTYgdG8gYnVpbGQuDQoNClRoZSBzaG9ydCB2
ZXJzaW9uIG9mIG15IGJ1aWxkIHByb2Nlc3MgaXM6DQoNCjEpIGluc3RhbGwgcG9reSBvbiBkYWlz
eSBicmFuY2gNCjIpIGluc3RhbGwgb3BlbiBlbWJlZGRlZCBvbiBkYWlzeSBicmFuY2gNCjMpIGlu
c3RhbGwgbWV0YS1qYXZhIG9uIHRydW5rDQo0KSBhdHRlbXB0IHRvIGJpdGJha2UgamF2YS10ZXN0
LWltYWdlIChyZW1vdmluZyBvcGVuamRrLTcgbGluZSkuDQo1KSBXYWl0IGZvciBqYXZhIEN1cnJl
bmN5RGF0YSBmYWlsdXJlLCBmaXggaXQgbWFudWFsbHkuDQo2KSByZS1yZXVuIGJpdGJha2UgamF2
YS10ZXN0LWltYWdlDQoNCkF0IHRoaXMgcG9pbnQsIG15IGJ1aWxkIGZhaWxzIHJ1bm5pbmcgcWVt
dS1pMzYuIFRoZSBpbWFnZSB3aWxsIHVzZSB1cCBhbGwNCmF2YWlsYWJsZSBtZW1vcnkgb24gdGhl
IHN5c3RlbSwgYW5kIHRoZW4gZ2V0IGtpbGxlZCBieSB0aGUgbGludXggb29tDQpraWxsZXIuIEkg
aGF2ZSB0cmllZCB0aGlzIG9uIGEgdmFyaWV0eSBvZiBPUywgVk0sIHBoeXNpY2FsIG1hY2hpbmUs
IGFuZA0KbWVtb3J5IGNvbWJpbmF0aW9ucy4gVGhlIHJlc3VsdCBpcyBhbHdheXMgdGhlIHNhbWUu
DQoNCklzIHRoZSBwcm9ibGVtIEnigJltIHNlZWluZyB0aGUgc2FtZSBhcyB3aGF0IHlvdeKAmXJl
IGRlc2NyaWJpbmcgYmVsb3c/DQoNCkFsc28sIGlzIHRoZXJlIGFuIHVwZGF0ZSB0byBtZXRhLWph
dmEgdG8gZml4IHRoZSBDdXJyZW5jeURhdGEgcHJvYmxlbT8NCg0KDQpUaGFua3MsDQoNCg0KQ29s
aW4NCg0KT24gMS8xNC8xNSwgNjoxMSBQTSwgIk90YXZpbyBTYWx2YWRvciIgPG90YXZpb0Bvc3N5
c3RlbXMuY29tLmJyPiB3cm90ZToNCg0KPkhlbGxvLA0KPg0KPihJIGFtIGFkZGluZyBBbGV4IG9u
IENjIGFzIHdlbGwpDQo+DQo+T24gV2VkLCBKYW4gMTQsIDIwMTUgYXQgOTo1MiBQTSwgTWF4IEty
dW1tZW5hY2hlciA8bWF4Lm9zcy4wOUBnbWFpbC5jb20+DQo+d3JvdGU6DQo+PiBPdGF2aW8gU2Fs
dmFkb3IgPG90YXZpbyA8YXQ+IG9zc3lzdGVtcy5jb20uYnI+IHdyaXRlczoNCj4+PiAgQ2FuIHlv
dSBwcmVwYXJlIGEgcGF0Y2hzZXQgZm9yIGl0Pw0KPj4+DQo+Pg0KPj4gSSdtIG5vdCByZWFsbHkg
Y29udmluY2VkIHRoYXQgcmV2ZXJ0aW5nIHRoZSBzdGF0aWMgbGlua2luZyBpcyBhIGdvb2QNCj4+
IGFwcHJvYWNoIGFzIG9idmlvdXNseSBzb21ldGhpbmcgZmFpbGVkIHdoZW4gbGlua2luZyBkeW5h
bWljYWxseS4NCj4+DQo+PiBCb3RoIG1haWxzIHdoaWNoIHJlcG9ydGVkIHRoZSBpc3N1ZSB3aXRo
IHRoZSBmYWlsaW5nIHFlbXUtYXJtIHJ1biB3ZXJlDQo+PmJ1aWx0DQo+PiBmb3IgY29saWJyaS10
MjAuIFRoZSBUZWdyYSBUMjAgU09DIGlzIGEgYml0IHNwZWNpYWwgYXMgaXQgZG9lcyBub3QgaGF2
ZQ0KPj5hDQo+PiBOZW9uIHVuaXQuIFBsdXMgb3VyIHN0YW5kYXJkIHNldHVwIHVzZXMgYW5nc3Ry
b20gd2hpY2ggYnVpbGRzIHRoZSBsaW5hcm8NCj4+IHRvb2xjaGFpbiB3aXRoIHRodW1iMiBzdXBw
b3J0Lg0KPj4NCj4+IFNvIHRoZSBmYWlsaW5nIGJ1aWxkcyBhcmUgZmFpbGluZyB3aXRoIGFuIHVu
dXN1YWwgb2UgdG9vbGNoYWluDQo+PmNvbmZpZ3VyYXRpb24NCj4+IGFuZCB0aGUgcm9vdCBjYXVz
ZSBpcyB0aGUgdG9vbGNoYWluLg0KPj4gSSdtIHVuc3VyZSBpZiByaXNraW5nIHRoZSBmYWlsaW5n
IGJ1aWxkcyB3aXRoIGR5bmFtaWMgbGlua2luZyBwb3BpbmcgdXANCj4+IGFnYWluIGp1c3RpZmll
cyBmaXhpbmcgdGhlIGJ1aWxkIGZhaWx1cmVzIGluIGFuIHVudXN1YWwgY29uZmlndXJhdGlvbi4N
Cj4+DQo+PiBJZiB5b3UgZG9uJ3QgdGhpbmsgc28gSSBjYW4gcHJlcGFyZSBhIHBhdGNoLCBubyBw
cm9ibGVtLg0KPg0KPkl0IGlzIGZhaWxpbmcgb24gbWUgYXMgd2VsbC4NCj4NCj5BbGV4IGhhcyBm
b3VuZCB0aGF0IFFFTVUgLUwgY29tbWFuZCBpcyBjYXVzaW5nIGlzc3VlIHNvIGlmIHlvdXIgcGF0
Y2gNCj5maXhlcyBpdCwgaXQgY291bGQgYmUgYW4gb3B0aW9uIGZvciBzdXJlLg0KPg0KPkkgdGhp
bmsgdGhlcmUncyBubyBnb29kIGFuc3dlciBhcyBhIHBhdGNoIGZvciB0ZXN0LiA6LSkgSSB0aGlu
ayB3ZSBhbGwNCj5jYW4gdHJ5IGl0IGFuZCBzZWUgaWYgaXQgaW1wcm92ZXMgaXQgYWZ0ZXIgYWxs
Lg0KPg0KPi0tIA0KPk90YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ty5TLiBTeXN0ZW1zDQo+aHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8v
Y29kZS5vc3N5c3RlbXMuY29tLmJyDQo+TW9iaWxlOiArNTUgKDUzKSA5OTgxLTc4NTQgICAgICAg
ICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo+LS0gDQo+X19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5PcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGlu
ZyBsaXN0DQo+T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj5odHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1k
ZXZlbA0KDQo=

