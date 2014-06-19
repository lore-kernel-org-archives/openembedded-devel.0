Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 603706FDEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 21:08:46 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so2866236wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DlaS3qlazfZgQgQFxy9A9bZiKibUKsALkOadO/+u+G8=;
	b=VhQwUCUTqtUkmLJi/J05yAMN5vDx94t1p5Db8W76OVbLCI+8KwfgrDSqJmPPMk7BGO
	y8JUauieV05XALbpJ02VkaVf1hboWfpVxckfUPSKM4gH4bglelX5hJUKjFLDwaS+DD6K
	i9lDfDMI5ETfQHTbOHleNf2JlMFmjo1/DI/0P3Jq3vp5dr8JdGPsX7qX142AUJyaTAhO
	7NqeC7no6Nt8RQGOnbuUsHOKHf4kEDkCc0mkJe5r3cVuszSTNtW80nz2C1WmdFTwf4vv
	7LM6zTLjcRoOt8BEJc0ROFg+Cr97/bFXP11G8lG2QImUb5eQvTi39RWTVW3tFVvqCvpN
	i06g==
X-Received: by 10.180.198.44 with SMTP id iz12mr9428524wic.49.1403212127139;
	Thu, 19 Jun 2014 14:08:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz4sm36590042wib.23.2014.06.19.14.08.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 14:08:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 23:08:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619210847.GT2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Jun 2014 21:08:53 -0000
X-Groupsio-MsgNum: 50461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/7+LvQqw8N5lf/3J"
Content-Disposition: inline

--/7+LvQqw8N5lf/3J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 04:32:17PM -0400, Kevyn-Alexandre Par=E9 wrote:
> Hi Martin,
>=20
> On Thu, Jun 19, 2014 at 3:26 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>=20
> >>   ruby \
> >>   qtbase \
> >>   qtconnectivity \
> >>   qtdeclarative \
> >>   qtgraphicaleffects \
> >>   qtimageformats \
> >>   qtlocation \
> >>   qtmultimedia \
> >>   qtquick1 \
> >>   qtquickcontrols \
> >>   qtscript \
> >>   qtsensors \
> >>   qtserialport \
> >>   qtsvg \
> >>   qtsystems \
> >>   qttools \
> >>   qtwebkit \
> >>   qtwebkit-examples \
> >>   qtx11extras \
> >>   qtxmlpatterns \
> >>   qsiv \
> >>   packagegroup-qt5-qtcreator-debug \
> >>   packagegroup-qt5-toolchain-target \
> >>   meta-toolchain-qt5 \
> >>   maliit-framework-qt5 \
> >>   maliit-plugins-qt5 \
> >>   cinematicexperience \
> >
> > recipe-name !=3D package-name, check which packages were created by tho=
se
> > recipes and include those in your image.
> >
>=20
> Yes still a lot to learn...
>=20
> So I could do
> bitbake qtbase
> ls tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/packages-s=
plit/
> qtbase      qtbase-doc           qtbase-examples-dev
> qtbase-fonts-pfa  qtbase-fonts-ttf-dejavu  qtbase-mkspecs
> qtbase-plugins.shlibdeps  qtbase.shlibdeps  qtbase-tools-dbg
> qtbase-dbg  qtbase-examples      qtbase-examples-staticdev
> qtbase-fonts-pfb  qtbase-fonts-ttf-vera    qtbase-plugins
> qtbase-qmlplugins         qtbase-staticdev  qtbase-tools.shlibdeps
> qtbase-dev  qtbase-examples-dbg  qtbase-fonts
> qtbase-fonts-qpf  qtbase-locale            qtbase-plugins-dbg
> qtbase-qmlplugins-dbg     qtbase-tools
>=20
> or use bitbake -e qtbase | grep PACKAGES=3D
>=20
> Other solutions?

buildhistory is great tool

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/7+LvQqw8N5lf/3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOjUV8ACgkQN1Ujt2V2gBy28QCdH3Ak2G3Z0BZTW2hPzyuGU4na
RfoAnRWRNqTjEKO8HnVotBabsLsZcOVW
=WVlK
-----END PGP SIGNATURE-----

--/7+LvQqw8N5lf/3J--
