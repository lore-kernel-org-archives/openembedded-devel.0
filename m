Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzOOf-0001VK-AM for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 09:42:41 +0200
Received: from f053042120.adsl.alicedsl.de ([78.53.42.120]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzOJw-0003RP-HV for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 07:37:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Sep 2011 09:37:37 +0200
In-Reply-To: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
References: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314949058.3526.17.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: package trying to link to /usr/lib/.lib instead of /usr/lib during staging
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
X-List-Received-Date: Fri, 02 Sep 2011 07:42:41 -0000
X-Groupsio-MsgNum: 34010
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-uEuhup891UWe76Y+1L/C"

--=-uEuhup891UWe76Y+1L/C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Wei,


Am Freitag, den 02.09.2011, 17:17 +1000 schrieb Wei Kong:

> During compilation, for some reason, the linker attempts to look for
> libraries in the wrong directory.

[=E2=80=A6]

please send your recipe without having Google Mail line wrap things, so
people can test it themselves.

Use `git commit =E2=80=A6` and `git format-patch =E2=80=A6` (and `git send-=
email`). This
is also documented in our Wiki (for example [1] and other pages).


Thanks,

Paul


[1] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-uEuhup891UWe76Y+1L/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5gh8EACgkQPX1aK2wOHVjgkACgjNLYH2EO17aXjyV+yNlgZZLO
EOMAn0STtju9OcoqhBnVDPzu0D7GYckK
=4Fbs
-----END PGP SIGNATURE-----

--=-uEuhup891UWe76Y+1L/C--
