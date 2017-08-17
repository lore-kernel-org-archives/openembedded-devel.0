Return-Path: <zhengrq.fnst@cn.fujitsu.com>
X-Greylist: delayed 671 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Aug 2017 01:38:33 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 753F178306
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 01:38:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,385,1498492800"; d="scan'208,217";a="23841593"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2017 09:27:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EF952472438F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:27:10 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([169.254.3.201]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Thu, 17 Aug 2017 09:27:11 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe] net-snmp:  do_compile error
Thread-Index: AdMW96DtzIGCw5c5T7mzvZ3YH8KT/w==
Date: Thu, 17 Aug 2017 01:27:11 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732B003BBC@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.100]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: EF952472438F.A70E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] net-snmp: do_compile error
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
X-List-Received-Date: Thu, 17 Aug 2017 01:38:36 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

V2hlbiBiaXRiYWtlIG5ldC1zbm1wIDUuNy4zLCBJIHdpbGwgbWVldCB0aGlz
IGVycm9yLCB3aG8ga25vd3MgdGhlIHJlYXNvbj8NCg0KaTU4Ni1wb2t5LWxp
bnV4LWxpYnRvb2w6IGNvbXBpbGU6ICBpNTg2LXBva3ktbGludXgtZ2NjIC1t
MzIgLW1hcmNoPWk1ODYgLVdsLC1PMSAtV2wsLS1oYXNoLXN0eWxlPWdudSAt
V2wsLS1hcy1uZWVkZWQgLS1zeXNyb290PaGtoa0vYnVpbGQvdG1wL3dvcmsv
aTU4Ni1wb2t5LWxpbnV4L25ldC1zbm1wLzUuNy4zLXIwL3JlY2lwZS1zeXNy
b290IC1JLi4vaW5jbHVkZSAtSS4gLUkuLi9zbm1wbGliIC1ETkVUU05NUF9F
TkFCTEVfSVBWNiAtZm5vLXN0cmljdC1hbGlhc2luZyAtTzIgLXBpcGUgLWcg
LWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1mZGVidWctcHJlZml4
LW1hcD2hraGtL2J1aWxkL3RtcC93b3JrL2k1ODYtcG9reS1saW51eC9uZXQt
c25tcC81LjcuMy1yMD0vdXNyL3NyYy9kZWJ1Zy9uZXQtc25tcC81LjcuMy1y
MCAtZmRlYnVnLXByZWZpeC1tYXA9oa2hrS9idWlsZC90bXAvd29yay9pNTg2
LXBva3ktbGludXgvbmV0LXNubXAvNS43LjMtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlPSAtZmRlYnVnLXByZWZpeC1tYXA9oa2hrS9idWlsZC90bXAvd29y
ay9pNTg2LXBva3ktbGludXgvbmV0LXNubXAvNS43LjMtcjAvcmVjaXBlLXN5
c3Jvb3Q9IC1VbGludXggLURsaW51eD1saW51eCAtYyBrZXl0b29scy5jICAt
ZlBJQyAtRFBJQyAtbyAubGlicy9rZXl0b29scy5vDQprZXl0b29scy5jOiBJ
biBmdW5jdGlvbiAnZ2VuZXJhdGVfS3UnOg0Ka2V5dG9vbHMuYzoxNTU6MjU6
IGVycm9yOiBkZXJlZmVyZW5jaW5nIHBvaW50ZXIgdG8gaW5jb21wbGV0ZSB0
eXBlICdFVlBfTURfQ1RYIHtha2Egc3RydWN0IGV2cF9tZF9jdHhfc3R9Jw0K
ICAgICBjdHggPSBtYWxsb2Moc2l6ZW9mKCpjdHgpKTsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+DQprZXl0b29scy5jOjI2NDo5OiB3YXJuaW5n
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnRVZQX01EX0NU
WF9jbGVhbnVwJzsgZGlkIHlvdSBtZWFuICdFVlBfTURfQ1RYX2NyZWF0ZSc/
IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KICAgICAgICAg
RVZQX01EX0NUWF9jbGVhbnVwKGN0eCk7DQogICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn4NCiAgICAgICAgIEVWUF9NRF9DVFhfY3JlYXRlDQpNYWtlZmls
ZTo5ODogcmVjaXBlIGZvciB0YXJnZXQgJ2tleXRvb2xzLmxvJyBmYWlsZWQN
Cg0KLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNv
ZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5vLjYgV2Vu
emh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAy
MTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlzdHUu
Y29tDQoNCgoK

