Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2N4p-0008QU-Sq for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 13:22:15 +0100
Received: from f053045005.adsl.alicedsl.de ([78.53.45.5] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2N34-0002lr-SC for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:20:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimJyKwc34_gwpG0nkP9ZyXgs3vQm1ScwqtMrG6P@mail.gmail.com>
References: <1300878254.4101.21.camel@mattotaupa>
	<AANLkTimJyKwc34_gwpG0nkP9ZyXgs3vQm1ScwqtMrG6P@mail.gmail.com>
Date: Wed, 23 Mar 2011 13:20:25 +0100
Message-ID: <1300882825.4101.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Wed, 23 Mar 2011 12:22:15 -0000
X-Groupsio-MsgNum: 30553
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WPeINJy/pQPd80USB5Sh"

--=-WPeINJy/pQPd80USB5Sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Kartik,


Am Mittwoch, den 23.03.2011, 08:00 -0400 schrieb Kartik Mohta:

> I had the same problem,
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6db4b9050e=
0e8b963e2a6b63790e48e3042ea99e
> solves it.

I saw that and did `bitbake -k libxml2` beforehand but it did not fix
the build. I will retry, just in case task configure was not rerun.


Thanks,

Paul


PS: My case shows one reason, why I think pasting error messages into
commit messages is a good thing. ;-)

--=-WPeINJy/pQPd80USB5Sh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2J5YkACgkQPX1aK2wOHVgHBACbBL4U7jAYRHui3eUq1c58/k/v
HOoAnRL3+d6NTVy3o8M4SSqb6gQSZra5
=CKG3
-----END PGP SIGNATURE-----

--=-WPeINJy/pQPd80USB5Sh--
