Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 255EC731D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 12:17:19 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g17so24235151wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=y2SQhfiQRi9RUejEajaVwXFYi1A4IyuLNaOnP/3v3qg=;
	b=TiZXyWYg6hzS7x3Gq9H5rdXM8gSD2E+Bn4l5Y9qyJTVhNF03XDLMZjQCXKPophLGAs
	/lLPvOGptr809j3f/HhZdUQ/WnIkc7vGwHqpKQL3ioTMkxYUVD/YCCqYiadxXZsWKMmU
	ZvkomKOfJBoblqXOXPM2cmHtgWimLtoi1xuIud2p5Xt1YSFnt4pPlWkMf7balyj8AK0K
	RHXuIccD+/Pn5bkn0+n0MOuC2QLpjEqcYVE55Ugr9yzJ9irWf4kpJPUz9kW5KGj7E3p4
	tVqtMstbfp9xQsAGP9owKODmJOmeg0gebXNNv0C1cP488CS7cZ0h6dtSlmToyw4hboXr
	QaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=y2SQhfiQRi9RUejEajaVwXFYi1A4IyuLNaOnP/3v3qg=;
	b=KgC63fo1YPWht+vlKuVlVoe05NXPfclywdBV9wDYoRZaeokV1dp7vyNLpKmCyyG0U7
	smkbksIAJVPwT5xLg/SGWmTv0//4SfXj/LgrbO6ShtDgsvMf2Vt1haQwqe3i71chcC5D
	g99QYgAUCzHiAPdWL3et3xVyUd9pcEtCS6A/K/jrZTlGYkuhVlPym1D8vJdWzzR7vQMa
	PAdzzd3cx4YG0TSwkHhMjXZnUZ1wnplqQgwNlAXuolzWNhCNYtEPdfJ2obMuhNqA30xg
	0C0vvIvzMbwM6LWIVvo1VQpK3IC7JnaG5zGcr2DUVbxXzd63NGtL/AqkuEQ8p5O7cI+e
	q6jQ==
X-Gm-Message-State: AOPr4FUt22+ZgkauvRxPz2otn7FN9Tmf3o2O7DEDrGkSotkoBgmpni25rLWUThB4eM9JHA==
X-Received: by 10.28.11.82 with SMTP id 79mr16550310wml.33.1462882639638;
	Tue, 10 May 2016 05:17:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b22sm2681605wmb.9.2016.05.10.05.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 05:17:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 May 2016 14:17:40 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160510121740.GA5675@jama>
References: <1462604487-112658-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1462604487-112658-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: koen.kooi@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V4 0/3] efivar: update to 0.23
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
X-List-Received-Date: Tue, 10 May 2016 12:17:22 -0000
X-Groupsio-MsgNum: 61450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 07, 2016 at 03:01:24AM -0400, Hongxu Jia wrote:
> Changed in V4:
>=20
> - Fix one failed with:
> | install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
> | install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
> ;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
> ;
> | install: cannot stat 'efivar.pc': No such file or directory
> | install: cannot stat 'efiboot.pc': No such file or directory
> | make[1]: *** [install] Error 1
> | make[1]: Leaving directory `efivar/0.23-r0/git/src'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed
>=20
> - Sync with latest upsteam
> Hi Martin,
>=20
> About your original build failed with:
> | i586-oe-linux-gcc  -m32 -march=3Di586
> --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
> -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/efivar/0.23-r0/git=3D/usr/src/efivar
> -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/efivar/0.23-r0/git=3D/usr/src/efivar
> -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x=
86_64-linux=3D
> -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/q=
emux86=3D
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.2=
3-r0/git/src/include/efivar/
> -specs=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efi=
var/0.23-r0/git/gcc.specs
> -L.  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed     -shared \
> | 	  -Wl,-soname,libefivar.so.0 \
> | 	  -o libefivar.so dp.o dp-acpi.o dp-hw.o dp-media.o dp-message.o
> efivarfs.o export.o guid.o guids.o guid-symbols.o lib.o vars.o -ldl
> |
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
> --default-symver: unknown option
> |
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
> use the --help option for usage information
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [libefivar.so] Error 1
> | make[1]: *** Waiting for unfinished jobs....
>=20
> I could not reproduce it, but from the log,
> --default-symver is unknown option. And upstream
> has fixed it in the following commit by removing option
> '--default-symver' from gcc.specs
> ....
> commit 975356c9486ff7fa0ec5534ef56cc6f519ad11b4
> Author: Peter Jones <pjones@redhat.com>
> Date:   Wed Mar 2 14:46:15 2016 -0500
>=20
>     libefivar: get rid of our variadic mess in efi_set_variable()
> ....
>=20
> //Hongxu

No it fails with different unknown option:
http://errors.yoctoproject.org/Errors/Details/61934/
http://errors.yoctoproject.org/Errors/Details/61951/

Maybe it's because my world builds are using gold which could be more
strict when parsing the options.

> The following changes since commit a6c172e2713f0018c5ebac0f957cff28b7ac26=
30:
>=20
>   poppler: add --std=3Dc++11 to fix build with Qt 5.7 (2016-05-06 12:40:2=
8 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib hongxu/fix-efivar
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dhongxu/fix-efivar
>=20
> Hongxu Jia (1):
>   efivar: fix do_install failed
>=20
> Koen Kooi (2):
>   efivar: update to 0.23
>   efibootmgr: update and unblacklist
>=20
>  .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 14 ++---
>  .../efibootmgr/files/ldflags.patch                 | 17 ------
>  .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
>  .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
>  .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++
>  ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------=
------
>  .../efivar/{efivar_0.21.bb =3D> efivar_0.23.bb}      | 28 ++++-----
>  7 files changed, 114 insertions(+), 121 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.pat=
ch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-s=
tatic-build.patch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fi=
x-for-cross-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-op=
tions-not-supported-by-lower-version-gcc.patch
>  rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb =3D> efivar_0.23.=
bb} (46%)
>=20
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcx0WQACgkQN1Ujt2V2gBySHgCeI0TDdF8uR0kCIxPaXV8NPZAd
39kAn1LIqlnCbV2EhjFWt2Rt+m7b03pZ
=5GCb
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
