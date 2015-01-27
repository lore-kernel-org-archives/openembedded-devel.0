Return-Path: <fan.xin@jp.fujitsu.com>
Received: from fgwmail6.fujitsu.co.jp (fgwmail6.fujitsu.co.jp [192.51.44.36])
	by mail.openembedded.org (Postfix) with ESMTP id B72327147D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 09:44:05 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [10.0.237.131])
	by fgwmail6.fujitsu.co.jp (Postfix) with ESMTP id A4A253EE0B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 18:44:03 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id B2646AC0468
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 18:44:02 +0900 (JST)
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 129E9E18005
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 18:44:02 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	E05D86D678A; Tue, 27 Jan 2015 18:42:57 +0900 (JST)
Received: from G01JPEXMBYT21.g01.fujitsu.local ([10.128.193.129]) by
	g01jpexchyt35 ([10.128.193.50]) with mapi id 14.03.0181.007;
	Tue, 27 Jan 2015 18:42:57 +0900
From: "Fan, Xin" <fan.xin@jp.fujitsu.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] Question about ntp build option
Thread-Index: AQHQKPSo1awv1B8Xg0Wv8eLV49IUrJzCEDuggAANXQCAEboC8A==
Date: Tue, 27 Jan 2015 09:42:58 +0000
Message-ID: <72334B6CF8FF6542A565D43122925D601B35F7@G01JPEXMBYT21>
References: <72334B6CF8FF6542A565D43122925D601999FF@G01JPEXMBYT21>
	<2746815.1G8tsLzyMa@peggleto-mobl5.ger.corp.intel.com>
	<72334B6CF8FF6542A565D43122925D601A0E7C@G01JPEXMBYT21>
	<1564018.h6sptGTLbK@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1564018.h6sptGTLbK@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.19.50]
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Question about ntp build option
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
X-List-Received-Date: Tue, 27 Jan 2015 09:44:10 -0000
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0ssIEkgdW5kZXJzdGFuZC4gVGhhbmtzIGZvciB5b3VyIGtpbmRseSByZXBs
eS4NCg0KSSBoYXZlIGxlYXJuZWQgYSBsb3QgZnJvbSB0aGlzIGRpc2N1c3Np
b24uIFRoYW5rIHlvdSBhZ2Fpbi4NCg0KQ2hlZXJzLA0KRmFuDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQYXVsIEVnZ2xldG9uIFtt
YWlsdG86cGF1bC5lZ2dsZXRvbkBsaW51eC5pbnRlbC5jb21dIA0KU2VudDog
RnJpZGF5LCBKYW51YXJ5IDE2LCAyMDE1IDg6NTUgUE0NClRvOiBGYW4sIFhp
bi/mqIog44K344OzDQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFF1ZXN0aW9uIGFi
b3V0IG50cCBidWlsZCBvcHRpb24NCg0KT24gRnJpZGF5IDE2IEphbnVhcnkg
MjAxNSAwMjowNToyNyBGYW4sIFhpbiB3cm90ZToNCj4gPiBUaGVyZSB3aWxs
IGFsd2F5cyBiZSBkaWZmZXJlbmNlcyBpbiBob3cgcGVvcGxlIGV4cGVjdCBz
b2Z0d2FyZSB0byBiZSANCj4gPiBjb25maWd1cmVkIGZvciB3aGF0ZXZlciB0
YXJnZXQgYW5kIGFwcGxpY2F0aW9uIHRoZXkgYXJlIGJ1aWxkaW5nIA0KPiA+
IGZvciwgaGVuY2Ugd2h5IHdlIG1ha2UgaXQgZmFpcmx5IGVhc3kgdG8gYWRq
dXN0IHRoZSBjb25maWd1cmF0aW9uLg0KPiANCj4gQWN0dWFsbHksIEkgaGFk
IHRoZSBzYW1lIG9waW5pb24gd2l0aCB5b3UgYXQgdGhlIGJlZ2lubmluZy4N
Cj4gDQo+IEJ1dCBpbiBsYXN0IERlY2VtYmVyLCB0aGUgbnRwIHB1Ymxpc2hl
ZCA0IHNlcmlvdXMgDQo+IHZ1bG5lcmFiaWxpdGllcyhDVkUtMjAxNC05Mjkz
LCBDVkUtMjAxNC05Mjk0LENWRS0yMDE0LTkyOTUsQ1ZFLTIwMTQtOTI5Niku
DQo+IFNvIEkgdGhpbmsgZXZlbiB0aGUgZGlzcGxheSBhIGNsb2NrIGZ1bmN0
aW9uLCBpdCBzaG91bGTjgIBhbHNvIGJlIA0KPiBwcm90ZWN0ZWQgYnkgb3Bl
bnNzbCBmb3IgdGhlIHNhZmV0eSBjb25uZWN0aW9uLg0KDQpJJ20gbm90IHN1
cmUgdGhpcyBmb2xsb3dzLiBDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0
IFNTTCBkb2Vzbid0IGFjdHVhbGx5IHByZXZlbnQgbWUgYXMgYW4gdW5hdXRo
b3Jpc2VkIHVzZXIgZnJvbSBtYWtpbmcgYSBjb25uZWN0aW9uIC0gaXQganVz
dCBlbnN1cmVzIHRoYXQgd2hlbiBJIGNvbm5lY3QgdG8gYSBzZXJ2ZXIgdGhh
dCBmaXJzdGx5IHRoZSBkYXRhIHNlbnQgb3ZlciB0aGUgY29ubmVjdGlvbiBp
cyBlbmNyeXB0ZWQsIGFuZCBmdXJ0aGVybW9yZSB0aGF0IHRoZSBjb25uZWN0
aW9uIGlzIGRpcmVjdGx5IHRvIHRoZSBzZXJ2ZXIgSSB0aGluayBpdCBpcyBh
bmQgbm90IHNvbWVvbmUgZWxzZSBtYXNxdWVyYWRpbmcgYXMgdGhhdCBzZXJ2
ZXIuIFRoaXMgd291bGQgbWVhbiB0aGF0IGZvciBleGFtcGxlIGFueSBidWZm
ZXIgb3ZlcmZsb3dzIHN1Y2ggYXMgdGhlIG9uZXMgaW4gdGhlIHZ1bG5lcmFi
aWxpdGllcyB5b3UgcG9pbnQgdG8gd291bGQgc3RpbGwgYmUgYWNjZXNzaWJs
ZSBhbmQgcG90ZW50aWFsbHkgZXhwbG9pdGFibGUgZXZlbiBpZiB0aGUgY29u
bmVjdGlvbiB3ZXJlIG9ubHkgYXZhaWxhYmxlIGFzIGVuY3J5cHRlZCB1c2lu
ZyBTU0wsIGF0IGxlYXN0IGFzIGZhciBhcyBJIGNhbiB0ZWxsLg0KDQo+IEFu
ZCBJIGZpbmQgbW9yZSBwYWNrYWdlcyBpbiBZb2N0b+OAgHdoaWNoIGFsc28g
dXNlIHRoZSBvcGVuc3NsIGFzIHRoZSANCj4gZGVmYXVsdCBvcHRpb24sIHNv
IEkgdGhpbmsgbnRwIGFsc28gc2hvdWxkIHNldCB0aGUgb3BlbnNzbCBvcHRp
b24gYXMgDQo+IGRlZmF1bHQgc2V0dGluZy4NCg0KSW4gYSBsb3Qgb2Ygb3Ro
ZXIgY2FzZXMgU1NMIGlzIG9uIGJ5IGRlZmF1bHQgYmVjYXVzZSBpdCByZWFs
bHkgbWFrZXMgc2Vuc2U7IGZvciBleGFtcGxlIGl0J3MgY29tbW9uIHRvIHdh
bnQgdG8gZmV0Y2ggZmlsZXMgZnJvbSBodHRwcyBzZXJ2ZXJzIHNvIGluIHRo
ZSBnZW5lcmFsIGNhc2UgeW91IHdvdWxkIHdhbnQgY3VybCB0byBiZSBidWls
dCB3aXRoIFNTTCBzdXBwb3J0IGJ5IGRlZmF1bHQuIEknbSBub3Qgc3VyZSB0
aGUgc2FtZSBjYW4gYmUgc2FpZCBvZiBudHAuIEFnYWluLCBJJ20gaGFwcHkg
dG8gYmUgY29ycmVjdGVkIHRob3VnaC4NCg0KQ2hlZXJzLA0KUGF1bA0KDQot
LSANCg0KUGF1bCBFZ2dsZXRvbg0KSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5v
bG9neSBDZW50cmUNCg==

