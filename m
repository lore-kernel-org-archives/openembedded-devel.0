Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.9765.1592990529802341234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; 
   d="scan'208,217";a="95222715"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 17:22:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 70CD04CE49B9
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2020 17:11:35 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 17:21:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 24 Jun 2020 17:21:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python][PATCH] python3-py: upgrade 1.8.1 -> 1.8.2
Thread-Topic: [oe] [meta-python][PATCH] python3-py: upgrade 1.8.1 -> 1.8.2
Thread-Index: AQHWSgJ2xnx9Yp3OdEi6u3LGgyuAyQ==
Date: Wed, 24 Jun 2020 09:21:58 +0000
Message-ID: <1592990517499.2231@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 70CD04CE49B9.A6379
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_15929905174992231cnfujitsucom_"

--_000_15929905174992231cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL3B5dGhvbi97cHl0aG9uMy1weV8xLjguMS5i
YiA9PiBweXRob24zLXB5XzEuOC4yLmJifSAgICAgICB8IDQgKystLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQogcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXB5XzEuOC4xLmJiID0+IHB5dGhvbjMtcHlfMS44LjIuYmJ9
ICg3MiUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5XzEuOC4xLmJiIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weV8xLjguMi5i
Yg0Kc2ltaWxhcml0eSBpbmRleCA3MiUNCnJlbmFtZSBmcm9tIG1ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlfMS44LjEu
YmINCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5XzEuOC4yLmJiDQppbmRleCBmZjY2YWVhYTIuLmFl
YTczNzg1MyAxMDA2NDQNCi0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlfMS44LjEuYmINCisrKyBiL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlfMS44
LjIuYmINCkBAIC0zLDggKzMsOCBAQCBIT01FUEFHRSA9ICJodHRwOi8vcHku
cmVhZHRoZWRvY3MuaW8vIg0KIExJQ0VOU0UgPSAiTUlUIg0KIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE2YmIwMzIwYjA0YTBh
NTAzZjEyZjY5ZmVhNDc5ZGU5Ig0KDQotU1JDX1VSSVttZDVzdW1dID0gIjQy
YzY3ZGU4NGIwN2FjOWNjODY3YjhiNzA4NDNhNDViIg0KLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1ZTI3MDgxNDAxMjYyMTU3NDY3YWQ2ZTdmODUxYjdhYTQw
MmM1ODUyZGJjYjNkYWUwNjc2ODQzNGRlNTc1MmFhIg0KK1NSQ19VUklbbWQ1
c3VtXSA9ICJiYWE1NGU0NTg4NzVkNjgwMzFjNDIyYWJiMmU0N2E1YyINCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjNiM2E0YzM2NTEyYTRjNGYwMjQwNDFh
YjUxODY2ZjExNzYxY2MxNjk2NzAyMDRiMjM1ZjZiMjA1MjNkNGU2YiINCg0K
IERFUEVORFMgKz0gIiR7UFlUSE9OX1BOfS1zZXR1cHRvb2xzLXNjbS1uYXRp
dmUiDQoNCi0tDQoyLjE3LjENCg0KPw0KDQoKCg==

--_000_15929905174992231cnfujitsucom_
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
<div>&nbsp;.../python/{python3-py_1.8.1.bb =3D&gt; python3-py_1.8.2.bb}&nbs=
p; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div>&nbsp;rename meta-python/recipes-devtools/python/{python3-py_1.8.1.bb =
=3D&gt; python3-py_1.8.2.bb} (72%)</div>
<div><br>
</div>
<div>diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb b=
/meta-python/recipes-devtools/python/python3-py_1.8.2.bb</div>
<div>similarity index 72%</div>
<div>rename from meta-python/recipes-devtools/python/python3-py_1.8.1.bb</d=
iv>
<div>rename to meta-python/recipes-devtools/python/python3-py_1.8.2.bb</div>
<div>index ff66aeaa2..aea737853 100644</div>
<div>--- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb</div>
<div>&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-py_1.8.2=
.bb</div>
<div>@@ -3,8 &#43;3,8 @@ HOMEPAGE =3D &quot;http://py.readthedocs.io/&quot;=
</div>
<div>&nbsp;LICENSE =3D &quot;MIT&quot;</div>
<div>&nbsp;LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6bb0320b04a0a50=
3f12f69fea479de9&quot;</div>
<div><br>
</div>
<div>-SRC_URI[md5sum] =3D &quot;42c67de84b07ac9cc867b8b70843a45b&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;5e27081401262157467ad6e7f851b7aa402c5852=
dbcb3dae06768434de5752aa&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;baa54e458875d68031c422abb2e47a5c&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;f3b3a4c36512a4c4f024041ab51866f11761=
cc169670204b235f6b20523d4e6b&quot;</div>
<div><br>
</div>
<div>&nbsp;DEPENDS &#43;=3D &quot;${PYTHON_PN}-setuptools-scm-native&quot;<=
/div>
<div><br>
</div>
<div>--</div>
<div>2.17.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15929905174992231cnfujitsucom_--
