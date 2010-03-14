Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqnUG-0001NQ-T1 for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 14:04:14 +0100
Received: from f053039124.adsl.alicedsl.de ([78.53.39.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqnRN-00065h-Vl for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 13:01:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100314083146.GA7866@mail.ceegeebee.com>
References: <20100314083146.GA7866@mail.ceegeebee.com>
Date: Sun, 14 Mar 2010 14:01:08 +0100
Message-ID: <1268571668.4038.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnutls_2.8.5.bb: FATAL: autoreconf execution failed.
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
X-List-Received-Date: Sun, 14 Mar 2010 13:04:14 -0000
X-Groupsio-MsgNum: 17595
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/S5ODVD7hXgSQsR0MuCw"

--=-/S5ODVD7hXgSQsR0MuCw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chris,


Am Sonntag, den 14.03.2010, 19:01 +1030 schrieb Chris Bennett:

[=E2=80=A6]

> My log of the error according to bitbake is:
>=20
> [..]
> | automake: unknown warning category `cross'
> | doc/Makefile.am:27: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
> | gtk-doc.make:7: GTK_DOC_USE_LIBTOOL does not appear in AM_CONDITIONAL
> | doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
> | gtk-doc.make:50: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
> | doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
> | gtk-doc.make:173: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
> | doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
> | doc/reference/Makefile.am:147: ENABLE_GTK_DOC does not appear in AM_CON=
DITIONAL
> | autoreconf: automake failed with exit status: 1
> | FATAL: autoreconf execution failed.
> NOTE: Task failed: /home/chris/oe/micro-dev/work/i686-oe-linux/gnutls-2.8=
.5-r0/temp/log.do_configure.14113

You have to look into this mentioned log file to find out what failed.

[=E2=80=A6]


Thanks,

Paul

--=-/S5ODVD7hXgSQsR0MuCw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuc3hQACgkQPX1aK2wOHVipFgCfQt+LaI23jE7kXGt8ualmZ8nM
BVkAniK1TX3UGE2+hIxwH6KVDBBJ4WgA
=ZLVd
-----END PGP SIGNATURE-----

--=-/S5ODVD7hXgSQsR0MuCw--
