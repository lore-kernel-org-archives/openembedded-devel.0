Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAOjv-0006Yx-4E for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 17:13:35 +0200
Received: from f053046136.adsl.alicedsl.de ([78.53.46.136]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAOjI-0003DI-2q for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 15:12:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1288011678-23938-1-git-send-email-obi@opendreambox.org>
References: <1288011678-23938-1-git-send-email-obi@opendreambox.org>
Date: Mon, 25 Oct 2010 17:12:55 +0200
Message-ID: <1288019575.3793.39.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cairo: depend on glib-2.0 to fix compile error
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
X-List-Received-Date: Mon, 25 Oct 2010 15:13:36 -0000
X-Groupsio-MsgNum: 25471
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5gIq+gL1tLMjoYPiIHXi"

--=-5gIq+gL1tLMjoYPiIHXi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 25.10.2010, 13:01 +0000 schrieb Andreas Oberritter:
> | In file included from cairo-gobject-enums.c:8:0:
> | cairo-gobject.h:44:25: fatal error: glib-object.h: No such file or dire=
ctory
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

[=E2=80=A6]

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

--=-5gIq+gL1tLMjoYPiIHXi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzFnncACgkQPX1aK2wOHVg5+QCfXjEbDLKJlXF0ZgHU2APb8gla
gfYAnRrgCUkndVQRJf/JeLxFG6Z8/QGG
=wROH
-----END PGP SIGNATURE-----

--=-5gIq+gL1tLMjoYPiIHXi--
