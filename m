Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8BECAC59A
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 00:01:38 +0000 (UTC)
Subject: Re: [meta-python][PATCH 4/4] python3-yarl: support reproducible
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 17:01:28 -0700
References: <CAMKF1sr5AR-aS5yUZ-+zCfB4NiAOwMDbHgCaXv+iiVkf-zf7uA@mail.gmail.com>
In-Reply-To: <CAMKF1sr5AR-aS5yUZ-+zCfB4NiAOwMDbHgCaXv+iiVkf-zf7uA@mail.gmail.com>
Message-ID: <15571.1758326488974989042@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9HsGykwKLzVRiK1PQlLZ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 00:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119615

--9HsGykwKLzVRiK1PQlLZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 12:24 PM, Khem Raj wrote:

>=20
>=20
>> +SRC_URI +=3D " \
>> + file://0001-build-wheel-in-place.patch \
>> +"
>=20
> This patch file is missing.

The patch locates in meta-python/recipes-devtools/python/files/0001-build-w=
heel-in-place.patch
which shared with [meta-python][PATCH 2/4] python3-frozenlist: support repr=
oducible [1]

[1] https://lists.openembedded.org/g/openembedded-devel/message/119531?p=3D=
%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Csupport+reproducible%2C20%2C2%2C0=
%2C115306109

//Hongxu

>=20
>=20
>> +
>> DEPENDS +=3D " \
>> python3-expandvars-native \
>=20
>

--9HsGykwKLzVRiK1PQlLZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 19, 2025 at 12:24 PM, Khem Raj wrote:</div>
<div>
<blockquote>
<blockquote>+SRC_URI +=3D " \<br />+ file://0001-build-wheel-in-place.patch=
 \<br />+"</blockquote>
This patch file is missing.</blockquote>
<h4 style=3D"box-sizing: border-box; font-family: system-ui, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 10px; ma=
rgin-bottom: 10px; font-size: 18px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2;=
 text-align: start; text-indent: 0px; text-transform: none; widows: 2; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgro=
und-color: #fafafa; text-decoration-thickness: initial; text-decoration-sty=
le: initial; text-decoration-color: initial;">The patch locates in <span st=
yle=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helveti=
ca Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color E=
moji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: =
16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps=
: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align:=
 start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color:=
 #ffffff; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial; display: inline !important; float: none;=
">meta-python/recipes-devtools/python/files/0001-build-wheel-in-place.patch=
</span></h4>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">which shared with </span>[meta-python][PATCH 2/4] python3-fr=
ozenlist: support reproducible [1]</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://lists.openembedded.org/g/openembedded-devel/mes=
sage/119531?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Csupport+reproduci=
ble%2C20%2C2%2C0%2C115306109" target=3D"_blank" rel=3D"noopener">https://li=
sts.openembedded.org/g/openembedded-devel/message/119531?p=3D%2C%2C%2C20%2C=
0%2C0%2C0%3A%3ACreated%2C%2Csupport+reproducible%2C20%2C2%2C0%2C115306109</=
a></div>
<div>&nbsp;</div>
<div>//Hongxu</div>
<br />
<blockquote>
<blockquote>+<br />DEPENDS +=3D " \<br />python3-expandvars-native \</block=
quote>
</blockquote>
</div>

--9HsGykwKLzVRiK1PQlLZ--

