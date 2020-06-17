Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7802.1592400955725211615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,522,1583164800"; 
   d="scan'208,217";a="94743901"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Jun 2020 21:35:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B66E149B1103
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 21:35:44 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Jun 2020 21:35:44 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 17 Jun 2020 21:35:43 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking][PATCH] openipmi: upgrade 2.0.28 -> 2.0.29
Thread-Topic: [oe] [meta-networking][PATCH] openipmi: upgrade 2.0.28 ->
  2.0.29
Thread-Index: AQHWRKqGSpi12xBbcUqTG/EOcxxcIg==
Date: Wed, 17 Jun 2020 13:35:43 +0000
Message-ID: <1592400942777.98825@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: B66E149B1103.A077E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159240094277798825cnfujitsucom_"

--_000_159240094277798825cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz8/U2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBjbi5mdWpp
dHN1LmNvbT4NCi0tLQ0KIC4uLi9vcGVuaXBtaS97b3BlbmlwbWlfMi4wLjI4
LmJiID0+IG9wZW5pcG1pXzIuMC4yOS5iYn0gICAgICAgfCA0ICsrLS0NCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KIHJlbmFtZSBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29w
ZW5pcG1pL3tvcGVuaXBtaV8yLjAuMjguYmIgPT4gb3BlbmlwbWlfMi4wLjI5
LmJifSAoOTYlKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC9vcGVuaXBtaS9vcGVuaXBtaV8yLjAuMjguYmIgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29wZW5pcG1pL29wZW5p
cG1pXzIuMC4yOS5iYg0Kc2ltaWxhcml0eSBpbmRleCA5NiUNCnJlbmFtZSBm
cm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3BlbmlwbWkv
b3BlbmlwbWlfMi4wLjI4LmJiDQpyZW5hbWUgdG8gbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtc3VwcG9ydC9vcGVuaXBtaS9vcGVuaXBtaV8yLjAuMjkuYmIN
CmluZGV4IGYxOTZlYjk5Mi4uODU2MzRhNzBlIDEwMDY0NA0KLS0tIGEvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVuaXBtaS9vcGVuaXBt
aV8yLjAuMjguYmINCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1
cHBvcnQvb3BlbmlwbWkvb3BlbmlwbWlfMi4wLjI5LmJiDQpAQCAtMzUsOCAr
MzUsOCBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9vcGVu
aXBtaS9PcGVuSVBNSS0ke1BWfS50YXIuZ3ogXA0KDQogUyA9ICIke1dPUktE
SVJ9L09wZW5JUE1JLSR7UFZ9Ig0KDQotU1JDX1VSSVttZDVzdW1dID0gImJh
MzdmMDhlMzA2MDYyZWM3M2M3ZWQyYTJiZDRkNWY0Ig0KLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI4ZThiMWRlMmE5YTA0MWI0MTkxMzNlY2IyMWY5NTZlOTk5
ODQxY2YyZTc1OWU5NzNlZWJhOWEzNmY4YjQwOTk2Ig0KK1NSQ19VUklbbWQ1
c3VtXSA9ICI0NmI0NTJlOTVkNjljOTJlNDE3MmIzNjczZWQ4OGQ1MiINCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMjI0NDEyNDU3OWFmYjE0ZTU2OWYzNDM5
M2U5YWM2MWU2NThhMjhiNmZmYThlNWMwZDJjMWMxMmE4Y2U2OTVjZCINCg0K
IGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBwa2djb25maWcgcHl0aG9u
M25hdGl2ZSBwZXJsbmF0aXZlIHVwZGF0ZS1yYy5kIHN5c3RlbWQgY3Bhbi1i
YXNlDQoNCi0tDQoyLjE3LjE/DQoNCgoK

--_000_159240094277798825cnfujitsucom_
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
<div>&#8203;&#8203;&#8203;Signed-off-by: Wang Mingyu &lt;wangmy@cn.fujitsu.=
com&gt;</div>
<div>---</div>
<div>&nbsp;.../openipmi/{openipmi_2.0.28.bb =3D&gt; openipmi_2.0.29.bb}&nbs=
p; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div>&nbsp;rename meta-networking/recipes-support/openipmi/{openipmi_2.0.28=
.bb =3D&gt; openipmi_2.0.29.bb} (96%)</div>
<div><br>
</div>
<div>diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.28.=
bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb</div>
<div>similarity index 96%</div>
<div>rename from meta-networking/recipes-support/openipmi/openipmi_2.0.28.b=
b</div>
<div>rename to meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb<=
/div>
<div>index f196eb992..85634a70e 100644</div>
<div>--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb</div>
<div>&#43;&#43;&#43; b/meta-networking/recipes-support/openipmi/openipmi_2.=
0.29.bb</div>
<div>@@ -35,8 &#43;35,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/openipmi=
/OpenIPMI-${PV}.tar.gz \</div>
<div><br>
</div>
<div>&nbsp;S =3D &quot;${WORKDIR}/OpenIPMI-${PV}&quot;</div>
<div><br>
</div>
<div>-SRC_URI[md5sum] =3D &quot;ba37f08e306062ec73c7ed2a2bd4d5f4&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;8e8b1de2a9a041b419133ecb21f956e999841cf2=
e759e973eeba9a36f8b40996&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;46b452e95d69c92e4172b3673ed88d52&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;2244124579afb14e569f34393e9ac61e658a=
28b6ffa8e5c0d2c1c12a8ce695cd&quot;</div>
<div><br>
</div>
<div>&nbsp;inherit autotools-brokensep pkgconfig python3native perlnative u=
pdate-rc.d systemd cpan-base</div>
<div><br>
</div>
<div>--</div>
<div>2.17.1&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159240094277798825cnfujitsucom_--
