Return-Path: <Jose.DiazdeGrenu@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.7])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD4F6010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:40:07 +0000 (UTC)
Received: from [216.82.249.131] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-7.bemta-12.messagelabs.com id 6C/36-01821-8F67C5A5;
	Mon, 15 Jan 2018 09:40:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRWlGSWpSXmKPExsXi5LtOQPdHWUy
	UwYlT3BZ7p59gtbh4eCmzA5PHzll32T3ObVzBGMAUxZqZl5RfkcCa8eDPBuaCZXEVfas3sDUw
	/onpYuTiEBJYzSjx5NxCZghnDaPE50tr2CCcJYwSj5qmMHUxcnKwCZhLTDt8kAXEFhFIkXh8+
	BwjiC0skCrRtXUXO0Q8TeL30x9QtpHEj3crwepZBFQl7t+cDWbzCvhK7Nt9hxViQRejxJ8PF8
	AaOAUCJW7umApWxCggK7Hy/GmwBcwC4hK3nswHO0JCQEBiyZ7zzBC2qMTLx/9YIWx5iVfnjjB
	B1OdJfNvSygaxTFDi5MwnYDOFBNQk2uZMYJ7AKDILydhZSFpmIWmZxcgBFNeUWL9LH6JEUWJK
	90N2CFtDonXOXHZk8QWM7KsYNYpTi8pSi3RNLPWSijLTM0pyEzNzdA0NjfRyU4uLE9NTcxKTi
	vWS83M3MQLjrp6BgXEH482F0YcYJTmYlER5pfJiooT4kvJTKjMSizPii0pzUosPMcpwcChJ8L
	4vBcoJFqWmp1akZeYAEwBMWoKDR0mEdwJImre4IDG3ODMdInWK0Z5jy6OXbcwcB8DkjRevgeS
	WZW/amIVY8vLzUqXEeX+BtAmAtGWU5sENhSWsS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWE
	ee+BTOHJzCuB2/0K6CwmoLPql0SCnFWSiJCSamDMZvT8dtZ8ip/jlY+fJQ6ePa1jleQSwHvzg
	Z5lnvXu5mQ31c4S8+YtG60mr6qx1dXzen9m+dsmeY3yIzPml9vdTNlc6nsj91/D5teGixx1tw
	cZbzu0/09wMPOvqtXyvVlPBf+w5S/6c9Rcq4c5cbtVM2PMlWdWu5jiVqpP55qkPXfZVeOV/Al
	KLMUZiYZazEXFiQCljiXHUwMAAA==
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-6.tower-28.messagelabs.com!1516009207!84340891!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12355 invoked from network); 15 Jan 2018 09:40:07 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-6.tower-28.messagelabs.com with SMTP;
	15 Jan 2018 09:40:07 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 15 Jan 2018 03:40:05 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 15 Jan 2018 03:40:04 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Mon, 15 Jan 2018 10:40:02 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] [PATCH] nativesdk-qtbase: drop fakeroot task
	do_generate_qt_environment_file
Thread-Index: AQHTjA8REFqWbb0+Jk6tJXrnGg5H1KN0sXLg
Date: Mon, 15 Jan 2018 09:40:01 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01B760C7@dor-sms-xch01.digi.com>
References: <1515807236-28679-1-git-send-email-liu.ming50@gmail.com>
	<CALatG=5Xygg2uf2uPksYkbWOQ3ZAY6zaqiR23X0DHA-Eox=W2A@mail.gmail.com>
In-Reply-To: <CALatG=5Xygg2uf2uPksYkbWOQ3ZAY6zaqiR23X0DHA-Eox=W2A@mail.gmail.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.93]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] [PATCH] nativesdk-qtbase: drop fakeroot task do_generate_qt_environment_file
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
X-List-Received-Date: Mon, 15 Jan 2018 09:40:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBoYWQgcHJlcGFyZWQgYSBzaW1pbGFyIHBhdGNoLiBUaGF0IG9uZSB3b3JrcyBmb3IgbWUuDQoN
ClRoYW5rcw0KDQpGcm9tOiBNaW5nIExpdSBbbWFpbHRvOmxpdS5taW5nNTBAZ21haWwuY29tXQ0K
U2VudDogU2F0dXJkYXksIEphbnVhcnkgMTMsIDIwMTggMjozNyBBTQ0KVG86IG9wZW5lbWJlZGRl
ZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBEaWF6
IGRlIEdyZW51LCBKb3NlIDxKb3NlLkRpYXpkZUdyZW51QGRpZ2kuY29tPg0KQ2M6IE1pbmcgTGl1
IDxsaXUubWluZzUwQGdtYWlsLmNvbT4NClN1YmplY3Q6IFJlOiBbbWV0YS1xdDVdIFtQQVRDSF0g
bmF0aXZlc2RrLXF0YmFzZTogZHJvcCBmYWtlcm9vdCB0YXNrIGRvX2dlbmVyYXRlX3F0X2Vudmly
b25tZW50X2ZpbGUNCg0KSGksIEpvc2U6DQoNCkkgZW5jb3VudGVyZWQgYSBzYW1lIGVudmlyb25t
ZW50LXNldHVwLmQgY29uZmxpY3QgaXNzdWUsIGl0IGNvdWxkIGJlIGZpeGVkIGJ5IHRoaXMgcGF0
Y2ggcGVyIG15IHRlc3QuDQoNCi8vTWluZyBMaXUNCg0KDQoNCjIwMTgtMDEtMTMgMjozMyBHTVQr
MDE6MDAgPGxpdS5taW5nNTBAZ21haWwuY29tPG1haWx0bzpsaXUubWluZzUwQGdtYWlsLmNvbT4+
Og0KRnJvbTogTWluZyBMaXUgPGxpdS5taW5nNTBAZ21haWwuY29tPG1haWx0bzpsaXUubWluZzUw
QGdtYWlsLmNvbT4+DQoNCk1vdmUgdGhlIGltcGxlbWVudGF0aW9uIHRvIGRvX2luc3RhbGwsIHRo
aXMgZml4ZXMgYSBmb2xsb3dpbmcgaXNzdWU6DQp8IEVycm9yOiBUcmFuc2FjdGlvbiBjaGVjayBl
cnJvcjoNCnwgZmlsZSAuLmVudmlyb25tZW50LXNldHVwLmQgY29uZmxpY3RzIGJldHdlZW4gYXR0
ZW1wdGVkIGluc3RhbGxzIG9mDQp8IG5hdGl2ZXNkay1jbWFrZS0zLjcuMi1yMC54ODZfNjRfbmF0
aXZlc2RrIGFuZA0KfCBuYXRpdmVzZGstcXRiYXNlLXRvb2xzLTUuOC4wK2dpdDArNDlkYzlhYTQw
OS1yMC54ODZfNjRfbmF0aXZlc2RrDQoNClNpZ25lZC1vZmYtYnk6IE1pbmcgTGl1IDxsaXUubWlu
ZzUwQGdtYWlsLmNvbTxtYWlsdG86bGl1Lm1pbmc1MEBnbWFpbC5jb20+Pg0KLS0tDQogcmVjaXBl
cy1xdC9xdDUvbmF0aXZlc2RrLXF0YmFzZV9naXQuYmI8aHR0cDovL25hdGl2ZXNkay1xdGJhc2Vf
Z2l0LmJiPiB8IDQgLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvcmVjaXBlcy1xdC9xdDUvbmF0aXZlc2RrLXF0YmFzZV9naXQuYmI8aHR0cDovL25h
dGl2ZXNkay1xdGJhc2VfZ2l0LmJiPiBiL3JlY2lwZXMtcXQvcXQ1L25hdGl2ZXNkay1xdGJhc2Vf
Z2l0LmJiPGh0dHA6Ly9uYXRpdmVzZGstcXRiYXNlX2dpdC5iYj4NCmluZGV4IDMzYmU5OWUuLjk4
ZTM1Y2MgMTAwNjQ0DQotLS0gYS9yZWNpcGVzLXF0L3F0NS9uYXRpdmVzZGstcXRiYXNlX2dpdC5i
YjxodHRwOi8vbmF0aXZlc2RrLXF0YmFzZV9naXQuYmI+DQorKysgYi9yZWNpcGVzLXF0L3F0NS9u
YXRpdmVzZGstcXRiYXNlX2dpdC5iYjxodHRwOi8vbmF0aXZlc2RrLXF0YmFzZV9naXQuYmI+DQpA
QCAtMTY5LDkgKzE2OSw3IEBAIGRvX2luc3RhbGwoKSB7DQogICAgICMgRml4IHVwIGFic29sdXRl
IHBhdGhzIGluIHNjcmlwdHMNCiAgICAgZ3JlcCAtbHIgL3Vzci9iaW4vcHl0aG9uICR7RH0ke09F
X1FNQUtFX1BBVEhfUVRfQVJDSERBVEF9LyB8IFwNCiAgICAgICAgIHhhcmdzIC1yIHNlZCAtaSAt
ZSAnMXMsIyEuKnB5dGhvbiwjISAke1VTUkJJTlBBVEh9L2VudiBweXRob24sJw0KLX0NCg0KLWZh
a2Vyb290IGRvX2dlbmVyYXRlX3F0X2Vudmlyb25tZW50X2ZpbGUoKSB7DQogICAgIG1rZGlyIC1w
ICR7RH0ke1NES1BBVEhOQVRJVkV9L2Vudmlyb25tZW50LXNldHVwLmQvDQogICAgIHNjcmlwdD0k
e0R9JHtTREtQQVRITkFUSVZFfS9lbnZpcm9ubWVudC1zZXR1cC5kL3F0NS5zaA0KDQpAQCAtMjAw
LDYgKzE5OCw0IEBAIGZha2Vyb290IGRvX2dlbmVyYXRlX3F0X2Vudmlyb25tZW50X2ZpbGUoKSB7
DQogICAgIHNlZCAtaSAtZSAnczoke1NES1BBVEhOQVRJVkV9OiRPRUNPUkVfTkFUSVZFX1NZU1JP
T1Q6ZycgJHNjcmlwdA0KIH0NCg0KLWFkZHRhc2sgZ2VuZXJhdGVfcXRfZW52aXJvbm1lbnRfZmls
ZSBhZnRlciBkb19pbnN0YWxsIGJlZm9yZSBkb19wYWNrYWdlDQotDQogU1JDUkVWID0gIjUwMTE3
ZDczOGFmNTI2Y2JmYmQ1YWZhNTBiOWE1MDFhY2IwZmI5Y2UiDQotLQ0KMi43LjQNCg0K

