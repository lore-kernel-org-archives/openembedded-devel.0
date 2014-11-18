Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A3BB27211F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 05:13:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43545361"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Nov 2014 13:10:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAI5DO5f030862;
	Tue, 18 Nov 2014 13:13:24 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 18 Nov 2014 13:13:43 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Rongqing Li
	<rongqing.li@windriver.com>
Thread-Topic: [oe] [PATCH 2/5] nicstat : add recipe
Thread-Index: AQHQAlXYY2C0usEnjUGBXl4xGeiF+ZxlHwoAgAC3VQA=
Date: Tue, 18 Nov 2014 05:13:41 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87C5B6F@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-3-git-send-email-lixin.fnst@cn.fujitsu.com>
	<546AAABA.5010301@windriver.com>
In-Reply-To: <546AAABA.5010301@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] nicstat : add recipe
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
X-List-Received-Date: Tue, 18 Nov 2014 05:13:44 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFJveQ0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJlcGx5Lg0KSSBhbSBzb3Jy
eSB0aGF0IEkgbWFkZSBhIG1pc3Rha2UsIEkgd2lsbCBhbWVuZCBpdCBhbmQgcmVzZW5kIGl0IGxh
dGVyLg0KDQpCZXN0IFJlZ2FyZHMsDQpMaSBYaW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFJvbmdxaW5nIExpDQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDE4LCAyMDE0IDEwOjExIEFNDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0ggMi81XSBuaWNz
dGF0IDogYWRkIHJlY2lwZQ0KPiANCj4gDQo+IA0KPiBPbiAyMDE05bm0MTHmnIgxN+aXpSAxOTow
MCwgTGkgeGluIHdyb3RlOg0KPiA+IG5pY3N0YXQgaXMgYSB0b29sIHRoYXQgcHJpbnRzIG91dCBu
ZXR3b3JrIHN0YXRpc3RpY3MgZm9yIGFsbCBuZXR3b3JrDQo+ID4gaW50ZXJmYWNlIGNhcmRzIChO
SUNzKSwgaW5jbHVkaW5nIHBhY2tldHMsIGtpbG9ieXRlcyBwZXIgc2Vjb25kLA0KPiA+IGF2ZXJh
Z2UgcGFja2V0IHNpemVzIGFuZCBtb3JlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGkgWGlu
IDxsaXhpbi5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL25pY3N0YXQvbmljc3RhdF8xLjk1LmJiIHwgMTAgKystLS0tLS0tLQ0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbmljc3RhdC9uaWNzdGF0
XzEuOTUuYmINCj4gPiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9uaWNzdGF0L25pY3N0YXRf
MS45NS5iYg0KPiA+IGluZGV4IDMxYTAxNWEuLmM3NTU2M2QgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0
YS1vZS9yZWNpcGVzLWV4dGVuZGVkL25pY3N0YXQvbmljc3RhdF8xLjk1LmJiDQo+ID4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL25pY3N0YXQvbmljc3RhdF8xLjk1LmJiDQo+ID4gQEAg
LTE3LDE1ICsxNyw5IEBAIGRvX2NvbXBpbGUoKSB7DQo+ID4gICB9DQo+ID4NCj4gPiAgIGRvX2lu
c3RhbGwoKSB7DQo+ID4gLSAgICAgICAgaW5zdGFsbCAtZCAke0R9LyR7YmluZGlyfS8NCj4gPiAt
ICAgICAgICBpbnN0YWxsIC1kICR7RH0vJHttYW5kaXJ9Lw0KPiA+ICsgICAgIAlpbnN0YWxsIC1k
ICR7RH0vJHtiaW5kaXJ9Lw0KPiA+ICsJaW5zdGFsbCAtZCAke0R9LyR7bWFuZGlyfS8NCj4gPiAg
ICAgICAgCWluc3RhbGwgLW0gMDc1NSAke1N9L25pY3N0YXQgJHtEfSR7YmluZGlyfS8NCj4gPiAg
IAlpbnN0YWxsIC1tIDA2NDQgJHtTfS9uaWNzdGF0LjEgJHtEfS8ke21hbmRpcn0vDQo+ID4gICB9
DQo+ID4NCj4gPiAtDQo+ID4gLQ0KPiA+IC0NCj4gPiAtDQo+ID4gLQ0KPiA+IC0NCj4gPg0KPiAN
Cj4gDQo+IEkgZGlkIG5vdCBmaW5kIG5pY3N0YXRfMS45NS5iYiBpbiBtZXRhLW9lLCBhcmUgeW91
ciBwYXRjaCBjb21wbGV0ZWQ/DQo+IA0KPiAtUm95DQo+IA0KPiAtLQ0KPiBCZXN0IFJlYWdyZHMs
DQo+IFJveSB8IFJvbmdRaW5nIExpDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QN
Cj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwN
Cg==

