Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8704E60DC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 00:28:04 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so6510376eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2014 16:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cVNejsvO677FG6m5ckaX5hxzTmEviqkEbltOo4ridhY=;
	b=i32lthlXLpNkDUSttA97Sedjgj4v2gx9T140xuubz3K8Av/S+LGOrsOgzCXjV3X9cQ
	90fAR4tyPNxHs7gvjWhpwjk+kX+HujoYJXGkeNUZWQJh9TqZDhduVBolK0cy+FllQznv
	XiSxvKHPM1AoMJHAK/l16sE2djyzJzD7Zeah6K+uDbBAbEjBn+h1xjO3ALqE3j+AhnSs
	XrYu+SJvh8mwfyqM48br8Pgc10V4Ifmt+Ih6MQe8oRO7W9Ljby300SM4DItRJggp/rM9
	8p0xOTx4i2mbYLmn9g+jcj2bnDlClmun9p2oOIz9kyves2zsYsUcdV+6Ynyf31kvSulB
	lbUg==
X-Received: by 10.15.43.10 with SMTP id w10mr72020927eev.13.1388708884999;
	Thu, 02 Jan 2014 16:28:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	n1sm140420118eep.20.2014.01.02.16.28.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jan 2014 16:28:04 -0800 (PST)
Date: Fri, 3 Jan 2014 01:28:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140103002808.GA3707@jama>
References: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
	<1387298509-20865-2-git-send-email-andrei@gherzan.ro>
	<CAK18fxG_hv1GJegCQg=Q=S8tMtm2DkD5RmubZ_pey0CFDkcFyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxG_hv1GJegCQg=Q=S8tMtm2DkD5RmubZ_pey0CFDkcFyA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] libsdl-image: Add support for libsdl-image-native
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
X-List-Received-Date: Fri, 03 Jan 2014 00:28:06 -0000
X-Groupsio-MsgNum: 47570
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 01:17:54AM +0200, Andrei Gherzan wrote:
> On Tue, Dec 17, 2013 at 6:41 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>=20
> > From: Alexandru Niculita <alexnick87@gmail.com>
> >
> > Change-Id: If4a11d3e0d7aa800081ac3361cf2662bb979dd7c
> > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-multimedia/libsdl-image/
> > libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/
> > libsdl-image_1.2.12.bb
> > index 459bf12..19dd4a4 100644
> > --- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> > +++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> > @@ -29,3 +29,5 @@ do_configure_prepend() {
> >      rm -f acinclude/ltsugar.m4
> >      rm -f acinclude/ltversion.m4
> >  }
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 1.8.1.4
> >
> >
> PING?

It cannot be merged without libsdl-native merged in oe-core, so until
this is resolved:
http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087=
633.html

there is no point in merging it in meta-oe (libsdl-image-native failed
in last world build).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLGBBgACgkQN1Ujt2V2gBybrQCeMokqcrWKA6FRj64CdbW/OSeE
YT8AnRgNxtvL5Xe+QTTgGh8fuFsE4w2M
=Dq5y
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
