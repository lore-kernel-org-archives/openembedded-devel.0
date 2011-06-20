Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYdIb-0000sg-1P for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 14:09:49 +0200
Received: from f053036010.adsl.alicedsl.de ([78.53.36.10]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYdFH-0005Ka-8j for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 12:06:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201106201555.51413.khimov@altell.ru>
References: <1308568797.5090.24.camel@mattotaupa>
	<201106201555.51413.khimov@altell.ru>
Date: Mon, 20 Jun 2011 14:06:17 +0200
Message-ID: <1308571577.5090.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: libmailtools-perl_2.06: task fetch fails: source not available anymore
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
X-List-Received-Date: Mon, 20 Jun 2011 12:09:49 -0000
X-Groupsio-MsgNum: 32761
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FA9XIr4y1rRRR5SkfPT0"

--=-FA9XIr4y1rRRR5SkfPT0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 20.06.2011, 15:55 +0400 schrieb Roman I Khimov:
> > could the source tarball `MailTools-2.06.tar.gz` please be put on the
> > OpenEmbedded mirror, since it is not available anymore upstream [1]
> > (only 2.07 and 2.08).
>=20
> Or maybe you can get it from here:
> http://mirror.ihug.co.nz/CPAN/modules/by-category/12_Opt_Arg_Param_Proc/U=
ser/MARKOV/
> (found by quick googling)

Thank you. I just found the error when `bitbake -k mythtv` failed using
`minimal-uclibc` and so I reported it.

In my opinion it is better to use the OE mirror. Who can be contacted to
put the file up there?


Thanks,

Paul

--=-FA9XIr4y1rRRR5SkfPT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3/N7kACgkQPX1aK2wOHViSlACfRXacgI3aqUzKR30p1gHIxwWm
xH0AnjNHqd24PvVWRK+gqddiBlZSumaL
=t67g
-----END PGP SIGNATURE-----

--=-FA9XIr4y1rRRR5SkfPT0--
