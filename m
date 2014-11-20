Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 88C0A65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:16:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43701871"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 11:13:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK3GSQs007048
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:16:28 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Thu, 20 Nov 2014 11:16:53 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: lvm2 compile error
Thread-Index: AdAEbN96Q+W9lsi2S96Zrwlpiu5PbQAAx3Aw
Date: Thu, 20 Nov 2014 03:16:49 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CCCB4BC1@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E87C670D@G08CNEXMBPEKD02.g08.fujitsu.local>
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E87C670D@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: lvm2 compile error
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
X-List-Received-Date: Thu, 20 Nov 2014 03:16:51 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IExpLCBY
aW4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIwLCAyMDE0IDExOjAyIEFNDQo+IFRvOiBv
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBbb2Vd
IGx2bTIgY29tcGlsZSBlcnJvcg0KPiANCj4gSGksDQo+IA0KPiBJIGJpdGJha2UgbHZtMiBmcm9t
IG1ldGEtb2UsIGJ1dCBpdCBoYXMgdGhlIGZvbGxvd2luZyBlcnJvcnMuDQo+IEhvdyBjYW4gSSBm
aXggaXQ/DQo+IA0KPiBUaGFua3MgaW4gYWR2YW5jZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
TGkgeGluDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gQnVpbGQgQ29uZmlndXJhdGlvbjoNCj4gQkJfVkVSU0lPTiAgICAgICAgPSAiMS4yNC4wIg0K
PiBCVUlMRF9TWVMgICAgICAgICA9ICJ4ODZfNjQtbGludXgiDQo+IE5BVElWRUxTQlNUUklORyAg
ID0gIkNlbnRPUy02LjUiDQo+IFRBUkdFVF9TWVMgICAgICAgID0gIng4Nl82NC1mY3QtbGludXgi
DQo+IIFjgWMNCj4gfCB4ODZfNjQtZmN0LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10
dW5lPWNvcmUyIC1tc3NlMw0KPiAtbWZwbWF0aD1zc2UgLVdsLC1PMSAtV2wsLS1oYXNoLXN0eWxl
PWdudSAtV2wsLS1hcy1uZWVkZWQNCj4gLVdsLC16LHJlbHJvLC16LG5vdw0KPiAtLXN5c3Jvb3Q9
L3lvY3RvL3dvcmswMDEvZm5zdC9saXhpbi93b3JrL3lvY3RvLXViaW51eC9idWlsZF94ODYtNjQv
dG1wDQo+IC9zeXNyb290cy91YmludXgtcWVtdXg4Ni02NCAtc2hhcmVkIC1XbCwtc29uYW1lLGxp
YmRldm1hcHBlci5zby4xLjAyIFwNCj4gfCAgICAgICAgICAgICAgICAtTzIgLXBpcGUgLWcgLWZl
bGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzDQo+IC1mc3RhY2stcHJvdGVjdG9yLWFsbCAtcGll
IC1mcGllIC1EX0ZPUlRJRllfU09VUkNFPTIgLU8yIC1waXBlIC1nDQo+IC1mZWxpbWluYXRlLXVu
dXNlZC1kZWJ1Zy10eXBlcyAtZnN0YWNrLXByb3RlY3Rvci1hbGwgLXBpZSAtZnBpZQ0KPiAtRF9G
T1JUSUZZX1NPVVJDRT0yIC1mUElDICAtTzIgLU8yIC1waXBlIC1nDQo+IC1mZWxpbWluYXRlLXVu
dXNlZC1kZWJ1Zy10eXBlcyAtZnN0YWNrLXByb3RlY3Rvci1hbGwgLXBpZSAtZnBpZQ0KPiAtRF9G
T1JUSUZZX1NPVVJDRT0yIC1mUElDICAtTzIgLVdsLC0tdmVyc2lvbi1zY3JpcHQsLmV4cG9ydC5z
eW0NCj4gLUwuLi9saWJkbSAtTC4uL2xpYiAtTC4uL2RhZW1vbnMvZG1ldmVudGQgZGF0YXN0cnVj
dC9iaXRzZXQubw0KPiBkYXRhc3RydWN0L2hhc2gubyBkYXRhc3RydWN0L2xpc3QubyBsaWJkbS1j
b21tb24ubyBsaWJkbS1maWxlLm8NCj4gbGliZG0tZGVwdHJlZS5vIGxpYmRtLXN0cmluZy5vIGxp
YmRtLXJlcG9ydC5vIGxpYmRtLWNvbmZpZy5vDQo+IG1tL2RiZ19tYWxsb2MubyBtbS9wb29sLm8g
cmVnZXgvbWF0Y2hlci5vIHJlZ2V4L3BhcnNlX3J4Lm8gcmVnZXgvdHRyZWUubw0KPiBpb2N0bC9s
aWJkbS1pZmFjZS5vIC1scnQgICAtbHVkZXYgIC1vIGlvY3RsL2xpYmRldm1hcHBlci5zby4xLjAy
DQoNCkkgdGhpbmsgaXQncyB3cm9uZyB0byBidWlsZCBzaGFyZWQgbGlicmFyeSB3aXRoICItc2hh
cmVkIiBhbmQgIi1waWUgLWZwaWUiIHRvZ2V0aGVyLg0KSSBndWVzcyBpdCB3aWxsIHdvcmsgYWZ0
ZXIgZ2V0IHJpZCBvZiAiLXBpZSAtZnBpZSIuDQoNClJlZ2FyZHMNCiBCaWFuDQoNCj4gfA0KPiAv
eW9jdG8vd29yazAwMS9mbnN0L2xpeGluL3dvcmsveW9jdG8tdWJpbnV4L2J1aWxkX3g4Ni02NC90
bXAvc3lzcm9vdHMvDQo+IHViaW51eC1xZW11eDg2LTY0L3Vzci9saWIvLi4vbGliL1NjcnQxLm86
IEluIGZ1bmN0aW9uIGBfc3RhcnQnOg0KPiB8DQo+IC95b2N0by93b3JrMDAxL2Zuc3QvbGl4aW4v
d29yay95b2N0by11YmludXgvYnVpbGRfeDg2LTY0L3RtcC93b3JrL2NvcmUNCj4gMi02NC1mY3Qt
bGludXgvZ2xpYmMvMi4yMC1yMC9naXQvY3N1Ly4uL3N5c2RlcHMveDg2XzY0L3N0YXJ0LlM6MTA4
Og0KPiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtYWluJw0KPiB8IGNvbGxlY3QyOiBlcnJvcjog
bGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cw0KPiB8IG1ha2VbMV06ICoqKiBbaW9jdGwvbGliZGV2
bWFwcGVyLnNvLjEuMDJdIEVycm9yIDENCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiANCj4gDQo+IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcg
bGlzdA0KPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1k
ZXZlbA0K

