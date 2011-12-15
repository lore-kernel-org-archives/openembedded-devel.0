Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbFs3-00065i-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 19:17:31 +0100
Received: by eekb15 with SMTP id b15so2090334eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J5ay70N2KAx7b9gfPAkv1OGwfakWp3AEVZBbC7UVpJ0=;
	b=VbybAv808xyW9O8YRylERsVbgdIhSY/YdqbNE8hsBbw/v4G58wrZ79PT7PAVHT/efY
	0KtbmpSrzIRdovBJBQHdRIxlBDCQXETKMdUJzL2dVkXa4O+tfrcAh3aCrIHFdU47H3ut
	B1PYId1YU3CUsd+bK7HAcw+uWs8jtFbRWdDxc=
Received: by 10.14.123.210 with SMTP id v58mr1910636eeh.40.1323972632863;
	Thu, 15 Dec 2011 10:10:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 39sm11828849eei.1.2011.12.15.10.10.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 10:10:32 -0800 (PST)
Date: Thu, 15 Dec 2011 19:10:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111215181030.GF4419@jama.jama.net>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
	<jcdbpo$grj$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jcdbpo$grj$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-efl 0/6] Small fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 18:17:31 -0000
X-Groupsio-MsgNum: 36138
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline

--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 06:46:32PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 15-12-11 13:12, Martin Jansa schreef:
> > The following changes since commit
> > 6f36625d072054737e0aa797fb791c35d999addc:
> >=20
> > florence: clean up recipe (2011-12-15 09:42:59 +0100)
> >=20
> > are available in the git repository at:=20
> > git://git.openembedded.org/meta-openembedded-contrib jansa/pull=20
> > http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/pull
>=20
> Does
> >=20
> that have the updated mplayer2 patch?

Yes

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7qMnQACgkQMkyGM64RGpEUJACePpB9nwYqrc93XD2LIUFPnsCl
> bw4An2A3Z+A9bTuqW+Yn0OTcwm1Joxek
> =3Dvnup
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7qOBYACgkQN1Ujt2V2gByF2ACdELzwKTiIFkjYNa6VOPaYyRKZ
hysAoIy1ZiGGqPyPu5Jq1wiM7idw7Kbg
=gUk/
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--
