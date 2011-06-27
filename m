Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbIjy-0003qT-7r for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:49:06 +0200
Received: from f053041087.adsl.alicedsl.de ([78.53.41.87]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbIgm-000289-NJ for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 20:45:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTik1SX0BQ=rdoJorZN0UWcK1Mnn9Qg@mail.gmail.com>
References: <BANLkTik1SX0BQ=rdoJorZN0UWcK1Mnn9Qg@mail.gmail.com>
Date: Mon, 27 Jun 2011 22:45:26 +0200
Message-ID: <1309207526.21379.150.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: python-numpy cannot find libraries
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
X-List-Received-Date: Mon, 27 Jun 2011 20:49:06 -0000
X-Groupsio-MsgNum: 32856
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2ZNei8dyXbUu0yt881Q5"

--=-2ZNei8dyXbUu0yt881Q5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bob,


Am Montag, den 27.06.2011, 15:23 -0500 schrieb Bob Cvengros:

> I am having a problem compiling python-numpy similar to that posted
> here<http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0=
31840.html>,
> however this issue does not appear to have been resolved.

you are correct. Thank you for investigating and finding that message in
the archive. I replied to Patrik and let us hope that he implemented a
solution.

[=E2=80=A6]

> I wish I could fix it, but my technical skills are not up to the task. I
> could use some help resolving the issue.

As Patrik wrote, could you try to remove your host libraries?


Thanks,

Paul

--=-2ZNei8dyXbUu0yt881Q5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4I6+YACgkQPX1aK2wOHVhRJACeKmMxDsnBerRq7QuiSDbhRy4I
bOMAn07ewtzN8XmhJbfqZmwn9Qic2rwM
=xlD6
-----END PGP SIGNATURE-----

--=-2ZNei8dyXbUu0yt881Q5--
