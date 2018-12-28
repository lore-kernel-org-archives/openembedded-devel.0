Return-Path: <athoik@gmail.com>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id E5DB960272
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 13:24:23 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id a77so17329807oii.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KwR61LCctsSoBK/E2ZwsHO9yBe7ZTDwVTUtecdEfQl0=;
	b=BN8umcAxRxM0555/N4c6puqJOlGd1aGGsdB0Qx03T8zwCNsh+gjVDSnyImbzgA8y9a
	LyAM8KNbQPi6Wd2NSJg/yy1w2D3O2P8DEuaki+BVYjEIzKx1X4vyOkh5N+oqezKfhoSG
	mT2R3kdPMD+fnUvelLEz0wuZ8wRIwrRfzIN27kzChvpBlPi04bhI/mZffXKqoxLIO9ke
	6hiCLMQvn+GlQveNVCz5pczdL+Wm5UX+WRkJw//n5Na7mxfAvmbM/WOXqSCzl2qNoBhb
	yDNtgceZ34x+byZuaycj797TwSyuqJ3ZaZ/OD5M5jV9JPOgP86NP9xrrfJoNEmqnnv/0
	iezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KwR61LCctsSoBK/E2ZwsHO9yBe7ZTDwVTUtecdEfQl0=;
	b=O5XoJeoiR8ztVqQJv6PEXA8iU8y1fjObT7E31Bn/K5FbGd1ciBE18EszvXMC8eDQBR
	op9NAdVxXmc4eRIrcwOU/irZ5DzaV4ZRK8t3DZinb5zWoZuqGK/4VdOFwOY63g5K8nhn
	NVNvgQTvp9cVK1xLxewxmLJCALLNU5D+lXB3HZSZ/OqMOJt3gdMlCayA15pMnC/O3vzd
	pAqnnb8JXb0qDvj75RVmyh66NKe/68KNoLm9dKbuUnwnhYpF/qdPJQY5r6PrKJs2p6Hu
	1NOZbJQLF82+6YwXQLwzImz9tLfGMHgfj1HGaKHJFlDt4TE3z3k/CPewLX48IfhHtCru
	1lKA==
X-Gm-Message-State: AA+aEWYNRrW2RcJY0v2cg6JE28Gf7doJXKVey6XcQ5KKrF6/0ft4Fzh5
	uN5ywtw5gbSmZAiv3jyG+swF5foLyaat7lnekQ==
X-Google-Smtp-Source: ALg8bN7PKPh09/47NGFlDUni4SbJN3nTqq/hO/fuLsWqkv6JAzdgz+IUWUd5RNZU71YRjYDe0k8P4XW/fiZXXBXa9eM=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr18226026oic.332.1546003464837;
	Fri, 28 Dec 2018 05:24:24 -0800 (PST)
MIME-Version: 1.0
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
	<CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
In-Reply-To: <CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Fri, 28 Dec 2018 15:24:13 +0200
Message-ID: <CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 13:24:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 28 =CE=94=CE=B5=CE=BA 2018 =CF=
=83=CF=84=CE=B9=CF=82 8:51 =CF=80.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.khem=
@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmail.com> =
wrote:
> >
> > Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
>
> have you build tested this patch on a musl platform ?
> if not please try one and report back.
>

bitbake faac was tested using TCLIBC =3D "musl"
(39e933936e11e186f21dacf4bccedddaa0a122df)
for machines qemuarm and qemuarm64. Build was successful.

Please let me know if above test case is enough or further actions required=
.

> > Previously not required mp4v2 library was dropped on 1.29.9.2.
> >
> > While being there also fix issue with multilib build on aarch64
> > using FILES_lib${BPN} instead of FILES_lib${PN}.
> >
> > WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Files=
/directories were installed but not shipped in any package:
> >   /usr/lib/libfaac.so.0
> >   /usr/lib/libfaac.so.0.0.0
> > Please set FILES such that these items are packaged. Alternatively if t=
hey are unneeded, avoid installing them or delete them within do_install.
> > lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]
> >
> > Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> > ---
> >  .../faac/{faac_1.29.bb =3D> faac_1.29.9.2.bb}        | 14 ++++-------
> >  ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 --------------=
--------
> >  2 files changed, 4 insertions(+), 38 deletions(-)
> >  rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb =3D> faac=
_1.29.9.2.bb} (56%)
> >  delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-=
mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> >
> > diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/met=
a-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > similarity index 56%
> > rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > index d36f2f4..4fc1121 100644
> > --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> > +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> > @@ -1,29 +1,23 @@
> >  SUMMARY =3D "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
> >  SECTION =3D "libs"
> >  LICENSE =3D "LGPLv2+"
> > -HOMEPAGE =3D "http://www.audiocoding.com/faac.html"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb85406=
3f7e7 \
> >                      file://libfaac/coder.h;beginline=3D5;endline=3D17;=
md5=3Dfa1fd6a5fa8cdc877d63a12530d273e0"
> >
> > -LICENSE_FLAGS =3D "commercial"
> > -
> >  inherit autotools
> >
> >  SRC_URI =3D " \
> >      ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
> > -    file://0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch =
\
> >  "
> >
> > -SRC_URI[md5sum] =3D "78603720f655180059d6970c582a3005"
> > -SRC_URI[sha256sum] =3D "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba3=
3d1af76ba53f4b3197"
> > -
> > -EXTRA_OECONF +=3D "--without-mp4v2"
> > +SRC_URI[md5sum] =3D "2b58d621fad8fda879f07b7cad8bfe10"
> > +SRC_URI[sha256sum] =3D "d45f209d837c49dae6deebcdd87b8cc3b04ea290880358=
faecf5e7737740c771"
> >
> >  PACKAGES =3D+ "lib${BPN} lib${BPN}-dev"
> >
> >  FILES_${PN} =3D " ${bindir}/faac "
> > -FILES_lib${PN} =3D " ${libdir}/*.so.*"
> > -FILES_lib${PN}-dev =3D " \
> > +FILES_lib${BPN} =3D " ${libdir}/*.so.*"
> > +FILES_lib${BPN}-dev =3D " \
> >      ${includedir} \
> >      ${libdir}/*.so \
> >      ${libdir}/*.la \
> > diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-D=
efine-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-mu=
ltimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.pa=
tch
> > deleted file mode 100644
> > index d845ddf..0000000
> > --- a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-_=
_STRING-if-cdefs.h-does-not-exist.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 46cc9298c38b9dd735fec3f39aa2d6e56a362410 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 28 Mar 2017 21:33:36 -0700
> > -Subject: [PATCH 2/2] mp4v2: Define __STRING if cdefs.h does not exist
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - common/mp4v2/mp4util.h | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/common/mp4v2/mp4util.h b/common/mp4v2/mp4util.h
> > -index 1f9cb64..1e7aced 100644
> > ---- a/common/mp4v2/mp4util.h
> > -+++ b/common/mp4v2/mp4util.h
> > -@@ -23,6 +23,10 @@
> > - #define __MP4_UTIL_INCLUDED__
> > - #include <assert.h>
> > -
> > -+#ifndef __STRING
> > -+#define __STRING(x)     #x
> > -+#endif
> > -+
> > - #ifndef ASSERT
> > - #define ASSERT(expr) \
> > -       if (!(expr)) { \
> > ---
> > -2.12.1
> > -
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

