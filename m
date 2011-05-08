Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxrU-0003a5-O4 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:53:06 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxq2-0004rm-N8 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:51:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iq4q32$e40$3@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
	<iq4q32$e40$3@dough.gmane.org>
Date: Sun, 08 May 2011 08:50:21 +0200
Message-ID: <1304837421.4124.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 6/8] p910nd: add 0.95 version
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
X-List-Received-Date: Sun, 08 May 2011 06:53:06 -0000
X-Groupsio-MsgNum: 31723
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-inhXrteJh/FZxdE0ycP/"

--=-inhXrteJh/FZxdE0ycP/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 03:02 +0200 schrieb Koen Kooi:

[=E2=80=A6]

> > +DESCRIPTION =3D "A small network printer daemon for embedded situation=
s that passes the job directly to the printer."
> > +SECTION =3D "console/utils"

This should be dropped, since it is redundant.

> > +HOMEPAGE =3D "http://p910nd.sourceforge.net/"
> > +SECTION =3D "console/utils"

This is the correct location according to the style guide [1].

> > +RDEPENDS_${PN}-avahi =3D "avahi"
>=20
> Again, RDEPENDS go below do_install

When was this agreed on? The style guide says differently.


Thanks,

Paul


[1] http://openembedded.org/index.php/Styleguide

--=-inhXrteJh/FZxdE0ycP/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GPS0ACgkQPX1aK2wOHVishACeMWtUbIkpf9VsPWWD2f9lLmLb
biYAnj/ti/Hb0pFZV74IsZn2Pc0NAQ6j
=OpQn
-----END PGP SIGNATURE-----

--=-inhXrteJh/FZxdE0ycP/--
