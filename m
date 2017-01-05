Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5AA471AE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 18:04:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so97994851wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 10:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Cde5e+TR1/sxzDHO3wewvcGIPwbi2fplOeOvZC4LMGE=;
	b=fex12ycVNmPzCHclqA0oPaf9poIDkF46F0Hv+tVa5adfyDxoy7o1H5T797Dw8DfjPO
	7w+nU8WAhONMJBe8PeF0NmLYAmJr8oJ5wdxy6bEkl0I+bUVWyGIipDtPaAQw8zHfK+ey
	Nu3ZxBDeqESCabDwX4y9KKH9UbT60dVvrIaXBydEDWLf4OdV5kR4pqfun4k8lJntSR9T
	mPAU8dAWzUb9mlcWOz31fXx5TFyvBhXTSGj/qOEyNFwn89Qd7gqJhvOtJPOuB0EZ82AZ
	kUR3aCdjLHc7QS0QuMv33bhvGjSbM7WDjj5MYrBDYZLw8/cyiT8DXaDamf11giO7M+a7
	Ni6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Cde5e+TR1/sxzDHO3wewvcGIPwbi2fplOeOvZC4LMGE=;
	b=UtgrNKcD2Dws109Fiq6KkLQKKUHenUbVQb7x7LYc13JNUWDGjYEJZX6WF4sR/zZxSs
	+5H2TxhHMgeLVFvSHyPiAS2Y9bSJ46YOVkffDkqTBEQaWlAiG6fpnHVusDMTHWhaS/gP
	5fw3kK0bIxkwNOfE02ZAV5YDS7Wlm66dbpquefbZhfUwjvHHaWF3tgJln9NhFkuw33QI
	l3bjIQVLv57Mr3ZNHcyYdyp3+paDtzP+5itpaxCCYxWiOkALA9I9LuklJAzzhxAISUsP
	3I/DF30hzl0WHF5dPVNIIHDiHbLdojMUqkh6XYJBXuOUzHv5ghdEZAdL15YYLuwvBxpW
	tgpg==
X-Gm-Message-State: AIkVDXKXyEJun/EFYckZikb5LP3ia4lGV843zMic58TAKFE6GEVr2XOvS42kya+kD6/RFg==
X-Received: by 10.28.158.82 with SMTP id h79mr60929038wme.19.1483639499291;
	Thu, 05 Jan 2017 10:04:59 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e5sm101376563wma.12.2017.01.05.10.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Jan 2017 10:04:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Jan 2017 19:04:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170105180458.GC3243@jama>
References: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
	<1483493243-30984-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1483493243-30984-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [PATCH][V2 2/2] raptor2: initial add 2.0.15
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
X-List-Received-Date: Thu, 05 Jan 2017 18:05:00 -0000
X-Groupsio-MsgNum: 64644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline

--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 02:27:23AM +0100, Andreas M=FCller wrote:
> * it is it in meta-office for a while. Now I need it in meta-qt5-extra too
> * LICENSE.txt summarizes all licenses and explains that ot is user's choi=
ce
>   which one to use
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...c-do-additional-checks-on-libxml2-also-wh.patch | 34 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  | 25 ++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure.=
ac-do-additional-checks-on-libxml2-also-wh.patch
>  create mode 100644 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
>=20
> diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-a=
dditional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2=
/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
> new file mode 100644
> index 0000000..7faeb13
> --- /dev/null
> +++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-addition=
al-checks-on-libxml2-also-wh.patch
> @@ -0,0 +1,34 @@
> +From 3f97aac5a1f43ef57b02fb9ccdcadd41a6b69fa9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Tue, 27 Oct 2015 10:21:24 +0100
> +Subject: [PATCH] configure.ac: do additional checks on libxml2 also when
> + detected by pkg-config
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Applied [1]
> +
> +[1] https://github.com/dajobe/raptor/pull/33
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 10ff870..35fa08e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -601,7 +601,7 @@ have_libxml=3D0
> + need_libxml=3D0
> +=20
> + oCPPFLAGS=3D"$CPPFLAGS"
> +-if test "X$XML_CONFIG" !=3D X; then
> ++if test "X$libxml_source" !=3D X; then
> +   CPPFLAGS=3D"$LIBXML_CFLAGS $CPPFLAGS"
> +   LIBS=3D"$LIBS $LIBXML_LIBS"
> +   AC_CHECK_FUNC(xmlCreatePushParserCtxt, have_xmlCreatePushParserCtxt=
=3Dyes, have_xmlCreatePushParserCtxt=3Dno)
> +--=20
> +2.1.0
> +
> diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/=
recipes-support/raptor2/raptor2_2.0.15.bb
> new file mode 100644
> index 0000000..8c6d008
> --- /dev/null
> +++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Library for parsing and serializing RDF syntaxes"
> +LICENSE =3D "GPLv2 | LGPLv2.1 | Apache-2.0"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.txt;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +    file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
> +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +    file://LICENSE-2.0.txt;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"

I haven't checked why, but doesn't match for me:

ERROR: raptor2-2.0.15-r0 do_populate_lic: QA Issue: raptor2: The LIC_FILES_=
CHKSUM does not match for file://LICENSE.txt;md5=3D2d5025d4aa3495befef8f172=
06a5b0a1
raptor2: The new md5 checksum is b840e5ae3aeb897f45b473341348cd9c

> +DEPENDS =3D "libxml2 libxslt curl yajl"
> +
> +SRC_URI =3D " \
> +    http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
> +    file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.pat=
ch \
> +"
> +SRC_URI[md5sum] =3D "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
> +SRC_URI[sha256sum] =3D "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb=
4782dd4a6a1480ed"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " \
> +    --without-xml2-config \
> +    --without-curl-config \
> +    --without-xslt-config \
> +"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWG6KyQAKCRA3VSO3ZXaA
HEWpAJ4hIX4sJ3El8yqZlANOP5uryY4/8wCgiYsxgMIkLS97vl4QctQ8OAXUClY=
=s+uO
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
