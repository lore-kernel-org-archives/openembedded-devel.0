Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32F6E77EE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 03:26:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v853QEq8005051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Sep 2017 20:26:14 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Mon, 4 Sep 2017 20:26:14 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] protobuf-c: set downloadfilename
Thread-Index: AQHTJX3dsQXiHoRo1UevhKf3MqF9dqKlomNQ
Date: Tue, 5 Sep 2017 03:26:13 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B8922FD@ALA-MBC.corp.ad.wrs.com>
References: <20170904070251.23140-1-jackie.huang@windriver.com>
	<CA+chaQcc+4quniUUxJps769vggyDn4o6PG+f1SrY-dku9wYPaQ@mail.gmail.com>
In-Reply-To: <CA+chaQcc+4quniUUxJps769vggyDn4o6PG+f1SrY-dku9wYPaQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.154]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf-c: set downloadfilename
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
X-List-Received-Date: Tue, 05 Sep 2017 03:26:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T2ssIHYyIGlzIHNlbnQgZm9yIHRoZSBjaGFuZ2UuDQoNClRoYW5rcywNCkphY2tpZQ0KDQpGcm9t
OiBNYXJ0aW4gSmFuc2EgW21haWx0bzptYXJ0aW4uamFuc2FAZ21haWwuY29tXQ0KU2VudDogTW9u
ZGF5LCBTZXB0ZW1iZXIgMDQsIDIwMTcgMjE6MDENClRvOiBIdWFuZywgSmllIChKYWNraWUpDQpD
Yzogb3BlbmVtYmVkZGVkLWRldmVsDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hd
IHByb3RvYnVmLWM6IHNldCBkb3dubG9hZGZpbGVuYW1lDQoNCkNoYW5nZSBpdCB0byB1c2UgZ2l0
IGZldGNoZXIgYXMgZ2l0aHViIGFyY2hpdmVzIGNhbiBiZSByZWdlbmVyYXRlZCBmcm9tIHRpbWUg
dG8gdGltZSB3aXRoIGRpZmZlcmVudCBjaGVja3N1bXMuDQoNCk9uIE1vbiwgU2VwIDQsIDIwMTcg
YXQgOTowMiBBTSwgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPG1haWx0bzpqYWNraWUuaHVh
bmdAd2luZHJpdmVyLmNvbT4+IHdyb3RlOg0KRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVh
bmdAd2luZHJpdmVyLmNvbTxtYWlsdG86amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+Pg0KDQpT
ZXQgZG93bmxvYWRmaWxlbmFtZSB0byBhdm9pZCB0aGUgZmlsZSBuYW1lIHdpdGhvdXQNCnBhY2th
Z2UgbmFtZSBsaWtlIHZ7UFZ9LnRhci5nei4NCg0KU2lnbmVkLW9mZi1ieTogSmFja2llIEh1YW5n
IDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbTxtYWlsdG86amFja2llLmh1YW5nQHdpbmRyaXZl
ci5jb20+Pg0KLS0tDQogbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVm
LWNfMS4yLjEuYmI8aHR0cDovL3Byb3RvYnVmLWNfMS4yLjEuYmI+IHwgMiArLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmLWNfMS4yLjEuYmI8aHR0cDov
L3Byb3RvYnVmLWNfMS4yLjEuYmI+IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmLWNfMS4yLjEuYmI8aHR0cDovL3Byb3RvYnVmLWNfMS4yLjEuYmI+DQppbmRleCA0
MGZiOTZjZjQuLjY5NmU4NGVkNSAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29s
cy9wcm90b2J1Zi9wcm90b2J1Zi1jXzEuMi4xLmJiPGh0dHA6Ly9wcm90b2J1Zi1jXzEuMi4xLmJi
Pg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmLWNfMS4y
LjEuYmI8aHR0cDovL3Byb3RvYnVmLWNfMS4yLjEuYmI+DQpAQCAtMTYsNyArMTYsNyBAQCBSREVQ
RU5EU18ke1BOfS1jb21waWxlciA9ICJwcm90b2J1Zi1jb21waWxlciINCiBSREVQRU5EU18ke1BO
fS1kZXYgKz0gIiR7UE59LWNvbXBpbGVyIg0KDQogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9MjM1YzMxOTVhMzk2ODUyNGRjMTUyNGI0ZWJlYTBjMGU8ZmlsZTovLy9cXExJ
Q0VOU0U7bWQ1PTIzNWMzMTk1YTM5Njg1MjRkYzE1MjRiNGViZWEwYzBlPiINCi1TUkNfVVJJID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2J1Zi1jL3Byb3RvYnVmLWMvYXJjaGl2ZS92JHtQVn0u
dGFyLmd6PGh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2J1Zi1jL3Byb3RvYnVmLWMvYXJjaGl2ZS92
JCU3YlBWJTdkLnRhci5nej4iDQorU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHJvdG9i
dWYtYy9wcm90b2J1Zi1jL2FyY2hpdmUvdiR7UFZ9LnRhci5nejtkb3dubG9hZGZpbGVuYW1lPSR7
QlB9LnRhci5nejxodHRwczovL2dpdGh1Yi5jb20vcHJvdG9idWYtYy9wcm90b2J1Zi1jL2FyY2hp
dmUvdiQlN2JQViU3ZC50YXIuZ3o7ZG93bmxvYWRmaWxlbmFtZT0kJTdiQlAlN2QudGFyLmd6PiIN
Cg0KIFNSQ19VUklbbWQ1c3VtXSA9ICJiODg0YWViYTQyODMzMDk0NDVhOGUzYjZlNzMyMmRkNiIN
CiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmQ3MDhmYjNjMDI0YjllNmU4NmRmMTQxZmFmZjgwMjE5
NGY1ZGI5MGE0Yjc5ZTZkNGFhNmJkNjFkZDk4M2RkNiINCi0tDQoyLjExLjANCg0KLS0NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQt
ZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzxtYWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpo
dHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1kZXZlbA0KDQo=

