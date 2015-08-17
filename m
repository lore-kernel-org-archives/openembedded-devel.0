Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F37275F2A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 06:23:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99707089"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2015 14:26:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7H6N5ZQ002541
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:23:05 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Mon, 17 Aug 2015 14:23:08 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] dmraid: add new recipe
Thread-Index: AQHQqYtqn6CFb1uClU6KEouoqjqEdZ4QFeLA
Date: Mon, 17 Aug 2015 06:23:07 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC011C1F8088@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1434606393-51485-1-git-send-email-biannm@cn.fujitsu.com>
In-Reply-To: <1434606393-51485-1-git-send-email-biannm@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] dmraid: add new recipe
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
X-List-Received-Date: Mon, 17 Aug 2015 06:23:14 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpXaGF0J3MgeW91ciBvcGluaW9uIGFib3V0IHRoaXMgcGF0Y2guDQoNCkkg
cmViYXNlZCBteSB0cmVlLCBzbyBwbGVhc2UgY2hlcnJ5LXBpY2sgdGhlIG5ldyBvbmUgZnJvbSB0
aGVyZS4NCmh0dHBzOi8vZ2l0aHViLmNvbS9iZW5kYWFyb24vbWV0YS1vZS1kZXYvY29tbWl0LzM0
MDlmYmJhMGM1OWRjMmNmMmFkMWY1NWI0ZmIyNTJkMmJiYzFhNzYNCg0KVGhhbmtzDQogQmlhbg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJpYW4sIE5haW1lbmcNCj4g
U2VudDogVGh1cnNkYXksIEp1bmUgMTgsIDIwMTUgMTo0NyBQTQ0KPiBUbzogb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEJpYW4sIE5haW1lbmcNCj4gU3Vi
amVjdDogW21ldGEtb2VdW1BBVENIXSBkbXJhaWQ6IGFkZCBuZXcgcmVjaXBlDQo+IA0KPiBEZXZp
Y2UtbWFwcGVyIFJBSUQgdG9vbCBhbmQgbGlicmFyeS4NCj4gSXQgaXMgcHJvdmlkZWQgYnkgbG90
cyBvZiBkaXN0cm8gc3VjaCBhcyBSSEVMIGFuZCBVYnVudHUuDQo+IA0KPiBUaGVyZSBhcmUgc29t
ZSB3ZWlyZCBsaW5lIGVuZGluZ3MgaW4gdGhpcyBwYXRjaCwgc28gcGxlYXNlIGNoZXJyeS1waWNr
IGl0IGZyb20NCj4gaHR0cHM6Ly9naXRodWIuY29tL2JlbmRhYXJvbi9tZXRhLW9lLWRldi9jb21t
aXQvYmNmN2RkMmI0NmVjNDk0OGI1ZDAzOTQ1ZDENCj4gMzkwOTMwMmNjZTk5YmMNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEJpYW4gTmFpbWVuZyA8Ymlhbm5tQGNuLmZ1aml0c3UuY29tPg0K

