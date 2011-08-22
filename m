Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QvaqB-0000Z0-Ql
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:11:23 +0200
Received: by fxg11 with SMTP id 11so3789486fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tddx/c3xp5dXoccPGnP7NS/NTmbcYDYOdEnQBYLEZtY=;
	b=WzCgI9i2TGJafXX02ogau90gyElYGpVIBbzDyQcvLFNkJzHW/5YRqj97wQ+j8EaJhs
	uusfenUO9cmjYU8z+/TEASyme4YD/mHG1ZIXy0/sj6/sQaEQShV6lb5DKt7nMyY5u1WL
	LYWmryp2yd3IF8+90ppAhOsuzOfScS/0DQszM=
Received: by 10.223.88.83 with SMTP id z19mr4202256fal.11.1314043599385;
	Mon, 22 Aug 2011 13:06:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e5sm4431072fah.35.2011.08.22.13.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:06:38 -0700 (PDT)
Date: Mon, 22 Aug 2011 22:06:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110822200630.GD3751@jama.jama.net>
References: <cover.1313655444.git.Martin.Jansa@gmail.com>
	<j2uc13$fdd$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j2uc13$fdd$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH 0/2] Pull request #8
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
X-List-Received-Date: Mon, 22 Aug 2011 20:11:23 -0000
X-Groupsio-MsgNum: 33767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 09:52:03PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-08-11 10:17, Martin Jansa schreef:
> > The following changes since commit 3d0b866967529a14268541b85e79cb35981e=
1aed:
> >=20
> > xdotool: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315 (2=
011-08-17 23:11:55 +0200)
> >=20
> > are available in the git repository at: git://git.openembedded.org/meta=
-openembedded-contrib jansa/meta-efl http://cgit.openembedded.org/cgit.cgi/=
meta-openembedded-contrib/log/?h=3Djansa/meta-efl
> >=20
> > Martin Jansa (2): e-base: bump EFL_SRCREV e-wm: remove SHR specific pat=
ch
>=20
> merged, thanks!

Thanks, I've another small EFL_SRCREV bump (for efreet changes) and 2
packaging fixes if you don't want to rebuild efl twice I'll send it in
pull request now, otherwise keep it for few more days for testing.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFOUrNjMkyGM64RGpERAjk0AJ9lxX/L8jwv9MPki3b1yJ4AmGQixQCgkVYM
> CPLMkEJWWdimqnJzcZYOwGg=3D
> =3D7EkT
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5StsYACgkQN1Ujt2V2gBylngCfSXR7/mdf4sv/3Ft89EAOJUKx
5McAoLJDxV+X0WstXd8wgbJPId5m5Omc
=ds9E
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
