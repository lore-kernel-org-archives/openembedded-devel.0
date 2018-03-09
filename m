Return-Path: <zyong@qti.qualcomm.com>
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
	[103.229.16.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6D59A606CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
	s=qcdkim; t=1520580249; x=1552116249;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=XmD5wOOgpvUBaIe94hFifBdCENwukVBLSLN9CEJfRsk=;
	b=ohd98UJt1MyFMWLLMQqrgGI+uv1NBbRbszRNM4OiA8zeuqL3WIx2NBS7
	N0mYvJrQljuvJjQtZ4BHNTjXHmZRb3g+XFTJzIQ6qI2/ZzpKWLvLUpXMF
	VTtduw1gc2YMs1hmNFRTJjR40uEvuSzyQhvmJmbDoNImdYpvwyJaEMJyw Y=;
X-IronPort-AV: E=Sophos;i="5.47,444,1515427200"; 
   d="scan'208";a="44990"
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
	by alexa-out-tai-02.qualcomm.com with ESMTP; 09 Mar 2018 15:24:07 +0800
X-IronPort-AV: E=McAfee;i="5900,7806,8826"; a="3291832"
Received: from aptaiexm02a.ap.qualcomm.com ([10.249.150.11])
	by ironmsg03-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
	08 Mar 2018 23:24:03 -0800
Received: from aptaiexm02b.ap.qualcomm.com (10.249.150.12) by
	aptaiexm02a.ap.qualcomm.com (10.249.150.11) with Microsoft SMTP Server
	(TLS) id 15.0.1365.1; Fri, 9 Mar 2018 15:24:00 +0800
Received: from aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d]) by
	aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d%19]) with mapi
	id 15.00.1365.000; Fri, 9 Mar 2018 15:24:00 +0800
From: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [oe] The license of hostapd v2.6
Thread-Index: AdO3SmTWwqkzEwuaSOCd9D2p82ldBv//gGQA//92LBA=
Date: Fri, 9 Mar 2018 07:24:00 +0000
Message-ID: <90e3ba77fe6343818693e52ebd9f7b01@aptaiexm02b.ap.qualcomm.com>
References: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
	<CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
In-Reply-To: <CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
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
X-List-Received-Date: Fri, 09 Mar 2018 07:24:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmUsDQoNClRoYW5rcy4gSSBmaW5kIEkgbWFkZSBhIG1pc3Rha2UuDQpodHRwOi8vZ2l0
Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvdHJlZS9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2hvc3RhcGQvaG9zdGFwZF8yLjYuYmI/aD1weXJvDQpodHRwOi8vZ2l0Lm9w
ZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvdHJlZS9tZXRhLW9lL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2hvc3RhcGQvaG9zdGFwZF8yLjUuYmI/aD1rcm9nb3RoDQoNCllvbmcNCg0KDQoN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJlIE1jQ3VyZHkgW21haWx0
bzphcm1jY3VyZHlAZ21haWwuY29tXSANClNlbnQ6IEZyaWRheSwgTWFyY2ggMDksIDIwMTggMTA6
MjQgQU0NClRvOiBZb25nIFpoYW5nIChBVVRPLUJJKSA8enlvbmdAcXRpLnF1YWxjb21tLmNvbT4N
CkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDog
UmU6IFtvZV0gVGhlIGxpY2Vuc2Ugb2YgaG9zdGFwZCB2Mi42DQoNCk9uIFRodSwgTWFyIDgsIDIw
MTggYXQgNjowMCBQTSwgWW9uZyBaaGFuZyAoQVVUTy1CSSkgPHp5b25nQHF0aS5xdWFsY29tbS5j
b20+IHdyb3RlOg0KPg0KPiBJIGFtIGRvaW5nIFlvY3RvMi4zIHVwZ3JhZGUgd2hpY2ggYWxzbyB1
cGRhdGUgbWV0YS1vcGVuZW1iZWRkZWQgbGF5ZXIuIEkgZmluZCB0aGF0IHRoZSB2ZXJzaW9uIG9m
IHBhY2thZ2UgaG9zdGFwZCBpcyB1cGRhdGVkIGZyb20gMi41IHRvIDIuNi4gQW5kIHRoZSBsaWNl
bnNlIGlzIHVwZGF0ZWQgZnJvbSAiQlNEIiB0byAiR1BMdjIgfCBCU0QiIGluIGhvc3RhcGQgcmVj
aXBlLiBBcyBJIGtub3csIFRoZXJlIGlzIG5vIGNoYW5nZSBpbiB0aGUgaG9zdGFwZCBsaWNlbnNp
bmcgdGVybXMgYmV0d2VlbiAyLjUgYW5kIDIuNiByZWxlYXNlcyBvciBhbnl0aGluZyB0aGF0IGhh
cyBoYXBwZW5lZCBzaW5jZSAyLjY7IG5vciBhcmUgdGhlcmUgcGxhbnMgb2YgY2hhbmdpbmcgdGhl
IGxpY2Vuc2UgaW4gdGhlIGZ1dHVyZS4gV2h5IGRvIHlvdSBwdXQgZHVhbCBsaWNlbnNlIGluIGhv
c3RhcGQgcmVjaXBlPw0KDQpUaGUgTElDRU5TRSB2YWx1ZSBpbiB0aGUgbWV0YS1vZSBob3N0YXBk
IHJlY2lwZSBoYXMgYmVlbiBzZXQgdG8gIkdQTHYyDQp8IEJTRCIgc2luY2UgdGhlIG9yaWdpbmFs
IHJlY2lwZSB3YXMgZmlyc3QgYWRkZWQgaW4gMjAxMjoNCg0KICBodHRwOi8vZ2l0Lm9wZW5lbWJl
ZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvY29tbWl0Lz9pZD03ODM5YjQxNzczOTYyMDExNjk2
ZWQwMjkyNDEzNmIwMDQ0N2NiMzgyDQoNCldoaWNoIHJlY2lwZSBhcmUgeW91IGxvb2tpbmcgYXQg
d2hlbiB5b3Ugc2VlIHRoZSBMSUNFTlNFIHZhbHVlIGhhcyBjaGFuZ2VkIGR1cmluZyB0aGUgdXBk
YXRlIGZyb20gaG9zdGFwZCAyLjUgdG8gMi42ID8NCg==

