Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B27CF7243A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 11:05:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208,217";a="44670971"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2014 19:01:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB8B4kOl011883
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Dec 2014 19:04:46 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 8 Dec 2014 19:05:09 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: rp-pppoe bitbake error
Thread-Index: AdAS1fmHg2cqe2SWTBWF+4n1HekjaA==
Date: Mon, 8 Dec 2014 11:05:10 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738E85CD@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: rp-pppoe bitbake error
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
X-List-Received-Date: Mon, 08 Dec 2014 11:05:19 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkkgYml0YmFrZSBycC1wcHBvZV8zLjguYmIgZnJvbSBPRSwgYnV0IGl0IGhhcyB0aGUg
Zm9sbG93aW5nIGVycm9ycy4NCklmIHlvdSBrbm93IGhvdyB0byBmaXggaXQsIHBsZWFzZSB0ZWxs
IG1lLg0KVGhhbmsgaW4gYWR2YW5jZS4NCg0KTGkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpnY2MgdmVyc2lvbiA0LjkuMSAoR0NDKQ0KY29uZmln
dXJlOjI2ODQ6ICQ/ID0gMA0KY29uZmlndXJlOjI2NzM6IHg4Nl82NC1mY3QtbGludXgtZ2NjICAt
bTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNzZSAtLXN5c3Jv
b3Q9L2hvbWUvbGl4aW4veW9jdG8tdWJpbnV4L2J1aWxkLng4Ni02NC90bXAvc3lzcm9vdHMvdWJp
bnV4LXFlbXV4ODYtNjQgLVYgPiY1DQp4ODZfNjQtZmN0LWxpbnV4LWdjYzogZXJyb3I6IHVucmVj
b2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICctVicNCng4Nl82NC1mY3QtbGludXgtZ2NjOiBm
YXRhbCBlcnJvcjogbm8gaW5wdXQgZmlsZXMNCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQpjb25m
aWd1cmU6MjY4NDogJD8gPSAxDQpjb25maWd1cmU6MjY3MzogeDg2XzY0LWZjdC1saW51eC1nY2Mg
IC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC0tc3lz
cm9vdD0vaG9tZS9saXhpbi95b2N0by11YmludXgvYnVpbGQueDg2LTY0L3RtcC9zeXNyb290cy91
YmludXgtcWVtdXg4Ni02NCAtcXZlcnNpb24gPiY1DQp4ODZfNjQtZmN0LWxpbnV4LWdjYzogZXJy
b3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICctcXZlcnNpb24nDQp4ODZfNjQt
ZmN0LWxpbnV4LWdjYzogZmF0YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzDQpjb21waWxhdGlvbiB0
ZXJtaW5hdGVkLg0KY29uZmlndXJlOjI2ODQ6ICQ/ID0gMQ0KY29uZmlndXJlOjI3MDQ6IGNoZWNr
aW5nIHdoZXRoZXIgdGhlIEMgY29tcGlsZXIgd29ya3MNCoFjDQpjb25maWd1cmU6MzEyOTogcmVz
dWx0OiBub25lIG5lZWRlZA0KY29uZmlndXJlOjMxNTI6IGNoZWNraW5nIGZvciB4ODZfNjQtZmN0
LWxpbnV4LXJhbmxpYg0KY29uZmlndXJlOjMxNzk6IHJlc3VsdDogeDg2XzY0LWZjdC1saW51eC1y
YW5saWINCmNvbmZpZ3VyZTozMjQ5OiBjaGVja2luZyBob3cgdG8gcnVuIHRoZSBDIHByZXByb2Nl
c3Nvcg0KY29uZmlndXJlOjMzMTk6IHJlc3VsdDogeDg2XzY0LWZjdC1saW51eC1nY2MgLUUgLS1z
eXNyb290PS9ob21lL2xpeGluL3lvY3RvLXViaW51eC9idWlsZC54ODYtNjQvdG1wL3N5c3Jvb3Rz
L3ViaW51eC1xZW11eDg2LTY0ICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2Uz
IC1tZnBtYXRoPXNzZQ0KY29uZmlndXJlOjMzMzk6IHg4Nl82NC1mY3QtbGludXgtZ2NjIC1FIC0t
c3lzcm9vdD0vaG9tZS9saXhpbi95b2N0by11YmludXgvYnVpbGQueDg2LTY0L3RtcC9zeXNyb290
cy91YmludXgtcWVtdXg4Ni02NCAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3Nl
MyAtbWZwbWF0aD1zc2UgIGNvbmZ0ZXN0LmMNCmNvbmZpZ3VyZTozMzM5OiAkPyA9IDANCmNvbmZp
Z3VyZTozMzUzOiB4ODZfNjQtZmN0LWxpbnV4LWdjYyAtRSAtLXN5c3Jvb3Q9L2hvbWUvbGl4aW4v
eW9jdG8tdWJpbnV4L2J1aWxkLng4Ni02NC90bXAvc3lzcm9vdHMvdWJpbnV4LXFlbXV4ODYtNjQg
IC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlICBjb25m
dGVzdC5jDQpjb25mdGVzdC5jOjk6Mjg6IGZhdGFsIGVycm9yOiBhY19ub25leGlzdGVudC5oOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQojaW5jbHVkZSA8YWNfbm9uZXhpc3RlbnQuaD4NCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeDQpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KY29u
ZmlndXJlOjMzNTM6ICQ/ID0gMQ0KY29uZmlndXJlOiBmYWlsZWQgcHJvZ3JhbSB3YXM6DQp8IC8q
IGNvbmZkZWZzLmggKi8NCnwgI2RlZmluZSBQQUNLQUdFX05BTUUgIiINCnwgI2RlZmluZSBQQUNL
QUdFX1RBUk5BTUUgIiINCnwgI2RlZmluZSBQQUNLQUdFX1ZFUlNJT04gIiINCnwgI2RlZmluZSBQ
QUNLQUdFX1NUUklORyAiIg0KfCAjZGVmaW5lIFBBQ0tBR0VfQlVHUkVQT1JUICIiDQp8ICNkZWZp
bmUgUEFDS0FHRV9VUkwgIiINCnwgLyogZW5kIGNvbmZkZWZzLmguICAqLw0KfCAjaW5jbHVkZSA8
YWNfbm9uZXhpc3RlbnQuaD4NCmNvbmZpZ3VyZTozMzgyOiBjaGVja2luZyBmb3IgZ3JlcCB0aGF0
IGhhbmRsZXMgbG9uZyBsaW5lcyBhbmQgLWUNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg0K

