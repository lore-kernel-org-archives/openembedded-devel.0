Return-Path: <zyong@qti.qualcomm.com>
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
	[103.229.16.227])
	by mail.openembedded.org (Postfix) with ESMTP id 004AB78937
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
	s=qcdkim; t=1520919324; x=1552455324;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=XjDKlb7ZCzd92OrO8Sq8VrSoUL0T6d3+m+9xnq4WngM=;
	b=Yx+yrDd1IrpTZ2wPq0qKw31J0+vVkFQB+UxWdJTtvIhgG7OyhHQIbT7p
	9441V7mAavj0cymsRQ5OXa4Byi9Nqo72GQU/BQ2oqPo6yj82h/DtVhf+I
	lSnBgNi/fsC5rHoS2nOeiYIHc+EC/9rQp5C107dMQ54B6TCHERFVa04e5 M=;
X-IronPort-AV: E=Sophos;i="5.47,464,1515427200"; 
   d="scan'208";a="66607"
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
	by alexa-out-tai-02.qualcomm.com with ESMTP; 13 Mar 2018 13:35:21 +0800
X-IronPort-AV: E=McAfee;i="5900,7806,8830"; a="3591693"
Received: from aptaiexm02b.ap.qualcomm.com ([10.249.150.12])
	by ironmsg01-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
	12 Mar 2018 22:35:17 -0700
Received: from aptaiexm02b.ap.qualcomm.com (10.249.150.12) by
	aptaiexm02b.ap.qualcomm.com (10.249.150.12) with Microsoft SMTP Server
	(TLS) id 15.0.1365.1; Tue, 13 Mar 2018 13:35:15 +0800
Received: from aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d]) by
	aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d%19]) with mapi
	id 15.00.1365.000; Tue, 13 Mar 2018 13:35:15 +0800
From: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] The license of hostapd v2.6
Thread-Index: AdO3SmTWwqkzEwuaSOCd9D2p82ldBv//gGQA//92LBD/+HOxsA==
Date: Tue, 13 Mar 2018 05:35:15 +0000
Message-ID: <c8d0dd7b9f20416c9cf54ef6e27929ef@aptaiexm02b.ap.qualcomm.com>
References: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
	<CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
	<90e3ba77fe6343818693e52ebd9f7b01@aptaiexm02b.ap.qualcomm.com>
In-Reply-To: <90e3ba77fe6343818693e52ebd9f7b01@aptaiexm02b.ap.qualcomm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
MIME-Version: 1.0
Subject: Re: The license of hostapd v2.6
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
X-List-Received-Date: Tue, 13 Mar 2018 05:35:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmUgLyBvcGVuZW1iZWRkZWQgdGVhbSwgDQoNCk1heSBJIGFzayB3aHkgdGhlIGhvc3Rh
cGQgbGljZW5zZSBpcyBzZXQgdG8gIkdQTHYyIHwgQlNEIj8gQWNjb3JkaW5nIHRvIHRoZSBpbmZv
cm1hdGlvbiB3ZSBnZXQsIHRoZSBob3N0YXBkIGxpY2Vuc2UgaXMgIkJTRCIuIENvdWxkIHlvdSBw
cm92aWRlIHRoZSBiYXNpcyBvZiAiR1BMdjIiIGxpY2Vuc2U/DQoNCg0KVGhhbmtzLA0KWW9uZw0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWW9uZyBaaGFuZyAoQVVUTy1CSSkg
DQpTZW50OiBGcmlkYXksIE1hcmNoIDA5LCAyMDE4IDM6MjQgUE0NClRvOiAnQW5kcmUgTWNDdXJk
eScgPGFybWNjdXJkeUBnbWFpbC5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJFOiBbb2VdIFRoZSBsaWNlbnNlIG9mIGhvc3RhcGQg
djIuNg0KDQpIaSBBbmRyZSwNCg0KVGhhbmtzLiBJIGZpbmQgSSBtYWRlIGEgbWlzdGFrZS4NCmh0
dHA6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC90cmVlL21ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvaG9zdGFwZC9ob3N0YXBkXzIuNi5iYj9oPXB5cm8NCmh0dHA6
Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC90cmVlL21ldGEtb2UvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaG9zdGFwZC9ob3N0YXBkXzIuNS5iYj9oPWtyb2dvdGgNCg0KWW9u
Zw0KDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQW5kcmUgTWNDdXJk
eSBbbWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dIA0KU2VudDogRnJpZGF5LCBNYXJjaCAwOSwg
MjAxOCAxMDoyNCBBTQ0KVG86IFlvbmcgWmhhbmcgKEFVVE8tQkkpIDx6eW9uZ0BxdGkucXVhbGNv
bW0uY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpT
dWJqZWN0OiBSZTogW29lXSBUaGUgbGljZW5zZSBvZiBob3N0YXBkIHYyLjYNCg0KT24gVGh1LCBN
YXIgOCwgMjAxOCBhdCA2OjAwIFBNLCBZb25nIFpoYW5nIChBVVRPLUJJKSA8enlvbmdAcXRpLnF1
YWxjb21tLmNvbT4gd3JvdGU6DQo+DQo+IEkgYW0gZG9pbmcgWW9jdG8yLjMgdXBncmFkZSB3aGlj
aCBhbHNvIHVwZGF0ZSBtZXRhLW9wZW5lbWJlZGRlZCBsYXllci4gSSBmaW5kIHRoYXQgdGhlIHZl
cnNpb24gb2YgcGFja2FnZSBob3N0YXBkIGlzIHVwZGF0ZWQgZnJvbSAyLjUgdG8gMi42LiBBbmQg
dGhlIGxpY2Vuc2UgaXMgdXBkYXRlZCBmcm9tICJCU0QiIHRvICJHUEx2MiB8IEJTRCIgaW4gaG9z
dGFwZCByZWNpcGUuIEFzIEkga25vdywgVGhlcmUgaXMgbm8gY2hhbmdlIGluIHRoZSBob3N0YXBk
IGxpY2Vuc2luZyB0ZXJtcyBiZXR3ZWVuIDIuNSBhbmQgMi42IHJlbGVhc2VzIG9yIGFueXRoaW5n
IHRoYXQgaGFzIGhhcHBlbmVkIHNpbmNlIDIuNjsgbm9yIGFyZSB0aGVyZSBwbGFucyBvZiBjaGFu
Z2luZyB0aGUgbGljZW5zZSBpbiB0aGUgZnV0dXJlLiBXaHkgZG8geW91IHB1dCBkdWFsIGxpY2Vu
c2UgaW4gaG9zdGFwZCByZWNpcGU/DQoNClRoZSBMSUNFTlNFIHZhbHVlIGluIHRoZSBtZXRhLW9l
IGhvc3RhcGQgcmVjaXBlIGhhcyBiZWVuIHNldCB0byAiR1BMdjINCnwgQlNEIiBzaW5jZSB0aGUg
b3JpZ2luYWwgcmVjaXBlIHdhcyBmaXJzdCBhZGRlZCBpbiAyMDEyOg0KDQogIGh0dHA6Ly9naXQu
b3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQvP2lkPTc4MzliNDE3NzM5
NjIwMTE2OTZlZDAyOTI0MTM2YjAwNDQ3Y2IzODINCg0KV2hpY2ggcmVjaXBlIGFyZSB5b3UgbG9v
a2luZyBhdCB3aGVuIHlvdSBzZWUgdGhlIExJQ0VOU0UgdmFsdWUgaGFzIGNoYW5nZWQgZHVyaW5n
IHRoZSB1cGRhdGUgZnJvbSBob3N0YXBkIDIuNSB0byAyLjYgPw0K

