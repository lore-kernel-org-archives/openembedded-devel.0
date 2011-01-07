Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pb90M-0007oY-Pl for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 10:53:06 +0100
Received: from f053042130.adsl.alicedsl.de ([78.53.42.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pb8zy-0003Nv-PI for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 09:52:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1294318110-23521-4-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-4-git-send-email-obi@opendreambox.org>
Date: Fri, 07 Jan 2011 10:52:41 +0100
Message-ID: <1294393961.3699.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 4/4] gcc: replace unconditional SRC_URI_append with SRC_URI +=
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
X-List-Received-Date: Fri, 07 Jan 2011 09:53:06 -0000
X-Groupsio-MsgNum: 27793
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vtRb8XJm8Xx1bzbxqZna"

--=-vtRb8XJm8Xx1bzbxqZna
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 06.01.2011, 12:48 +0000 schrieb Andreas Oberritter:

What do you mean by =C2=BBunconditional SRC_URI_append=C2=AB? I searched th=
rough
the documentation and could not find the word. I always thought
`SRC_URI_append =3D` and `SRC_URI +=3D` is the same and if I am not mistake=
n
the manual says the same [1].

Do I understand your patch correctly, that when `_append` was used in
the recipe in some places, the space was missing and that you chose to
replace it by `+=3D` for consistency?

[=E2=80=A6]


Thanks and sorry for the stupid question.

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html#recipes_syntax

--=-vtRb8XJm8Xx1bzbxqZna
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0m4lsACgkQPX1aK2wOHVgeMgCePn0KXsF1bL+qOCVkKm+7OiYK
AykAniFTqECxy7UpZ4pfiwvbxdKiUG5R
=PDyh
-----END PGP SIGNATURE-----

--=-vtRb8XJm8Xx1bzbxqZna--
