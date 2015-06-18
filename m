Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D15873306
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 00:59:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97234445"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 09:03:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I0w14q019902
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 08:58:01 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 18 Jun 2015 08:59:36 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
Thread-Index: AQHQqNNk5vhEumrz40qzb17j8PPGI52wotQAgADNZ1A=
Date: Thu, 18 Jun 2015 00:59:35 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73E10096@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-8-git-send-email-biannm@cn.fujitsu.com>
	<20150617203632.GA2390@jama>
In-Reply-To: <20150617203632.GA2390@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
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
X-List-Received-Date: Thu, 18 Jun 2015 00:59:39 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRl
ZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBN
YXJ0aW4gSmFuc2ENCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTgsIDIwMTUgNDozNyBBTQ0KPiBU
bzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIHYyIDcvN10gc2FtYmE6IHVwZ3JhZGUgdG8gNC4xLjEy
DQo+IA0KPiBPbiBXZWQsIEp1biAxNywgMjAxNSBhdCAwMzo0OToxM1BNICswODAwLCBCaWFuIE5h
aW1lbmcgd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlhbiBOYWltZW5nIDxiaWFubm1AY24u
ZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBnaXQgc2VuZC1lbWFpbCB3aWxsIGNhdGNoIGVycm9yIGFz
IGJlbG93DQo+ID4gIGZhdGFsOiAwMDAyLXNhbWJhLXVwZ3JhZGUtdG8tNC4xLjEyLnBhdGNoOiA5
NjU6IHBhdGNoIGNvbnRhaW5zIGEgbGluZQ0KPiA+IGxvbmdlciB0aGFuIDk5OCBjaGFyYWN0ZXJz
DQo+ID4NCj4gPiBTbywgcGxlYXNlIGdldCBwYXRjaCBmcm9tDQo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2JlbmRhYXJvbi9tZXRhLW9lLWRldi9jb21taXQvNDc2NzhlZDM0NmExY2UzNDdhNjQ3MA0K
PiA+IDVjNzZkZjA5ZDRmYTUzN2IwZQ0KPiANCj4gSSd2ZSBjaGVycnktcGlja2VkIGZpcnN0IDYg
cGF0Y2hlcyBmcm9tIGhlcmUsIGJ1dCB0aGlzIGxhc3Qgb25lIGZhaWxzIHRvIGFwcGx5LA0KPiBi
ZWNhdXNlIHlvdSdyZSByZW1vdmluZyBzYW1iYSAzLjYuMjQsIGJ1dCBpbiBtYXN0ZXIgd2UgaGF2
ZSAzLjYuMjUgc2luY2UgdGhpcw0KPiBjb21taXQgbWVyZ2VkIG1vcmUgdGhhbiBtb250aCBhZ286
DQo+IA0KPiBjb21taXQgOWFjNTcxM2IyZmNiNWNlMDM2OTNlZGQ0MDYzNmQ4ZmNlM2UwMTRkMA0K
PiBBdXRob3I6ICAgICBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+IEF1dGhv
ckRhdGU6IFdlZCBBcHIgMjkgMTc6MjU6MDIgMjAxNSArMDgwMA0KPiBDb21taXQ6ICAgICBNYXJ0
aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+DQo+IENvbW1pdERhdGU6IE1vbiBNYXkg
MTEgMTA6Mjc6MjggMjAxNSArMDIwMA0KPiANCj4gICAgIHNhbWJhOiB1cGdyYWRlIHRvIDMuNi4y
NQ0KPiANCj4gQWxzbyB0aGlzIHBhdGNoIG9ubHkgcmVtb3ZlcyAzLjYuMjQsIGJ1dCBkb2Vzbid0
IGFkZCA0LjEuMTIuDQo+IA0KPiBQbGVhc2UgcmViYXNlIHRvIGxhdGVzdCBtYXN0ZXIgYW5kIGZp
eCB0aGUgbGFzdCBjb21taXQuDQo+IA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQpQbGVhc2Ug
Y2hlcnJ5LXBpY2sgdGhlIG5ldyBvbmUgZnJvbSBoZXJlDQpodHRwczovL2dpdGh1Yi5jb20vYmVu
ZGFhcm9uL21ldGEtb2UtZGV2L2NvbW1pdC8yOTlmYzZkNjdjNmU3NTU0NTBjM2ExZThjZjBiYTA0
NmViN2ZhOGI3DQoNClRoYW5rcw0KIEJpYW4NCg0KPiAtLQ0KPiBNYXJ0aW4gJ0phTWEnIEphbnNh
ICAgICBqYWJiZXI6IE1hcnRpbi5KYW5zYUBnbWFpbC5jb20NCg==

