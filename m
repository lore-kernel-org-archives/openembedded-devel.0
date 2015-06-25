Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BC424605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:09:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97736197"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 15:13:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P77nYp012416;
	Thu, 25 Jun 2015 15:07:49 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Thu, 25 Jun 2015 15:09:26 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/2] networkmanager: upgrade from
	0.9.8.10 to 1.0.2
Thread-Index: AQHQrwhLbOLv9YwpikGCGv0Z+qS6JZ28wAjg//9+coCAAIqlQA==
Date: Thu, 25 Jun 2015 07:09:26 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390AF90@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CALbNGRQU9+M1aQMWRtW8p02esF8K9COy=LPM6R8=wSZB4xY_dA@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E87390AF66@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CALbNGRR_yo9RC0TTvoK8SjLKowvQm12FD+_xE1r+shm+M2iWKA@mail.gmail.com>
In-Reply-To: <CALbNGRR_yo9RC0TTvoK8SjLKowvQm12FD+_xE1r+shm+M2iWKA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.85]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.8.10 to 1.0.2
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
X-List-Received-Date: Thu, 25 Jun 2015 07:09:33 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJlYXMgTcO8bGxlciBb
bWFpbHRvOnNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBK
dW5lIDI1LCAyMDE1IDI6MzcgUE0NCj4gVG86IExpLCBYaW4v5p2OIOasow0KPiBDYzogb3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0g
W21ldGEtb2VdW1BBVENIIDEvMl0gbmV0d29ya21hbmFnZXI6IHVwZ3JhZGUgZnJvbSAwLjkuOC4x
MCB0bw0KPiAxLjAuMg0KPiANCj4gT24gVGh1LCBKdW4gMjUsIDIwMTUgYXQgODozNCBBTSwgTGks
IFhpbiA8bGl4aW4uZm5zdEBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4+ID4NCj4gPj4gPiAg
U1lTVEVNRF9TRVJWSUNFXyR7UE59ID0gIk5ldHdvcmtNYW5hZ2VyLnNlcnZpY2UiDQo+ID4+ID4g
K1NZU1RFTURfQVVUT19FTkFCTEUgPSAiZGlzYWJsZSINCj4gPj4gV2hhdCBpcyB0aGlzIGZvcj8N
Cj4gPj4NCj4gPj4gT3RoZXJ3aXNlOiBIYXZlIHNhbWUgaGVyIHVuZGVyIHRlc3QgZm9yIGEgd2hp
bGUgYW5kIGFtIGZpbmUgd2l0aCBpdC4NCj4gPj4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcmVwbHku
DQo+ID4NCj4gPiBBZnRlciBzZXR0aW5nICJTWVNURU1EX0FVVE9fRU5BQkxFID0gImRpc2FibGUi
IiwgdGhlDQo+ID4gTmV0d29ya01hbmFnZXIuc2VydmljZSB3aWxsIG5vdCBCZSBzdGFydGVkIHdo
ZW4gdGhlIHN5c3RlbSBzdGFydHMuDQo+ID4gQW5kIHdlIGRpZCB0ZXN0IGFib3V0IHRoaXMuDQo+
IFllcyBhbmQgaG93IGlzIGl0IHN0YXJ0ZWQ/DQoNClRoZSBzeXN0ZW1kIGlzIGVuYWJsZWQgaW4g
b3VyIHN5c3RlbS4NClNvLCBJbiB0aGUgcHJvY2VzcyBvZiBzdGFydGluZyB0aGUgc3lzdGVtLCBp
dCB3aWxsIGNoZWNrIGFsbCBvZiB0aGUgc2VydmljZSB3aGljaCBpcyBlbmFibGVkIGFuZCBzdGFy
dCB0aGVtIC4NCkZvciBleGFtcGxlLCBpZiB3ZSBzZXQgTmV0d29ya01hbmFnZXIuc2VydmljZSBl
bmFibGUsIGl0IHdpbGwgYmUgc3RhcnRlZCBhdXRvbWF0aWNhbGx5IHdoZW4gdGhlIHN5c3RlbSBp
cyBzdGFydGluZy4NCg0KUmVnYXJkcywNCkxpDQoNCg==

