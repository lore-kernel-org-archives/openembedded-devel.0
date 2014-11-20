Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1AC65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:02:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208,217";a="43701050"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 10:59:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK31xoT005806
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:01:59 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 20 Nov 2014 11:02:14 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: lvm2 compile error
Thread-Index: AdAEbN96Q+W9lsi2S96Zrwlpiu5PbQ==
Date: Thu, 20 Nov 2014 03:02:19 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87C670D@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: lvm2 compile error
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
X-List-Received-Date: Thu, 20 Nov 2014 03:02:26 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkkgYml0YmFrZSBsdm0yIGZyb20gbWV0YS1vZSwgYnV0IGl0IGhhcyB0aGUgZm9sbG93
aW5nIGVycm9ycy4NCkhvdyBjYW4gSSBmaXggaXQ/DQoNClRoYW5rcyBpbiBhZHZhbmNlLg0KDQpC
ZXN0IHJlZ2FyZHMsDQpMaSB4aW4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQpCdWlsZCBDb25maWd1cmF0aW9uOg0KQkJfVkVSU0lPTiAgICAgICAgPSAiMS4y
NC4wIg0KQlVJTERfU1lTICAgICAgICAgPSAieDg2XzY0LWxpbnV4Ig0KTkFUSVZFTFNCU1RSSU5H
ICAgPSAiQ2VudE9TLTYuNSINClRBUkdFVF9TWVMgICAgICAgID0gIng4Nl82NC1mY3QtbGludXgi
DQqBY4FjDQp8IHg4Nl82NC1mY3QtbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9
Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNzZSAtV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1X
bCwtLWFzLW5lZWRlZCAtV2wsLXoscmVscm8sLXosbm93IC0tc3lzcm9vdD0veW9jdG8vd29yazAw
MS9mbnN0L2xpeGluL3dvcmsveW9jdG8tdWJpbnV4L2J1aWxkX3g4Ni02NC90bXAvc3lzcm9vdHMv
dWJpbnV4LXFlbXV4ODYtNjQgLXNoYXJlZCAtV2wsLXNvbmFtZSxsaWJkZXZtYXBwZXIuc28uMS4w
MiBcDQp8ICAgICAgICAgICAgICAgIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVi
dWctdHlwZXMgLWZzdGFjay1wcm90ZWN0b3ItYWxsIC1waWUgLWZwaWUgLURfRk9SVElGWV9TT1VS
Q0U9MiAtTzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1mc3RhY2st
cHJvdGVjdG9yLWFsbCAtcGllIC1mcGllIC1EX0ZPUlRJRllfU09VUkNFPTIgLWZQSUMgIC1PMiAt
TzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1mc3RhY2stcHJvdGVj
dG9yLWFsbCAtcGllIC1mcGllIC1EX0ZPUlRJRllfU09VUkNFPTIgLWZQSUMgIC1PMiAtV2wsLS12
ZXJzaW9uLXNjcmlwdCwuZXhwb3J0LnN5bSAtTC4uL2xpYmRtIC1MLi4vbGliIC1MLi4vZGFlbW9u
cy9kbWV2ZW50ZCBkYXRhc3RydWN0L2JpdHNldC5vIGRhdGFzdHJ1Y3QvaGFzaC5vIGRhdGFzdHJ1
Y3QvbGlzdC5vIGxpYmRtLWNvbW1vbi5vIGxpYmRtLWZpbGUubyBsaWJkbS1kZXB0cmVlLm8gbGli
ZG0tc3RyaW5nLm8gbGliZG0tcmVwb3J0Lm8gbGliZG0tY29uZmlnLm8gbW0vZGJnX21hbGxvYy5v
IG1tL3Bvb2wubyByZWdleC9tYXRjaGVyLm8gcmVnZXgvcGFyc2VfcngubyByZWdleC90dHJlZS5v
IGlvY3RsL2xpYmRtLWlmYWNlLm8gLWxydCAgIC1sdWRldiAgLW8gaW9jdGwvbGliZGV2bWFwcGVy
LnNvLjEuMDINCnwgL3lvY3RvL3dvcmswMDEvZm5zdC9saXhpbi93b3JrL3lvY3RvLXViaW51eC9i
dWlsZF94ODYtNjQvdG1wL3N5c3Jvb3RzL3ViaW51eC1xZW11eDg2LTY0L3Vzci9saWIvLi4vbGli
L1NjcnQxLm86IEluIGZ1bmN0aW9uIGBfc3RhcnQnOg0KfCAveW9jdG8vd29yazAwMS9mbnN0L2xp
eGluL3dvcmsveW9jdG8tdWJpbnV4L2J1aWxkX3g4Ni02NC90bXAvd29yay9jb3JlMi02NC1mY3Qt
bGludXgvZ2xpYmMvMi4yMC1yMC9naXQvY3N1Ly4uL3N5c2RlcHMveDg2XzY0L3N0YXJ0LlM6MTA4
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtYWluJw0KfCBjb2xsZWN0MjogZXJyb3I6IGxkIHJl
dHVybmVkIDEgZXhpdCBzdGF0dXMNCnwgbWFrZVsxXTogKioqIFtpb2N0bC9saWJkZXZtYXBwZXIu
c28uMS4wMl0gRXJyb3IgMQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KDQoNCg0KDQo=

