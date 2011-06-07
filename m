Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QTsqP-0006nw-9s
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 11:45:05 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB23.4emm.local ([::1]) with mapi; Tue, 7 Jun 2011 05:41:48 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] Modified populate-volatile.sh to atomically
	update volatile.cache, to avoid power loss issues. Signed-off-by:
	jameslimbouris <james@digitalmatter.com.au>
Thread-Index: AQHMJO+gqeGZlChb7Ee6IQ5m7oAVJpSxoshA
Date: Tue, 7 Jun 2011 09:42:31 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02E820@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF02E499@MBX20.4emm.local>
	<1307436604.4064.15.camel@mattotaupa>
In-Reply-To: <1307436604.4064.15.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] Modified populate-volatile.sh to atomically update volatile.cache, to avoid power loss issues. Signed-off-by: jameslimbouris <james@digitalmatter.com.au>
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
X-List-Received-Date: Tue, 07 Jun 2011 09:45:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCBbbWFpbHRv
OnBhdWxlcGFudGVyQHVzZXJzLnNvdXJjZWZvcmdlLm5ldF0NCj4gU2VudDogVHVlc2RheSwgNyBK
dW5lIDIwMTEgNDo1MCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gQ2M6IEphbWVzIExpbWJvdXJpcw0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFU
Q0hdIE1vZGlmaWVkIHBvcHVsYXRlLXZvbGF0aWxlLnNoIHRvIGF0b21pY2FsbHkgdXBkYXRlDQo+
IHZvbGF0aWxlLmNhY2hlLCB0byBhdm9pZCBwb3dlciBsb3NzIGlzc3Vlcy4gU2lnbmVkLW9mZi1i
eTogamFtZXNsaW1ib3VyaXMNCj4gPGphbWVzQGRpZ2l0YWxtYXR0ZXIuY29tLmF1Pg0KPiANCj4g
RGVhciBKYW1lcywNCj4gDQo+IA0KPiB0aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guDQo+DQouLi4g
DQo+IA0KPiBwbGVhc2UgcmVzZW5kIHlvdXIgcGF0Y2ggWzJdLCBhcyB0aGUgY29tbWl0IG1lc3Nh
Z2UgZW5kZWQgdXAgaW4gdGhlDQo+IHN1YmplY3QgbGluZS9jb21taXQgc3VtbWFyeS4gUGxlYXNl
IGFsc28gcHJlZml4IHRoZSBjb21taXQgc3VtbWFyeSB3aXRoDQo+IHRoZSByZWNpcGUgbmFtZSBb
MV0gYW5kIGZvcm1hdCB5b3VyIG5hbWUgY29ycmVjdGx5IGluIHRoZSBTaWduZWQtb2ZmLWJ5DQo+
IGxpbmUuIFlvdSBjYW4gdGFrZSB0aGUgZm9sbG93aW5nIG9uZSBhcyBhIHN0YXJ0aW5nIHBvaW50
IGFuZCBwbGVhc2UNCj4gYWRhcHQvaW1wcm92ZSBpdC4NCj4gDQouLi4NCj4gDQo+IERvZXMgbm90
IGAvZXRjL3ZvbGF0aWxlLmNhY2hlLmJ1aWxkYCBuZWVkIHRvIGJlIHJlbW92ZWQgZHVyaW5nIHRo
ZSBuZXh0DQo+IGJvb3QgdXA/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBQYXVsDQoNClRoYW5rcyBQ
YXVsLCBJIHRob3VnaHQgaXQgbG9va2VkIGEgYml0IG9kZC4uLiBJJ20gc3RpbGwgZ2V0dGluZyB1
c2VkIHRvIGFsbCBvZiB0aGVzZSBHaXQgc2NyaXB0cy4NCkkndmUganVzdCBtYWlsZWQgYSBzZWNv
bmQgYXR0ZW1wdCB0aHJvdWdoLg0KDQpJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gZXhwbGljaXRs
eSByZW1vdmUgYC9ldGMvdm9sYXRpbGUuY2FjaGUuYnVpbGRgLCBhcyB0aGUgc2NyaXB0IHNob3Vs
ZA0KcmVidWlsZCB0aGUgdm9sYXRpbGVzIGNhY2hlIG9uIHRoZSBuZXh0IGJvb3QsIHdoaWNoIHdp
bGwgcmVtb3ZlLCByZWJ1aWxkLCBhbmQgcmVuYW1lIHRoZSAuYnVpbGQgZmlsZS4NCsKgwqANClJl
Z2FyZHMsDQrCoEphbWVzIExpbWJvdXJpcw0KDQoNCg==


