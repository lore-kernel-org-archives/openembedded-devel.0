Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1S5xqL-0003Xw-6N for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 12:18:41 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q29B5dam030339
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Mar 2012 05:05:40 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q29B5dBX015290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Mar 2012 05:05:39 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 9 Mar 2012 05:05:39 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe 5/6] cloud9: remove unneded systemd code
Thread-Index: Acz95I9/OY+u4gGrL0CmYWsve1jgCQ==
Date: Fri, 9 Mar 2012 11:05:38 +0000
Message-ID: <2ig0lhu1ti0mhyknnc4ow74t.1331291074225@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 5/6] cloud9: remove unneded systemd code
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2012 11:18:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SG93IGlzIGl0IHRoYXQgdGhlIHNlcnZpY2UgdG8gc3RhcnQgdGhlIHNlcnZlciBydW5uaW5nIGlz
IHVubmVlZGVkPw0KDQoNCi0tLS0tLS0tIE9yaWdpbmFsIG1lc3NhZ2UgLS0tLS0tLS0NClN1Ympl
Y3Q6IFtvZV0gW21ldGEtb2UgNS82XSBjbG91ZDk6IHJlbW92ZSB1bm5lZGVkIHN5c3RlbWQgY29k
ZQ0KRnJvbTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tPg0K
VG86ICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIgPG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KQ0M6DQoNCg0KDQpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+DQotLS0N
CiBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY2xvdWQ5L2Nsb3VkOV8wLjUuMS5iYiB8ICAgIDYg
Ky0tLS0tDQogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY2xvdWQ5L2Nsb3VkOV8w
LjUuMS5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jbG91ZDkvY2xvdWQ5XzAuNS4xLmJi
DQppbmRleCA3MDQxNTI3Li44YTNmMjA2IDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL2Nsb3VkOS9jbG91ZDlfMC41LjEuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9jbG91ZDkvY2xvdWQ5XzAuNS4xLmJiDQpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDc4NGMzYmNmZjYwMWZkOGY5NTE1ZjUyYTExZTcw
MTgiDQoNCiBERVBFTkRTID0gImxpYnhtbDIgbm9kZWpzLW5hdGl2ZSINCg0KLVBSID0gInIxNCIN
CitQUiA9ICJyMTUiDQoNCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYWpheG9yZy9jbG91
ZDkuZ2l0O25hbWU9Y2xvdWQ5aWRlIFwNCiAgICAgICAgICAgIGdpdDovL2dpdGh1Yi5jb20vYWph
eG9yZy9vMztkZXN0c3VmZml4PW8zO25hbWU9bzMgXA0KQEAgLTk4LDkgKzk4LDYgQEAgZG9faW5z
dGFsbCAoKSB7DQogIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L28zL21vZHVsZXMvbzMuanMg
JHtEfSR7ZGF0YWRpcn0vY2xvdWQ5L3N1cHBvcnQvanNkYXYvc3VwcG9ydC9ub2RlLW8zLXhtbC12
NC9saWIvbzMteG1sL28zLmpzDQogIGluc3RhbGwgLW0gMDc1NSAke1dPUktESVJ9L28zL28zLm5v
ZGUgJHtEfSR7ZGF0YWRpcn0vY2xvdWQ5L3N1cHBvcnQvanNkYXYvc3VwcG9ydC9ub2RlLW8zLXht
bC12NC9saWIvbzMteG1sL28zLm5vZGUNCg0KLSBpbnN0YWxsIC1tIDA3NTUgLWQgJHtEfSR7c3lz
dGVtZF91bml0ZGlyfS9zeXN0ZW0NCi0gaW5zdGFsbCAtbSAwNjQ0ICR7V09SS0RJUn0vY2xvdWQ5
LnNlcnZpY2UgJHtEfSR7c3lzdGVtZF91bml0ZGlyfS9zeXN0ZW0vDQotDQogICBpbnN0YWxsIC1t
IDA3NTUgLWQgJHtEfSR7c3lzY29uZmRpcn0vYXZhaGkvc2VydmljZXMvDQogICBpbnN0YWxsIC1t
IDA2NDQgJHtXT1JLRElSfS9jbG91ZDktYXZhaGkuc2VydmljZSAke0R9JHtzeXNjb25mZGlyfS9h
dmFoaS9zZXJ2aWNlcy8NCiB9DQpAQCAtMTA5LDcgKzEwNiw2IEBAIEZJTEVTXyR7UE59LWRiZyAr
PSAiJHtkYXRhZGlyfS9jbG91ZDkvc3VwcG9ydC9qc2Rhdi9zdXBwb3J0L25vZGUtbzMteG1sLXY0
L2xpYi9vDQogICAgICAgICAgICAgICAgICAgICAke2RhdGFkaXJ9L2Nsb3VkOS9zdXBwb3J0L2pz
ZGF2L3N1cHBvcnQvbm9kZS1vMy14bWwtdjQvbGliLy5kZWJ1ZyBcDQogICAgICAgICAgICAgICAg
ICAgICINCg0KLUZJTEVTXyR7UE59ICs9ICIke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtIg0KIFJE
RVBFTkRTXyR7UE59ID0gIm5vZGVqcyBnemlwIg0KDQogaW5oZXJpdCBzeXN0ZW1kDQotLQ0KMS43
LjYuNA0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K

