Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1La4BL-0002Y3-6R
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 09:23:13 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id B5F1F16DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 09:33:39 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 5BF3F2A4243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 09:20:39 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 19 Feb 2009 09:21:01 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Ugly build problem with emacs/qemu
Thread-Index: AcmSavKoxRCcfTsmQcWJMic7deT0zA==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Cc: mlauer@vanille-media.de
Subject: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Thu, 19 Feb 2009 08:25:07 -0000
X-List-Received-Date: Thu, 19 Feb 2009 08:25:07 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYSBwcm9ibGVtIHdpdGggZW1hY3MgaXRzZWxmIG9yIHFl
bXUuDQoNCkkgdHJ5IHRvIGJ1aWxkIGV4YWN0bHkgdGhlIHNhbWUgaW1hZ2Ugd2l0aCB0aGUgc2Ft
ZSBjb25maWd1cmF0aW9uIChmeWkgQ0NBQ0hFPSIiKSBvbiBkaWZmZXJlbnQgY29tcHV0ZXJzLiBP
biBvbmUgZXZlcnl0aGluZyBidWlsZHMgZmluZSBvbiB0aGUgb3RoZXIgY29tcGlsaW5nIGVtYWNz
IGZhaWxzIHdpdGggYSBzZWdtZW50YXRpb24gZmF1bHQuIDooDQoNCk5PVEU6IG1ha2UgUUVNVT1x
ZW11LWFybSAgLXMgMTA0ODU3NiAtTCAvaG9tZS9zbGVkei9vZS90bXAuMS9zdGFnaW5nL2FybXY1
dGUtYW5nc3Ryb20tbGludXgtZ251ZWFiaQ0KY2QgbGliLXNyYzsgbWFrZSBhbGwgIFwNCiAgICAg
ICAgICBDQz0nYXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmktZ2NjIC1tYXJjaD1hcm12NXRlIC1t
dHVuZT1hcm05MjZlai1zIC1tdGh1bWItaW50ZXJ3b3JrIC1tdGh1bWInIENGTEFHUz0nLWlzeXN0
ZW0vaG9tZS9zbGVkei9vZS90bXAuMS9zdGFnaW5nL2FybXY1dGUtYW5nc3Ryb20tbGludXgtZ251
ZWFiaS91c3IvaQ0KbmNsdWRlIC1mZXhwZW5zaXZlLW9wdGltaXphdGlvbnMgLWZyZW5hbWUtcmVn
aXN0ZXJzIC1mb21pdC1mcmFtZS1wb2ludGVyIC1PMicgQ1BQRkxBR1M9Jy1EX0JTRF9TT1VSQ0Ug
IC1pc3lzdGVtL2hvbWUvc2xlZHovb2UvdG1wLjEvc3RhZ2luZy9hcm12NXRlLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmkvdXNyL2luY2x1ZGUnIFwNCiAgICAgICAgICBMREZMQUdTPSctTC9ob21lL3Ns
ZWR6L29lL3RtcC4xL3N0YWdpbmcvYXJtdjV0ZS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9s
aWIgLVdsLC1ycGF0aC1saW5rLC9ob21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvYXJtdjV0ZS1h
bmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIgLVdsLC1PMSAtV2wsLQ0KLWhhc2gtc3R5bGU9
Z251IC1XbCwtem5vY29tYnJlbG9jJyBNQUtFPSdtYWtlJw0KbWFrZVsxXTogRW50ZXJpbmcgZGly
ZWN0b3J5IGAvaG9tZS9zbGVkei9vZS90bXAuMS93b3JrL2FybXY1dGUtYW5nc3Ryb20tbGludXgt
Z251ZWFiaS9lbWFjcy0yMi4zLXIwL2VtYWNzLTIyLjMvbGliLXNyYycNCmFybS1hbmdzdHJvbS1s
aW51eC1nbnVlYWJpLWdjYyAtbWFyY2g9YXJtdjV0ZSAtbXR1bmU9YXJtOTI2ZWotcyAtbXRodW1i
LWludGVyd29yayAtbXRodW1iIC1EX0JTRF9TT1VSQ0UgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4u
L3NyYyAtSS9ob21lL3NsZWR6L29lL3RtcC4xL3dvcmsvYXJtdjV0ZS1hbmdzdHJvbS1saW51eC1n
bg0KdWVhYmkvZW1hY3MtMjIuMy1yMC9lbWFjcy0yMi4zL2xpYi1zcmMgLUkvaG9tZS9zbGVkei9v
ZS90bXAuMS93b3JrL2FybXY1dGUtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9lbWFjcy0yMi4zLXIw
L2VtYWNzLTIyLjMvbGliLXNyYy8uLi9zcmMgLUwvaG9tZS9zbGVkei9vZS90bXAuMS9zdGFnaW5n
L2FybXY1dGUtYW5nc3Ryb20tDQpsaW51eC1nbnVlYWJpL3Vzci9saWIgLVdsLC1ycGF0aC1saW5r
LC9ob21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvYXJtdjV0ZS1hbmdzdHJvbS1saW51eC1nbnVl
YWJpL3Vzci9saWIgLVdsLC1PMSAtV2wsLS1oYXNoLXN0eWxlPWdudSAtV2wsLXpub2NvbWJyZWxv
YyAtRF9CU0RfU09VUkNFICAtaXN5c3RlbS9ob21lL3NsZWQNCnovb2UvdG1wLjEvc3RhZ2luZy9h
cm12NXRlLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUgLWlzeXN0ZW0vaG9tZS9z
bGVkei9vZS90bXAuMS9zdGFnaW5nL2FybXY1dGUtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3Iv
aW5jbHVkZSAtZmV4cGVuc2l2ZS1vcHRpbWl6YXRpb25zIC1mcmVuYW1lLXJlZ2lzdGVycw0KIC1m
b21pdC1mcmFtZS1wb2ludGVyIC1PMiAtbyB0ZXN0LWRpc3RyaWIgL2hvbWUvc2xlZHovb2UvdG1w
LjEvd29yay9hcm12NXRlLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvZW1hY3MtMjIuMy1yMC9lbWFj
cy0yMi4zL2xpYi1zcmMvdGVzdC1kaXN0cmliLmMNCnFlbXUtYXJtICAtcyAxMDQ4NTc2IC1MIC9o
b21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvYXJtdjV0ZS1hbmdzdHJvbS1saW51eC1nbnVlYWJp
IC4vdGVzdC1kaXN0cmliIC9ob21lL3NsZWR6L29lL3RtcC4xL3dvcmsvYXJtdjV0ZS1hbmdzdHJv
bS1saW51eC1nbnVlYWJpL2VtYWNzLTIyLjMtcjAvZW1hY3MtMjIuMy9saWItcw0KcmMvdGVzdGZp
bGUNCm1ha2VbMV06ICoqKiBbdGVzdC1kaXN0cmliXSBTZWdtZW50YXRpb24gZmF1bHQNCm1ha2Vb
MV06ICoqKiBEZWxldGluZyBmaWxlIGB0ZXN0LWRpc3RyaWInDQptYWtlWzFdOiBMZWF2aW5nIGRp
cmVjdG9yeSBgL2hvbWUvc2xlZHovb2UvdG1wLjEvd29yay9hcm12NXRlLWFuZ3N0cm9tLWxpbnV4
LWdudWVhYmkvZW1hY3MtMjIuMy1yMC9lbWFjcy0yMi4zL2xpYi1zcmMnDQptYWtlOiAqKiogW2xp
Yi1zcmNdIEVycm9yIDINCkZBVEFMOiBvZV9ydW5tYWtlIGZhaWxlZA0K


