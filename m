Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 734BD77BDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:46:11 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p52so10450895wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qvJ5ZX9vZkPfbvsD5L4/ojZWLfx67p+2UoWCTds84Tw=;
	b=hC3b9qsu72xogQ9vu1Zm7DZuk1SvazMEiS9oKiLwwk1w7eHkyW6oj2WskIFscLjPSZ
	xwnSmSWdpar2lEkPiVJl2bNtKIwbsHL8g3K3mcR/9vHO/L5suOqXdYWpiHgX5TpkrQyS
	9FiPW2lhsusMcRw0G7tNp1Sma7zKf5obclgYWLAakH55hGxpxaaHKzFhmunUQ6nOma/f
	mt8DJmY3EPv3uBa/2d9uRjrB1Tjeq9NMKb+N9kKJVOtYnAUQTEGzgR9AgbOz4hygcCxM
	uZVL3M3ZMkK6eNf69zDKp/yBUuIpkmvGrSmMlZ55ZvJzt8noqSh/w45CBj1HoMmuNNij
	1RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qvJ5ZX9vZkPfbvsD5L4/ojZWLfx67p+2UoWCTds84Tw=;
	b=bHiscs1YjeB83xOjwBLzZCPbDQG6bwPhXrAfOXmexf7PZoIwTHJccX+UN2/lKpECqy
	llWbDhmDlvWuI1N3G79KZ+gcONynmlUM09FTOuIB83mFtKNp0Eg7jzM0sOzNTO6rYn/w
	vXEmGqcw9GP0pEug88MEiBBx4ErvPloJ/Jq7qy8p6UYlA4vFY13fKxjOa63WxmAhGOW4
	Sw1abOtNc6oUfKBiEW7K1cmw1w70H7G+JBF7IRi1A/1enK2DbVZXMAP56pQP+4KBbDkb
	Tzf9vI/rDC1yYbxO6XeiS7h1PlO5a6MiU8vi6IhEzc/ZVCbUxz1SI9tQPleBq5S7Mnn7
	rqsQ==
X-Gm-Message-State: AFeK/H0aEMkZLa/xVGuAODxmQtchtsULrp3OZaT9Wh3jvTJNAA76HsTDvLzEbOZ39G66UQ==
X-Received: by 10.223.135.252 with SMTP id c57mr4642690wrc.109.1490867173001; 
	Thu, 30 Mar 2017 02:46:13 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	134sm11533135wmj.6.2017.03.30.02.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 02:46:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:46:07 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170330094607.GD3060@jama>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-16-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170320053152.29352-16-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 16/16] libexecinfo: Add recipe
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
X-List-Received-Date: Thu, 30 Mar 2017 09:46:12 -0000
X-Groupsio-MsgNum: 65982
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2017 at 10:31:52PM -0700, Khem Raj wrote:
> This package is handy especially with musl to port
> apps which use glibc backtrace APIs

Fails to build here:
http://errors.yoctoproject.org/Errors/Details/138496/

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-makefile-Fix-build-on-linux.patch         | 59 ++++++++++++++++
>  ...x-compiler-errors-found-with-newer-gcc-cl.patch | 79 ++++++++++++++++=
++++++
>  .../libexecinfo/libexecinfo_1.1.bb                 | 27 ++++++++
>  3 files changed, 165 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo/0001=
-makefile-Fix-build-on-linux.patch
>  create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo/0002=
-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
>  create mode 100644 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.=
bb
>=20
> diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefi=
le-Fix-build-on-linux.patch b/meta-oe/recipes-extended/libexecinfo/libexeci=
nfo/0001-makefile-Fix-build-on-linux.patch
> new file mode 100644
> index 000000000..f1863f14b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-=
build-on-linux.patch
> @@ -0,0 +1,59 @@
> +From 910bbc2cb6cc1cfa6deed9d170da02a639902c7c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 19 Mar 2017 16:14:54 -0700
> +Subject: [PATCH 1/2] makefile: Fix build on linux
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 33 +++++++++++++++++----------------
> + 1 file changed, 17 insertions(+), 16 deletions(-)
> +
> +Index: libexecinfo-1.1/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libexecinfo-1.1.orig/Makefile
> ++++ libexecinfo-1.1/Makefile
> +@@ -23,24 +23,25 @@
> + # SUCH DAMAGE.
> + #
> + # $Id: Makefile,v 1.3 2004/07/19 05:19:55 sobomax Exp $
> ++#
> ++# Linux Makefile by Matt Smith <mcs@darkregion.net>, 2011/01/04
> +=20
> +-LIB=3D	execinfo
> +-
> +-SRCS=3D	stacktraverse.c stacktraverse.h execinfo.c execinfo.h
> +-
> +-INCS=3D	execinfo.h
> +-
> +-SHLIB_MAJOR=3D	1
> +-SHLIB_MINOR=3D	0
> +-
> +-NOPROFILE=3D	yes
> +-
> +-DPADD=3D		${LIBM}
> +-LDADD=3D		-lm
> +-
> +-#WARNS?=3D	4
> +-
> +-#stacktraverse.c: gen.py
> +-#	./gen.py > stacktraverse.c
> ++CC?=3Dcc
> ++AR?=3Dar
> ++EXECINFO_CFLAGS=3D$(CFLAGS) -O2 -pipe -fno-strict-aliasing -std=3Dgnu99=
 -fstack-protector -c
> ++EXECINFO_LDFLAGS=3D$(LDFLAGS)
> ++
> ++all: static dynamic
> ++
> ++static:
> ++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c
> ++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c
> ++	$(AR) rcs libexecinfo.a stacktraverse.o execinfo.o
> ++
> ++dynamic:
> ++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse=
=2Ec -o stacktraverse.So
> ++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c -o=
 execinfo.So
> ++	$(CC) -shared -Wl,-soname,libexecinfo.so.1 -o libexecinfo.so.1 $(EXECI=
NFO_LDFLAGS) stacktraverse.So execinfo.So
> +=20
> +-.include <bsd.lib.mk>
> ++clean:
> ++	rm -rf *.o *.So *.a *.so
> diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execin=
fo-Fix-compiler-errors-found-with-newer-gcc-cl.patch b/meta-oe/recipes-exte=
nded/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-n=
ewer-gcc-cl.patch
> new file mode 100644
> index 000000000..423b67082
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-=
compiler-errors-found-with-newer-gcc-cl.patch
> @@ -0,0 +1,79 @@
> +From 0810817773fb81d7383d2fa8464244c8f79845fb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 19 Mar 2017 16:16:18 -0700
> +Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/=
clang
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + execinfo.c | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/execinfo.c b/execinfo.c
> +index 906fb14..9448b60 100644
> +--- a/execinfo.c
> ++++ b/execinfo.c
> +@@ -69,7 +69,8 @@ backtrace(void **buffer, int size)
> + char **
> + backtrace_symbols(void *const *buffer, int size)
> + {
> +-    int i, clen, alen, offset;
> ++    size_t clen, alen;
> ++    int i, offset;
> +     char **rval;
> +     char *cp;
> +     Dl_info info;
> +@@ -78,7 +79,6 @@ backtrace_symbols(void *const *buffer, int size)
> +     rval =3D malloc(clen);
> +     if (rval =3D=3D NULL)
> +         return NULL;
> +-    (char **)cp =3D &(rval[size]);
> +     for (i =3D 0; i < size; i++) {
> +         if (dladdr(buffer[i], &info) !=3D 0) {
> +             if (info.dli_sname =3D=3D NULL)
> +@@ -92,14 +92,14 @@ backtrace_symbols(void *const *buffer, int size)
> +                    2 +                      /* " <" */
> +                    strlen(info.dli_sname) + /* "function" */
> +                    1 +                      /* "+" */
> +-                   D10(offset) +            /* "offset */
> ++                   10 +                     /* "offset */
> +                    5 +                      /* "> at " */
> +                    strlen(info.dli_fname) + /* "filename" */
> +                    1;                       /* "\0" */
> +             rval =3D realloc_safe(rval, clen + alen);
> +             if (rval =3D=3D NULL)
> +                 return NULL;
> +-            snprintf(cp, alen, "%p <%s+%d> at %s",
> ++            snprintf((char *) rval + clen, alen, "%p <%s+%d> at %s",
> +               buffer[i], info.dli_sname, offset, info.dli_fname);
> +         } else {
> +             alen =3D 2 +                      /* "0x" */
> +@@ -108,12 +108,15 @@ backtrace_symbols(void *const *buffer, int size)
> +             rval =3D realloc_safe(rval, clen + alen);
> +             if (rval =3D=3D NULL)
> +                 return NULL;
> +-            snprintf(cp, alen, "%p", buffer[i]);
> ++            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
> +         }
> +-        rval[i] =3D cp;
> +-        cp +=3D alen;
> ++        rval[i] =3D (char *) clen;
> ++        clen +=3D alen;
> +     }
> +=20
> ++    for (i =3D 0; i < size; i++)
> ++        rval[i] +=3D (long) rval;
> ++
> +     return rval;
> + }
> +=20
> +@@ -155,6 +158,6 @@ backtrace_symbols_fd(void *const *buffer, int size, =
int fd)
> +                 return;
> +             snprintf(buf, len, "%p\n", buffer[i]);
> +         }
> +-        write(fd, buf, len - 1);
> ++        write(fd, buf, strlen(buf));
> +     }
> + }
> +--=20
> +2.12.0
> +
> diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/me=
ta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
> new file mode 100644
> index 000000000..48d14dd62
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
> @@ -0,0 +1,27 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "A quick-n-dirty BSD licensed clone of the GNU libc back=
trace facility."
> +HOMEPAGE =3D "http://www.freshports.org/devel/libexecinfo"
> +LIC_FILES_CHKSUM =3D "file://execinfo.c;endline=3D25;md5=3D85bd3fa4ea9ac=
ae5182e29db063fe2e5"
> +LICENSE =3D "BSD-2-Clause"
> +SECTION =3D "libs"
> +DEPENDS =3D ""
> +
> +SRC_URI =3D "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.t=
ar.bz2 \
> +           file://0001-makefile-Fix-build-on-linux.patch \
> +           file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc=
-cl.patch \
> +           "
> +SRC_URI[md5sum] =3D "8e9e81c554c1c5d735bc877448e92b91"
> +SRC_URI[sha256sum] =3D "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26=
913a4c19d8a59b1f"
> +
> +CFLAGS +=3D "-fno-omit-frame-pointer"
> +
> +do_install() {
> +    install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
> +    install -D -m 0744 ${S}/stacktraverse.h ${D}${includedir}/stacktrave=
rse.h
> +    install -D -m 0744 ${B}/libexecinfo.a ${D}${libdir}/libexecinfo.a
> +    install -D -m 0755 ${B}/libexecinfo.so.1 ${D}${libdir}/libexecinfo.s=
o.1
> +    ln -s libexecinfo.so.1 ${D}${libdir}/libexecinfo.so
> +}
> +
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNzT3gAKCRA3VSO3ZXaA
HOF4AJ9SmsnKfqFrc8AiUG2+Xbu+lNAH2QCcCikI0IlbQJ7cgdn6M2djyNmyVJo=
=C01G
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
