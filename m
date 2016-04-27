Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6AFC731EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:48:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so957346wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t75NQRtxz+GhciDauXSK/Wfd0PCw9rK1nOSnXF57vv8=;
	b=0IVDh0YDhbIwyyZqRx8vzYdvXW83VmQsZxyrM7VAq6joZVdvDiwk1Oi7hIRM3ef+p0
	nLg49/odcm/0ZyZGCs5gvfbNP5fhAITbtKiuIwpJksOcXnVH1a43FZj56V+7IBTs+Yiv
	YsOcIjEdzisOt9sJlbh4GzfkwKjNTdjxw4GluIyylEL/JQwlywnybSgwaTcUs9Zn6GFQ
	vYAMV87EFsl1U3QRjTcLWE62Y84489b1fV+h2QrWk+wUe8rTCdBoDyaDfLGX4rB9VXbj
	58pu9UaL5eT7KRIAMg1BjtkXVJvE07Lsop9QJmRdEUGN5q3wtrwmOY8e/5SCInfGpX2r
	x2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t75NQRtxz+GhciDauXSK/Wfd0PCw9rK1nOSnXF57vv8=;
	b=b49q/5rXgweOQ/FwUqYSZHKBbzJ3qVFvwFnvzn7mwP5NsxdXJEujPYAfi2xDZttQ92
	Qty0P0wgBsVBQ9bF1qbv47PA2cBr09NCFBRawQk8wBBjCJU7b+0EDG0xd4lWv7BGxJ9r
	tgssh/90GXGnUkIMlBKHn/yW6CSxX+uoF28uydUksNflRSfoDNz4sC616/AH+/zsZj8C
	j4A0dmnK4UtWzWMX9sQgz8mpVkcED/XDWxN5KhDpScCTKd+5N6yUB4UY4LdtV0zbcHZE
	1+5g3zEUR6Xr+ZUJCdZ66mN5o9mkSS6YyjjtF+udmPNTEj8/NC7CQmOieNTKSB2ccV0o
	ZNaQ==
X-Gm-Message-State: AOPr4FUIrNlAjhsM/jAQtGOESbxqtg/nxWULhNWMB8fTj3WJSZLIQvUty0gQM9DXwgzuRg==
X-Received: by 10.28.171.8 with SMTP id u8mr7770034wme.97.1461743293590;
	Wed, 27 Apr 2016 00:48:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v143sm27787074wmv.4.2016.04.27.00.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 00:48:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 09:48:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427074811.GC2559@jama>
References: <1461351842-8783-1-git-send-email-derek@asterius.io>
	<20160427074500.GA2559@jama>
MIME-Version: 1.0
In-Reply-To: <20160427074500.GA2559@jama>
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
X-List-Received-Date: Wed, 27 Apr 2016 07:48:14 -0000
X-Groupsio-MsgNum: 61196
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 09:45:00AM +0200, Martin Jansa wrote:
> On Fri, Apr 22, 2016 at 03:04:02PM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb | 17 -----------=
------
> >  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 17 +++++++++++=
++++++
> >  2 files changed, 17 insertions(+), 17 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.=
bb
> >  create mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.=
bb
> >=20
> > diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/me=
ta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> > deleted file mode 100644
> > index cb4bc24..0000000
> > --- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -SUMMARY =3D "Fribidi library for bidirectional text"
> > -SECTION =3D "libs"
> > -PR =3D "r1"
> > -LICENSE =3D "LGPLv2.1"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb9=
03e34"
> > -BBCLASSEXTEND =3D "native"
> > -
> > -PROVIDES =3D "libfribidi"
> > -
> > -inherit autotools lib_package pkgconfig
> > -
> > -CFLAGS_append =3D "  -DPAGE_SIZE=3D4096 "
> > -
> > -SRC_URI =3D "http://fribidi.org/download/fribidi-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] =3D "626db17d2d99b43615ad9d12500f568a"
> > -SRC_URI[sha256sum] =3D "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f=
300e2af12f44f64177"
> > diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/me=
ta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> > new file mode 100644
> > index 0000000..02b8764
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Fribidi library for bidirectional text"
> > +SECTION =3D "libs"
> > +PR =3D "r1"
>=20
> You can drop PR when upgrading PV.
>=20
> Probably this change caused fbreader to fail:
> | Compiling ZLTextParagraphBuilder.o ...In file included from /home/jenki=
ns/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/fribidi/fribidi=
=2Eh:35:0,
> |                  from ZLTextParagraphBuilder.h:26,
> |                  from ZLTextParagraphBuilder.cpp:30:
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/=
fribidi/fribidi-common.h:61:20: fatal error: glib.h: No such file or direct=
ory
> | compilation terminated.
> | make[2]: *** [ZLTextParagraphBuilder.o] Error 1
> | make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork/armv5te-oe-linux-gnueabi/fbreader/0.12.10-r1/fbreader-0.12.10/zlibrary/=
text/src/area'
> | make[1]: *** [.objects] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork/armv5te-oe-linux-gnueabi/fbreader/0.12.10-r1/fbreader-0.12.10/zlibrary/=
text'
> | make: *** [all] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/fbreader/0.12.1=
0-r1/temp/log.do_compile.29262)
> NOTE: recipe fbreader-0.12.10-r1: task do_compile: Failed
>=20
> Can you check if fribidi should depend on glib-2.0 now? And also please s=
end v2 with -M (adjust the -M parameter to detect rename if you used -M bef=
ore).

There is also undeclared dependency on libpcre as shown by QA warnings:

fribidi-0.19.7: fribidi-bin rdepends on glib-2.0, but it isn't a build
dependency, missing glib-2.0 in DEPENDS or PACKAGECONFIG? [build-deps]
fribidi-0.19.7: fribidi rdepends on libpcre, but it isn't a build
dependency, missing libpcre in DEPENDS or PACKAGECONFIG? [build-deps]
fribidi-0.19.7: fribidi rdepends on glib-2.0, but it isn't a build
dependency, missing glib-2.0 in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> Also add short summary explaining what was changed in COPYING change when=
 you're changing its checksum.
>=20
> > +LICENSE =3D "LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb7424=
769c7"
> > +BBCLASSEXTEND =3D "native"
> > +
> > +PROVIDES =3D "libfribidi"
> > +
> > +inherit autotools lib_package pkgconfig
> > +
> > +CFLAGS_append =3D "  -DPAGE_SIZE=3D4096 "
> > +
> > +SRC_URI =3D "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
> > +
> > +SRC_URI[md5sum] =3D "6c7e7cfdd39c908f7ac619351c1c5c23"
> > +SRC_URI[sha256sum] =3D "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc=
66571ad2a670595a8e"
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgbrsACgkQN1Ujt2V2gByjGQCfQHv9VhrlpgHx3E7FGueFf1Gk
QYcAoI1/Vl8bLUaBE9sRCXr9pC8EU0fO
=PBVA
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
