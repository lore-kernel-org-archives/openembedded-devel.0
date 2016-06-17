Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2E5860589
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:58:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 187so26228wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Fqq/fT4/PI3zuPtYh/13RNxStrxtYKgY6/KCNSp0fzQ=;
	b=e2UoYzoXqKaRjs24C3+H1pUCX3dfKo2QaZbgZ0Vf+DO+9Fs6tBJ3ydpgiuEbBplbV+
	KysrBXa3q0c6ywP0nH0gWKJMsOEoM8yM9XITi8cafycJb1ov1Ow/QRubRREDYkEhl9JH
	1qiW5m51Fv0rj31w7YfI6A/sXMyS0Id2xry2TkS7DP4wBlPk1CEf8c+YN4kZunuSvW1X
	ea/wPKmJcJ+eT+/NZMMlY9d1cu7vcFIvdr/2tEVjf5GtkPy7cShcO34iBvw+prDRV4er
	py9u21eapvjbBa5jUVpjStFQVPq54WbcXZFifUc21W3hgkStv5TXVjl9eWu6GleTSYak
	ElDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Fqq/fT4/PI3zuPtYh/13RNxStrxtYKgY6/KCNSp0fzQ=;
	b=FkTspKvILf6Y0yMd4Fi9LSI9vRsTyYwmwc3ff5qQcJxRFNu7teOFS7NtpQzWIdrtmf
	JSp7ROUX6VuDH2pehJRCBNOOERtj9AQsz09fMJJUziGMLigGzz39fV2C/CkEAE86az2J
	79cgd882ilG8dBazXjOh2bnIN+cemId8wsAroDBekAMktfk3prTAGSJy4THMQmOMfjZE
	im/8FZ5OgzvhdEMRC+MZEcAkfx+AIBN+z+/mT9Mx5TseKbdvecgNcSJoffw4058X9BgR
	pHBK8JALhv1PmQPTLttfz8s6yvHfFD3CVu7VVbhnrrm1jjsx7qQ3rUkU6cdO0mVC7VR9
	U25A==
X-Gm-Message-State: ALyK8tI4QJkt7uveGdgowy3u6sM1XwMvTdijq7yRbaOFYQeusvr6ZQ1B47DGuzb9dGc68g==
X-Received: by 10.28.221.4 with SMTP id u4mr2667531wmg.32.1466171936595;
	Fri, 17 Jun 2016 06:58:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o10sm12297425wjs.38.2016.06.17.06.58.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Jun 2016 06:58:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 Jun 2016 15:59:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160617135932.GA2574@jama>
References: <1466171611-29613-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1466171611-29613-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH] p7zip: update to version 15.14.1
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
X-List-Received-Date: Fri, 17 Jun 2016 13:58:56 -0000
X-Groupsio-MsgNum: 61865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 03:53:31PM +0200, Pascal Bach wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>

What changed in LIC_FILES_CHKSUM files? Describe it in commit message.

> ---
>  ...do_not_override_compiler_and_do_not_strip.patch | 25 +++++++++++-----=
------
>  .../p7zip/{p7zip_9.20.1.bb =3D> p7zip_15.14.1.bb}    |  9 ++++----
>  2 files changed, 17 insertions(+), 17 deletions(-)
>  rename meta-oe/recipes-extended/p7zip/{p7zip_9.20.1.bb =3D> p7zip_15.14.=
1.bb} (71%)
>=20
> diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compile=
r_and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_over=
ride_compiler_and_do_not_strip.patch
> index a3b02c5..b0a560f 100644
> --- a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_d=
o_not_strip.patch
> +++ b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_d=
o_not_strip.patch
> @@ -7,25 +7,24 @@ Upstream-Status: Pending
>  Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
>  Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
> =20
> -Index: p7zip_9.20.1/makefile.machine
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- p7zip_9.20.1/makefile.machine	2011-03-13 12:54:57.000000000 +0100
> -+++ p7zip_9.20.1/makefile.machine	2015-02-03 08:39:44.427696944 +0100
> -@@ -4,14 +4,14 @@
> +diff -Nurp p7zip_15.14.1_orig/makefile.machine p7zip_15.14.1/makefile.ma=
chine
> +--- p7zip_15.14.1_orig/makefile.machine	2016-03-23 20:37:47.000000000 +0=
100
> ++++ p7zip_15.14.1/makefile.machine	2016-06-17 15:33:39.720454477 +0200
> +@@ -2,7 +2,7 @@
> + # makefile for Linux (x86, PPC, alpha ...)
> + #
>  =20
> - OPTFLAGS=3D-O
> +-OPTFLAGS=3D-O -s
> ++OPTFLAGS=3D-O
>  =20
> --ALLFLAGS=3D${OPTFLAGS} -pipe -s \
> -+ALLFLAGS=3D${OPTFLAGS} -pipe \
> + ALLFLAGS=3D${OPTFLAGS} -pipe \
>       	-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE \
> - 	-DNDEBUG -D_REENTRANT -DENV_UNIX \
> +@@ -10,8 +10,6 @@ ALLFLAGS=3D${OPTFLAGS} -pipe \
>   	-D_7ZIP_LARGE_PAGES \
>   	$(LOCAL_FLAGS)
>  =20
> --CXX=3Dg++ $(ALLFLAGS)
> --CC=3Dgcc $(ALLFLAGS)
> -+CXX+=3D$(ALLFLAGS)
> -+CC+=3D$(ALLFLAGS)
> +-CXX=3Dg++
> +-CC=3Dgcc
>   CC_SHARED=3D-fPIC
>   LINK_SHARED=3D-fPIC -shared
>  =20
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/rec=
ipes-extended/p7zip/p7zip_15.14.1.bb
> similarity index 71%
> rename from meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> rename to meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
> index b89fc42..8e2e241 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_15.14.1.bb
> @@ -1,13 +1,14 @@
>  SUMMARY =3D "7-zip is a commandline utility handling 7z archives."
>  HOMEPAGE =3D "http://www.7-zip.org/"
>  LICENSE =3D "LGPL-2.1+ & unRAR"
> -LIC_FILES_CHKSUM =3D "file://DOCS/copying.txt;md5=3Decfc54c9e37b63ac5890=
0061ce2eab5a \
> -                    file://DOCS/unRarLicense.txt;md5=3D9c87ddde469ef94ae=
d153b0951d088de"
> +LIC_FILES_CHKSUM =3D "file://DOC/copying.txt;md5=3D4fbd65380cdd255951079=
008b364516c \
> +                    file://DOC/unRarLicense.txt;md5=3D9c87ddde469ef94aed=
153b0951d088de \
> +                    file://DOC/License.txt;md5=3D8346bfd0a2fa0987e7a3a51=
2adf84ab9"
> =20
>  SRC_URI =3D "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${=
PV}_src_all.tar.bz2 \
>            file://do_not_override_compiler_and_do_not_strip.patch"
> -SRC_URI[md5sum] =3D "bd6caaea567dc0d995c990c5cc883c89"
> -SRC_URI[sha256sum] =3D "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9=
dee7b66f03cb4782"
> +SRC_URI[md5sum] =3D "92cca093312b5a71a7be7dc7d1d32509"
> +SRC_URI[sha256sum] =3D "699db4da3621904113e040703220abb1148dfef477b55305=
e2f14a4f1f8f25d4"
> =20
>  S =3D "${WORKDIR}/${BPN}_${PV}"
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldkAkQACgkQN1Ujt2V2gBzTMACfS7DUF4qJJ2I2D9DQXJrDsG9B
VhQAniEfqpErNQAb19CnNwDmSj8ByKMY
=wkw2
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
