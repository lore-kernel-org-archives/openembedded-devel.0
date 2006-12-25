Received: from [82.195.149.148] (helo=xen.inhex.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1Gyiil-0007dA-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Dec 2006 06:49:59 +0100
Received: from localhost ([127.0.0.1]:4427 helo=debian.deb)
	by xen.inhex.net with esmtp (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1Gyij0-00051T-Uc
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Dec 2006 05:50:18 +0000
Received: from dion by debian.deb with local (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1GyijR-0002rP-7X
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Dec 2006 07:50:41 +0200
Date: Mon, 25 Dec 2006 07:50:41 +0200
From: Dmitry Nezhevenko <dion@inhex.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061225055041.GA7665@debian.deb>
References: <20061225001648.GA21942@debian.deb>
	<1765228861.20061225013542@vanille-media.de>
MIME-Version: 1.0
In-Reply-To: <1765228861.20061225013542@vanille-media.de>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Trying to build opie-image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Dec 2006 05:50:00 -0000
X-Groupsio-MsgNum: 1012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline

--5/uDoXvLw7AC5HRs
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2006 at 01:35:42AM +0100, Michael 'Mickey' Lauer wrote:
> Dmitry Nezhevenko wrote:
> > NOTE: multiple providers are available (glibc, glibc-intermediate);
> > NOTE: consider defining
> > PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
> > ERROR: Nothing provides dependency task-bootstrap
> > ERROR: dependency task-bootstrap (for opie-image) not satisfied
> > NOTE: no buildable providers for opie-image
>=20
> Do you have any local changes to opie-image.bb? The one in the
> repository no longer depends on task-bootstrap.
>=20

No. Just checkout, create config and run bitbake. Nothing else. There is
log of bitbake -v opie-image.

--=20
WBR, Dmitry

--k+w/mQv8wyuph6w0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="log.gz"
Content-Transfer-Encoding: base64

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

--k+w/mQv8wyuph6w0--

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFj2ax0T/aIlRaJQYRAuL4AJ94RFEEs+5tyyBsEP92M9+MGLmQrgCdF2fO
7Qqk+fhuzVM0hwIZ7T+lN+M=
=E3QI
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
