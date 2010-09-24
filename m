Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz4zq-00074L-0c for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:55:22 +0200
Received: from f053038003.adsl.alicedsl.de ([78.53.38.3] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz4zl-0007CF-HV for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:55:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i7hr1l$kte$1@dough.gmane.org>
References: <4C9C696B.4050800@dresearch.de>
	<1285320191-22618-1-git-send-email-sledz@dresearch.de>
	<i7hr1l$kte$1@dough.gmane.org>
Date: Fri, 24 Sep 2010 11:55:07 +0200
Message-ID: <1285322107.3715.55.camel@mattotaupa>
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
Subject: Re: [PATCH] libatasmart-0.13: resolve cross compile problem
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
X-List-Received-Date: Fri, 24 Sep 2010 09:55:22 -0000
X-Groupsio-MsgNum: 23932
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-kG01WCXd+L4FtqNzecs+"

--=-kG01WCXd+L4FtqNzecs+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 24.09.2010, 11:29 +0200 schrieb Koen Kooi:

> On 24-09-10 11:23, Steffen Sledz wrote:
> > * This patch solves a cross/native compile problem:
> > | ./strpool atasmart.c atasmart.strpool.c
> > | ./strpool: ./strpool: cannot execute binary file
> >=20
> > Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>=20
> Acked-by: Koen Kooi <koen@openembedded.org>

Build-tested with `MACHINE =3D "beagleboard"` and =C8=A6ngstr=C3=B6m 2008.1=
.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I will try to get this fixed upstream.

[=E2=80=A6]


Thanks,

Paul

--=-kG01WCXd+L4FtqNzecs+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkycdXsACgkQPX1aK2wOHVhL4gCZATNPp9zHEUVfPYdiTIXJkKDj
fIgAniZKd1Qxc27u9nzhJ/YygnxBguvR
=EaS1
-----END PGP SIGNATURE-----

--=-kG01WCXd+L4FtqNzecs+--
