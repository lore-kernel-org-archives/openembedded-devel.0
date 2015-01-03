Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 80FAB727D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 23:23:44 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y7Y2r-0000pV-3H from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jan 2015 15:23:45 -0800
Received: from NA-MBX-02.mgc.mentorg.com ([169.254.2.162]) by
	SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) with mapi id
	14.03.0224.002; Sat, 3 Jan 2015 15:23:44 -0800
From: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking] [PATCH] dnrd: fix SRC_URI
Thread-Index: AdAnrFDaCLJag7x4tE+tLpovmJJ0Ow==
Date: Sat, 3 Jan 2015 23:23:43 +0000
Message-ID: <EC21369A6993DD47985E1CBF1038266E2202214A@NA-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking] [PATCH] dnrd: fix SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 23:23:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2FuIHdlIGp1c3QgY2hhbmdlIHRoaXMgdG8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9IGhlcmU/DQoN
Ci1KLg0KDQpPbiAzIEphbiAyMDE1IDE4OjE0LCBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6DQpGaXhlZDoNCkVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6IEZldGNo
ZXIgZmFpbHVyZSBmb3IgVVJMOg0KICAgICdodHRwOi8vbmN1LmRsLnNvdXJjZWZvcmdlLm5ldC9w
cm9qZWN0L2RucmQvZG5yZC8yLjIwLjMvZG5yZC0yLjIwLjMudGFyLmd6Jy4NCiAgICBVbmFibGUg
dG8gZmV0Y2ggVVJMIGZyb20gYW55IHNvdXJjZS4NCg0KU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlh
bmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQotLS0NCiAuLi4vcmVjaXBlcy1kYWVtb25z
L2RucmQvZG5yZF8yLjIwLjMuYmIgICAgICAgICAgICB8ICAgIDIgKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtbmV0
d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvZG5yZC9kbnJkXzIuMjAuMy5iYiBiL21ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWRhZW1vbnMvZG5yZC9kbnJkXzIuMjAuMy5iYg0KaW5kZXggODVhNThjYy4u
Nzg4Y2U3ZCAxMDA2NDQNCi0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWRhZW1vbnMvZG5y
ZC9kbnJkXzIuMjAuMy5iYg0KKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9k
bnJkL2RucmRfMi4yMC4zLmJiDQpAQCAtOSw3ICs5LDcgQEAgU0VDVElPTiA9ICJTeXN0ZW0gRW52
aXJvbm1lbnQvRGFlbW9ucyINCiBMSUNFTlNFID0gIkdQTHYyIg0KIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTBiZTY3MDE3ZjFjNzcwMzEzYWQ3YjQwZTE4ZDU2OGYxIg0K
DQotU1JDX1VSSSA9ICJodHRwOi8vbmN1LmRsLnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0LyR7QlBO
fS8ke0JQTn0vJHtQVn0vJHtCUH0udGFyLmd6IFwNCitTUkNfVVJJID0gImh0dHA6Ly9zb3VyY2Vm
b3JnZS5uZXQvcHJvamVjdHMvJHtCUE59L2ZpbGVzLyR7QlBOfS8ke1BWfS8ke0JQfS50YXIuZ3og
XA0KICAgICAgICAgICAgZmlsZTovL2RucmQuc2VydmljZSBcDQogICAgICAgICAgICBmaWxlOi8v
ZG5yZC5jb25mLnNhbXBsZSBcDQogICAgICAgICAgICBmaWxlOi8vZG5yZC5pbml0Ig0KLS0NCjEu
Ny45LjUNCg0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQpPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

