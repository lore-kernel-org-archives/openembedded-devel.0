Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIzgW-0007JX-5a for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:49:52 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIzf5-0000u7-M1 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:48:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iq5kie$gie$3@dough.gmane.org>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
	<1304836455.4124.7.camel@mattotaupa>  <iq5kie$gie$3@dough.gmane.org>
Date: Sun, 08 May 2011 10:47:10 +0200
Message-ID: <1304844430.4124.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 02/11] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sun, 08 May 2011 08:49:52 -0000
X-Groupsio-MsgNum: 31728
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AyjLllmttNuGfMvnvgNL"

--=-AyjLllmttNuGfMvnvgNL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 10:34 +0200 schrieb Koen Kooi:

> On 08-05-11 08:34, Paul Menzel wrote:
> > Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:

[=E2=80=A6]

> >> +S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> >=20
> > Is not this the default for `S`?
>=20
> Note the _ in S versus - in PN :)


Indeed. Thanks!

Paul

--=-AyjLllmttNuGfMvnvgNL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GWI4ACgkQPX1aK2wOHViXrgCfeltV6vzGWrFySeamp5ozLxJe
fJAAn3BA3Bg/2qOY2g6GrRDfS/WiaM/t
=wdXq
-----END PGP SIGNATURE-----

--=-AyjLllmttNuGfMvnvgNL--
