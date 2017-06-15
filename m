Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CC8C2781E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 04:03:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20056584"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2017 12:03:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 60C1D46B53FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:03:16 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Thu, 15 Jun 2017 12:03:17 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH]: cifs-utils 6.6 -> 6.7
Thread-Index: AQHS1fOYdiP6BEtWzUSBsOKPBqVAhqIlbLBw
Date: Thu, 15 Jun 2017 04:03:14 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7324596A60@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1495816903-99668-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1495816903-99668-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.100]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 60C1D46B53FF.ACA77
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-networking][PATCH]: cifs-utils 6.6 -> 6.7
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
X-List-Received-Date: Thu, 15 Jun 2017 04:03:25 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQpaaGVuZyBSdW9xaW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBT
b2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCkFERFIuOiBOby42IFdl
bnpodSBSb2FkLCBTb2Z0d2FyZSBBdmVudWUsDQogICAgICAgTmFuamluZywg
MjEwMDEyLCBDaGluYQ0KTUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1
LmNvbQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBa
aGVuZywgUnVvcWluL9ajIMj0x9UgDQpTZW50OiBTYXR1cmRheSwgTWF5IDI3
LCAyMDE3IDEyOjQyIEFNDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBaaGVuZywgUnVvcWluL9ajIMj0x9Ug
PHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NClN1YmplY3Q6IFtvZV0g
W21ldGEtbmV0d29ya2luZ11bUEFUQ0hdOiBjaWZzLXV0aWxzIDYuNiAtPiA2
LjcNCg0KVXBncmFkZSBjaWZzLXV0aWxzIGZyb20gNi42IHRvIDYuNw0KDQpT
aWduZWQtb2ZmLWJ5OiB6aGVuZ3JxIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRz
dS5jb20+DQotLS0NCiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0
L2NpZnMvY2lmcy11dGlsc19naXQuYmIgfCA1ICsrKy0tDQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvY2lm
cy9jaWZzLXV0aWxzX2dpdC5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVz
LXN1cHBvcnQvY2lmcy9jaWZzLXV0aWxzX2dpdC5iYg0KaW5kZXggZWZkYTcw
Ny4uM2NhNWI3OCAxMDA2NDQNCi0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNp
cGVzLXN1cHBvcnQvY2lmcy9jaWZzLXV0aWxzX2dpdC5iYg0KKysrIGIvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9jaWZzL2NpZnMtdXRpbHNf
Z2l0LmJiDQpAQCAtNCwxMiArNCwxMyBAQCBTRUNUSU9OID0gIm90aGVyb3Nm
cyINCiBMSUNFTlNFID0gIkdQTHYzICYgTEdQTHYzIg0KIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2Fi
ODc0ZTgwZDQ3ZmFlNTA0Ig0KIA0KLVBWID0gIjYuNiINCitQViA9ICI2Ljci
DQogDQotU1JDUkVWID0gIjc5MjZhYWVhOThjZGM5NmI2NTQ0YjhlMjFmYjVi
MGI0NDIyYzM0MGQiDQorU1JDUkVWID0gIjgxMDFhMDc4NzFmMTg1YzcwNDRm
YTJjYTIyMWIyODJhYjQ2MDdjOGIiDQogU1JDX1VSSSA9ICJnaXQ6Ly9naXQu
c2FtYmEub3JnL2NpZnMtdXRpbHMuZ2l0Ig0KIA0KIFMgPSAiJHtXT1JLRElS
fS9naXQiDQorREVQRU5EUyArPSAibGlidGFsbG9jIg0KIA0KIFBBQ0tBR0VD
T05GSUcgPz89ICIiDQogUEFDS0FHRUNPTkZJR1tjYXBdID0gIi0td2l0aC1s
aWJjYXAsLS13aXRob3V0LWxpYmNhcCxsaWJjYXAiDQotLSANCjIuNy40DQoN
CgoK

