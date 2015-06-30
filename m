Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CD23675C3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 07:26:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97899399"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jun 2015 15:30:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5U7OaqG010150
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:24:37 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Tue, 30 Jun 2015 15:26:16 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 0/9] add openlmi and it's depends
Thread-Index: AQHQslTofCu+D2NQdUyUY/ZYaIWqhp3Czk4AgAHX/HA=
Date: Tue, 30 Jun 2015 07:26:16 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2874D@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
	<55911B4D.7090303@opendreambox.org> <20150629111252.GA2393@jama>
In-Reply-To: <20150629111252.GA2393@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 0/9] add openlmi and it's depends
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
X-List-Received-Date: Tue, 30 Jun 2015 07:26:20 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgTWFydGluLCBBbmRyZWFzDQoNCg0KPiA+ID4gTGVpIE1hb2h1aSAoOSk6DQo+ID4gPiAgIG9w
ZW5sbWk6IGFkZCBuZXcgcmVjaXBlIG9wZW5sbWkNCj4gPiA+ICAgY2ltLXNjaGVtYS1leHBlcjog
YWRkIG5ldyByZWNpcGUgZm9yIG9wZW5sbWkNCj4gPiA+ICAgY21waS1iaW5kaW5nczogYWRkIG5l
dyByZWNpcGUgZm9yIG9wZW5sbWkNCj4gPiA+ICAga29ua3JldGNtcGk6YWRkIG5ldyByZWNpcGUg
Zm9yIG9wZW5sbWkNCj4gPiA+ICAgc2JsaW0tc2ZjYjogYWRkIG5ldyByZWNpcGUgZm9yIG9wZW5s
bWkNCj4gPiA+ICAgc2JsaW0tc2ZjQ29tbW9uOiBhZGQgbmV3IHJlY2lwZQ0KPiA+ID4gICBzYmxp
bS1jbXBpLWRldmVsOiBhZGQgbmV3IHJlY2lwZQ0KPiA+ID4gICBjaW0tc2NoZW1hXzIuNDAuMC5i
YjogZGVsZXRlDQo+ID4gPiAgIHB5d2JlbTogYWRkIG5ldyByZWNpcGUNCj4gPg0KPiA+IHlvdSBz
aG91bGQgb3JkZXIgeW91ciBwYXRjaGVzIGluIGEgd2F5IHRoYXQgZG9lc24ndCBicmVhayBnaXQg
YmlzZWN0LA0KPiA+IGkuZS4gZGVwZW5kZW5jaWVzIHNob3VsZCBjb21lIGZpcnN0Lg0KDQpJIGdv
dCBpdC4gVGhhbmsgeW91Lg0KDQo+IA0KPiBJIGFncmVlLCBJJ3ZlIHRyaWVkIHRvIHJlLW9yZGVy
IHRoZW0gcXVpY2tseSB3aGVuIGNoZXJyeS1waWNraW5nIHRvIG1hc3Rlci1uZXh0Lg0KDQpUaGFu
ayB5b3UgdmVyeSBtdWNoIQ0KDQoNClJlZ2FyZHMNCg0KTGVpDQoNCg==

