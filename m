Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LUOcq-00034a-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Feb 2009 17:59:58 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9A43E16DF7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2009 16:49:06 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id CA3082A421E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2009 16:36:48 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 3 Feb 2009 16:36:48 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF623@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: patch for neon-0.25.5
Thread-Index: AcmGFTpD2T2PKogmQ8KS2YyhlJMqGQ==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: patch for neon-0.25.5
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
X-List-Received-Date: Tue, 03 Feb 2009 17:00:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

QWZ0ZXIgS29lbiBoYXMgZml4ZWQgYXByLTEuMi4xMiAoVGhhbnghKSBpIHJ1biBpbiBuZXh0IHRo
ZSBwcm9ibGVtIHdoZW4gYnVpbGRpbmcgbmVvbi0wLjI1LjUuDQpUaGUgZm9sbG93aW5nIHBhdGNo
IGFsbG93cyB0byBidWlsZCBpdCBhZ2FpbnN0IGdudXRscy0yLiBPSyB0byBwdXNoIHRoaXMgcGF0
Y2g/DQoNCmRpZmYgLS1naXQgYS9wYWNrYWdlcy9uZW9uL2ZpbGVzL2dudXRscy0yLnBhdGNoIGIv
cGFja2FnZXMvbmVvbi9maWxlcy9nbnV0bHMtMi5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAuLjJiMzdkZmMNCi0tLSAvZGV2L251bGwNCisrKyBiL3BhY2thZ2VzL25l
b24vZmlsZXMvZ251dGxzLTIucGF0Y2gNCkBAIC0wLDAgKzEsMTEgQEANCitkaWZmIC1OdXJkIG5l
b24tMC4yNS41L21hY3Jvcy9uZW9uLm00IG5lb24tMC4yNS41LXBhdGNoZWQvbWFjcm9zL25lb24u
bTQNCistLS0gbmVvbi0wLjI1LjUvbWFjcm9zL25lb24ubTQgMjAwOS0wMi0wMyAxNjoyMzo0MC4w
MDAwMDAwMDAgKzAxMDANCisrKysgbmVvbi0wLjI1LjUtcGF0Y2hlZC9tYWNyb3MvbmVvbi5tNCAy
MDA5LTAyLTAzIDE2OjI0OjAwLjAwMDAwMDAwMCArMDEwMA0KK0BAIC04OTUsNiArODk1LDcgQEAN
CisgICAgMS4wLj98MS4wLjE/fDEuMC4yMHwxLjAuMjEpIA0KKyAgICAgICBBQ19NU0dfRVJST1Io
W0dOVSBUTFMgdmVyc2lvbiAkbmVfZ251dGxzX3ZlciBpcyB0b28gb2xkIC0tIDEuMC4yMiBvciBs
YXRlciByZXF1aXJlZF0pIDs7DQorICAgIDEuKikgOzsNCisrICAgMi4qKSA7Ow0KKyAgICAqKSBB
Q19NU0dfRVJST1IoW0dOVSBUTFMgdmVyc2lvbiAkbmVfZ251dGxzX3ZlciBpcyBub3Qgc3VwcG9y
dGVkXSkgOzsNCisgICAgZXNhYw0KKyANCmRpZmYgLS1naXQgYS9wYWNrYWdlcy9uZW9uL25lb25f
MC4yNS41LmJiIGIvcGFja2FnZXMvbmVvbi9uZW9uXzAuMjUuNS5iYg0KaW5kZXggZjkzNWZkYi4u
YmVjOTI2MiAxMDA2NDQNCi0tLSBhL3BhY2thZ2VzL25lb24vbmVvbl8wLjI1LjUuYmINCisrKyBi
L3BhY2thZ2VzL25lb24vbmVvbl8wLjI1LjUuYmINCkBAIC00LDEwICs0LDExIEBAIFNFQ1RJT04g
PSAibGlicyINCiBMSUNFTlNFID0gIkxHUEwiDQogREVQRU5EUyA9ICJ6bGliIGxpYnhtbDIgZXhw
YXQgdGltZSBnbnV0bHMiDQogDQotUFIgPSAicjMiDQorUFIgPSAicjQiDQogDQogU1JDX1VSSSA9
ICJodHRwOi8vd3d3LndlYmRhdi5vcmcvJHtQTn0vJHtQfS50YXIuZ3ogXA0KLSAgICAgICBmaWxl
Oi8vZ251dGxzLWZvcmNlLWFuZC1kZXRlY3QucGF0Y2g7cGF0Y2g9MSINCisgICAgICAgZmlsZTov
L2dudXRscy1mb3JjZS1hbmQtZGV0ZWN0LnBhdGNoO3BhdGNoPTEgXA0KKyAgICAgICBmaWxlOi8v
Z251dGxzLTIucGF0Y2g7cGF0Y2g9MSINCiANCiBpbmhlcml0IGF1dG90b29scyBiaW5jb25maWcg
bGliX3BhY2thZ2UgcGtnY29uZmlnDQogDQo=


