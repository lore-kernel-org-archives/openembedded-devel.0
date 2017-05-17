Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED2377D4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:40:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y10so1773737wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gaMJbAM3PmzRNGLZJQp2QEjhUi5+w+tYWkk5eS3RMyU=;
	b=jqpWJ5RfleeVt96Jbc3KXzhRkgpI5wiVqu+khpR3tVDT/TcjqTU7Yfy0p862c7UyXt
	woEoLTI2n+lB8yjEiZN70zUbRFZ4fYlYcYSkjQzNCvz9prxnl0GJbVfzqHN/xbNkR1vB
	8BdexoUELDL0iOPPRrdL4DeijI63633BuSNxNFsciOY4twcg9zQ/WvoUlYiszpuWaaFc
	t6CfElKDuR7Tbj9Z+7MIyM0RoOOS9o3UUIYQWzCrZVpxUzqViEAI/GTMubZuSLSQFT4j
	6OOtPUEBfYQxPqPkUpQ5z4ijvPSbHJJlTXVOw2CBSn+9CaSPbUkhmKX10tJkYdZaoZg8
	lOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gaMJbAM3PmzRNGLZJQp2QEjhUi5+w+tYWkk5eS3RMyU=;
	b=cpvNw1e+ktpU6ie94skGUk8Mozw1mC3s0fYbg4lE4780d7wahyeFfj1rDYilaLPzjH
	hGJ10bz+arP40RBLifbeDEVKKrVFm1GmzXarXcioSNtN/3YyFu+8fhXdJUmcXH0VV3ZH
	yVAVqgnmBVTNcqih+Q7ep49+5OLttWTbxS6G/2vdCdSfWNFfNfGopiKCtg/+Q8GAga0F
	QLtiBdo/34GW1LpWHswpb/p2CKCF/bYEiim7zWZaNkkkeaYVN5P+3NyRzAbBT1FO+xLf
	td/JEyj7ZXJjljO4KVwy+dYF4emzqS0ZD/G6W91amE/JjPkUtdwSl7QOYWZGKoXKVJK8
	saDA==
X-Gm-Message-State: AODbwcB7PSmv65hLlmjR103PVPG2rTxqQpOiFzkrF44AmGRwD/RvIvLt
	WyL4mldtyCflCiRI
X-Received: by 10.28.138.209 with SMTP id m200mr1696834wmd.8.1495010421450;
	Wed, 17 May 2017 01:40:21 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k65sm1655561wmd.28.2017.05.17.01.40.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 May 2017 01:40:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 May 2017 10:41:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170517084112.GA3086@jama>
References: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
	<20170517063523.ltvullw64jv4zotd@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20170517063523.ltvullw64jv4zotd@ad.chargestorm.se>
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: Re: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Wed, 17 May 2017 08:40:21 -0000
X-Groupsio-MsgNum: 66777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2017 at 08:35:23AM +0200, Anders Darander wrote:
> Hi,
>=20
> * Gianfranco Costamagna <costamagna.gianfranco@gmail.com> [170516 13:15]:
>=20
> First, the subject should have included [PATCH v2 1/2] instead of just
> [PATCH 1/2], as this really is the 2nd version. (This applies to the
> whole series).
>=20
> > From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>=20
> > Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.co=
m>
> > ---
>=20
> Down here, a changelog for the changes between v1 and v2. (At least if
> they'r not covered by a cover letter).
>=20
> >  meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> > -SRC_URI =3D "http://libndp.org/files/${BPN}-${PV}.tar.gz \
> > +SRC_URI =3D "git://github.com/jpirko/libndp;branch=3Dmaster;tag=3Dv${P=
V} \
>=20
> Pleasen, remove tag=3Dv${PV} from the SRC_URI. Instead, add a SRVREV=3D t=
he
> SHA1. If you use a tag, bitbake will reach out the git server upon each
> build to verify the SHA1 of the tag. That'll break off-line builds etc.

This is actually 6th version of this change I've seen on ML and one of
them (the one I've cherry-picked to master-next) already sets SRCREV
correctly (I made the same comment earlier).

https://patchwork.openembedded.org/project/oe/patches/?submitter=3D&state=
=3D*&q=3Dlibndp&archive=3Dboth&delegate=3D

>=20
> Cheers,
> Anders
>=20
> >             file://0001-include-sys-select.h-for-fd_-definitions.patch \
> >             "
> > -SRC_URI[md5sum] =3D "1e54d26bcb4a4110bc3f90c5dd04f1a7"
> > -SRC_URI[sha256sum] =3D "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a7=
7425e52edc33ffac0e"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
>=20
> >  inherit autotools
> --=20
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRwMpwAKCRA3VSO3ZXaA
HK5wAKCX0kjHg7qfZqGVfP/ccbxjmLx5ogCglhfLYoRV64FyKXRvkYs6HcbbaK0=
=fpAR
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
