Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5EA783A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:39:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20096992"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jun 2017 09:39:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BE9F347C7C81
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:39:49 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Fri, 16 Jun 2017 09:39:47 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking] [PATCH] ifenslave: 2.7 -> 2.9
Thread-Index: AQHSzrhVNk+b1r0mM0SJQnqL22LrUqIm5VgA
Date: Fri, 16 Jun 2017 01:39:46 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E01F6AC@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1494989425-25411-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1494989425-25411-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: BE9F347C7C81.AD535
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking] [PATCH] ifenslave: 2.7 -> 2.9
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
X-List-Received-Date: Fri, 16 Jun 2017 01:39:53 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1L7vGIOf50+4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkg
MTcsIDIwMTcgMTA6NTAgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBIdWFuZywgUWl5dS+7xiDn
+dPuIDxodWFuZ3F5LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6
IFtvZV0gW21ldGEtbmV0d29ya2luZ10gW1BBVENIXSBpZmVuc2xhdmU6IDIu
NyAtPiAyLjkNCj4gDQo+IDEpIFVwZ3JhZGUgaWZlbnNsYXZlIGZyb20gMi43
IHRvIDIuOS4NCj4gMikgTGljZW5zZSBjaGVja3N1bSBjaGFuZ2VkLHNpbmNl
IHRoZSBjb3B5cmlnaHQncyBGb3JtYXQgd2VyZSBjaGFuZ2VkLg0KPiANCj4g
Rm9ybWF0Og0KPiBodHRwczovL3d3dy5kZWJpYW4ub3JnL2RvYy9wYWNrYWdp
bmctbWFudWFscy9jb3B5cmlnaHQtZm9ybWF0LzEuMC8NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1
LmNvbT4NCj4gLS0tDQo+ICAuLi4vcmVjaXBlcy1zdXBwb3J0L2lmZW5zbGF2
ZS97aWZlbnNsYXZlXzIuNy5iYiA9PiBpZmVuc2xhdmVfMi45LmJifSB8IDUg
KysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pICByZW5hbWUNCj4gbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtc3VwcG9ydC9pZmVuc2xhdmUve2lmZW5zbGF2ZV8yLjcuYmIgPT4NCj4g
aWZlbnNsYXZlXzIuOS5iYn0gKDg2JSkNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2lmZW5zbGF2ZS9pZmVu
c2xhdmVfMi43LmJiDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3Vw
cG9ydC9pZmVuc2xhdmUvaWZlbnNsYXZlXzIuOS5iYg0KPiBzaW1pbGFyaXR5
IGluZGV4IDg2JQ0KPiByZW5hbWUgZnJvbSBtZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1zdXBwb3J0L2lmZW5zbGF2ZS9pZmVuc2xhdmVfMi43LmJiDQo+IHJl
bmFtZSB0byBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2lmZW5z
bGF2ZS9pZmVuc2xhdmVfMi45LmJiDQo+IGluZGV4IDUwMjg5MjEuLmVhMjhi
MzQgMTAwNjQ0DQo+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1
cHBvcnQvaWZlbnNsYXZlL2lmZW5zbGF2ZV8yLjcuYmINCj4gKysrIGIvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9pZmVuc2xhdmUvaWZlbnNs
YXZlXzIuOS5iYg0KPiBAQCAtMyw5ICszLDEwIEBAIEhPTUVQQUdFID0NCj4g
Imh0dHA6Ly93d3cubGludXhmb3VuZGF0aW9uLm9yZy9jb2xsYWJvcmF0ZS93
b3JrZ3JvdXBzL25ldHdvcmtpbmcvYm9uDQo+ICBTRUNUSU9OID0gIm5ldCIN
Cj4gDQo+ICBMSUNFTlNFID0gIkdQTHYzIg0KPiAtTElDX0ZJTEVTX0NIS1NV
TSA9DQo+ICJmaWxlOi8vZGViaWFuL2NvcHlyaWdodDttZDU9NjgwN2JhODFj
MDc0NGFiNTBkNzM1Yzk0NjI4YzNmNjQiDQo+ICtMSUNfRklMRVNfQ0hLU1VN
ID0NCj4gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT1hY2M4OTgxMjkz
OGNmOWFkNmIxZGViYzM3Y2VhMDI1MyINCj4gDQo+IC1TUkNSRVYgPSAiNDAw
YzQ5MGQ1MmFjYjMxZjEwNjRlMWJmNGZjOWZjYWYzNzkxODg4ZiINCj4gKw0K
PiArU1JDUkVWID0gIjQyYmZiYjliZWI5MjQ2NzJjYTg2Yjg2ZTk2NzlhYzNk
NmI4N2Q5OTIiDQo+ICBTUkNfVVJJID0gImdpdDovL2Fub25zY20uZGViaWFu
Lm9yZy9jb2xsYWItbWFpbnQvaWZlbnNsYXZlLmdpdCINCj4gDQo+ICBTID0g
IiR7V09SS0RJUn0vZ2l0Ig0KPiAtLQ0KPiAyLjcuNA0KDQoKCg==

