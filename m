Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 907FC6CABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:16:53 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so3901472eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nNhTjk58XWRA9lxSCaW9TGJnvVsmiSwRPrJecCEXkhA=;
	b=gQsEjEP6DhnS8sUdmyG9HSi9O724w2wJIOo2tOiHcHC3BXWPhTFvCcU28mHJfXPmFI
	9YoY/ZU90kuj4aO0yze01BEW4DoByxjbSATtshlas8dfvqa7xL6QVldtY9ZG28ELXrzX
	viW5JvHK2PLsRkr+a9drG3npzzXqwtEimnGA9bzRejfcYDn73AbdQ+YXXvTUqLIjMQ1M
	/W5BGdE53S8e9XyPYkEbj3jEfub3aQL00ADOvdzZ5hRraTlPllVmyQ/kKfbhOkVlnoX9
	MpTlW2g+08QWKJv3h6xtL2RpIvoVIjZx9YiVwzgqLEdjbQXH0J9iCRzIlazr/+p6pnnu
	ArsA==
X-Received: by 10.14.211.136 with SMTP id w8mr94260eeo.80.1381839415136;
	Tue, 15 Oct 2013 05:16:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id s3sm2560415eeo.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 05:16:54 -0700 (PDT)
Date: Tue, 15 Oct 2013 14:16:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20131015121657.GE3703@jama>
References: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
	<61507A97-CE1F-49BE-BC95-8B8F9AD4D54F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <61507A97-CE1F-49BE-BC95-8B8F9AD4D54F@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 12:16:54 -0000
X-Groupsio-MsgNum: 46729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 02:06:16PM +0200, Koen Kooi wrote:
>=20
> Op 15 okt. 2013, om 13:37 heeft Fathi Boudra <fathi.boudra@linaro.org> he=
t volgende geschreven:
>=20
> > License files changes:
> > + * This file was part of the Independent JPEG Group's software:
> >   * Copyright (C) 1991-1998, Thomas G. Lane.
> >   * Modified 2002-2009 by Guido Vollbeding.
> > - * Copyright (C) 2009-2011, D. R. Commander.
> > - * This file is part of the Independent JPEG Group's software.
> > + * Modifications:
> > + * Copyright (C) 2009-2011, 2013, D. R. Commander.
> >=20
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>=20
> Acked-by: Koen Kooi <koen.kooi@linaro.org>
>=20
> > ---
> > meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
> > 1 file changed, 4 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/r=
ecipes-core/jpeg/libjpeg-turbo_svn.bb
> > index 4fd258f..f18d37d 100644
> > --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > @@ -3,12 +3,11 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
> >=20
> > LICENSE =3D"BSD-3-Clause"
> > LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb=
5b2a0e6457a6cfe21d \
> > -                    file://jpeglib.h;endline=3D14;md5=3D7bb9a39828a1b1=
e84acd4e8aec1e5532 \
> > -                    file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5=
dfc0e21ec902cb33 \
> > +                    file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a=
9f8da313cc4015ed6f \
> > +                    file://djpeg.c;endline=3D13;md5=3D03db065044529233=
c296324be85530ab \
> > "
> > -PV =3D "8d+1.2.1"
> > -PR =3D "r2"
> > -SRCREV =3D "837"
> > +PV =3D "8d+1.3.0"
> > +SRCREV =3D "988"
> > SRC_URI =3D "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-tu=
rbo;protocol=3Dhttps;module=3Dtrunk"

Please update SRC_URI to match new SF layout:
WARNING: Failed to fetch URL
svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=3Dht=
tps;module=3Dtrunk,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
Updating '.':
Redirecting to URL 'https://svn.code.sf.net/p/libjpeg-turbo/code/trunk':

svn: E170009: Repository UUID '632fc199-4ca6-4c93-a231-07263d6284db'
doesn't match expected UUID '3789f03b-4d11-0410-bbf8-ca57d06f2519'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJdMjkACgkQN1Ujt2V2gBzn4ACgglOwqmcu3WjOXa0u75svcZRk
XccAn0f4OAJlXarDJfVWWFrYcMUWyYWO
=AWGh
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
