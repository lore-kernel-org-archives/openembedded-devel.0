Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 43F26610DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 20:15:26 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3521067eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aJFLcvEx5e1ltxPD7Yuz+IzFqmsjzRJ+2u1NxetFPGY=;
	b=jqWK+I/XiScinic4MlSnhP22Tqb70PUWuGG36O1gLUbu4kBdX8NRojkA6fTl4FppPI
	cajoY/l6YTZJqdvxbsuUFuUASUlMFu3WH/ZoTaNHcUAZYr19FWx/Xnj6SUtTlIro3zqX
	wrbpkQGReLhGwR402XXo1VbpxynR/91GTJ8xePvhNu9prmoM4zsfjlXuAhYZGgHrA0L/
	UvAmhGUDAPDnoj6mean/jsjxVi6rpuraqsDcgDNX8YRHxvAbGUiuArG3HMGN6e3uE5wh
	arARsMMwgwHdhT4Sy3kDoLZSMyc8wdu6v38CJI7CVtWF3hVQRs0ACO8F+cXSkVxX4UmH
	MQ0w==
X-Received: by 10.14.214.136 with SMTP id c8mr51144637eep.6.1381176927461;
	Mon, 07 Oct 2013 13:15:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm67211471eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 13:15:26 -0700 (PDT)
Date: Mon, 7 Oct 2013 22:15:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20131007201536.GU6240@jama>
References: <20131007180120.GC18775@denix.org>
	<20131007202956.718ce202@e6520eb>
	<20131007183739.GD18775@denix.org>
	<20131007205710.386447ba@e6520eb> <20131007193306.GT6240@jama>
	<CAOMwXhNV3q5P_+kCZtnDNUpZpG-OvMoe7Rem=cw86Z6vx8WmbA@mail.gmail.com>
	<20131007194922.GE18775@denix.org>
MIME-Version: 1.0
In-Reply-To: <20131007194922.GE18775@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Laszlo Papp <lpapp@kde.org>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Mon, 07 Oct 2013 20:15:26 -0000
X-Groupsio-MsgNum: 46469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G9m07da55tKJni3T"
Content-Disposition: inline

--G9m07da55tKJni3T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:49:22PM -0400, Denys Dmytriyenko wrote:
> On Mon, Oct 07, 2013 at 08:43:48PM +0100, Laszlo Papp wrote:
> > On Mon, Oct 7, 2013 at 8:33 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >=20
> > > On Mon, Oct 07, 2013 at 08:57:10PM +0200, Eric B=E9nard wrote:
> > > > Le Mon, 07 Oct 2013 14:37:39 -0400,
> > > > Denys Dmytriyenko <denis@denix.org> a =E9crit :
> > > >
> > > > > On Mon, Oct 07, 2013 at 08:29:56PM +0200, Eric B=E9nard wrote:
> > > > > > Hi Denys,
> > > > > >
> > > > > > Le Mon, 07 Oct 2013 14:01:20 -0400,
> > > > > > Denys Dmytriyenko <denis@denix.org> a =E9crit :
> > > > > >
> > > > > > > Martin, Otavio, et al,
> > > > > > >
> > > > > > > Are you planning on updating Qt version in master to 5.1.1 any
> > > time soon,
> > > > > > > preferably before 1.5 release? :) If nobody looked into that =
yet,
> > > will you be
> > > > > > > open to take patches for the same?
> > > > > > >
> > > > > > I have 5.1.1 in test here. I expect to send the patch in the co=
ming
> > > > > > days.
> > > > >
> > > > > Thanks! Sounds good. Let me know if you need help in testing!
> > > > >
> > > >
> > > > as soon as it finish to compile here I'll send the patch serie for
> > > > testing.
> > >
> > > +Laszlo
> > >
> > > Laszlo also said that he is working on patches for 5.1.1 I don't know
> > > how far he got..
> > >
> >=20
> > Not any far, sorry, but I would be happy to use someone else's patches.=
 By
> > the way, it would be nice to have 5.2.0 alpha (and later beta) updates
> > soon, too.
>=20
> Having 5.2.0 alpha would be nice, but that's probably too unstable to try=
 and=20
> get in before Dora release. I want 5.1.1 as the latest stable to get into=
=20
> Dora. :) So, I'm offering any help to expedite things like testing and su=
ch :)

I've already branched meta-qt5/dora before removing 5.0.2 recipes from
master.

I'm willing to "backport" 5.1.1 from master to dora or even remove 5.0.2
there as well, but last time I've asked around nobody responded to say
if they are still using 5.0.2 or 5.1.* is good enough for everybody.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G9m07da55tKJni3T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJTFmgACgkQN1Ujt2V2gBwMGgCdFS3bR3JPkx4oV9N80KtVLcLh
5dgAoKvw5uZ9Aw2Rz8aM3iz/RtsjUshI
=81Uk
-----END PGP SIGNATURE-----

--G9m07da55tKJni3T--
