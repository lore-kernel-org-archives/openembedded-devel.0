Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD906FF78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 01:13:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9951750"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 09:13:37 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 54FCD42BC501
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:13:36 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Tue, 16 Aug 2016 09:13:35 +0800
From: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] dstat: 0.7.2 -> 0.7.3
Thread-Index: AQHR9uObO4wy571MsESXK/IL9SVUlKBKyNrA
Date: Tue, 16 Aug 2016 01:13:34 +0000
Message-ID: <C43D7C6FFC265C429F44FEB1C68F1B25633DB117@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1471250746-1965-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<20160815105542.rc622shiwx3qio4s@jama>
In-Reply-To: <20160815105542.rc622shiwx3qio4s@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.120]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 54FCD42BC501.ABFCA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: =?UTF-8?B?562U5aSNOiBbbWV0YS1vZV1bUEFUQ0hdIGRzdGF0OiAwLjcuMiAtPiAwLjcuMw==?=
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
X-List-Received-Date: Tue, 16 Aug 2016 01:13:49 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U29ycnksIEkgZm9yZ2V0IHRvIGNoZWNrIGl0Lg0KDQotLS0tLdPKvP7Urbz+
LS0tLS0NCreivP7Iyzogb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZl
bC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddILT6se0gTWFydGlu
IEphbnNhDQq3osvNyrG85DogMjAxNsTqONTCMTXI1SAxODo1Ng0KytW8/sjL
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
1vfM4jogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBkc3RhdDogMC43LjIg
LT4gMC43LjMNCg0KT24gTW9uLCBBdWcgMTUsIDIwMTYgYXQgMDQ6NDU6NDZB
TSAtMDQwMCwgV2FuZyBYaW4gd3JvdGU6DQo+IFVwZ3JhZGUgZHN0YXQgZnJv
bSAwLjcuMiB0byAwLjcuMy4NCg0KQmV0dGVyIGNoYW5nZSB3YXMgYWxyZWFk
eSBzZW50IGxhc3Qgd2VlazoNCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtZGV2ZWwvMjAxNi1BdWd1c3Qv
MTA4NTI0Lmh0bWwNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaW4g
PHdhbmd4aW4yMDE1LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAg
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZHN0YXQve2RzdGF0XzAuNy4yLmJi
ID0+IGRzdGF0XzAuNy4zLmJifSB8IDYgDQo+ICsrLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkgIHJl
bmFtZSANCj4gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZHN0YXQve2RzdGF0
XzAuNy4yLmJiID0+IGRzdGF0XzAuNy4zLmJifSAoNzElKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2RzdGF0L2RzdGF0
XzAuNy4yLmJiIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2RzdGF0
L2RzdGF0XzAuNy4zLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggNzElDQo+IHJl
bmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2RzdGF0L2RzdGF0
XzAuNy4yLmJiDQo+IHJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9kc3RhdC9kc3RhdF8wLjcuMy5iYg0KPiBpbmRleCA2M2YxODEyLi4xZTM5
YWVhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9k
c3RhdC9kc3RhdF8wLjcuMi5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC9kc3RhdC9kc3RhdF8wLjcuMy5iYg0KPiBAQCAtNSwxMiArNSwx
MCBAQCBhbmQgZmxleGliaWxpdHkuIERzdGF0IGlzIGhhbmR5IGZvciBtb25p
dG9yaW5nIA0KPiBzeXN0ZW1zIGR1cmluZyBwZXJmb3JtYW5jZSB0dW5pbmcg
IGJlbmNobWFya3Mgb3IgdHJvdWJsZXNob290aW5nLiINCj4gIEhPTUVQQUdF
ID0gImh0dHA6Ly9kYWcud2llZS5ycy9ob21lLW1hZGUvZHN0YXQiDQo+ICBM
SUNFTlNFID0gIkdQTHYyIg0KPiAtTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUx
OWYiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyINCj4gIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9kYWd3aWVlcnMvZHN0YXQuZ2l0Ig0K
PiAtU1JDX1VSSVttZDVzdW1dID0gIjc5OGUwNTBlMmUwMjRmMDhhMjcyZGQ0
YjBlMWViYTQxIg0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk2ZDFlNmVh
MjQzNGU0NzdmYTk3MzIyZDkyNzc4ZjY4NDU4ZDdlNTdiYzU1YmM0ZjcyZTI5
NDY3YTUyY2ZmZDEiDQo+ICANCj4gLVNSQ1JFViA9ICI1MjUxMzk3ZWI4ZDNi
Mjg0YTkwYmZkZmFlYzBjOGUxMjEwMTQ2ZTNmIg0KPiArU1JDUkVWID0gImVi
YWNlNmQ0MTc3Zjg3NDhmMzVjZWM4N2Y3YTQ5OTQ2MDQ2YjBhMjAiDQo+ICAN
Cj4gIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ICANCj4gLS0NCj4gMi43LjQN
Cj4gDQo+IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVs
IG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KDQotLSAN
Ck1hcnRpbiAnSmFNYScgSmFuc2EgICAgIGphYmJlcjogTWFydGluLkphbnNh
QGdtYWlsLmNvbQ0KCgo=

