Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFA465CC6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:12:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1S1CCd6020304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Feb 2017 17:12:12 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 27 Feb 2017 17:12:11 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the service
	by default
Thread-Index: AQHSkQdNwFK30NgEw0qBY/jJVIkEcqF9mfXA
Date: Tue, 28 Feb 2017 01:12:10 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
	<20170227080959.27797-2-jackie.huang@windriver.com>
	<CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
In-Reply-To: <CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.153]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] dnsmasq: disable the service by default
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
X-List-Received-Date: Tue, 28 Feb 2017 01:12:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQgY2FuIGJlIG92ZXJyaWRkZW4gdG8gZW5hYmxlIHRoZSBzZXJ2aWNlIGluIHRoZSBjb25mIGZp
bGUgb2YgdGhlIGRpc3Rybw0Kd2l0aCB3aXRjaCBvbmx5IGRuc21hc3EgaXMgdXNlZCBpbiB0aGUg
aW1hZ2VzLg0KDQpXZSBjYW4gYWxzbyBkaXNhYmxlIHRoZSBzZXJ2aWNlIGluIHRoZSBkaXN0cm8g
Y29uZiBmaWxlIGluc3RlYWQgb2YgaW4gdGhlIHJlY2lwZQ0KaWYgaXQgbWFrZXMgbW9yZSBzZW5z
ZS4NCg0KVGhhbmtzLA0KSmFja2llDQoNCkZyb206IEJydWNlIEFzaGZpZWxkIFttYWlsdG86YnJ1
Y2UuYXNoZmllbGRAZ21haWwuY29tXQ0KU2VudDogTW9uZGF5LCBGZWJydWFyeSAyNywgMjAxNyAx
MDozOSBQTQ0KVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWwN
ClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIIDIvMl0gZG5zbWFzcTog
ZGlzYWJsZSB0aGUgc2VydmljZSBieSBkZWZhdWx0DQoNCg0KDQpPbiBNb24sIEZlYiAyNywgMjAx
NyBhdCAzOjA5IEFNLCA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb208bWFpbHRvOmphY2tpZS5o
dWFuZ0B3aW5kcml2ZXIuY29tPj4gd3JvdGU6DQpGcm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5o
dWFuZ0B3aW5kcml2ZXIuY29tPG1haWx0bzpqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4+DQoN
ClRoZSBzZXJ2aWNlIHdpbGwgZmFpbCB0byBzdGFydC9zdG9wIHdoZW4gZG5zbWFzcSBhbmQNCmJp
bmQgKHByb3ZpZGVzIG5hbWVkKSBhcmUgYm90aCBpbnN0YWxsZWQgc2luY2UgdGhleQ0KYXJlIHVz
aW5nIHRoZSBzYW1lIHBvcnQgNTM6DQoNCnwgZG5zbWFzcTogZmFpbGVkIHRvIGNyZWF0ZSBsaXN0
ZW5pbmcgc29ja2V0IGZvciBwb3J0IDUzOiBBZGRyZXNzIGFscmVhZHkgaW4gdXNlDQoNClNvIGRp
c2FibGUgdGhlIHNlcnZpY2UgYnkgZGVmYXVsdCwgaWYgdGhlIHVzZXIgcmVhbGx5DQp3YW50IHRv
IHVzZSB0d28gZG5zIHNlcnZpdmVzLCB0aGUgY29uZmlnIG5lZWRzIHRvIGJlDQpjaGFuZ2VkIHRv
IHVzZSBkaWZmZXJlbnQgaW50ZXJmYWNlcyBvciBwb3J0cy4NCg0KQnV0IHdoYXQgaWYgdGhlIHVz
ZXIgaXMgb25seSB1c2luZyBkbnNtYXNxID8gKHdoaWNoIGlzIHRoZSBjYXNlIGluIHRoZSBpbWFn
ZXMgSSB1c2UpLg0KVGhpcyB3b3VsZCBiZSBhIGJlaGF2aW91ciBjaGFuZ2UgdGhhdCB0aGV5IGFk
ZCBkbnNtYXNxLCBidXQgZG9uJ3QgYWN0dWFsbHkgZ2V0IHRoZQ0Kc2VydmljZSBzdGFydGVkLg0K
SU1ITyBpZiBzb21lb25lIGlzIGluc3RhbGxpbmcgdHdvIHBhY2thZ2VzIHRoYXQgcHJvdmlkZSB0
aGUgc2FtZSBzZXJ2aWNlLCB0aGV5DQphcmUgbW9yZSBhd2FyZSBvZiB3aGF0IGlzIGdvaW5nIG9u
IGFuZCBjYW4gZGlzYWJsZSBvbmUgKG9yIHRoZSBvdGhlcikgLi4gdmVyc3VzDQpzb21lb25lIHRo
YXQgYWRkcyBhIHNpbmdsZSBwYWNrYWdlIHRoYXQgcHJvdmlkZXMgYSBzZXJ2aWNlIC4uIGFuZCB0
aGVuIGZpbmQgb3V0IHRoYXQNCml0IGRvZXNuJ3QgYWN0dWFsbHkgc3RhcnQuDQpCcnVjZQ0KDQoN
CkFzIHJlZmVyZW5jZSwgb3RoZXIgZGlzdHJvIGxpa2UgY2VudG9zL2ZlZG9yYSBhbHNvDQpkaXNh
YmxlcyB0aGUgc2VydmljZXMgYnkgZGVmYXVsdCBvbiBpbnN0YWxsYXRpb24uDQoNClNpZ25lZC1v
ZmYtYnk6IEphY2tpZSBIdWFuZyA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb208bWFpbHRvOmph
Y2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPj4NCi0tLQ0KIG1ldGEtbmV0d29ya2luZy9yZWNpcGVz
LXN1cHBvcnQvZG5zbWFzcS9kbnNtYXNxLmluYyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9y
dC9kbnNtYXNxL2Ruc21hc3EuaW5jIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9k
bnNtYXNxL2Ruc21hc3EuaW5jDQppbmRleCA0MjRhMDZiLi45YzIyNzZmIDEwMDY0NA0KLS0tIGEv
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNtYXNxL2Ruc21hc3EuaW5jDQorKysg
Yi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcS5pbmMNCkBA
IC04MSwzICs4MSw0IEBAIFJQUk9WSURFU18ke1BOfSArPSAiJHtQTn0tc3lzdGVtZCINCiBSUkVQ
TEFDRVNfJHtQTn0gKz0gIiR7UE59LXN5c3RlbWQiDQogUkNPTkZMSUNUU18ke1BOfSArPSAiJHtQ
Tn0tc3lzdGVtZCINCiBTWVNURU1EX1NFUlZJQ0VfJHtQTn0gPSAiZG5zbWFzcS5zZXJ2aWNlIg0K
K1NZU1RFTURfQVVUT19FTkFCTEUgPz0gImRpc2FibGUiDQotLQ0KMi44LjMNCg0KLS0NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQt
ZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzxtYWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpo
dHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1kZXZlbA0KDQoNCg0KLS0NCiJUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRl
ciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZCINCg==

