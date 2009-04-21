Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LwDQj-0006IE-Sx
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 12:42:28 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 3AC2116DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 12:38:14 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id DF1A62A4229
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 12:37:57 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 21 Apr 2009 12:37:27 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF769@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: initscript changes?
Thread-Index: AcnCbTDoSuJG8BlJS3mNuRZ8iX3Ozw==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: initscript changes?
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
X-List-Received-Date: Tue, 21 Apr 2009 10:42:48 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIG91ciBoaXBveCBtYWNoaW5lIHdlIG5lZWQgc29tZSBpbml0c2NyaXB0IG1vZGlmaWNhdGlv
bnMgKGNoYW5nZXMgaW4gcmVib290IGFuZCBhIG5ldyBzeW1saW5rKS4NCg0KV291bGQgdGhpcyBi
ZSB0aGUgcmlnaHQgd2F5IHRvIGRvIHRoYXQ6DQoNCmRpZmYgLS1naXQgYS9yZWNpcGVzL2luaXRz
Y3JpcHRzL2ZpbGVzL2hpcG94L3JlYm9vdCBiL3JlY2lwZXMvaW5pdHNjcmlwdHMvZmlsZXMvaGlw
b3gvcmVib290DQpuZXcgZmlsZSBtb2RlIDEwMDc1NQ0KaW5kZXggMDAwMDAwMC4uYWYyZGExMA0K
LS0tIC9kZXYvbnVsbA0KKysrIGIvcmVjaXBlcy9pbml0c2NyaXB0cy9maWxlcy9oaXBveC9yZWJv
b3QNCkBAIC0wLDAgKzEsMTkgQEANCisjISAvYmluL3NoDQorIw0KKyMgcmVib290ICAgICAgIEV4
ZWN1dGUgdGhlIHJlYm9vdCBjb21tYW5kLg0KKyMNCisNCitQQVRIPS9zYmluOi9iaW46L3Vzci9z
YmluOi91c3IvYmluDQorDQorIyBUZXN0IGlmIHdlIHNob3VsZCBib290IGludG8gdGhlIG5ldyBr
ZXJuZWwNCitpZiB0ZXN0IC14IC91c3Ivc2Jpbi9rZXhlYyAtYSAtZiAvc3lzL2tlcm5lbC9rZXhl
Y19sb2FkZWQgOyB0aGVuDQorICAgIHJlYWQgbG9hZGVkIDwgL3N5cy9rZXJuZWwva2V4ZWNfbG9h
ZGVkDQorICAgIGlmIHRlc3QgIiRsb2FkZWQiID0gIjEiIDsgdGhlbg0KKyAgICAgICAgZWNobyAt
biAiTG9hZGVkIGtlcm5lbCBpbWFnZSBmb3VuZCwgZXhlY3V0aW5nIC4uLiAiDQorICAgICAgICAv
dXNyL3NiaW4va2V4ZWMgLS1leGVjDQorICAgICAgICBlY2hvICIke3dhcm59ZmFpbGVkLCBkb2lu
ZyBub3JtYWwgcmVib290JHtub3JtfSINCisgICAgZmkNCitmaQ0KKw0KK2VjaG8gLW4gIlJlYm9v
dGluZy4uLiAiDQorcmVib290IC1kIC1mIC1pDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9pbml0c2Ny
aXB0cy9pbml0c2NyaXB0c18xLjAuYmIgYi9yZWNpcGVzL2luaXRzY3JpcHRzL2luaXRzY3JpcHRz
XzEuMC5iYg0KaW5kZXggNTU2ZmJlNC4uY2JjZmVjNSAxMDA2NDQNCi0tLSBhL3JlY2lwZXMvaW5p
dHNjcmlwdHMvaW5pdHNjcmlwdHNfMS4wLmJiDQorKysgYi9yZWNpcGVzL2luaXRzY3JpcHRzL2lu
aXRzY3JpcHRzXzEuMC5iYg0KQEAgLTQsNyArNCw3IEBAIFBSSU9SSVRZID0gInJlcXVpcmVkIg0K
IERFUEVORFMgPSAibWFrZWRldnMiDQogUkRFUEVORFMgPSAibWFrZWRldnMiDQogTElDRU5TRSA9
ICJHUEwiDQotUFIgPSAicjExMyINCitQUiA9ICJyMTE0Ig0KIA0KIFNSQ19VUkkgPSAiZmlsZTov
L2Z1bmN0aW9ucyBcDQogICAgICAgICAgICBmaWxlOi8vaGFsdCBcDQpAQCAtMTMwLDMgKzEzMCw4
IEBAIGRvX2luc3RhbGwgKCkgew0KIGRvX2luc3RhbGxfYXBwZW5kX2FuZ3N0cm9tICgpIHsNCiAg
ICAgICAgcm0gJHtEfSR7c3lzY29uZmRpcn0vaW5pdC5kL2RldmljZXMgJHtEfSR7c3lzY29uZmRp
cn0vcmNTLmQvUzA1ZGV2aWNlcw0KIH0NCisNCisjIEhJUE9YIG5lZWRzIC9zeXMgaW4gcmVib290
IGZvciBrZXhlYyBjaGVjaw0KK2RvX2luc3RhbGxfYXBwZW5kX2hpcG94ICgpIHsNCisgICAgICAg
bG4gLXNmICAgICAgICAgIC4uL2luaXQuZC9zeXNmcy5zaCAgICAgICR7RH0ke3N5c2NvbmZkaXJ9
L3JjNi5kL1M4MHN5c2ZzDQorfQ0K


