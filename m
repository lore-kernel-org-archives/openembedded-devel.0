Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC45784B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:23:33 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v8D7NXFa029767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 13 Sep 2017 09:23:33 +0200
Received: from DEFTHW99ERIMSX.ww902.siemens.net
	(defthw99erimsx.ww902.siemens.net [139.22.70.134])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id v8D7NXBF010151
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 13 Sep 2017 09:23:33 +0200
Received: from DEFTHW99ERDMSX.ww902.siemens.net (139.22.70.69) by
	DEFTHW99ERIMSX.ww902.siemens.net (139.22.70.134) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 13 Sep 2017 09:23:33 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.143]) by
	DEFTHW99ERDMSX.ww902.siemens.net ([139.22.70.69]) with mapi id
	14.03.0361.001; Wed, 13 Sep 2017 09:23:32 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] protobuf: update to 3.4.0
Thread-Index: AQHTJ+eQhJXUyJf8cUWZFP5QNG82W6Kvy0UAgAKnBiA=
Date: Wed, 13 Sep 2017 07:23:32 +0000
Message-ID: <355BE46A91031048906B695426A8D8E6171FEDE6@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1504795356-19820-1-git-send-email-pascal.bach@siemens.com>
	<CA+chaQdgk7FGQ3VoBFCvK7siVUf_dRPdyCmht1copoe1YGcoTA@mail.gmail.com>
In-Reply-To: <CA+chaQdgk7FGQ3VoBFCvK7siVUf_dRPdyCmht1copoe1YGcoTA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.19]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: update to 3.4.0
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
X-List-Received-Date: Wed, 13 Sep 2017 07:23:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBzdWJtaXR0ZWQgYW4gdXBkYXRlZCBwYXRjaHNldCB0aGF0IGFsc28gdXBkYXRlcyBwcm90b2J1
Zi1jIHRvIGEgY29tcGF0aWJsZSB2ZXJzaW9uLg0KSeKAmW0gbm90IHVzaW5nIHByb3RvYnVmLWMg
c28gSSBkaWRu4oCZdCBjYXRjaCB0aGUgcHJvYmxlbS4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmll
bmNlLg0KDQpGcm9tOiBNYXJ0aW4gSmFuc2EgW21haWx0bzptYXJ0aW4uamFuc2FAZ21haWwuY29t
XQ0KU2VudDogTW9udGFnLCAxMS4gU2VwdGVtYmVyIDIwMTcgMTg6NTINClRvOiBCYWNoLCBQYXNj
YWwgKEJUIENQUyBSJkQgWkcgRlcgQ0NQKSA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+DQpDYzog
b3BlbmVtYmVkZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4NClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSF0gcHJvdG9idWY6IHVwZGF0
ZSB0byAzLjQuMA0KDQpGYWlscyB0byBidWlsZCBoZXJlOg0KaHR0cDovL2Vycm9ycy55b2N0b3By
b2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzE1NTUzMy8NCg0KT24gVGh1LCBTZXAgNywgMjAxNyBh
dCA0OjQyIFBNLCBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb208bWFpbHRvOnBh
c2NhbC5iYWNoQHNpZW1lbnMuY29tPj4gd3JvdGU6DQpBbHNvIHB1dCBwcm90YnVmLWxpdGUgaW50
byBpdCdzIG93biBwYWNrYWdlDQoNClNpZ25lZC1vZmYtYnk6IFBhc2NhbCBCYWNoIDxwYXNjYWwu
YmFjaEBzaWVtZW5zLmNvbTxtYWlsdG86cGFzY2FsLmJhY2hAc2llbWVucy5jb20+Pg0KLS0tDQog
Li4uL3Byb3RvYnVmL3twcm90b2J1Zl8zLjMuMC5iYjxodHRwOi8vcHJvdG9idWZfMy4zLjAuYmI+
ID0+IHByb3RvYnVmXzMuNC4wLmJiPGh0dHA6Ly9wcm90b2J1Zl8zLjQuMC5iYj59ICAgICAgICAg
ICAgfCA5ICsrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pDQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi97cHJv
dG9idWZfMy4zLjAuYmI8aHR0cDovL3Byb3RvYnVmXzMuMy4wLmJiPiA9PiBwcm90b2J1Zl8zLjQu
MC5iYjxodHRwOi8vcHJvdG9idWZfMy40LjAuYmI+fSAoNzUlKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzMuMy4wLmJiPGh0dHA6Ly9w
cm90b2J1Zl8zLjMuMC5iYj4gYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJv
dG9idWZfMy40LjAuYmI8aHR0cDovL3Byb3RvYnVmXzMuNC4wLmJiPg0Kc2ltaWxhcml0eSBpbmRl
eCA3NSUNCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90
b2J1Zl8zLjMuMC5iYjxodHRwOi8vcHJvdG9idWZfMy4zLjAuYmI+DQpyZW5hbWUgdG8gbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzMuNC4wLmJiPGh0dHA6Ly9wcm90
b2J1Zl8zLjQuMC5iYj4NCmluZGV4IGNlNjRhODguLjM5MTA4ZGQgMTAwNjQ0DQotLS0gYS9tZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfMy4zLjAuYmI8aHR0cDovL3By
b3RvYnVmXzMuMy4wLmJiPg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmXzMuNC4wLmJiPGh0dHA6Ly9wcm90b2J1Zl8zLjQuMC5iYj4NCkBAIC02LDcgKzYs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3Byb3RvYnVmIg0KIFNF
Q1RJT04gPSAiY29uc29sZS90b29scyINCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSINCg0KLVBB
Q0tBR0VfQkVGT1JFX1BOID0gIiR7UE59LWNvbXBpbGVyIg0KK1BBQ0tBR0VfQkVGT1JFX1BOID0g
IiR7UE59LWNvbXBpbGVyICR7UE59LWxpdGUiDQoNCiBERVBFTkRTID0gInpsaWIiDQogUkRFUEVO
RFNfJHtQTn0tY29tcGlsZXIgPSAiJHtQTn0iDQpAQCAtMTQsMTEgKzE0LDExIEBAIFJERVBFTkRT
XyR7UE59LWRldiArPSAiJHtQTn0tY29tcGlsZXIiDQoNCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT0zNTk1M2M3NTJlZmM5Mjk5YjE4NGY5MWJlZjU0MDA5NTxmaWxlOi8v
L1xcTElDRU5TRTttZDU9MzU5NTNjNzUyZWZjOTI5OWIxODRmOTFiZWY1NDAwOTU+Ig0KDQotU1JD
UkVWID0gImE2MTg5YWNkMThiMDA2MTFjMWRjNzA0MjI5OWFkNzU0ODZmMDhhMWEiDQorU1JDUkVW
ID0gIjgwYTM3ZTA3ODJkMmQ3MDJkNTIyMzRiNjJkZDRiOWVjNzRmZDJjOTUiDQoNCi1QViA9ICIz
LjMuMCtnaXQke1NSQ1BWfSINCitQViA9ICIzLjQuMCtnaXQke1NSQ1BWfSINCg0KLVNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvcHJvdG9idWYuZ2l0PGh0dHA6Ly9naXRodWIuY29t
L2dvb2dsZS9wcm90b2J1Zi5naXQ+Ig0KK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29n
bGUvcHJvdG9idWYuZ2l0O2JyYW5jaD0zLjQueDxodHRwOi8vZ2l0aHViLmNvbS9nb29nbGUvcHJv
dG9idWYuZ2l0O2JyYW5jaD0zLjQueD4iDQoNCiBFWFRSQV9PRUNPTkYgKz0gIiAtLXdpdGgtcHJv
dG9jPWVjaG8iDQoNCkBAIC0yNyw2ICsyNyw3IEBAIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNl
cA0KIFMgPSAiJHtXT1JLRElSfS9naXQiDQoNCiBGSUxFU18ke1BOfS1jb21waWxlciA9ICIke2Jp
bmRpcn0gJHtsaWJkaXJ9L2xpYnByb3RvYyR7U09MSUJTfSINCitGSUxFU18ke1BOfS1saXRlID0g
IiR7YmluZGlyfSAke2xpYmRpcn0vbGlicHJvdG9idWYtbGl0ZSR7U09MSUJTfSINCg0KIE1JUFNf
SU5TVFJVQ1RJT05fU0VUID0gIm1pcHMiDQoNCi0tDQoyLjEuNA0KDQotLQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1kZXZlbCBt
YWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1h
aWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCmh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVs
DQoNCg==

