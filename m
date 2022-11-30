Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5DAC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:28:12 +0000 (UTC)
Subject: Re: [meta-python][PATCH 1/2] python3-binwalk: add recipe for version 2.3.3
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Nov 2022 23:28:09 -0800
References: <CANx9H-DEL_Z1BeT8VnPZ9jC0_VHEtQV_O2Vs8UdzdiC77-aCMA@mail.gmail.com>
In-Reply-To: <CANx9H-DEL_Z1BeT8VnPZ9jC0_VHEtQV_O2Vs8UdzdiC77-aCMA@mail.gmail.com>
Message-ID: <8531.1669793289706780131@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JiN4NsufTeBA2GetsJi4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99868

--JiN4NsufTeBA2GetsJi4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> On Fri, Nov 25, 2022 at 3:44 AM tomzy < tomasz.zyjewski@... > wrote:
>=20

>=20
> Install binwalk utility
>=20
> Signed-off-by: Tomasz =C5=BByjewski < tomasz.zyjewski@... >
> ---
> .../python/ python3-binwalk_2.3.3.bb ( http://python3-binwalk_2.3.3.bb ) =
|
> 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/ python3-binwalk_2=
.3.3.bb
> ( http://python3-binwalk_2.3.3.bb )
>=20
> diff --git a/meta-python/recipes-devtools/python/ python3-binwalk_2.3.3.b=
b
> ( http://python3-binwalk_2.3.3.bb ) b/meta-python/recipes-devtools/python=
/
> python3-binwalk_2.3.3.bb ( http://python3-binwalk_2.3.3.bb )
> new file mode 100644
> index 000000000000..362efa275148
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/ python3-binwalk_2.3.3.bb (
> http://python3-binwalk_2.3.3.bb )
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Firmware analysis tool"
> +DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a
> fast, \
> +easy to use tool for analyzing, reverse engineering, and extracting
> firmware \
> +images."
> +HOMEPAGE =3D " https://github.com/ReFirmLabs/binwalk "
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4d=
e64"
> +
> +SRC_URI =3D "git:// github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branc=
h=3Dmaster
> ( http://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster )=
 "
> +

>=20
>=20
> Thank you for fetching the git repo which is much newer (and with better
> security apparently) than the pypi version.
>=20

I will do the same with the python3-uefi-firmware recipe

>=20
>=20
>=20
> +SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd" + +S =3D
> "${WORKDIR}/git" + +inherit setuptools3 + +RDEPENDS:${PN} +=3D
> "python3-core" -- 2.25.1

--JiN4NsufTeBA2GetsJi4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Nov 25, 2022 at 3:44 AM tomzy=
 &lt;<a href=3D"mailto:tomasz.zyjewski@..." target=3D"_blank" rel=3D"nofoll=
ow noopener">tomasz.zyjewski@...</a>&gt; wrote:</div>
</blockquote>
<blockquote class=3D"gmail_quote">Install binwalk utility<br /><br />Signed=
-off-by: Tomasz =C5=BByjewski &lt;<a href=3D"mailto:tomasz.zyjewski@..." ta=
rget=3D"_blank" rel=3D"nofollow noopener">tomasz.zyjewski@...</a>&gt;<br />=
---<br />&nbsp;.../python/<a href=3D"http://python3-binwalk_2.3.3.bb" targe=
t=3D"_blank" rel=3D"nofollow noopener">python3-binwalk_2.3.3.bb</a>&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 17 +++++++++++++++++<br />&nbsp;1=
 file changed, 17 insertions(+)<br />&nbsp;create mode 100644 meta-python/r=
ecipes-devtools/python/<a href=3D"http://python3-binwalk_2.3.3.bb" target=
=3D"_blank" rel=3D"nofollow noopener">python3-binwalk_2.3.3.bb</a><br /><br=
 />diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-binwalk_2.3.3.bb" target=3D"_blank" rel=3D"nofollow noopener">python3-bi=
nwalk_2.3.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-binwalk_2.3.3.bb" target=3D"_blank" rel=3D"nofollow noopener">pytho=
n3-binwalk_2.3.3.bb</a><br />new file mode 100644<br />index 000000000000..=
362efa275148<br />--- /dev/null<br />+++ b/meta-python/recipes-devtools/pyt=
hon/<a href=3D"http://python3-binwalk_2.3.3.bb" target=3D"_blank" rel=3D"no=
follow noopener">python3-binwalk_2.3.3.bb</a><br />@@ -0,0 +1,17 @@<br />+S=
UMMARY =3D "Firmware analysis tool"<br />+DESCRIPTION =3D "This package con=
tains Python Binwalk tool. Binwalk is a fast, \<br />+easy to use tool for =
analyzing, reverse engineering, and extracting firmware \<br />+images."<br=
 />+HOMEPAGE =3D "<a href=3D"https://github.com/ReFirmLabs/binwalk" target=
=3D"_blank" rel=3D"nofollow noopener">https://github.com/ReFirmLabs/binwalk=
</a>"<br />+LICENSE =3D "MIT"<br />+LIC_FILES_CHKSUM =3D "file://LICENSE;md=
5=3D65bbee055d3ea3bfc475f07aecf4de64"<br />+<br />+SRC_URI =3D "git://<a hr=
ef=3D"http://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster=
" target=3D"_blank" rel=3D"nofollow noopener">github.com/ReFirmLabs/binwalk=
;protocol=3Dhttps;branch=3Dmaster</a>"<br />+</blockquote>
<blockquote>
<div>&nbsp;</div>
<div>Thank you for fetching the git repo which is much newer (and with bett=
er security apparently) than the pypi version.</div>
</blockquote>
I will do the same with the python3-uefi-firmware recipe<br />
<blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
+SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd" + +S =3D "${WORKDIR}=
/git" + +inherit setuptools3 + +RDEPENDS:${PN} +=3D "python3-core" -- 2.25.=
1</blockquote>

--JiN4NsufTeBA2GetsJi4--

