Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfU3X-0006dT-Sm for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 11:42:35 +0200
Received: from f053045224.adsl.alicedsl.de ([78.53.45.224]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfU0C-0006qn-Jn; Sat, 09 Jul 2011 09:39:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAD=GYpYxH6E3rho_vW3Q9ncXna7EPHK5M=icjFn0eQ3v7YJ=Lw@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<CAD=GYpYxH6E3rho_vW3Q9ncXna7EPHK5M=icjFn0eQ3v7YJ=Lw@mail.gmail.com>
Date: Sat, 09 Jul 2011 11:38:41 +0200
Message-ID: <1310204321.4123.68.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Sat, 09 Jul 2011 09:42:35 -0000
X-Groupsio-MsgNum: 33088
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-28PmVf105XCncWP1jRn9"

--=-28PmVf105XCncWP1jRn9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Freitag, den 08.07.2011, 19:29 -0500 schrieb Joel A Fernandes:

> Can we ignore this patch and use one I just submitted titled
> "pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03"?

yes of course. Could you please update the state of your patches in OE=E2=
=80=99s
patch queue [1]? You have to register and for example use the following
command [2].

	$ pwclient update -s Superseded 7115

If a patch has been committed you can also pass the commit ID with `-c`.

> Thanks for reviewing my patch,

No problem.


Thanks,

Paul


PS: Please never top post to lists. If interleaved style is not useful,
since you do not need to take reference to anything, just delete the
quote all together.


[1] http://patches.openembedded.org/project/oe/list/
[2] http://www.openembedded.org/index.php/Patchwork

--=-28PmVf105XCncWP1jRn9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4YIYsACgkQPX1aK2wOHViFIACdGaoraRE3Z2PBgufTlaWZs12E
Vw4Anj7jKUa0TqEl0dH2JaRi1yxNUcYi
=3jG6
-----END PGP SIGNATURE-----

--=-28PmVf105XCncWP1jRn9--
