Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0734978812
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 18:26:57 +0000 (UTC)
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1epeXC-0006JB-Gy from Joe_MacDonald@mentor.com ;
	Sat, 24 Feb 2018 10:26:58 -0800
Received: from svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) by
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Sat, 24 Feb 2018 10:26:56 -0800
Received: from svr-orw-mbx-04.mgc.mentorg.com ([fe80::4967:8f7f:4a15:68a4]) by
	SVR-ORW-MBX-04.mgc.mentorg.com ([fe80::4967:8f7f:4a15:68a4%22]) with
	mapi id 15.00.1320.000; Sat, 24 Feb 2018 10:26:56 -0800
From: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] [RFC] meta-openembedded/meta-oe re-org
Thread-Index: AQHTrZ0Mv+Yd9al56UizIm4J0IW4Vg==
Date: Sat, 24 Feb 2018 18:26:56 +0000
Message-ID: <7e8d4f35-6212-46c1-84d3-a386aeae326d@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sat, 24 Feb 2018 18:26:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGV5IEFybWluLA0KDQpZb3VyIGJyYW5jaCBpbmNsdWRlcyBhdCBsZWFzdCBzb21lIChJIGhhdmVu
J3QgbG9va2VkIHRvIHNlZSBpZiBpdCdzIGFsbCwgc2VlbXMgbGlrZWx5KSBvZiB0aGUgY2hhbmdl
cyBJIGhhdmUgbWVyZ2VkIGFuZCByZWFkeSB0byBpbmNsdWRlIGZvciBtZXRhLW5ldHdvcmtpbmcu
IFNpbmNlIEkgaGF2ZW4ndCBwdXNoZWQgdGhlbSB5ZXQgYW5kIHdvdWxkbid0IGJlIGJlZm9yZSB0
b25pZ2h0IGF0IHRoZSBlYXJsaWVzdCwgZG8geW91IHdhbnQgbWUgdG8gd2FpdD8gT3Igd2VyZSB0
aGV5IGp1c3QgaW5jbHVkZWQgaW4geW91ciB0cmVlIGZvciB0ZXN0aW5nPyBJIGRvbid0IHdhbnQg
dG8gY2F1c2UgeW91IHVubmVjZXNzYXJ5IG1lcmdlIGNvbmZsaWN0cy4NCg0KLUouDQoNCk9uIEZl
YiAyNCwgMjAxOCAxMjo1NyBQTSwgYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5jb20+IHdy
b3RlOg0KSGVsbG8sDQoNCkkgYW0gcGxhbm5pbmcgb24gbW92aW5nIHNvbWUgcmVjaXBlcyB0byBu
ZXcgbG9jYXRpb25zIHRoYXQgYXJlIG1vcmUNCmluLWxpbmUgd2l0aCB0aGVpciBmdW5jdGlvbi4N
Cg0KQWxzbywgSSBwbGFuIG9uIGFkZGluZyAqLXNoZWxscywgKi1kYnMsICotc2VjdXJpdHkgYW5k
ICouY3J5cHRvIGFuZA0KbW92aW5nIHRoZSBhcHByb3ByaWF0ZSByZWNpcGVzIHRoZXJlLg0KDQpU
aGlzIG1pZ2h0IGhlbHAgZmFjaWxpdGF0ZSBmb2xrcyBzaWduaW5nIHVwIHRvIG1haW50YWluIGEg
Z3JvdXBpbmcgbGlrZQ0KcmVjaXBlcy1jcnlwdG8gaWYgdGhhdCBpcyB0aGVpciB0aGluZy4NCg0K
DQpJIHdpbGwgYmUgc2VuZGluZyBvdXQgcGF0Y2hlcyBsYXRlciB0b2RheSBmb3IgcmV2aWV3Lg0K
DQpJIGhhdmUgc3RhZ2VkIHRoZSBjaGFuZ2VzIEANCmh0dHA6Ly9jZ2l0Lm9wZW5lbWJlZGRlZC5v
cmcvbWV0YS1vcGVuZW1iZWRkZWQtY29udHJpYi9sb2cvP2g9YWt1c3Rlci9tZXRhLW9lLXJlb3Jn
DQoNCi0gYXJtaW4NCg0KDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KDQo=

