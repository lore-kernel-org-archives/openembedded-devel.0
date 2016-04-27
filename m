Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C77C65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:44:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w143so10226178wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BGIc39VemP3GPa5OtrQ2QwUYyfXbTARCdLM6H+bgsTs=;
	b=tPAJp4Yn7X8yxmufwt3dYiGX6pPZUJg2O4+WGSqgEFybPRyj0AxT/3yhjYUS+mR749
	M0GJAvd9lxxMiwSLRtzwXUpU23IA5aP4pk3GKmQ5bPzcLq+hLFnM62Or5jpQMhQ8YUMN
	LZpZo5SwCGLXJRYR3LodHACWyuOzG28ZGkzhgBNCGBy2JgYQ2XwFZzPxTAfKewx54auS
	dyMLwUMcuaW3Ah45NmnGOVH/YdMvtZx7ExUn0ovZrDXEaqMIwcUAp/EYbHaDP9F7wbrN
	eWNTaqcRJtmqJRdHY9Z1UeNVg/8qOJhwx7zh2wsYIujpZjzDH39ffeMazEUnaRwDecEh
	L/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BGIc39VemP3GPa5OtrQ2QwUYyfXbTARCdLM6H+bgsTs=;
	b=NljtidHuSBFesp53nJ9VvbRqQ1s96PFsOn/LTkiiq9wVgulZNNpJehSAaAG3R7CXn1
	eoGoS2h5OdpCVOCguHmBUIuuO15mH42J3z147QYHIpdud9JD3O8m/zEUpqDAUKHANbA3
	PmJFYhTfOudFBWeWH5el0Y8D/Vxp3MAnuMnIxmliJ/g6VXA+aLrjTyuYO0Tbs8y7rOzE
	gMT7Wjcb5AtjRZnmvi3BIoBBUTTbP3toFyFWDLlDmeiSrP5d6l2cA+O1U02GwL9Edqgk
	CDJ4wqwY8i3L8VHVpEP8edMD8bPKSqfZz3VFKfw90TTeymsXhD6frEJYVole/U/R13s5
	iupA==
X-Gm-Message-State: AOPr4FW+XA19wH1Px+Cs7w/LPiuwhluho/3GIpo9fSHw+wX4wRce1xH9SsxnKvLIIENFfQ==
X-Received: by 10.28.177.132 with SMTP id a126mr21895117wmf.86.1461743070563; 
	Wed, 27 Apr 2016 00:44:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n3sm2596529wja.6.2016.04.27.00.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 00:44:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 09:45:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427074500.GA2559@jama>
References: <1461351842-8783-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1461351842-8783-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH] fribidi: update to version 0.19.7
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
X-List-Received-Date: Wed, 27 Apr 2016 07:44:31 -0000
X-Groupsio-MsgNum: 61194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 03:04:02PM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb | 17 -------------=
----
>  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 17 +++++++++++++=
++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
>  create mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
>=20
> diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/meta=
-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> deleted file mode 100644
> index cb4bc24..0000000
> --- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "Fribidi library for bidirectional text"
> -SECTION =3D "libs"
> -PR =3D "r1"
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
> -BBCLASSEXTEND =3D "native"
> -
> -PROVIDES =3D "libfribidi"
> -
> -inherit autotools lib_package pkgconfig
> -
> -CFLAGS_append =3D "  -DPAGE_SIZE=3D4096 "
> -
> -SRC_URI =3D "http://fribidi.org/download/fribidi-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "626db17d2d99b43615ad9d12500f568a"
> -SRC_URI[sha256sum] =3D "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f30=
0e2af12f44f64177"
> diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/meta=
-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> new file mode 100644
> index 0000000..02b8764
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Fribidi library for bidirectional text"
> +SECTION =3D "libs"
> +PR =3D "r1"

You can drop PR when upgrading PV.

Probably this change caused fbreader to fail:
| Compiling ZLTextParagraphBuilder.o ...In file included from /home/jenkins=
/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/fribidi/fribidi.h=
:35:0,
|                  from ZLTextParagraphBuilder.h:26,
|                  from ZLTextParagraphBuilder.cpp:30:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/fr=
ibidi/fribidi-common.h:61:20: fatal error: glib.h: No such file or directory
| compilation terminated.
| make[2]: *** [ZLTextParagraphBuilder.o] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/fbreader/0.12.10-r1/fbreader-0.12.10/zlibrary/te=
xt/src/area'
| make[1]: *** [.objects] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/fbreader/0.12.10-r1/fbreader-0.12.10/zlibrary/te=
xt'
| make: *** [all] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/fbreader/0.12.10-=
r1/temp/log.do_compile.29262)
NOTE: recipe fbreader-0.12.10-r1: task do_compile: Failed

Can you check if fribidi should depend on glib-2.0 now? And also please sen=
d v2 with -M (adjust the -M parameter to detect rename if you used -M befor=
e).

Also add short summary explaining what was changed in COPYING change when y=
ou're changing its checksum.

> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
> +BBCLASSEXTEND =3D "native"
> +
> +PROVIDES =3D "libfribidi"
> +
> +inherit autotools lib_package pkgconfig
> +
> +CFLAGS_append =3D "  -DPAGE_SIZE=3D4096 "
> +
> +SRC_URI =3D "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "6c7e7cfdd39c908f7ac619351c1c5c23"
> +SRC_URI[sha256sum] =3D "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66=
571ad2a670595a8e"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgbe8ACgkQN1Ujt2V2gBxpnwCeKpeqh8uMzWhJZfsL7cduyhDY
MEQAni3RPUvISX8xIDam6USUAB60P/an
=fGbE
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
