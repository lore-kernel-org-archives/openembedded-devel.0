Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7B170233
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 08:13:05 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so3431840wes.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vtY/66UhBKA9qUDKqfRmjlYRtCSbLWXjj+Qk2aJxBA0=;
	b=yaM/onoCCaocUsZl/SzJNlP2TAsKhfyKZjHmx+b5rxpwr2wZ2EUDt1lOYTOFPuVB8e
	VUEAxkI3tn+aLNWzfICvkNZ9oGjAzxdAR0OMwft4A5jkPe9ZyzMwRzrlet1SoXXe/WdS
	i6p/sH6sd1/EEzoH68XmDO6C1s24tHPA9fQYP5XjSuuD8mgTwlXKaOhJknJ07LzaNOXu
	H6iKyo4Khg245OuDy4IFECINsGxRhRFEq8ZtSrpr1HN26rHpI4GjHYySjArv+eSqtKS+
	hptJV4688HLaTkNtUEmo9NNnVjk76vl7PsUWI4Cbo3Y9Yp3lriOXHSVRLuDiHMAv64Sj
	CBwQ==
X-Received: by 10.180.82.199 with SMTP id k7mr2224006wiy.34.1403251986404;
	Fri, 20 Jun 2014 01:13:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj2sm2482626wib.11.2014.06.20.01.13.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 01:13:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Jun 2014 10:13:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140620081307.GW2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 08:13:15 -0000
X-Groupsio-MsgNum: 50472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sL7C0a98p/u5aVah"
Content-Disposition: inline

--sL7C0a98p/u5aVah
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 08:38:19PM -0400, Kevyn-Alexandre Par=E9 wrote:
> On Thu, Jun 19, 2014 at 7:21 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Jun 19, 2014 at 07:06:08PM -0400, Kevyn-Alexandre Par=E9 wrote:
> >> I'm a bit further but still have some interrogations?
> >>
> >> ERROR: qtwebkit not found in the base feeds (overo armv7a-vfp-neon
> >> armv7a-vfp armv7a armv6-vfp armv6 armv5e-vfp armv5e armv5-vfp armv5
> >> armv4 arm noarch any all)
> >>
> >> I'm having these included in my image:
> >>
> >>   ruby \
> >>   qtbase \
> >>   qtbase-fonts \
> >>   qtbase-fonts-ttf-vera \
> >>   qtbase-fonts-ttf-dejavu \
> >>   qtbase-fonts-pfa \
> >>   qtbase-fonts-pfb \
> >>   qtbase-fonts-qpf \
> >>   qtbase-tools-dbg \
> >>   qtbase-plugins-dbg \
> >>   qtbase-tools \
> >>   qtbase-plugins \
> >>   qtbase-mkspecs \
> >>   qtbase-dev \
> >>   qtdeclarative-qmlplugins-dbg \
> >>   qtdeclarative-tools-dbg \
> >>   qtdeclarative-plugins-dbg \
> >>   qtdeclarative-qmlplugins \
> >>   qtdeclarative-tools \
> >>   qtdeclarative-plugins \
> >>   qtdeclarative-mkspecs \
> >>   qtdeclarative-dbg \
> >>   qtdeclarative-dev \
> >>   qtdeclarative \
> >>   qtquick1-qmlplugins-dbg \
> >>   qtquick1-tools-dbg \
> >>   qtquick1-plugins-dbg \
> >>   qtquick1-qmlplugins \
> >>   qtquick1-tools \
> >>   qtquick1-plugins \
> >>   qtquick1-mkspecs \
> >>   qtquick1-dbg \
> >>   qtquick1-dev \
> >>   qtquick1 \
> >>   qttools-tools-dbg \
> >>   qttools-tools \
> >>   qttools-mkspecs \
> >>   qttools-dbg \
> >>   qttools-dev \
> >>   qttools \
> >>   qtwebkit \
> >>
> >> [1] Why the bitbake qtwebkit is working but not when I'm including it
> >> in my image?
> >
> > What PACKAGECONFIG values are you using (especially for qtbase)?
>=20
> Sorry for a lot of newbie questions... But I have not play with PACKAGECO=
NFIG
> I didn't change PACKAGECONFIG. The only thing I was doing was to add
> previous list of packages to IMAGE_INSTALL +=3D
>=20
> >
> > carefully read comments in qtbase.inc
> >
>=20
> Reading it make me remember that what I want to do, enable qtquick,
> that depends on qtquick1.inc:
>=20
> DEPENDS +=3D "qtscript qtsvg qtxmlpatterns qtwebkit"
>=20
> I thought that simply adding them to the IMAGE_INSTALL will be enough
>=20
> Then in qtbase.inc:
>=20
> # separate some parts of PACKAGECONFIG which are often changed
> # be aware that you need to add icu to build qtwebkit, default
> # PACKAGECONFIG is kept rather minimal for people who don't need
> # stuff like webkit (and it's easier to add options than remove)
>=20
> So could this be because I'm not adding the icu?
>=20
> PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"
>=20
> So from a old email you respond:
> https://www.mail-archive.com/yocto@yoctoproject.org/msg16316.html
>=20
> I think that if I want to enable the icu I need to add???
> PACKAGECONFIG vim ??=3D "icu" in my local.conf or could I add it
> somewhere else? like in the recipe of my image?

PACKAGECONFIG_append_pn-qtbase =3D " icu"

You'll probably want also gl and accessibility.

> Still confuse about that part...
>=20
> BR,
>=20
> -KA
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sL7C0a98p/u5aVah
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOj7RMACgkQN1Ujt2V2gBz3BQCfTNxKm3wvH27CbqNEEKRjUxWM
dn0AoIXTcVtOBvgePKrK138ENfI6TYU1
=ZwMy
-----END PGP SIGNATURE-----

--sL7C0a98p/u5aVah--
