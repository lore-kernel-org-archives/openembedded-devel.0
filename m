Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NQzzq-0005tl-Nf for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 10:10:09 +0100
Received: from g225080015.adsl.alicedsl.de ([92.225.80.15]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NQzxv-0001sW-Q6 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 09:08:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5wc44txmn1qzu@guohr-laptop-ubuntu>
References: <> <1262417674-26652-1-git-send-email-camelguo@gmail.com>
	<201001020935.04959.holger+oe@freyther.de>
	<op.u5wc44txmn1qzu@guohr-laptop-ubuntu>
Date: Sat, 02 Jan 2010 10:08:51 +0100
Message-ID: <1262423331.3308.8.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: signed-off procedure (was: [PATCH] Fix compiling error of uclibc-initial-0.9.30.1 due to incorrect uClibc.machine for qemumips)
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
X-List-Received-Date: Sat, 02 Jan 2010 09:10:09 -0000
X-Groupsio-MsgNum: 15327
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1w960OjcV8K3DI1eRbv/"

--=-1w960OjcV8K3DI1eRbv/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guo,


Am Samstag, den 02.01.2010, 16:42 +0800 schrieb Guo Hongruan:
> =E5=9C=A8 Sat, 02 Jan 2010 16:35:04 +0800=EF=BC=8CHolger Hans Peter Freyt=
her =20
> <holger+oe@freyther.de> =E5=86=99=E9=81=93:

[=E2=80=A6]

> > The other bit is... use "Signed-off-by:" on your patches if you want th=
em
> > included in OE. Only if you use the above they will show up in
> > patchwork.openembedded.org which people go through to look at outstandi=
ng
> > patches...
>=20
> Signed-off-by? How to do it.

Just add a line

Signed-off-by: name <email>

below the commit message. In Git you can specify to do this
automatically most of the time with the =C2=BB-s=C2=AB parameter, for examp=
le when
you commit something or format a patch.

> Could you give me some links about this topics? I will google it

The coreboot project took this also over from Linux [1]. I did not find
a link to where the recent Linux procedure is described. Basically if
you sign off a patch, you will say that you are complying with the
project rules and license terms so that it can be included.

[=E2=80=A6]


Bests,

Paul


[1] http://www.coreboot.org/Development_Guidelines#Sign-off_Procedure

--=-1w960OjcV8K3DI1eRbv/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAks/DRwACgkQPX1aK2wOHVhWagCfZv5nQQxW1M2SHjIRWY2nmO0e
0OcAn1Z40ViWr4bWob3KViMg5vMYdUA7
=zUX1
-----END PGP SIGNATURE-----

--=-1w960OjcV8K3DI1eRbv/--
