Return-Path: <zyong@qti.qualcomm.com>
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
	[103.229.16.227])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0D27887A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
	s=qcdkim; t=1520995925; x=1552531925;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=yLGcbuk0V67oVkFYcp969FZl1XnCfyhrbAQQKQ8W4hA=;
	b=afup5T7CyyMfQY/2cYQGAW8ciUsBGXq9gh83Gh7RljCOPYhdoIATyOAB
	x+4Xo/S8YohOswp69EKfBBfbxIX1DL3Tn6u9KUsdQAgf8noyBCMWktXz7
	HG8p8BwNMJmRvrCzLqGLInM5eNIK/s9wGs4GzGGmUNXdsrP8ICVIYaJf7 0=;
X-IronPort-AV: E=Sophos;i="5.47,468,1515427200"; 
   d="scan'208";a="74819"
Received: from ironmsg01-tai.qualcomm.com ([10.249.140.6])
	by alexa-out-tai-02.qualcomm.com with ESMTP; 14 Mar 2018 10:52:03 +0800
X-IronPort-AV: E=McAfee;i="5900,7806,8831"; a="3659373"
Received: from aptaiexm02f.ap.qualcomm.com ([10.249.150.16])
	by ironmsg01-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
	13 Mar 2018 19:51:59 -0700
Received: from aptaiexm02b.ap.qualcomm.com (10.249.150.12) by
	aptaiexm02f.ap.qualcomm.com (10.249.150.16) with Microsoft SMTP Server
	(TLS) id 15.0.1365.1; Wed, 14 Mar 2018 10:51:57 +0800
Received: from aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d]) by
	aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d%19]) with mapi
	id 15.00.1365.000; Wed, 14 Mar 2018 10:51:57 +0800
From: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [oe] The license of hostapd v2.6
Thread-Index: AdO3SmTWwqkzEwuaSOCd9D2p82ldBv//gGQA//92LBD/+HOxsIAPrXqA//8uZzA=
Date: Wed, 14 Mar 2018 02:51:57 +0000
Message-ID: <ad038783563040af910e92e7eb26919f@aptaiexm02b.ap.qualcomm.com>
References: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
	<CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
	<90e3ba77fe6343818693e52ebd9f7b01@aptaiexm02b.ap.qualcomm.com>
	<c8d0dd7b9f20416c9cf54ef6e27929ef@aptaiexm02b.ap.qualcomm.com>
	<CAJ86T=V6Uz6EhL6GbRswaf9ZsmZ7JEgjRHowpYEN+wKvy0Sa-A@mail.gmail.com>
In-Reply-To: <CAJ86T=V6Uz6EhL6GbRswaf9ZsmZ7JEgjRHowpYEN+wKvy0Sa-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 14 Mar 2018 02:52:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmUsDQoNCkkgYW0gYSBuZXdlciBoZXJlLiBDb3VsZCB5b3UgcHJvdmlkZSBndWlkZSB0
byBzdWJtaXQgdGhlIHBhdGNoLCBvciBjb3VsZCB5b3UgaGVscCB0byBkbyBpdD8NCg0KUmVnYXJk
cywNCllvbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJlIE1jQ3Vy
ZHkgW21haWx0bzphcm1jY3VyZHlAZ21haWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgTWFyY2gg
MTQsIDIwMTggNjoxOSBBTQ0KVG86IFlvbmcgWmhhbmcgKEFVVE8tQkkpIDx6eW9uZ0BxdGkucXVh
bGNvbW0uY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTdWJqZWN0OiBSZTogW29lXSBUaGUgbGljZW5zZSBvZiBob3N0YXBkIHYyLjYNCg0KT24gTW9u
LCBNYXIgMTIsIDIwMTggYXQgMTA6MzUgUE0sIFlvbmcgWmhhbmcgKEFVVE8tQkkpIDx6eW9uZ0Bx
dGkucXVhbGNvbW0uY29tPiB3cm90ZToNCj4NCj4gTWF5IEkgYXNrIHdoeSB0aGUgaG9zdGFwZCBs
aWNlbnNlIGlzIHNldCB0byAiR1BMdjIgfCBCU0QiPyBBY2NvcmRpbmcgdG8gdGhlIGluZm9ybWF0
aW9uIHdlIGdldCwgdGhlIGhvc3RhcGQgbGljZW5zZSBpcyAiQlNEIi4gQ291bGQgeW91IHByb3Zp
ZGUgdGhlIGJhc2lzIG9mICJHUEx2MiIgbGljZW5zZT8NCg0KQmVjYXVzZSBpdCdzIGEgbWlzdGFr
ZS4gVGhlIExJQ0VOU0UgZGVmaW5pdGlvbiBpbiB0aGUgcmVjaXBlIHdhcyBub3QgdXBkYXRlZCB3
aGVuIHRoZSBob3N0YXBkIGxpY2Vuc2luZyB3YXMgY2hhbmdlZCBpbiAyMDEyLg0KDQpVbmZvcnR1
bmF0ZWx5IHRoZXNlIGtpbmQgb2YgbWlzdGFrZXMgYXJlIG5vdCB1bmNvbW1vbi4gQ29udHJpYnV0
b3JzIG9mIHZlcnNpb24gdXBkYXRlIHBhdGNoZXMgb2Z0ZW4gZG9uJ3QgdGFrZSB0aGUgdGltZSB0
byBjaGVjayBjYXJlZnVsbHkgZm9yIGNoYW5nZXMgaW4gdGhlIHNvdXJjZSAobGljZW5zaW5nIGNo
YW5nZXMsIG5ldyBjb25maWd1cmUgb3B0aW9ucywNCmV0YykgYW5kIHRoZXJlIGFyZSB2ZXJ5IGZl
dyBwZW9wbGUgd2hvIHJldmlldyBwYXRjaGVzIHNlbnQgdG8gdGhlIGxpc3QgKGV2ZW4gd29yc2Us
IGEgbmVnYXRpdmUgcmV2aWV3IG9uIHRoZSBsaXN0IGlzIG5vIGd1YXJhbnRlZSB0aGF0IGEgcGF0
Y2ggd29uJ3QganVzdCBnZXQgbWVyZ2VkIGFueXdheSAtIHNvIG92ZXIgdGltZSBwZW9wbGUgd2hv
IG1heSBiZSBpbmNsaW5lZCB0byByZXZpZXcgcGF0Y2hlcyB0ZW5kIHRvIHN0b3AgYm90aGVyaW5n
KS4NCg0KU28sIGluIHN1bW1hcnkgLSB5b3UgaGF2ZSBmb3VuZCBhIGJ1ZyEgUGVyaGFwcyB5b3Ug
Y2FuIHN1Ym1pdCBhIHBhdGNoIHRvIGZpeCB0aGUgTElDRU5TRSBkZWZpbml0aW9uIGluIHRoZSBy
ZWNpcGU/DQoNCi0tLS0NCg0KRm9yIHJlZmVyZW5jZSwgdGhlIHRvcCBsZXZlbCBvZiB0aGUgaG9z
dGFwZCBzb3VyY2UgdHJlZSBjb250YWlucyBhIENPUFlJTkcgZmlsZSB3aGljaCBzdGF0ZXM6DQoN
ClRoaXMgc29mdHdhcmUgd2FzIHByZXZpb3VzbHkgZGlzdHJpYnV0ZWQgdW5kZXIgQlNEL0dQTCB2
MiBkdWFsIGxpY2Vuc2UgdGVybXMgdGhhdCBhbGxvd2VkIGVpdGhlciBvZiB0aG9zZSBsaWNlbnNl
IGFsdGVybmF0aXZlcyB0byBiZSBzZWxlY3RlZC4gQXMgb2YgRmVicnVhcnkgMTEsIDIwMTIsIHRo
ZSBwcm9qZWN0IGhhcyBjaG9zZW4gdG8gdXNlIG9ubHkgdGhlIEJTRCBsaWNlbnNlIG9wdGlvbiBm
b3IgZnV0dXJlIGRpc3RyaWJ1dGlvbi4gQXMgc3VjaCwgdGhlIEdQTCB2MiBsaWNlbnNlIG9wdGlv
biBpcyBubyBsb25nZXIgdXNlZC4gSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgdGhlIEJTRCBsaWNl
bnNlIG9wdGlvbiAodGhlIG9uZSB3aXRoIGFkdmVydGlzZW1lbnQgY2xhdXNlIHJlbW92ZWQpIGlz
IGNvbXBhdGlibGUgd2l0aCBHUEwgYW5kIGFzIHN1Y2gsIGRvZXMgbm90IHByZXZlbnQgdXNlIG9m
IHRoaXMgc29mdHdhcmUgaW4gcHJvamVjdHMgdGhhdCB1c2UgR1BMLg0KDQpTb21lIG9mIHRoZSBm
aWxlcyBtYXkgc3RpbGwgaW5jbHVkZSBwb2ludGVycyB0byBHUEwgdmVyc2lvbiAyIGxpY2Vuc2Ug
dGVybXMuIEhvd2V2ZXIsIHN1Y2ggY29weXJpZ2h0IGFuZCBsaWNlbnNlIG5vdGlmaWNhdGlvbnMg
YXJlIG1haW50YWluZWQgb25seSBmb3IgYXR0cmlidXRpb24gcHVycG9zZXMgYW5kIGFueSBkaXN0
cmlidXRpb24gb2YgdGhpcyBzb2Z0d2FyZSBhZnRlciBGZWJydWFyeSAxMSwgMjAxMiBpcyBubyBs
b25nZXIgdW5kZXIgdGhlIEdQTCB2MiBvcHRpb24uDQo=

