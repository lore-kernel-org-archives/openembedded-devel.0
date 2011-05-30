Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QQxzt-0002aO-Hh for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 10:38:49 +0200
Received: from f053035189.adsl.alicedsl.de ([78.53.35.189]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QQxxN-0007HR-DL for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 08:36:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DE352E5.7090604@gmail.com>
References: <4DE352E5.7090604@gmail.com>
Date: Mon, 30 May 2011 10:35:42 +0200
Message-ID: <1306744542.4106.31.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Error building qt4e-base-image with angstrom-2010.x
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
X-List-Received-Date: Mon, 30 May 2011 08:38:49 -0000
X-Groupsio-MsgNum: 32373
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-riI8IMh4TiaKCn7WpTN7"

--=-riI8IMh4TiaKCn7WpTN7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marco,


Am Montag, den 30.05.2011, 10:18 +0200 schrieb Marco Cavallini:

> I'm facing to a problem building qt4e-base-image with angstrom-2010.x on
> a Debian lenny host, is it normal?
> http://pastebin.com/6SnFSYs6

please always paste the logs into the message so that people do not need
to open a browser, can comment inline and have everything in the archive
too.

> I suspect a Debian lenny issue with new OE stuff.

I would not think so, because the tool chain used for compiling is build
extra (native/sysroot).

> Any hint would be appreciated.

Does it build with another distribution or tool chain? Did the build
ever work for you?


Thanks,

Paul

--=-riI8IMh4TiaKCn7WpTN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3jVs0ACgkQPX1aK2wOHVgZKgCcC5BducMG6KRjNg6ZUkUiCDNg
62gAoIXY8xbMYTv9MDRXtHeh70l+YIG8
=YXMd
-----END PGP SIGNATURE-----

--=-riI8IMh4TiaKCn7WpTN7--
