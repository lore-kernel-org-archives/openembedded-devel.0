Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0066AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:45:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98311435"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2015 17:49:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6A9hQc6004951
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 17:43:26 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 10 Jul 2015 17:45:09 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 0/9] add openlmi and it's depends
Thread-Index: AQHQslTofCu+D2NQdUyUY/ZYaIWqhp3Czk4AgAHX/HD//8IIAIAQGHWQ
Date: Fri, 10 Jul 2015 09:45:09 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2A386@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
	<55911B4D.7090303@opendreambox.org> <20150629111252.GA2393@jama>
	<1B56A49860EB2D45ADE3731B15C959FDB2874D@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20150630114022.GA2396@jama>
In-Reply-To: <20150630114022.GA2396@jama>
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
X-List-Received-Date: Fri, 10 Jul 2015 09:45:11 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgTWFydGluDQoNCj4gRnJvbSBsYXN0IGJhdGNoIGZyb20gZnVqaXRzdSBmb2xsb3dpbmcgcmVj
aXBlcyBmYWlsIHRvIGJ1aWxkIGluIHdvcmxkIGJ1aWxkczoNCj4ga29ua3JldGNtcGksIHNibGlt
LXNmY2IsIGNtcGktYmluZGluZ3MsIG9wZW53c21hbg0KDQpFeGNlcHQga29ua3JldGNtcGksIEkg
Y2FuJ3QgcmVwcm9kdWNlIHRoZSBlcnJvciBvZiBzYmxpbS1zZmNiLCBjbXBpLWJpbmRpbmdzIGFu
ZCBvcGVud3NtYW4uDQoNCkkgd2FudCB0byBrbm93IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gbXkg
YnVpbGQgZW52aXJvbm1lbnQgYW5kIHlvdXJzLg0KDQpXb3VsZCB5b3UgbWluZCBzaG93IG1lIHlv
dXIgYmJsYXllcnMuY29uZiBhbmQgbG9jYWwuY29uZiA/DQoNCkNoZWVycyANCkxlaQ0KDQoNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIE1hcnRpbg0K
PiBKYW5zYQ0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDMwLCAyMDE1IDc6NDAgUE0NCj4gVG86IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
b2VdIFttZXRhLW9lXVtQQVRDSCB2MiAwLzldIGFkZCBvcGVubG1pIGFuZCBpdCdzIGRlcGVuZHMN
Cj4gDQo+IE9uIFR1ZSwgSnVuIDMwLCAyMDE1IGF0IDA3OjI2OjE2QU0gKzAwMDAsIExlaSwgTWFv
aHVpIHdyb3RlOg0KPiA+IEhpIE1hcnRpbiwgQW5kcmVhcw0KPiA+DQo+ID4NCj4gPiA+ID4gPiBM
ZWkgTWFvaHVpICg5KToNCj4gPiA+ID4gPiAgIG9wZW5sbWk6IGFkZCBuZXcgcmVjaXBlIG9wZW5s
bWkNCj4gPiA+ID4gPiAgIGNpbS1zY2hlbWEtZXhwZXI6IGFkZCBuZXcgcmVjaXBlIGZvciBvcGVu
bG1pDQo+ID4gPiA+ID4gICBjbXBpLWJpbmRpbmdzOiBhZGQgbmV3IHJlY2lwZSBmb3Igb3Blbmxt
aQ0KPiA+ID4gPiA+ICAga29ua3JldGNtcGk6YWRkIG5ldyByZWNpcGUgZm9yIG9wZW5sbWkNCj4g
PiA+ID4gPiAgIHNibGltLXNmY2I6IGFkZCBuZXcgcmVjaXBlIGZvciBvcGVubG1pDQo+ID4gPiA+
ID4gICBzYmxpbS1zZmNDb21tb246IGFkZCBuZXcgcmVjaXBlDQo+ID4gPiA+ID4gICBzYmxpbS1j
bXBpLWRldmVsOiBhZGQgbmV3IHJlY2lwZQ0KPiA+ID4gPiA+ICAgY2ltLXNjaGVtYV8yLjQwLjAu
YmI6IGRlbGV0ZQ0KPiA+ID4gPiA+ICAgcHl3YmVtOiBhZGQgbmV3IHJlY2lwZQ0KPiA+ID4gPg0K
PiA+ID4gPiB5b3Ugc2hvdWxkIG9yZGVyIHlvdXIgcGF0Y2hlcyBpbiBhIHdheSB0aGF0IGRvZXNu
J3QgYnJlYWsgZ2l0DQo+ID4gPiA+IGJpc2VjdCwgaS5lLiBkZXBlbmRlbmNpZXMgc2hvdWxkIGNv
bWUgZmlyc3QuDQo+ID4NCj4gPiBJIGdvdCBpdC4gVGhhbmsgeW91Lg0KPiA+DQo+ID4gPg0KPiA+
ID4gSSBhZ3JlZSwgSSd2ZSB0cmllZCB0byByZS1vcmRlciB0aGVtIHF1aWNrbHkgd2hlbiBjaGVy
cnktcGlja2luZyB0byBtYXN0ZXItbmV4dC4NCj4gPg0KPiA+IFRoYW5rIHlvdSB2ZXJ5IG11Y2gh
DQo+IA0KPiBGcm9tIGxhc3QgYmF0Y2ggZnJvbSBmdWppdHN1IGZvbGxvd2luZyByZWNpcGVzIGZh
aWwgdG8gYnVpbGQgaW4gd29ybGQgYnVpbGRzOg0KPiBrb25rcmV0Y21waSwgc2JsaW0tc2ZjYiwg
Y21waS1iaW5kaW5ncywgb3BlbndzbWFuLCBzeXNkaWcgYW5kIGxpYmxkYiAoc3RpbGwgcGVuZGlu
Zw0KPiBmcm9tIHNhbWJhIHBhdGNoc2V0KQ0KPiANCj4gYnVpbGQgbG9ncyBpbjoNCj4gaHR0cDov
L2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9CdWlsZC82ODM2Lw0KPiANCj4gLS0NCj4g
TWFydGluICdKYU1hJyBKYW5zYSAgICAgamFiYmVyOiBNYXJ0aW4uSmFuc2FAZ21haWwuY29tDQo=

