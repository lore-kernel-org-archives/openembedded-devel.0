Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAA171BF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:38:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35711806"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2018 15:38:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CF63A48AEA0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:38:24 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0361.001; Tue, 23 Jan 2018 15:38:23 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH v2] xorgxrdp: new add
Thread-Index: AQHTiRERjwr6efoKD0+7Pkv11hRe66OBETkA
Date: Tue, 23 Jan 2018 07:38:26 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9A981@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1515141913-120084-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1515141913-120084-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.156]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CF63A48AEA0D.AC39F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][PATCH v2] xorgxrdp: new add
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
X-List-Received-Date: Tue, 23 Jan 2018 07:38:27 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogWmhlbmcsIFJ1b3Fpbi/WoyDI9MfVIA0KU2VudDogRnJpZGF5LCBK
YW51YXJ5IDA1LCAyMDE4IDQ6NDUgUE0NClRvOiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IFpoZW5nLCBSdW9xaW4v
1qMgyPTH1SA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KU3ViamVj
dDogW29lXVttZXRhLW9lXVtQQVRDSCB2Ml0geG9yZ3hyZHA6IG5ldyBhZGQN
Cg0KQWRkIGEgbmV3IHJlY2lwZSB4b3JneHJkcF8wLjIuNS5iYi4NCg0KU2ln
bmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVq
aXRzdS5jb20+DQotLS0NCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3hvcmcteHJk
cC94b3JneHJkcF8wLjIuNS5iYiAgICB8IDIyICsrKysrKysrKysrKysrKysr
KysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC94b3Jn
LXhyZHAveG9yZ3hyZHBfMC4yLjUuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5i
YiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3hvcmcteHJkcC94b3JneHJk
cF8wLjIuNS5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAw
MDAuLjIwY2Y0NWYNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L3hvcmcteHJkcC94b3JneHJkcF8wLjIuNS5iYg0KQEAg
LTAsMCArMSwyMiBAQA0KK1NVTU1BUlkgPSAiWG9yZyBkcml2ZXJzIGZvciB4
cmRwLiINCisNCitMSUNFTlNFID0gIlgxMSINCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hMjUyMzY2MDMyOWZkY2EzZDk1NGMw
YTg3MzkwZTAwNyANCitcICINCisNCitpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcNCisNCitERVBFTkRTID0gInZpcnR1YWwvbGlieDExIHhzZXJ2ZXIt
eG9yZyB4cmRwIG5hc20tbmF0aXZlIg0KKw0KK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9uZXV0cmlub2xhYnMveG9yZ3hyZHAuZ2l0IFwNCisgICAg
ICAgICAgICINCisNCitTUkNSRVYgPSAiYzEyMjU0NGYxODRkNDAzMWJiYWUx
YWQ4MGZiYWI1NTRjMzRhOTQyNyINCisNCitQViA9ICIwLjIuNStnaXQke1NS
Q1BWfSINCisNCitTID0gIiR7V09SS0RJUn0vZ2l0Ig0KKw0KK0ZJTEVTXyR7
UE59ICs9ICIke2xpYmRpcn0veG9yZy9tb2R1bGVzLyoiDQorDQorSU5TQU5F
X1NLSVBfJHtQTn0gKz0gInhvcmctZHJpdmVyLWFiaSINCi0tDQoyLjcuNA0K
DQoKCg==

