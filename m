Return-Path: <Adrian.Dudau@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.45])
	by mail.openembedded.org (Postfix) with ESMTP id 668DF60232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:00:55 +0000 (UTC)
Received: from 1aqIXW-0001yT-UD by out10a.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>) id 1aqIXW-0001ym-Va
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2016 04:00:54 -0700
Received: by emcmailer; Wed, 13 Apr 2016 04:00:54 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with smtp (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>) id 1aqIXW-0001yT-UD
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2016 04:00:54 -0700
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0294.000; Wed, 13 Apr 2016 13:00:54 +0200
From: Adrian Dudau <Adrian.Dudau@enea.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] Revert "umip: blacklist"
Thread-Index: AQHRlMzL+fh/8TN80kW0klylzJwkq5+GdYmAgAEm1IA=
Date: Wed, 13 Apr 2016 11:00:54 +0000
Message-ID: <1460545253.3257.14.camel@sestows129.enea.se>
References: <1460473156-25279-1-git-send-email-adrian.dudau@enea.com>
	<20160412172539.GE2564@jama>
In-Reply-To: <20160412172539.GE2564@jama>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.141.157]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: Re: [meta-oe][PATCH] Revert "umip: blacklist"
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
X-List-Received-Date: Wed, 13 Apr 2016 11:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3916EA69410864B8FE01E78F0B5013B@local>
Content-Transfer-Encoding: base64

T24gdGlzLCAyMDE2LTA0LTEyIGF0IDE5OjI1ICswMjAwLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+
IE9uIFR1ZSwgQXByIDEyLCAyMDE2IGF0IDA0OjU5OjE2UE0gKzAyMDAsIEFkcmlhbiBEdWRhdSB3
cm90ZToNCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGQ4MmIwZDhmNjM4ZDFlMWM3ZDkxNzU2MDVl
YWRhYmZiOTlhNmQzNDUuDQo+ID4gDQo+ID4gVGhlIFNSQ19VUkkgaXMgdXAgYWdhaW4sIG5vIG5l
ZWQgdG8gYmxhY2tsaXN0IHRoZSByZWNpcGUgYW55bW9yZS4NCj4gDQo+IFdoYXQgYWJvdXQgdGhl
IHNlY29uZCBwYXJ0IHdpdGggZ3JhbS5oLCB0aGF0J3Mgbm90IHJlbGF0ZWQgdG8gU1JDX1VSSS4N
Cg0KVGhhdCBpc3N1ZSBkaWRuJ3QgcmVwcm9kdWNlIGZvciBtZS4gDQoNCkhvd2V2ZXIsIG5vdyB0
aGF0IHlvdSBtZW50aW9uZWQgaXQsIEkgcmVtZW1iZXJlZCBoYXZpbmcgc2VlbiB0aGF0IGlzc3Vl
DQpiZWZvcmUgYW5kIGR1ZyBhIGxpdHRsZSBkZWVwZXIuIFRoZSBpc3N1ZSBzZWVtcyB0byBhcHBl
YXIgcmFuZG9tbHkgaW4NCnNvbWUgY2lyY3Vtc3RhbmNlcyBvZiBhIHBhcmFsbGVsIGJ1aWxkIHdo
ZXJlIHRoZSBzY2FuLmwgaXMgcGFyc2VkIGJlZm9yZQ0KZ3JhbS5oIGlzIGdlbmVyYXRlZC4gRGlz
YWJsaW5nIHBhcmFsbGVsIGJ1aWxkIGZvciB0aGUgcmVjaXBlIHNob3VsZCBmaXgNCnRoZSBpc3N1
ZS4gSSB3aWxsIHNlbmQgYSBwYXRjaCBzaG9ydGx5Lg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBEdWRhdSA8YWRyaWFuLmR1ZGF1QGVuZWEuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRh
LW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3VtaXAvdW1pcF8xLjAuYmIgfCAyIC0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3VtaXAvdW1pcF8xLjAuYmIgYi9tZXRhLW9lL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L3VtaXAvdW1pcF8xLjAuYmINCj4gPiBpbmRleCA0MWU1MzQwLi43Njkw
MWFiIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdW1pcC91
bWlwXzEuMC5iYg0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdW1pcC91
bWlwXzEuMC5iYg0KPiA+IEBAIC0xNiw1ICsxNiwzIEBAIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+
ID4gIEVYVFJBX09FX0NPTkYgPSAiLS1lbmFibGUtdnQiDQo+ID4gIA0KPiA+ICBpbmhlcml0IGF1
dG90b29scy1icm9rZW5zZXANCj4gPiAtDQo+ID4gLVBOQkxBQ0tMSVNUW3VtaXBdID89ICJCUk9L
RU46IFNSQ19VUkkgc2VlbXMgdG8gYmUgZG93biBhbmQgYnVpbGQgZnJvbSBwcmVtaXJyb3IgZmFp
bHMgdG8gZmluZCBncmFtLmgsIHNlZSBodHRwOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJy
b3JzL0RldGFpbHMvNTYxNTgvIg0KPiA+IC0tIA0KPiA+IDEuOS4xDQo+ID4gDQo+ID4gLS0gDQo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBP
cGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiANCg0KDQo=

