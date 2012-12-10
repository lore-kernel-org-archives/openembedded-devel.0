Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Ti8Lb-0005BP-9f; Mon, 10 Dec 2012 19:44:59 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1263995wey.6
	for <multiple recipients>; Mon, 10 Dec 2012 10:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XfZ0/fL/XNLSzzH+wxbIaw40xuf5QUh9EEnTogomVy8=;
	b=YDxvs3T5Bg/5qntMV2QBzg5ZTd5SCCv7GALUqSD/JvRCVpursTQTjJMjVN1PSryZ8F
	GKcwmz2xXQHJYJJJuJvz77IcuG3MQBl4R9imovAyIg0Bj6TCZWwDvdaS8pMOotLYCyJc
	VroelAtTPmJmWv/k8GA+gloZcPl+qWh0KmXHifW/ub9stKKnDI5LngrsRFHQuHtkivw7
	5OQ13z5zy3uVOkdkvHWgVDv6cqTBf+p8CgMFnj8msO13FJrtdcL7gcOSUNz7rqdkt5t+
	fd9NcMKCE+GS8mZxnCq5zRQj+uD2+iFoHMg9QsPXv9vidILBZ+aPfmR2Vnx+3afnPlRu
	AIkw==
Received: by 10.180.20.109 with SMTP id m13mr12478778wie.16.1355164228020;
	Mon, 10 Dec 2012 10:30:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y3sm11148804wix.6.2012.12.10.10.30.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 10:30:27 -0800 (PST)
Date: Mon, 10 Dec 2012 19:30:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121210183031.GA3331@jama.jama.net>
References: <20121210105047.B3BC61033D@opal>
	<CAK18fxE0L2riJGvnK9LkZPF=Q7JUxPkKykKFZXwbsm0mnD_G2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxE0L2riJGvnK9LkZPF=Q7JUxPkKykKFZXwbsm0mnD_G2Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "qt4: rename bbappends to match new 4.8. 4 version from oe-core"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 18:44:59 -0000
X-Groupsio-MsgNum: 42064
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 12:51:15PM +0200, Andrei Gherzan wrote:
> Any chance to have this merged soon?

Are you asking about oe-core patch? Because asking about merging
something on oe-commits ML does not make much sense.

Cheers,

> *Andrei Gherzan*
> mobile +40.744.478.414  fax +40.31.816.28.12
> Email: andrei@gherzan.ro
> Email: andrei.gherzan@windriver.com
> Romania
>=20
>=20
>=20
> On Mon, Dec 10, 2012 at 12:50 PM, <git@git.openembedded.org> wrote:
>=20
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 9c2eee256d52e7ee40163542381d8d2691bd5bfe
> > URL:
> > http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D9=
c2eee256d52e7ee40163542381d8d2691bd5bfe
> >
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > Date:   Mon Dec 10 11:47:42 2012 +0100
> >
> > Revert "qt4: rename bbappends to match new 4.8.4 version from oe-core"
> >
> > The recipes aren't in OE-core yet
> >
> > This reverts commit 421a73c9c3bea13e029cd0505711ef02753949bb.
> >
> > ---
> >
> >  ..._4.8.4.bbappend =3D> qt4-embedded_4.8.3.bbappend} |    0
> >  ..._4.8.4.bbappend =3D> qt4-x11-free_4.8.3.bbappend} |    0
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
> > similarity index 100%
> > rename from meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > rename to meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
> > diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
> > similarity index 100%
> > rename from meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > rename to meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
> >
> >
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> >
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDGKkcACgkQN1Ujt2V2gBwLBACeIN1n5eP0X4yMPTzSWSUrVgSy
tXwAoI199XzN/wBfSo3NkwgawP/mqbQm
=qKdS
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
