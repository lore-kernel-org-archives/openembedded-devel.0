Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7854.1592401137831466111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,522,1583164800"; 
   d="scan'208,217";a="94744011"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Jun 2020 21:38:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E1D2D4CE30E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 21:38:50 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Jun 2020 21:38:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 17 Jun 2020 21:38:50 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] twm: upgrade 1.0.10 -> 1.0.11
Thread-Topic: [oe] [meta-oe] [PATCH] twm: upgrade 1.0.10 -> 1.0.11
Thread-Index: AQHWRKrFvI7NtYiTW0+dhq9pJ3pKHA==
Date: Wed, 17 Jun 2020 13:38:50 +0000
Message-ID: <1592401130021.4922@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E1D2D4CE30E4.A28BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_15924011300214922cnfujitsucom_"

--_000_15924011300214922cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL3hvcmctYXBwL3t0d21fMS4wLjEwLmJiID0+
IHR3bV8xLjAuMTEuYmJ9ICAgICAgICAgICAgICAgIHwgNSArKystLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97
dHdtXzEuMC4xMC5iYiA9PiB0d21fMS4wLjExLmJifSAoNjclKQ0KDQpkaWZm
IC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3R3
bV8xLjAuMTAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAvdHdtXzEuMC4xMS5iYg0Kc2ltaWxhcml0eSBpbmRleCA2NyUNCnJlbmFt
ZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC90d21f
MS4wLjEwLmJiDQpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctYXBwL3R3bV8xLjAuMTEuYmINCmluZGV4IDNhMjI2N2FlOS4uNDVj
YWFhY2YyIDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctYXBwL3R3bV8xLjAuMTAuYmINCisrKyBiL21ldGEtb2UvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC90d21fMS4wLjExLmJiDQpAQCAtNSw4ICs1
LDkgQEAgREVQRU5EUyArPSAiIGxpYnhleHQgbGlieHQgbGlieG11IGJpc29u
LW5hdGl2ZSINCiBMSUNFTlNFID0gIk1JVCINCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT00YzZkNDJlZjYwZTgxNjZhYTI2NjA2
NTI0YzBiOTU4NiINCg0KLVNSQ19VUklbbWQ1c3VtXSA9ICJlMzIyYzA4ZWVi
NjM1ZjkyNGVkZTViOGViYTNkYjU0ZSINCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNjQ0OWVhZGNhMTZjZTBmMGQ5MDA2MDViMGNjMDIwYjk1ZjQwNjE5MjYx
YjdiZWNjZmI0NmJjYzE4MzY0NDVkNyINCitTUkNfVVJJID0gIiR7WE9SR19N
SVJST1J9L2luZGl2aWR1YWwvYXBwLyR7QlBOfS0ke1BWfS50YXIuZ3oiDQor
U1JDX1VSSVttZDVzdW1dID0gIjQ4ZTgzMjEwYjM5YTdiZmI0OTI2MDRiYTBi
Y2ZiMTllIg0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTBlY2FiYWM1NGU2
ZGI3YWZkNWMyMGE3OGQ4OWMwMTM0ZjNjNzRiMTQ5YmVlNzFiMWZlYzc3NWU2
ZTA2MGNjIg0KDQogRklMRVNfJHtQTn0gKz0gIiR7ZGF0YWRpcn0vWDExL3R3
bS9zeXN0ZW0udHdtcmMiDQogQUxURVJOQVRJVkVfTkFNRSA9ICJ4LXdpbmRv
dy1tYW5hZ2VyIg0KLS0NCjIuMTcuMT8NCg0KCgo=

--_000_15924011300214922cnfujitsucom_
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
<div>&nbsp;.../xorg-app/{twm_1.0.10.bb =3D&gt; twm_1.0.11.bb}&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 5 &#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div>&nbsp;rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.10.bb =3D&gt; =
twm_1.0.11.bb} (67%)</div>
<div><br>
</div>
<div>diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb b/meta-oe=
/recipes-graphics/xorg-app/twm_1.0.11.bb</div>
<div>similarity index 67%</div>
<div>rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb</div>
<div>rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb</div>
<div>index 3a2267ae9..45caaacf2 100644</div>
<div>--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb</div>
<div>&#43;&#43;&#43; b/meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb</div>
<div>@@ -5,8 &#43;5,9 @@ DEPENDS &#43;=3D &quot; libxext libxt libxmu bison=
-native&quot;</div>
<div>&nbsp;LICENSE =3D &quot;MIT&quot;</div>
<div>&nbsp;LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4c6d42ef60e8166a=
a26606524c0b9586&quot;</div>
<div><br>
</div>
<div>-SRC_URI[md5sum] =3D &quot;e322c08eeb635f924ede5b8eba3db54e&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;6449eadca16ce0f0d900605b0cc020b95f406192=
61b7beccfb46bcc1836445d7&quot;</div>
<div>&#43;SRC_URI =3D &quot;${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.=
gz&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;48e83210b39a7bfb492604ba0bcfb19e&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;410ecabac54e6db7afd5c20a78d89c0134f3=
c74b149bee71b1fec775e6e060cc&quot;</div>
<div><br>
</div>
<div>&nbsp;FILES_${PN} &#43;=3D &quot;${datadir}/X11/twm/system.twmrc&quot;=
</div>
<div>&nbsp;ALTERNATIVE_NAME =3D &quot;x-window-manager&quot;</div>
<div>--</div>
<div>2.17.1&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15924011300214922cnfujitsucom_--
