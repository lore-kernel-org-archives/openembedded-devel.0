Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 25C5E7027B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 01:05:05 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so4320861wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 18:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0K1+GS6ni+Bi7yWDfQm0/ADoBdbsxMNiNsbvxo1+u0Q=;
	b=Ub0l1AHvbvDC1V1YMNTrs/MIkgVzp5iPiqu17b5wv0J5SwzRd4FaFi5xA19jE1/szS
	HXryL1us6/mMhTUR4e8PvqFflzqbJ4/LK1HEG+UdQODriJFtIgiXT0gsmUwhK0TbJ2mT
	Il2NrrsAomyfmaunD169mp1EMChMtMPMnmbQio26YGsZ4ZZ7wMEA5ZFxmic7n1ysFH5t
	kOoOkKKErbVuu7TcLH1EIceumIN9UcX8oTTaAMJoNW//nVEXOS4XVXIem5pohieforkT
	raHqBy7YRFfKTWQn7U4WYhOpKbLgvKApnqDp2yDv8JHTntgXlH0P5nI0vc5a7PTPD95/
	i+zw==
X-Received: by 10.194.71.132 with SMTP id v4mr8437312wju.102.1403312706471;
	Fri, 20 Jun 2014 18:05:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lo18sm9407326wic.1.2014.06.20.18.05.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 18:05:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 03:05:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140621010508.GC2117@jama>
References: <CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Jun 2014 01:05:11 -0000
X-Groupsio-MsgNum: 50488
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pgNHpQPJFoUYTAIP"
Content-Disposition: inline

--pgNHpQPJFoUYTAIP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 08:22:39PM -0400, Kevyn-Alexandre Par=E9 wrote:
> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=E9 wrote:
> >> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL make my
> >> build fail with:
> >> ERROR: qtwebkit not found in the base feeds
> >> LOG: http://pastebin.com/fx2Zi9vW
> >> Any clue what I'm doing wrong?
> >
> > Check which packages (if any) were created by qtwebkit recipe, if any
> > then read log.do_configure for possible clues.
> >
>=20
> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
> pkgdata these only to have ".packaged"
> http://pastebin.com/0ugj2NVF
>=20
> log.do_configure:
> http://pastebin.com/cXWdDXmy

The WebKit build was disabled for the following reasons:
    * ICU is required. To build QtWebKit with Qt 5 you need to build Qt
     5 with libICU support. Check for ICU support being mentioned in
     qtbase/config.summary.

> What's interesting or maybe not is that dgb and dev have empty rpm
> created and not the others?
> log.do_package_write_rpm
> http://pastebin.com/Cft9Uh3J

-dbg and -dev are configured to create empty package
ALLOW_EMPTY_<pkgname>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pgNHpQPJFoUYTAIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOk2kQACgkQN1Ujt2V2gBzF9QCfTTmZdyk4JT2pxA1icA8DjXZf
wZYAn0SfYhqSc2CSphXdxdE2Nbh65nS4
=p9M+
-----END PGP SIGNATURE-----

--pgNHpQPJFoUYTAIP--
