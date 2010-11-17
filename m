Received: from mail-iw0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIjeH-00049u-H3
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:10:16 +0100
Received: by iwn2 with SMTP id 2so2285187iwn.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HwJSPUw617OkugAj7+vrvjOoSag/hSBnIcoDSBPkClo=;
	b=DqcuVUnK+nCimqWE6o+xoUUYKGy2MWO54Xn71lmpOBVh+yM8s1zVDxk3Msn5psuP5l
	DVYYngEU641Ski3JAxyNKPL5LbQzB72bjok695KGJY/DkFj6H2rMsXy5D0Bx1Gl9ZuLB
	1FF5TglTO3gKAYEzb70chHtPbavCFEQNOiz3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IGpbtIZUHmfgu/k/E2gqPZQTvNqTLIEU+vJGhTbPPMGcl/7bVjH1p9vy0uiVvEhSYz
	/JcYB9zfHGlUyZ7eKoOBU25KWsFL0xAqMLbgtE+WrDQkfInrJ2zr6ob7BFEDzzmXtefN
	05cpn76eErAtBE0zcpixxayV+m8raOXct9TOg=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr7097706ibe.101.1290006544609; Wed,
	17 Nov 2010 07:09:04 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 07:09:04 -0800 (PST)
In-Reply-To: <1290003899-13958-3-git-send-email-Martin.Jansa@gmail.com>
References: <1290003899-13958-1-git-send-email-Martin.Jansa@gmail.com>
	<1290003899-13958-3-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 17 Nov 2010 16:09:04 +0100
Message-ID: <AANLkTi=c9EB7ZGi-_NSRR4cB_BLJ6JEC3kyFu9R8AyMP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.179
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] xorg: remove recipes for versions not pinned in any distro config
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
X-List-Received-Date: Wed, 17 Nov 2010 15:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/11/17 Martin Jansa <martin.jansa@gmail.com>:
> ---
> =A0recipes/xorg-doc/xorg-sgml-doctools_1.5.bb =A0 =A0 =A0 =A0 | =A0 =A08 =
--------
> =A0recipes/xorg-driver/xf86-video-geode_2.11.9.bb =A0 =A0 | =A0 =A09 ----=
-----
> =A0recipes/xorg-driver/xf86-video-vmware_11.0.2.bb =A0 =A0| =A0 =A07 ----=
---
> =A0recipes/xorg-font/font-adobe-100dpi_1.0.2.bb =A0 =A0 =A0 | =A0 =A06 --=
----
> =A0recipes/xorg-font/font-adobe-75dpi_1.0.2.bb =A0 =A0 =A0 =A0| =A0 =A06 =
------
> =A0.../xorg-font/font-adobe-utopia-100dpi_1.0.3.bb =A0 =A0| =A0 =A09 ----=
-----
> =A0recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb | =A0 =A09 --------=
-
> =A0recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb | =A0 =A09 --------=
-
> =A0recipes/xorg-font/font-arabic-misc_1.0.2.bb =A0 =A0 =A0 =A0| =A0 10 --=
--------
> =A0recipes/xorg-font/font-bh-100dpi_1.0.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-bh-75dpi_1.0.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
7 -------
> =A0.../font-bh-lucidatypewriter-100dpi_1.0.2.bb =A0 =A0 =A0 | =A0 =A07 --=
-----
> =A0.../font-bh-lucidatypewriter-75dpi_1.0.2.bb =A0 =A0 =A0 =A0| =A0 =A07 =
-------
> =A0recipes/xorg-font/font-bh-type1_1.0.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb =A0 | =A0 =A07 ------=
-
> =A0recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb =A0 =A0| =A0 =A07 ----=
---
> =A0recipes/xorg-font/font-bitstream-type1_1.0.2.bb =A0 =A0| =A0 =A07 ----=
---
> =A0recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb =A0 =A0| =A0 =A07 ----=
---
> =A0recipes/xorg-font/font-cursor-misc_1.0.2.bb =A0 =A0 =A0 =A0| =A0 =A07 =
-------
> =A0recipes/xorg-font/font-daewoo-misc_1.0.2.bb =A0 =A0 =A0 =A0| =A0 =A07 =
-------
> =A0recipes/xorg-font/font-dec-misc_1.0.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-ibm-type1_1.0.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-isas-misc_1.0.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-jis-misc_1.0.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
7 -------
> =A0recipes/xorg-font/font-micro-misc_1.0.2.bb =A0 =A0 =A0 =A0 | =A0 =A09 =
---------
> =A0recipes/xorg-font/font-misc-cyrillic_1.0.2.bb =A0 =A0 =A0| =A0 =A07 --=
-----
> =A0recipes/xorg-font/font-misc-ethiopic_1.0.2.bb =A0 =A0 =A0| =A0 =A06 --=
----
> =A0recipes/xorg-font/font-misc-meltho_1.0.2.bb =A0 =A0 =A0 =A0| =A0 =A08 =
--------
> =A0recipes/xorg-font/font-misc-misc_1.1.1.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 ------
> =A0recipes/xorg-font/font-schumacher-misc_1.1.1.bb =A0 =A0| =A0 =A06 ----=
--
> =A0recipes/xorg-font/font-screen-cyrillic_1.0.3.bb =A0 =A0| =A0 =A06 ----=
--
> =A0recipes/xorg-font/font-sony-misc_1.0.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
6 ------
> =A0recipes/xorg-font/font-sun-misc_1.0.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
6 ------
> =A0recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb =A0| =A0 =A07 ------=
-
> =A0recipes/xorg-font/font-xfree86-type1_1.0.3.bb =A0 =A0 =A0| =A0 =A07 --=
-----
> =A035 files changed, 0 insertions(+), 252 deletions(-)
> =A0delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.5.bb
> =A0delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.9.bb
> =A0delete mode 100644 recipes/xorg-driver/xf86-video-vmware_11.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-adobe-100dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-adobe-75dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
> =A0delete mode 100644 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
> =A0delete mode 100644 recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb
> =A0delete mode 100644 recipes/xorg-font/font-arabic-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bh-100dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bh-75dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1=
.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.=
0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bh-type1_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-bitstream-type1_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-cursor-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-daewoo-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-dec-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-ibm-type1_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-isas-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-jis-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-micro-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-misc-cyrillic_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-misc-ethiopic_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-misc-meltho_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-misc-misc_1.1.1.bb
> =A0delete mode 100644 recipes/xorg-font/font-schumacher-misc_1.1.1.bb
> =A0delete mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.3.bb
> =A0delete mode 100644 recipes/xorg-font/font-sony-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-sun-misc_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb
> =A0delete mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.3.bb
>
> diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.5.bb b/recipes/xorg-do=
c/xorg-sgml-doctools_1.5.bb
> deleted file mode 100644
> index ab58deb..0000000
> --- a/recipes/xorg-doc/xorg-sgml-doctools_1.5.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require xorg-doc-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "1cd2d8213ee71ebdbefce45c9da54762"
> -SRC_URI[archive.sha256sum] =3D "0e135d7c848d8b740df71895aa00ed8354406979=
e01f0df50a243fcd46452e20"
> -
> -FILES_${PN} +=3D " /usr/share/sgml/X11"
> diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.9.bb b/recipes/xor=
g-driver/xf86-video-geode_2.11.9.bb
> deleted file mode 100644
> index 7b5c6b1..0000000
> --- a/recipes/xorg-driver/xf86-video-geode_2.11.9.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require xorg-driver-video.inc
> -DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "718afca8425aa62662c03a9083915be1"
> -SRC_URI[archive.sha256sum] =3D "b30d14a8ad389be055f95133a14e2da8ad43892b=
3fb5225d99bfb571cfec7bb5"
> -
> -COMPATIBLE_HOST =3D "i.86.*-linux"
> diff --git a/recipes/xorg-driver/xf86-video-vmware_11.0.2.bb b/recipes/xo=
rg-driver/xf86-video-vmware_11.0.2.bb
> deleted file mode 100644
> index 3b1a186..0000000
> --- a/recipes/xorg-driver/xf86-video-vmware_11.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-driver-video.inc
> -DEPENDS +=3D " xineramaproto xf86miscproto drm xf86driproto"
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "00c3a70870abcda5f340497b0285dab1"
> -SRC_URI[archive.sha256sum] =3D "eab19da564b9488423424722fc84309fba2c10f1=
b90c092bf993f80c59f475d2"
> diff --git a/recipes/xorg-font/font-adobe-100dpi_1.0.2.bb b/recipes/xorg-=
font/font-adobe-100dpi_1.0.2.bb
> deleted file mode 100644
> index 381094a..0000000
> --- a/recipes/xorg-font/font-adobe-100dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "1518e417b18e22673a8f4e2e4adda47b"
> -SRC_URI[archive.sha256sum] =3D "71016e092043bc124f196d5be3d1921ab9131f25=
97ec15736a289973ca316775"
> diff --git a/recipes/xorg-font/font-adobe-75dpi_1.0.2.bb b/recipes/xorg-f=
ont/font-adobe-75dpi_1.0.2.bb
> deleted file mode 100644
> index d1308d9..0000000
> --- a/recipes/xorg-font/font-adobe-75dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "73e8e5f04943e54b69503dcd90821a5f"
> -SRC_URI[archive.sha256sum] =3D "2d49cacf910409dfb0776e02e08acec8926794bf=
63c2eb82a3a3947cf01310fd"
> diff --git a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb b/recipe=
s/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
> deleted file mode 100644
> index 337d1fc..0000000
> --- a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require xorg-font-common.inc
> -
> -DESCRIPTION =3D "Adobe typeface software"
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "de543b3cad2dc0c5a5ef16d88b01acae"
> -SRC_URI[archive.sha256sum] =3D "e048d1d37210b85bd008004dc55596bb0abdf67d=
60a4e8b0d5347f6ebd6c8cac"
> diff --git a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb b/recipes=
/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
> deleted file mode 100644
> index a9d0201..0000000
> --- a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require xorg-font-common.inc
> -
> -DESCRIPTION =3D "Adobe typeface software"
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "0d694a5591e89d2315d841f414668344"
> -SRC_URI[archive.sha256sum] =3D "274dbe4adbb57a35a57c0eb248e01dcdbcd4e4aa=
0a3834263e4026becd9542e3"
> diff --git a/recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb b/recipes=
/xorg-font/font-adobe-utopia-type1_1.0.3.bb
> deleted file mode 100644
> index 95010cc..0000000
> --- a/recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require xorg-font-common.inc
> -
> -DESCRIPTION =3D "Adobe typeface software"
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "d086727a7d07b5ed60ca98c6ed88ccd5"
> -SRC_URI[archive.sha256sum] =3D "50fa467293cdf2fd909f4a6e32de9da7435dde22=
e1e6c1066a408e5ac20610f9"
> diff --git a/recipes/xorg-font/font-arabic-misc_1.0.2.bb b/recipes/xorg-f=
ont/font-arabic-misc_1.0.2.bb
> deleted file mode 100644
> index 1c77161..0000000
> --- a/recipes/xorg-font/font-arabic-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require xorg-font-common.inc
> -
> -DESCRIPTION =3D "100dpi, 24 point (approximately) font to minimally supp=
ort (almost) all \
> -of the Arabic characters available in Unicode."
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "40f50d360831755002ed3b25cc11d62d"
> -SRC_URI[archive.sha256sum] =3D "ed3bae41b435c151e75d385456239aaf4d2d26dd=
6ef52cdc8314de0336206522"
> diff --git a/recipes/xorg-font/font-bh-100dpi_1.0.2.bb b/recipes/xorg-fon=
t/font-bh-100dpi_1.0.2.bb
> deleted file mode 100644
> index 9c992e1..0000000
> --- a/recipes/xorg-font/font-bh-100dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "66dc4284674242913bd333dfe6c2d175"
> -SRC_URI[archive.sha256sum] =3D "9e7908b7d7586fb61615c9a3fa1e29c70ef6f24a=
393abe89f29969d27af93a2e"
> diff --git a/recipes/xorg-font/font-bh-75dpi_1.0.2.bb b/recipes/xorg-font=
/font-bh-75dpi_1.0.2.bb
> deleted file mode 100644
> index e4c4dc6..0000000
> --- a/recipes/xorg-font/font-bh-75dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "a2c4bd73637330391fd3d16e58be5528"
> -SRC_URI[archive.sha256sum] =3D "40fe8a5be3925d6fb2da29b7f0d33bd27858c79b=
94f3ee38ebc0d86a3d4fa80d"
> diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb b=
/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb
> deleted file mode 100644
> index 719614c..0000000
> --- a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "6bb4ce98da5aadae91101484b1de9ea8"
> -SRC_URI[archive.sha256sum] =3D "730ca783fb487fbc31885023fb26414203672022=
15c43fa79739d1f25cc75392"
> diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb b/=
recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb
> deleted file mode 100644
> index 7279f83..0000000
> --- a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "c500d809e60b0139bf6b4bce6550372a"
> -SRC_URI[archive.sha256sum] =3D "3f5dd55cc266386d453827e358a7984b809513db=
58a8aabfa8d9b3fc85720edf"
> diff --git a/recipes/xorg-font/font-bh-type1_1.0.2.bb b/recipes/xorg-font=
/font-bh-type1_1.0.2.bb
> deleted file mode 100644
> index d5fbafa..0000000
> --- a/recipes/xorg-font/font-bh-type1_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "da9932f1c325095b48d73f954bdbce62"
> -SRC_URI[archive.sha256sum] =3D "ff33bf9d8d3943b45ca7405586350ef9496de4ad=
d736d3ee057aa645fad90fe6"
> diff --git a/recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb b/recipes/x=
org-font/font-bitstream-100dpi_1.0.2.bb
> deleted file mode 100644
> index b614690..0000000
> --- a/recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "af353d08fa119c3da3b5d01f19d91c59"
> -SRC_URI[archive.sha256sum] =3D "416d1968e7eae0848c058afaff351ff66ab95632=
cabab4eeff0cd050c1955613"
> diff --git a/recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb b/recipes/xo=
rg-font/font-bitstream-75dpi_1.0.2.bb
> deleted file mode 100644
> index e8e8b90..0000000
> --- a/recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "e51e4ed02a7c09022134ce1f6714b277"
> -SRC_URI[archive.sha256sum] =3D "3de2cbe0fdbfb1a752aef761f65ad9d64e6881b7=
9822b7028cecbc5ea87c5ff3"
> diff --git a/recipes/xorg-font/font-bitstream-type1_1.0.2.bb b/recipes/xo=
rg-font/font-bitstream-type1_1.0.2.bb
> deleted file mode 100644
> index 2eec48d..0000000
> --- a/recipes/xorg-font/font-bitstream-type1_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "27c55f6a938e7153c59fb551b2f491f9"
> -SRC_URI[archive.sha256sum] =3D "5deb7a36cd70f8048d0c20a743dd56de9d1ced2e=
9a3f556678def492b0a54cf1"
> diff --git a/recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb b/recipes/xo=
rg-font/font-cronyx-cyrillic_1.0.2.bb
> deleted file mode 100644
> index 5aca57a..0000000
> --- a/recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "98fa04be8f2ad27a0c4d73a06acbcfbc"
> -SRC_URI[archive.sha256sum] =3D "f8c0ab277f4a6fd8a68f90bb702de1f2ba253330=
13c123b6f7dc3bcbc6471caa"
> diff --git a/recipes/xorg-font/font-cursor-misc_1.0.2.bb b/recipes/xorg-f=
ont/font-cursor-misc_1.0.2.bb
> deleted file mode 100644
> index 3ffa63e..0000000
> --- a/recipes/xorg-font/font-cursor-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "b0ff8cb54d245d328ba5b9ed38d734ed"
> -SRC_URI[archive.sha256sum] =3D "117a000109d0d9b71f1efe5809dac2bc7c254ff9=
a7a8995f7a295842881e300f"
> diff --git a/recipes/xorg-font/font-daewoo-misc_1.0.2.bb b/recipes/xorg-f=
ont/font-daewoo-misc_1.0.2.bb
> deleted file mode 100644
> index b054af1..0000000
> --- a/recipes/xorg-font/font-daewoo-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "7db1b5b2304c49df5f44aeb815e265d6"
> -SRC_URI[archive.sha256sum] =3D "9d3f13449afc51d21d3de4f049982a92056c71a9=
8bdc43b6b9dbf615c297b9c9"
> diff --git a/recipes/xorg-font/font-dec-misc_1.0.2.bb b/recipes/xorg-font=
/font-dec-misc_1.0.2.bb
> deleted file mode 100644
> index e66765f..0000000
> --- a/recipes/xorg-font/font-dec-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "46e46e60e7dbf1fd6dc264392799d5d8"
> -SRC_URI[archive.sha256sum] =3D "b726d0f7fc8e712480cab0db80d24f7c539342d3=
ed4f426aa0ec6f48a93e51ee"
> diff --git a/recipes/xorg-font/font-ibm-type1_1.0.2.bb b/recipes/xorg-fon=
t/font-ibm-type1_1.0.2.bb
> deleted file mode 100644
> index aed277b..0000000
> --- a/recipes/xorg-font/font-ibm-type1_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "ad4a8b9443f32c29a4e7001a50af17c0"
> -SRC_URI[archive.sha256sum] =3D "a8c95e7c34b8cc82ae97d7db9d482db4fc4ac4f3=
451ca8b04df1a1bd8efa2764"
> diff --git a/recipes/xorg-font/font-isas-misc_1.0.2.bb b/recipes/xorg-fon=
t/font-isas-misc_1.0.2.bb
> deleted file mode 100644
> index 5c96898..0000000
> --- a/recipes/xorg-font/font-isas-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "02eca731d77307c4cb37738a32f2db9f"
> -SRC_URI[archive.sha256sum] =3D "f0dc69141e04573aaf27232e72cb312b3b6c7bba=
dbb562522dde67993ce76535"
> diff --git a/recipes/xorg-font/font-jis-misc_1.0.2.bb b/recipes/xorg-font=
/font-jis-misc_1.0.2.bb
> deleted file mode 100644
> index 3977f65..0000000
> --- a/recipes/xorg-font/font-jis-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "b08eb798739f85158fee74977cf335c2"
> -SRC_URI[archive.sha256sum] =3D "f570a7245dad60a42f68aed5f7b94e9166ea9c7f=
4f3ce892c79b7a8b234a1d8f"
> diff --git a/recipes/xorg-font/font-micro-misc_1.0.2.bb b/recipes/xorg-fo=
nt/font-micro-misc_1.0.2.bb
> deleted file mode 100644
> index ce57cdb..0000000
> --- a/recipes/xorg-font/font-micro-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -EXTRA_OECONF =3D "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8=
859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable=
-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --=
disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8=
859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
> -
> -SRC_URI[archive.md5sum] =3D "2515f3fd42de917d088869a4e8d9813b"
> -SRC_URI[archive.sha256sum] =3D "020678e9f67795c67c95331add02db5b4b8db090=
af3255938dd405cf855aa12f"
> diff --git a/recipes/xorg-font/font-misc-cyrillic_1.0.2.bb b/recipes/xorg=
-font/font-misc-cyrillic_1.0.2.bb
> deleted file mode 100644
> index 0b85af8..0000000
> --- a/recipes/xorg-font/font-misc-cyrillic_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "d6eede978912b85ad96ca409f6a20690"
> -SRC_URI[archive.sha256sum] =3D "7821db4a1c9f94540e31dd1003bcac3f694b0de9=
17b2d68bd8140129e64c0498"
> diff --git a/recipes/xorg-font/font-misc-ethiopic_1.0.2.bb b/recipes/xorg=
-font/font-misc-ethiopic_1.0.2.bb
> deleted file mode 100644
> index b1c4948..0000000
> --- a/recipes/xorg-font/font-misc-ethiopic_1.0.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "bf9879739a9f06dc1980cf16defaa4d9"
> -SRC_URI[archive.sha256sum] =3D "250424b04bba8c85bf5ee5af184b6c8c02227360=
828258acdb2de4f4d71322ce"
> diff --git a/recipes/xorg-font/font-misc-meltho_1.0.2.bb b/recipes/xorg-f=
ont/font-misc-meltho_1.0.2.bb
> deleted file mode 100644
> index 5309b64..0000000
> --- a/recipes/xorg-font/font-misc-meltho_1.0.2.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require xorg-font-common.inc
> -
> -DESCRIPTION =3D "These fonts are designed for the display of Syriac text=
."
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "b6d53e8bcc06e25f868130a0c4619ab2"
> -SRC_URI[archive.sha256sum] =3D "ec8813f32d1bfceed96cc186c02be7156bf07695=
4e2e30ac7d41e02ba070b91e"
> diff --git a/recipes/xorg-font/font-misc-misc_1.1.1.bb b/recipes/xorg-fon=
t/font-misc-misc_1.1.1.bb
> deleted file mode 100644
> index 56859bf..0000000
> --- a/recipes/xorg-font/font-misc-misc_1.1.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "6e25a0ff5ce776a1b894a7ea117b2858"
> -SRC_URI[archive.sha256sum] =3D "c4f09a5c76549b1794bdc7e6be28e5aeb1178681=
ea76bceccdb11e43494d89ce"
> diff --git a/recipes/xorg-font/font-schumacher-misc_1.1.1.bb b/recipes/xo=
rg-font/font-schumacher-misc_1.1.1.bb
> deleted file mode 100644
> index 11094ff..0000000
> --- a/recipes/xorg-font/font-schumacher-misc_1.1.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "bd63a27f967f4d98a257f7d677f2cb5b"
> -SRC_URI[archive.sha256sum] =3D "e6ce520ab2962eaa4d639538fc44b7f4b5a5abf4=
f273bd8643fcd05b14adfbe5"
> diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.3.bb b/recipes/xo=
rg-font/font-screen-cyrillic_1.0.3.bb
> deleted file mode 100644
> index 3e85276..0000000
> --- a/recipes/xorg-font/font-screen-cyrillic_1.0.3.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "d50d209c9e7580aaba544d54b5e51e76"
> -SRC_URI[archive.sha256sum] =3D "4e1a3892cb0059e24acf3156f59122e4fdf14164=
c3a7ed5d93e0788ef8b7ef0a"
> diff --git a/recipes/xorg-font/font-sony-misc_1.0.2.bb b/recipes/xorg-fon=
t/font-sony-misc_1.0.2.bb
> deleted file mode 100644
> index 08079d8..0000000
> --- a/recipes/xorg-font/font-sony-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "5efb8d23f57124c0f65d7112e2fa6997"
> -SRC_URI[archive.sha256sum] =3D "6ecb69b1b6ae716158e167217f6179d1b0c138c1=
24e90dfaf2888e3b888fc754"
> diff --git a/recipes/xorg-font/font-sun-misc_1.0.2.bb b/recipes/xorg-font=
/font-sun-misc_1.0.2.bb
> deleted file mode 100644
> index b5ed49a..0000000
> --- a/recipes/xorg-font/font-sun-misc_1.0.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require xorg-font-common.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "a01cb1b68d01840ad3442bac7b5b2701"
> -SRC_URI[archive.sha256sum] =3D "22a3d64ec5625e402de2a66f7888920cfaa175c8=
de1405db163f0b411b2be3f1"
> diff --git a/recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb b/recipes/=
xorg-font/font-winitzki-cyrillic_1.0.2.bb
> deleted file mode 100644
> index fae519d..0000000
> --- a/recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "2d92227f14910732dc46303d6f8a9543"
> -SRC_URI[archive.sha256sum] =3D "f4fbf0ae12b7a0e5dd440cb2d63eb24feada3d28=
3b9e0d588295f799e772ffe0"
> diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.3.bb b/recipes/xorg=
-font/font-xfree86-type1_1.0.3.bb
> deleted file mode 100644
> index 48bca39..0000000
> --- a/recipes/xorg-font/font-xfree86-type1_1.0.3.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-font-common.inc
> -
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "df934bfc0339322cee73ee3c5460a648"
> -SRC_URI[archive.sha256sum] =3D "2ac19a2bde71cfd614da4e3e90f9ad992a94a8eb=
d1ee4fee44f8aad6f01363ba"
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


