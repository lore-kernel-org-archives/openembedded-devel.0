Return-Path: <leimaohui@cn.fujitsu.com>
X-Greylist: delayed 608 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Dec 2017 09:18:07 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C995F785E6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:18:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31063924"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Dec 2017 17:07:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 328C2486A76B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:07:56 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Mon, 11 Dec 2017 17:07:56 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Why was lldpad removed.
Thread-Index: AdNyTM1DyRmrASEWRiOQNDfwSkQi8w==
Date: Mon, 11 Dec 2017 09:07:54 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD013C30FB72@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.167.225.25]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 328C2486A76B.AA3BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Why was lldpad removed.
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
X-List-Received-Date: Mon, 11 Dec 2017 09:18:08 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYWxsDQoNCkkgbm90aWNlZCB0aGF0IGxsZHBhZCBoYXMgYmVlbiByZW1v
dmVkLiBBbmQgdGhlIGNvbW1pdCBsb2cgaXMgOiANCiAgICIgQmFzZWQgb24g
dGhpcyB0aHJlYWQ6DQoNCiAgICAgICAgICAgIGh0dHA6Ly9jb21tZW50cy5n
bWFuZS5vcmcvZ21hbmUuY29tcC5oYW5kaGVsZHMub3BlbmVtYmVkZGVkLzcw
ODkwDQoNCiAgICBpdCBzZWVtcyB0aGF0IGxsZHBkIGlzIGEgbW9yZSBjb21w
bGV0ZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgTExEUA0KICAgIHByb3RvY29s
LiAgUmVtb3ZlIHRoaXMgaW1wbGVtZW50YXRpb24gdG8gcHJvdmlkZSBiZXR0
ZXIgZGlyZWN0aW9uIHRvDQogICAgbmV3Y29tZXJzIGFuZCB0byBhdHRlbXB0
IHRvIGZvY3VzIHN1cHBvcnQgZm9yIGEgc2luZ2xlIGltcGxlbWVudGF0aW9u
IGluDQogICAgdGhlIG1ldGEtbmV0d29ya2luZyBsYXllci4NCiAgICAiIA0K
DQpCdXQgcmVmZXJlbmNlIHRvIHRoZSBob21lcGFnZSBvZiBsbGRwYWQsIGl0
IGlzIG5vdCBvbmx5IGFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBMTERQIHBy
b3RvY29sLCB0aGUgbW9zdCBpbXBvcnRhbnQgY2FwYWJpbGl0aWVzIGFyZToN
CiAqIE9wZXJhdGlvbiBvZiB0aGUgRENCWCBwcm90b2NvbChJRUVFIDgwMi4x
UWF6KSBmb3IgaW50ZXJmYWNlcyB3aGljaCBzdXBwb3J0IHRoZSBEQ0IgcnRu
ZXRsaW5rIGludGVyZmFjZS4NCiAqIENvbmZpZ3VyaW5nIHRoZSBEQ0Igc2V0
dGluZ3Mgb2YgdGhlIG5ldHdvcmsgZHJpdmVyIGJhc2VkIG9uIHRoZSBvcGVy
YXRpb24gb2YgRENCWC4NCg0KQW5kIGluIEZlZG9yYSBhbmQgVWJ1bnR1LCBs
bGRwYWQgYW5kIGxsZHBkIGFyZSBwcm92aWRlZCBhdCB0aGUgc2FtZSB0aW1l
LiBTbywgZm9yIHVzZXJzIHdobyB3YW50IERDQlgsIGl0IHNlZW1zIGEgcGl0
eSB0byByZW1vdmUgbGxkcGFkIGluIG1ldGEtb2UuDQoNCkJlc3QgcmVnYXJk
cw0KTGVpIE1hb2h1aQ0KCgo=

