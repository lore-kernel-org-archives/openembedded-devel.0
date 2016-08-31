Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA516FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:35:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d196so3870061wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WsFnJhsLq9dXGYX+9bLV7En8yT1Klm8irntwteGEhbM=;
	b=zazyocdNAvoND/1oqP9pPj0vKn7vybryXKKFHemD+Z+H8HCtS4oaZGXKzmw8ft/Oxj
	fkwqPdrq8IjwhYSakLLN+OfHPjiWsR6GkKFE9ii4cQ1iCPCKdcDykfe2Vx+njc6kzMO4
	TzVrp1mJu10OGpzhxAxsu6gEUQfLWw9HhLW6XIEmk7nkTnCH15PgudfiafXe4KFmKmb+
	znVtGqYmNHhnkOKwaHKNz+Pe+/GbcwRqpgztTLSjkO+ZTbl84P34TZ+gpeIda2d1f2kS
	CwZY9CsCji5YQCVtsLRIe7sJLiE0uPLJdZkzwkf/avAVaK2VLCAatphmpzgFnHYjPJnv
	W46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WsFnJhsLq9dXGYX+9bLV7En8yT1Klm8irntwteGEhbM=;
	b=crR+OcP6vIdVM9c+b/4hkNsA1d9e4t7c0myphdZMTkEJMM5dA3LuGHxnq4l8Ac/0mg
	T/7DATtHStXdAqqfcyaI8DCYUzDiJI9aW2b+CSgAtdHIGCYYLRd7mHgyP9WogC3l90lx
	X/3JUYTwnrpfJAe9X81QjTeObkDfsx33ciFFDkiWmP6RsrREfI1aXPt5DwlxjIr88tKY
	aLrd8CFOPuq5wYu1ZEprwjrv3hGKAdNdRfXpVpQpwarC5ugcmiOIlS3VVmhEYoAsfLaW
	wy/nH0EXytndnTVOmD5eS/WTZdsNCXIeGrgEYxpNUgs3GsBJOWCQ0zZH4tAvnvd417ji
	eR8Q==
X-Gm-Message-State: AE9vXwMky3g/hgRSPcQFbudllx35lcJ2ad+B793gWvz7j19tq4SgIF8sQpcHQMwiNU9M4Q==
X-Received: by 10.194.77.142 with SMTP id s14mr8939383wjw.77.1472654131029;
	Wed, 31 Aug 2016 07:35:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d64sm9264552wmc.22.2016.08.31.07.35.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 07:35:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 16:35:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831143530.gy6guxm6rlbhhr6m@jama>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<1472546366.8449.19.camel@andred.net>
	<CALbNGRSJx4MD=SekttxB7H1PjEUTgaQfCnBtXu+t-YGX9BKVLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSJx4MD=SekttxB7H1PjEUTgaQfCnBtXu+t-YGX9BKVLw@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Wed, 31 Aug 2016 14:35:32 -0000
X-Groupsio-MsgNum: 62900
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g6gyta6dpgpaa7yx"
Content-Disposition: inline

--g6gyta6dpgpaa7yx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2016 at 10:41:29AM +0200, Andreas M=FCller wrote:
> On Tue, Aug 30, 2016 at 10:39 AM, Andr=E9 Draszik <git@andred.net> wrote:
> > On Mo, 2016-08-29 at 22:52 +0200, Martin Jansa wrote:
> >> * since last changes in oe-core LICENSE variable needs to list all
> >> licenses used
> >>   by individual packages otherwise bitbake warning like this is shown:
> >>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
> >> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (GP=
Lv3)
> >> that are not listed in LICENSE
> >>   as possible improvement you can set LICENSE to GPLv2 to all plugins
> >>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
> >>   GPLv3 which sucks as described here:
> >>   https://www.mail-archive.com/openembedded-core@lists.openembedded.or=
g/ms
> >> g81645.html
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/me=
ta-
> >> oe/recipes-devtools/geany/geany-plugins_1.27.bb
> >> index 9a39150..5e1e721 100644
> >> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> >> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> >> @@ -1,7 +1,7 @@
> >>  DESCRIPTION =3D "A fast and lightweight IDE"
> >>  HOMEPAGE =3D "http://plugins.geany.org/"
> >>  # majority's default
> >
> >      ^^^^^^^^^^
> > To avoid confusion, it'd be good to remove this comment as well as it's=
 not
> > only the majority of licenses anymore
> >
> > Cheers,
> > Andre'
> >
> >
> >> -LICENSE =3D "GPLv2"
> >> +LICENSE =3D "GPLv2 & GPLv3"
> >>
> >>  DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-native
> >> libassuan gpgme"
> >>
> >> --
> >> 2.9.2
> >>
> And probably a note that 90% of license information is wrong...

There are more issues in geany-plugins:

geany-plugins-1.27: geany-plugins: Files/directories were installed but not=
 shipped in any package:
  /usr/lib/geany/git-changebar.so
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
geany-plugins: 1 installed and not shipped files. [installed-vs-shipped]
geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't a=
 build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it isn'=
t a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it isn=
't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-dep=
s]

It would be nice if someone actually using it send some fixes.

If nobody does in next week, I'll add PNBLACKLIST.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g6gyta6dpgpaa7yx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfG6zEACgkQN1Ujt2V2gBz4jACfTW1XHG8bCPAUoGbRLseONtvY
TxEAoJCufIcV7rFOHDsj2FbObByPra+t
=zgNS
-----END PGP SIGNATURE-----

--g6gyta6dpgpaa7yx--
