Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8268A77C84
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 04:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1C0A11842B;
	Wed, 12 Apr 2017 06:03:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YxTIIa6VtPMA; Wed, 12 Apr 2017 06:03:50 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 150C418420;
	Wed, 12 Apr 2017 06:03:50 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0002D1E08D;
	Wed, 12 Apr 2017 06:03:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E93521E08C;
	Wed, 12 Apr 2017 06:03:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 12 Apr 2017 06:03:49 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id DCEF53090;
	Wed, 12 Apr 2017 06:03:49 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 12 Apr 2017 06:03:49 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 12 Apr 2017 06:03:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Dengke Du <dengke.du@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] crash: 7.1.5 -> 7.1.8
Thread-Index: AQHSszEM/JBKZfxQd0qiZv51WRl1DKHA9CGAgAAkskA=
Date: Wed, 12 Apr 2017 04:03:49 +0000
Message-ID: <bec3152746cc44c18098f5a5c7ffa528@XBOX02.axis.com>
References: <1491962624-152617-1-git-send-email-dengke.du@windriver.com>
	<0f0d1e28-d0b2-ef82-53b7-868c3d1dc534@windriver.com>
In-Reply-To: <0f0d1e28-d0b2-ef82-53b7-868c3d1dc534@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] crash: 7.1.5 -> 7.1.8
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
X-List-Received-Date: Wed, 12 Apr 2017 04:03:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IERlbmdr
ZSBEdQ0KPiBTZW50OiBkZW4gMTIgYXByaWwgMjAxNyAwNTozNw0KPiBUbzogb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW1BBVENI
XSBjcmFzaDogNy4xLjUgLT4gNy4xLjgNCj4gDQo+IFRoaXMgcGF0Y2ggbmVlZCB0byBhZGQgdGhl
ICJpZCBjYyIgdG8gSE9TVFRPT0xTIGluIGJpdGJha2UuY29uZiBpbg0KPiBvZS1jb3JlLCBJIHdp
bGwgc2VuZCB0aGUgcGF0Y2ggdG8gb2UtY29yZSBsYXRlci4NCg0KSSBkb3VidCB5b3Ugd2lsbCBn
ZXQgZWl0aGVyICJpZCIgb3IgImNjIiBhY2NlcHRlZCBpbnRvIEhPU1RUT09MUyANCmluIE9FLUNv
cmUuIERlZmluaXRlbHkgbm90ICJjYyIgYXMgcmVjaXBlcyBhcmUgZXhwZWN0ZWQgdG8gdXNlIA0K
JHtCVUlMRF9DQ30gKHdoaWNoIHVzZXMgImdjYyIpIGZvciB0aGUgaG9zdCBjb21waWxlci4gQW5k
IHByb2JhYmx5IA0Kbm90ICJpZCIgdW5sZXNzIHlvdSBoYXZlIGEgdmVyeSBnb29kIGV4cGxhbmF0
aW9uIGZvciB3aHkgaXQgaXMgDQpuZWVkZWQuIFRoZSBwcm9ibGVtIHdpdGggImlkIiBpcyB0aGF0
IGl0IGlzIHR5cGljYWxseSB1c2VkIHRvIGdldCANCmluZm9ybWF0aW9uIGFib3V0IHRoZSBydW5u
aW5nIHVzZXIsIHdoaWNoIG1ha2VzIGl0IGEgcHJvYmxlbSBmcm9tIA0KYSBkZXRlcm1pbmlzdGlj
IHZpZXcuIEFsc28sIHNpbmNlIG5vdGhpbmcgaW4gT0UtQ29yZSByZXF1aXJlcyAiaWQiLCANCnRo
ZXJlIGlzIG5vIHJlYXNvbiB0byBhZGQgaXQgdGhlcmUuIEl0IGNvdWxkIGJlIGFkZGVkIHRvIGxh
eWVyLmNvbmYgDQppbiBtZXRhLW9lLCBidXQgdGhlIGNvbmNlcm5zIGFib3V0IGRldGVybWluaXNt
IHN0aWxsIHN0YW5kcy4NCg0KLy9QZXRlcg0KDQoNCg==

