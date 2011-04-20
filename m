Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QCZUl-0001vN-Gr
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 17:39:11 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3KFafjH004004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:36:41 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3KFaemA020345
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:36:40 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3KFack1012726
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:36:40 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 20 Apr 2011 17:36:21 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Kooi, Koen" <k-kooi@ti.com>
Date: Wed, 20 Apr 2011 17:36:15 +0200
Thread-Topic: [oe] [PATCHv2] wpa-supplicant: Build from git sources
Thread-Index: Acv/Y4tKDwd9Pq7FTZG70SRvJEfIhgADOc8Q
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F03320BB47A@dnce02.ent.ti.com>
References: <1302727726-9362-1-git-send-email-eyalr@ti.com>
	<iojko1$bte$3@dough.gmane.org>
	<BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
	<iojvmj$de8$1@dough.gmane.org>
	<BANLkTi=PX+c_=1ghKQt0131OMtS7YQzR-A@mail.gmail.com>
In-Reply-To: <BANLkTi=PX+c_=1ghKQt0131OMtS7YQzR-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {DB409137-0882-422E-844C-2F1E12559EC1}
x-cr-hashedpuzzle: AGjK Buwm CoJd DePW Dgct EfA3 Ekfp EwRI F/0u GRlR GdRe
	HHwu IR75 IYPG IwLM KiWU; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {DB409137-0882-422E-844C-2F1E12559EC1};
	ZQB5AGEAbAByAEAAdABpAC4AYwBvAG0A; Wed, 20 Apr 2011 15:36:15
	GMT;
	UgBFADoAIABbAG8AZQBdACAAWwBQAEEAVABDAEgAdgAyAF0AIAB3AHAAYQAtAHMAdQBwAHAAbABpAGMAYQBuAHQAOgAgAEIAdQBpAGwAZAAgAGYAcgBvAG0AIABnAGkAdAAgAHMAbwB1AHIAYwBlAHMA
acceptlanguage: en-US
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv2] wpa-supplicant: Build from git sources
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 15:39:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS29lbiwNCg0KYWRkaW5nIHN1Y2ggYSBQViB0byB0aGUgcmVjaXBlIGNhdXNlcyB0aGUgZmls
ZXMgdGhhdCBhcmUgbG9jYXRlZCB1bmRlciByZWNpcGVzL3dwYS1zdXBwbGljYW50LWdpdC8gYW5k
IGFyZSBwYXJ0IG9mIFNSQ19VUkkgbm90IHRvIGJlIGZvdW5kIGFzIGl0IGFwcGVhcnMgdGhhdCBp
dCBub3cgbG9va3MgZm9yIHRoZW0gdW5kZXI6DQoNCnJlY2lwZXMvd3BhLXN1cHBsaWNhbnQtMC43
LjMrMC44LngvDQoNCkhvdyBkbyBJIHdvcmsgYXJvdW5kIHRoaXM/DQoNCkJlc3QgUmVnYXJkcywN
CkV5YWwNCk9uIFR1ZSwgQXByIDE5LCAyMDExIGF0IDc6MzcgQU0sIEtvZW4gS29vaSA8a29lbkBk
b21pbmlvbi50aHJ1aGVyZS5uZXQ8bWFpbHRvOmtvZW5AZG9taW5pb24udGhydWhlcmUubmV0Pj4g
d3JvdGU6DQotLS0tLUJFR0lOIFBHUCBTSUdORUQgTUVTU0FHRS0tLS0tDQpIYXNoOiBTSEExDQpP
biAxOS0wNC0xMSAxNDoxMywg15DXmdeZ15wg16jXmdeZ15bXqCB3cm90ZToNCj4gVGhpcyBuYW1p
bmcgaXMgdXNlZCBpbiBvdGhlciByZWNpcGVzIGJ1aWxkaW5nIGZyb20gZ2l0Lg0KPiBBbnkgc3Vn
Z2VzdGlvbnMgb2YgaG93IGl0IHNob3VsZCBiZSBjYWxsZWQgaW5zdGVhZD8NCllvdSBhcmUgZW50
aXJlbHkgcmlnaHQgdGhhdCB0aGUgZmlsZW5hbWUgdXN1YWxseSBpcyBmb29fZ2l0LmJiPGh0dHA6
Ly9mb29fZ2l0LmJiLz4sIGJ1dA0KdGhlcmUgd291bGQgYmUgc29tZXRoaW5nIGxpa2UgUFYgPSAi
eC55LnorZ2l0IiBpbnNpZGUuDQpUaGlzIGlzIHRvIGVuc3VyZSB1cGdyYWRlIHBhdGhzIGZyb20g
ZS5nLiAwLjcuMyB0byB0aGUgMC44cmMgYW5kIDAuOA0KZmluYWwgcmVsZWFzZS4gSWYgSSBoYXZl
ICcwLjcuMycgaW5zdGFsbGVkLCB1cGdyYWRpbmcgdG8gJ2dpdCcgaXMgbm8NCnByb2JsZW0sIGJ1
dCBnb2luZyBmcm9tICdnaXQnIHRvICcwLjguMCcgd291bGQgYmUsIHNpbmNlICdnaXQnIHdpbGwg
c29ydA0KaGlnaGVyLg0KSSdtIG5vdCBpbnRvIHdwYS1zdXBwbGljYW50IHJlbGVhc2UgdmVyc2lv
bmluZywgc28gSSBkb24ndCBoYXZlIHRoZQ0KcmlnaHQgc29sdXRpb24sIGJ1dCBzb21ldGhpbmcg
bGlrZQ0KDQpQViA9ICIwLjcuMyswLjhyYyINClBSX2FwcGVuZCA9ICJnaXRyJHtTUkNQVn0iDQoN
CnNob3VsZCB3b3JrLg0KDQpyZWdhcmRzLA0KDQpLb2VuDQoNCg0KPiDXkdeq15DXqNeZ15ogMjAx
MSA0IDE5IDEyOjM1LCDXnteQ16ogIktvZW4gS29vaSIgPGtvZW5AZG9taW5pb24udGhydWhlcmUu
bmV0PG1haWx0bzprb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4+IDoNCj4gT24gMTMtMDQtMTEg
MjI6NDgsIEV5YWwgUmVpemVyIHdyb3RlOg0KPj4+PiAqIEJ1aWxkcyBhIG5ldyB2ZXJzaW9uIDAu
OC54IHdoaWNoIGlzIG5vdCByZWxlYXNlZCB5ZXQgYXMgYSB6aXAgZmlsZS4NCj4+Pj4gVGhpcyB2
ZXJzaW9uIGhhcyBuZXcgZmVhdHVyZXMgbGlrZSBXSUZJLWRpcmVjdCB1c2VkIGluIG5ldyBtYWM4
MDIxMQ0KPj4+PiB2ZXJzaW9ucw0KPj4+Pg0KPg0KPiBTYW1lIHRoaW5nIGFzIHdpdGggaG9zdGFw
LWRhZW1vbjogJ2dpdCcgaXMgbm90IGEgdmFsaWQgUFYuDQo+DQo+Pg0KPj4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQtZGV2ZWwg
bWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxt
YWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpodHRwOi8v
bGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVk
LWRldmVsDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPg0KPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21h
aWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVsDQotLS0tLUJFR0lOIFBHUCBTSUdOQVRV
UkUtLS0tLQ0KVmVyc2lvbjogR251UEcgdjEuNC41IChEYXJ3aW4pDQppRDhEQlFGTnJZSVNNa3lH
TTY0UkdwRVJBbGJHQUtDWkNmQ0psb1NTdDhxTngzbmNsaFB1RzFLd0t3Q2ZZSDZvDQpkbG9KaWFw
UkV3RExvZU1VcmRnV0d1ND0NCj05di9TDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVt
YmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0KaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZv
L29wZW5lbWJlZGRlZC1kZXZlbA0KDQo=

