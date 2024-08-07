Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062F7C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 09:45:08 +0000 (UTC)
Subject: =?UTF-8?B?aG93IHRvIGJ1aWxkIEVYVEVSTkFMIGtlcm5lbCBtb2R1bGUgd2l0aCDigJxpbmhlcml0IG1vZHVsZSBleHRlcm5hbHNyY+KAnQ==?=
To: openembedded-devel@lists.openembedded.org
From: "chenheyun" <chen_heyun@163.com>
X-Originating-Location: Chongqing, CN (183.66.200.41)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 02:45:01 -0700
Message-ID: <j3v4.1723023901388991573.vzSs@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CALHOpeQeMkFl9FpGg1X"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 09:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111606

--CALHOpeQeMkFl9FpGg1X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi all=EF=BC=9A
i have a problem=E3=80=82
i want build EXTERNAL kernel module and module src is outside=E3=80=82
just like this=EF=BC=9A
=E2=80=9C
inherit module externalsrc
EXTERNALSRC:pn-x =3D "/xxx/source/kernel-modules"
EXTERNALSRC_BUILD:pn-x =3D "${S}"
do_compile[dirs]=3D "${S}"
do_install[dirs]=3D "${S}"
=E2=80=9D

i dont want build tmp in my source code. but EXTERNAL kernel module will cr=
eate tmp data in my source code.

--CALHOpeQeMkFl9FpGg1X
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi all=EF=BC=9A</div>
<div>&nbsp; &nbsp;i have a problem=E3=80=82</div>
<div>&nbsp; &nbsp;i want build EXTERNAL kernel module and module src is out=
side=E3=80=82</div>
<div>just like this=EF=BC=9A</div>
<div>&ldquo;</div>
<div>inherit module externalsrc</div>
<div>EXTERNALSRC:pn-x =3D "/xxx/source/kernel-modules"<br />EXTERNALSRC_BUI=
LD:pn-x =3D "${S}"</div>
<div>do_compile[dirs]=3D "${S}"<br />do_install[dirs]=3D "${S}"</div>
<div>&rdquo;</div>
<div>&nbsp;</div>
<div>i dont want build tmp in my source code. but EXTERNAL kernel module wi=
ll create tmp data in my source code.</div>
<div>&nbsp;</div>

--CALHOpeQeMkFl9FpGg1X--

