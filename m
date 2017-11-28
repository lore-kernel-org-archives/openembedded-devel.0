Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 410D071A36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 02:34:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208,217";a="30499471"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2017 10:34:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D12A48029E7;
	Tue, 28 Nov 2017 10:34:51 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Tue, 28 Nov 2017 10:34:49 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] xrdp: new recipe
Thread-Index: AQHTZP3qVUAqri38eEycPW1vUZwRnKMpGD5Q
Date: Tue, 28 Nov 2017 02:34:49 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA3E0F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1511511021-50020-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CALbNGRQZzzwRJgGUR=Cx_KY=SahwuRiYGFHv2Zeq4-PpT2BF=g@mail.gmail.com>
In-Reply-To: <CALbNGRQZzzwRJgGUR=Cx_KY=SahwuRiYGFHv2Zeq4-PpT2BF=g@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.116]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 5D12A48029E7.A75F5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xrdp: new recipe
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
X-List-Received-Date: Tue, 28 Nov 2017 02:34:57 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmVhczoNCiAgICBEbyB5b3UgbWVhbiB1c2UgZ2l0IFNSQ19VUkkg
YW5kIFNSQ1JFViBpbnN0ZWFkIG9mIHRhcmJhbGxzPw0KDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWmhl
bmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVj
aC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwg
U29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hp
bmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0KRnJv
bTogQW5kcmVhcyBNw7xsbGVyIFttYWlsdG86c2Nobml0emVsdG9ueUBnbWFp
bC5jb21dDQpTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI0LCAyMDE3IDQ6MjYg
UE0NClRvOiBaaGVuZywgUnVvcWluL+mDkSDoi6XpkqYgPHpoZW5ncnEuZm5z
dEBjbi5mdWppdHN1LmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEt
b2VdW1BBVENIXSB4cmRwOiBuZXcgcmVjaXBlDQoNCk9uIEZyaSwgTm92IDI0
LCAyMDE3IGF0IDk6MTAgQU0sIHpoZW5ncnEgPHpoZW5ncnEuZm5zdEBjbi5m
dWppdHN1LmNvbTxtYWlsdG86emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29t
Pj4gd3JvdGU6DQpBZGQgYSBuZXcgcmVjaXBlIHhyZHBfMC45LjQuYmI8aHR0
cDovL3hyZHBfMC45LjQuYmI+Lg0KDQpTaWduZWQtb2ZmLWJ5OiBaaGVuZyBS
dW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbTxtYWlsdG86emhl
bmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPj4NCi0tLQ0KIG1ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L3hyZHAveHJkcF8wLjkuNC5iYjxodHRwOi8veHJkcF8w
LjkuNC5iYj4gfCAxMSArKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3hyZHAveHJkcF8wLjkuNC5iYjxodHRwOi8veHJk
cF8wLjkuNC5iYj4NCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3hyZHAveHJkcF8wLjkuNC5iYjxodHRwOi8veHJkcF8wLjkuNC5i
Yj4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC94cmRwL3hyZHBfMC45LjQu
YmI8aHR0cDovL3hyZHBfMC45LjQuYmI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KaW5kZXggMDAwMDAwMC4uNTcwMDkzNg0KLS0tIC9kZXYvbnVsbA0KKysr
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveHJkcC94cmRwXzAuOS40LmJi
PGh0dHA6Ly94cmRwXzAuOS40LmJiPg0KQEAgLTAsMCArMSwxMSBAQA0KK0RF
U0NSSVBUSU9OID0gIkFuIG9wZW4gc291cmNlIHJlbW90ZSBkZXNrdG9wIHBy
b3RvY29sKHJkcCkgc2VydmVyLiINCisNCitMSUNFTlNFID0gIkFwYWNoZS0y
LjAiDQorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
NzJjZmJlNGU3YmQzM2EwYTFkZTk2MzBjOTExOTVjMjEgXA0KKzxmaWxlOi8v
L1xcQ09QWUlORzttZDU9NzJjZmJlNGU3YmQzM2EwYTFkZTk2MzBjOTExOTVj
MjElMjBcJTBiKz4iDQorDQorREVQRU5EUyA9ICJvcGVuc3NsIHZpcnR1YWwv
bGlieDExIGxpYnhmaXhlcyBsaWJ4cmFuZHIiDQorDQpQbGVhc2UgdXNlIGdp
dCAtIGdpdGh1YiB0ZW5kcyB0byByZWJ1aWxkIHRhcmJhbGxzIHdoaWNoIGNo
YW5nZXMgY2hlY2tzdW1zLg0KK1NSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL25ldXRyaW5vbGFicy94cmRwL3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BW
fS8ke0JQTn0tJHtQVn0udGFyLmd6PGh0dHBzOi8vZ2l0aHViLmNvbS9uZXV0
cmlub2xhYnMveHJkcC9yZWxlYXNlcy9kb3dubG9hZC92JCU3YlBWJTdkLyQl
N2JCUE4lN2QtJCU3YlBWJTdkLnRhci5nej4iDQorU1JDX1VSSVttZDVzdW1d
ID0gIjQ0NTk4NDg5NTYxMTI1MTgyZjZlMmUwYzMzYWM4ZTE5Ig0KK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwNTllMzYyZGI1NTBiNThhMTA4MTE3ZTY1Mzgz
NjNkOTBmMDdlZGQwYTU0ODEwYWZmYWU5NzdhNmIwYmI2ZWE3Ig0KLS0NCjIu
Ny40DQpBbmRyZWFzDQoKCg==

