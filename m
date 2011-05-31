Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRK6B-0007k4-Pt for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 10:14:47 +0200
Received: from f053045255.adsl.alicedsl.de ([78.53.45.255]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRK3g-0003pi-RS for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 08:12:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DE493ED.5010906@atmel.com>
References: <09fa504b75a241d161f6263aa74393d19993b075.1306760475.git.ludovic.desroches@atmel.com>
	<1306782295.4106.479.camel@mattotaupa>  <4DE493ED.5010906@atmel.com>
Date: Tue, 31 May 2011 10:11:39 +0200
Message-ID: <1306829499.4991.37.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v3] tiobench: Add version 0.3.3 (initial recipe)
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
X-List-Received-Date: Tue, 31 May 2011 08:14:47 -0000
X-Groupsio-MsgNum: 32410
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qY6CGc0iE00W6MMnaLDA"

--=-qY6CGc0iE00W6MMnaLDA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ludovic,


Am Dienstag, den 31.05.2011, 09:08 +0200 schrieb Ludovic Desroches:

> On 5/30/2011 9:04 PM, Paul Menzel wrote:
> > From: Ludovic Desroches<ludovic.desroches@atmel.com>
> > Date: Mon, 30 May 2011 18:43:14 +0200
> >
> > Build tested
> > =E2=80=A2 with task-base image with the tiobench package on atmel board=
s by Ludovic Desroches and
> > =E2=80=A2 using `angstrom-2010.x` and `minimal{,-uclibc}` for `MACHINE =
=3D "beagleboard"` by Paul Menzel.
> >
> > Signed-off-by: Ludovic Desroches<ludovic.desroches@atmel.com>
> > Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
> > ---
> > v2 =E2=86=92 v3
> > =E2=80=A2 sort dependencies
> > =E2=80=A2 update `LICENSE`
> > =E2=80=A2 remove overrides, which are the defaults
> > =E2=80=A2 use ${PN} and ${P}
> > =E2=80=A2 rename directory for the patch
> >
> > Ludovic, could you please test the updated patch and tell me if you sen=
d the Makefile patch upstream.
> No problem, it is still ok. Thanks for your help. It's good for me to=20
> see how this recipe has to look like since we can find different ways=20
> into other (maybe old) recipes. I confess I have seen some of the=20
> changes you asked but I forget them!
>=20
> I have not sent the Makefile patch upstream, since the last release is=
=20
> quite old, I don't know the project is still active.

It does not look like that. Looking at the CVS log it seems like
tiobench 0.4.1 should have been released somehow. Anyhow, it never hurts
to send the patch to the author mentioned in `README`.

I will commit your patch probably tomorrow to give others time for
comments.


Thanks,

Paul

--=-qY6CGc0iE00W6MMnaLDA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3koqoACgkQPX1aK2wOHViNLwCeOSfHM6oBRNDdv0hFMYxsj/Cl
V9kAnj/N/iPXACYZxTPLkzX4B+l8tIFj
=i3uV
-----END PGP SIGNATURE-----

--=-qY6CGc0iE00W6MMnaLDA--
