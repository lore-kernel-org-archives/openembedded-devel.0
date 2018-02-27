Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93DBC7878B;
	Tue, 27 Feb 2018 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 32204185CE;
	Tue, 27 Feb 2018 17:56:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zNB9zkPXoDi0; Tue, 27 Feb 2018 17:56:58 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DD65E1858D;
	Tue, 27 Feb 2018 17:56:57 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4881A081;
	Tue, 27 Feb 2018 17:56:57 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B64EE1A07F;
	Tue, 27 Feb 2018 17:56:57 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 27 Feb 2018 17:56:57 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id AA5651AFC;
	Tue, 27 Feb 2018 17:56:57 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 27 Feb 2018 17:56:57 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 27 Feb 2018 17:56:57 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Woerner <twoerner@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, "Patches and discussions about
	the oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe] [RFC] Rename meta-openembedded to
	openembedded-extras
Thread-Index: AQHTr993RXcPnvEtT0Sk9kytfXmEJaO4dVmw
Date: Tue, 27 Feb 2018 16:56:57 +0000
Message-ID: <63be8ac8a2744c64b18e252afd2e6307@XBOX02.axis.com>
References: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
	<0bb858dc-a43f-ae14-01c9-2a42855e4409@gmail.com>
	<20180224034807.GF2786@denix.org>
	<CAHUNapQYRJ=qNnQt8GT7eZ+m=iOdFDRWnY4Vuu4twB+VLA05jw@mail.gmail.com>
In-Reply-To: <CAHUNapQYRJ=qNnQt8GT7eZ+m=iOdFDRWnY4Vuu4twB+VLA05jw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-core] [RFC] Rename meta-openembedded to	openembedded-extras
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
X-List-Received-Date: Tue, 27 Feb 2018 16:56:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2VsbCwgdGhlcmUgaXMgYSBiZW5lZml0IGluIGhhdmluZyBhIGNvbW1vbiBuYW1pbmcgZm9yIGxh
eWVycyBpbiB0aGF0IGl0IGlzIHBvc3NpYmxlIHRvIGVhc2lseSBpZGVudGlmeSB0aGVtIHByb2dy
YW1tYXRpY2FsbHkuIEUuZy4sIG91ciBzZXR1cCB3aWxsIGF1dG9tYXRpY2FsbHkgdGFrZSBhbGwg
Y2hlY2tlZCBvdXQgbGF5ZXJzIG5hbWVkIOKAnG1ldGEq4oCdIGFuZCBhZGQgdGhlbSB0byB0aGUg
YmJsYXllcnMuY29uZi5zYW1wbGUgZmlsZS4gVGhhdCBzYWlkLCB0aGUgbmFtZSDigJxtZXRh4oCd
IGFzIGl0IGhhcyBiZWVuIHVzZWQsIGJvdGggZm9yIGEgc3BlY2lmaWMgbGF5ZXIgKGkuZS4sIG1l
dGEpLCBhcyBwcmVmaXggZm9yIGluZGl2aWR1YWwgbGF5ZXJzIChlLmcuLCBtZXRhLW9lKSBhbmQg
YXMgcHJlZml4IGZvciBhIGdyb3VwIG9mIGxheWVycyAoZS5nLiwgbWV0YS1vcGVuZW1iZWRkZWQp
LCBpcyBtb3N0bHkgY29uZnVzaW5n4oCmDQoNCi8vUGV0ZXINCg0KRnJvbTogb3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgVHJldm9y
IFdvZXJuZXINClNlbnQ6IGRlbiAyNyBmZWJydWFyaSAyMDE4IDE2OjI3DQpUbzogT3BlbkVtYmVk
ZGVkIERldmVsIExpc3QgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PjsgUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtvZV0gW1JGQ10gUmVuYW1lIG1ldGEtb3BlbmVtYmVkZGVkIHRvIG9wZW5lbWJlZGRlZC1l
eHRyYXMNCg0KT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMTA6NDggUE0sIERlbnlzIERteXRyaXll
bmtvIDxkZW5pc0BkZW5peC5vcmc8bWFpbHRvOmRlbmlzQGRlbml4Lm9yZz4+IHdyb3RlOg0KT24g
VGh1LCBGZWIgMjIsIDIwMTggYXQgMTI6Mzc6NDRQTSAtMDgwMCwgYWt1c3RlcjgwOCB3cm90ZToN
Cj4gSSB0aGluayBvcGVuZW1iZWRlZGQtY29yZSBpcyBpbmNvcnJlY3QuIGl0IHNob3VsZCBoYXZl
IGJlZW4NCj4gbWV0YS1vcGVuYmVkZGVkLWNvcmUgb3IgbWV0YS1jb3JlLg0KDQpJdCBkb2VzIGhh
dmUgYSBsYXllciBjYWxsZWQganVzdCAibWV0YSIgdGhvdWdoLi4uDQoNCkluIHJldHJvc3BlY3Qs
IHVzaW5nIHRoZSB3b3JkICJtZXRhIiBldmVyeXdoZXJlIGJlY29tZXMgdXNlbGVzcy4gTm8gbGF5
ZXIgY29udGFpbnMgYWN0dWFsIHNvdXJjZXMgYW5kIG5ldmVyIHNob3VsZCwgc28gdGhleSdyZSBh
bGwgIm1ldGEiIGRhdGEsIGl0J3MgcmVkdW5kYW50IHRvIGhhdmUgdG8gc2F5IHNvIGluIGV2ZXJ5
IGxheWVyJ3MgbmFtZSAoZXRjKS4NCkl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIgdG8gdXNlIHRo
YXQgc3BhY2UgdG8gY29udmV5IHNvbWV0aGluZyBtZWFuaW5nZnVsLCBzdWNoIGFzOiAid2hldGhl
ciBhIGxheWVyIHdhcyBkZXNpZ25lZCB0byBiZSBhIGJzcCwgYSBkaXN0cm8sIHNvbWV0aGluZyBl
bHNlLCBvciBhIGNvbWJpbmF0aW9uIiwgb3IgcGVyaGFwcyBvdGhlciBtZWFuaW5nZnVsIGluZm9y
bWF0aW9uLg0KDQo=

