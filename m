Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D96C0609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 06:16:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55733057"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jan 2015 14:13:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t086GHdo020096;
	Thu, 8 Jan 2015 14:16:18 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 8 Jan 2015 14:16:50 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [oe] recent addition of libgxim depends issue
Thread-Index: AQHQKEcX1pxGx5J+dE+SiQsWQJTE6JyzTsoAgACS7wCAAH5/gIABXlNg
Date: Thu, 8 Jan 2015 06:16:49 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DE75F4@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <54A97D15.4080801@gmail.com>
	<B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
	<2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1so4_twi6X-df5xCbXjd5d1kSg8HdwxP74VNF3hboJhU8Q@mail.gmail.com>
In-Reply-To: <CAMKF1so4_twi6X-df5xCbXjd5d1kSg8HdwxP74VNF3hboJhU8Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: recent addition of libgxim depends issue
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
X-List-Received-Date: Thu, 08 Jan 2015 06:16:56 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDA4LCAyMDE1
IDE6MDEgQU0NCj4gVG86IFBhdWwgRWdnbGV0b24NCj4gQ2M6IEFybWluIEt1c3Rlcjsgb3BlbmVt
YmVkZWQtZGV2ZWw7IEJpYW4sIE5haW1lbmcv5Y2eIOS5g+eMmw0KPiBTdWJqZWN0OiBSZTogW29l
XSByZWNlbnQgYWRkaXRpb24gb2YgbGliZ3hpbSBkZXBlbmRzIGlzc3VlDQo+IA0KPiBPbiBXZWQs
IEphbiA3LCAyMDE1IGF0IDE6MjcgQU0sIFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGlu
dXguaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBJZiBpdCdzIG5vdCBzcGVjaWZpY2FsbHkgYSBy
dWJ5LXJlbGF0ZWQgcGllY2Ugb2Ygc29mdHdhcmUgKHdoaWNoIGl0DQo+ID4gZG9lc24ndCBzZWVt
IHRvIGJlLCBhdCBhIGdsYW5jZSkgdGhlbiB0aGF0IHdvdWxkbid0IHNlZW0gcmlnaHQuIENhbg0K
PiA+IHRoZSBydWJ5IGRlcGVuZGVuY3kgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCB1c2luZyBQQUNL
QUdFQ09ORklHIHBlcmhhcHM/DQo+IA0KPiB0aGF0cyBhbm90aGVyIG9wdGlvbiB5ZXMNCg0KcnVi
eS1uYXRpdmUgbm90IHJ1bnRpbWUtcnVieSBpcyByZXF1aXJlZCBieSBsaWJneGltLiANClRoZXJl
J3MgYSBydWJ5IHNjcmlwdCBuYW1lZCBta2FjYy5yYiB1c2VkIHRvIGdlbmVyYXRlIHNvdXJjZSBm
aWxlLg0KSSB0aGluayBpdCdzIG5vdCBhIGZlYXR1cmUgd2hpY2ggY2FuIGJlIGRpc2FibGVkL2Vu
YWJsZWQgZWFzaWx5IGJ5IHVzaW5nIFBBQ0tBR0VDT05GSUcuDQoNCkJ1dCBhcyBQYXVsIHNhaWQs
IGl0J3Mgbm90IGEgcnVieS1yZWxhdGVkIHNvZnR3YXJlLCBtb3ZpbmcgaXQgdG8NCm1ldGEtcnVi
eSBkb2VzIG5vdCBtYWtlIHNlbnNlLg0KDQpJcyBpdCBpbXBvc3NpYmxlIHRvIG1vdmUgdGhlIHJ1
YnkgdG8gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzIG9yIG9lLWNvcmUvcmVjaXBlcy1kZXZ0b29s
cw0Kc2FtZSBweXRob24gYW5kIHBlcmwuDQoNClRoYW5rcw0KIEJpYW4NCg==

