Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7878.1592401143192149014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,522,1583164800"; 
   d="scan'208,217";a="94744017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Jun 2020 21:39:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C0F5C4CE30EB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 21:38:55 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Jun 2020 21:38:55 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 17 Jun 2020 21:38:55 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-wtforms: upgrade 2.2.1 -> 2.3.1
Thread-Topic: [oe] [meta-python] [PATCH] python3-wtforms: upgrade 2.2.1 ->
  2.3.1
Thread-Index: AQHWRKrLHqjwaJQdw02FW9pX63E6lg==
Date: Wed, 17 Jun 2020 13:38:55 +0000
Message-ID: <1592401134880.81332@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: C0F5C4CE30EB.A37E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159240113488081332cnfujitsucom_"

--_000_159240113488081332cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL3tweXRob24zLXd0Zm9ybXNfMi4yLjEuYmIg
PT4gcHl0aG9uMy13dGZvcm1zXzIuMy4xLmJifSAgfCA2ICsrKy0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQogcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXd0Zm9ybXNfMi4yLjEuYmIgPT4gcHl0aG9uMy13dGZvcm1z
XzIuMy4xLmJifSAoNjAlKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13dGZvcm1zXzIuMi4x
LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13dGZvcm1zXzIuMy4xLmJiDQpzaW1pbGFyaXR5IGluZGV4IDYwJQ0K
cmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy13dGZvcm1zXzIuMi4xLmJiDQpyZW5hbWUgdG8gbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13dGZvcm1z
XzIuMy4xLmJiDQppbmRleCAyYjdhZjYyNjcuLjlmMDgxYjY4YyAxMDA2NDQN
Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd3Rmb3Jtc18yLjIuMS5iYg0KKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13dGZvcm1zXzIuMy4xLmJi
DQpAQCAtMiwxMCArMiwxMCBAQCBERVNDUklQVElPTiA9ICJBIGZsZXhpYmxl
IGZvcm1zIHZhbGlkYXRpb24gYW5kIHJlbmRlcmluZyBsaWJyYXJ5IGZvciBw
eXRob24gd2ViDQogSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLnB5dGhvbi5v
cmcvcHlwaS9XVEZvcm1zIg0KIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIg0K
IExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIg0KLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL1BLRy1JTkZPO21kNT1jNDY2MGMxMzI3NzBkNWQwYTU3NTc1
NDFmNmI3OTQ5MyINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9QS0ct
SU5GTzttZDU9MjA4Y2UxYzE1OWY5MTFlY2YzODk4MDY2NTA1ODIwMjEiDQoN
Ci1TUkNfVVJJW21kNXN1bV0gPSAiNDFjMDAwOGRiZTdiZDk4ODkyYzU4Zjc0
NTdhNDZhNGEiDQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjZGJhYzNlN2Y2
ODc4MDg2YzMzNGFhMjVkYzVhMzM4NjlhMzk1NGU5ZDFlMDE1MTMwZDY1YTY5
MzA5YjNiNjEiDQorU1JDX1VSSVttZDVzdW1dID0gImJmZjA2OTQzZTU5Njcx
NTgxYWYwN2Y4MGQxNGJkYTVmIg0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4
NjFhMTNiM2FlNTIxZDY3MDBkYWMzYjI3NzE5NzBiZDM1NGE2M2JhNzA0M2Vj
YzNhODJiNTI4ODU5NmExOTcyIg0KDQogUFlQSV9QQUNLQUdFID0gIldURm9y
bXMiDQoNCi0tDQoyLjE3LjE/DQoNCgoK

--_000_159240113488081332cnfujitsucom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<div>&#8203;&#8203;Signed-off-by: Wang Mingyu &lt;wangmy@cn.fujitsu.com&gt;=
</div>
<div>---</div>
<div>&nbsp;.../{python3-wtforms_2.2.1.bb =3D&gt; python3-wtforms_2.3.1.bb}&=
nbsp; | 6 &#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)</div>
<div>&nbsp;rename meta-python/recipes-devtools/python/{python3-wtforms_2.2.=
1.bb =3D&gt; python3-wtforms_2.3.1.bb} (60%)</div>
<div><br>
</div>
<div>diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1=
.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb</div>
<div>similarity index 60%</div>
<div>rename from meta-python/recipes-devtools/python/python3-wtforms_2.2.1.=
bb</div>
<div>rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb=
</div>
<div>index 2b7af6267..9f081b68c 100644</div>
<div>--- a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb</di=
v>
<div>&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wtforms_=
2.3.1.bb</div>
<div>@@ -2,10 &#43;2,10 @@ DESCRIPTION =3D &quot;A flexible forms validatio=
n and rendering library for python web</div>
<div>&nbsp;HOMEPAGE =3D &quot;https://pypi.python.org/pypi/WTForms&quot;</d=
iv>
<div>&nbsp;SECTION =3D &quot;devel/python&quot;</div>
<div>&nbsp;LICENSE =3D &quot;BSD-3-Clause&quot;</div>
<div>-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Dc4660c132770d5d0a575=
7541f6b79493&quot;</div>
<div>&#43;LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D208ce1c159f911ec=
f389806650582021&quot;</div>
<div><br>
</div>
<div>-SRC_URI[md5sum] =3D &quot;41c0008dbe7bd98892c58f7457a46a4a&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;0cdbac3e7f6878086c334aa25dc5a33869a3954e=
9d1e015130d65a69309b3b61&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;bff06943e59671581af07f80d14bda5f&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;861a13b3ae521d6700dac3b2771970bd354a=
63ba7043ecc3a82b5288596a1972&quot;</div>
<div><br>
</div>
<div>&nbsp;PYPI_PACKAGE =3D &quot;WTForms&quot;</div>
<div><br>
</div>
<div>--</div>
<div>2.17.1&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159240113488081332cnfujitsucom_--
