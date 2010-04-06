Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nz82g-0006f2-IQ for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 14:38:07 +0200
Received: from g225080234.adsl.alicedsl.de ([92.225.80.234]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nz7zT-0007im-QC for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 12:34:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hpf9cr$gd1$1@dough.gmane.org>
References: <1270556127.6073.7.camel@mattotaupa> <hpf9cr$gd1$1@dough.gmane.org>
Date: Tue, 06 Apr 2010 14:34:45 +0200
Message-ID: <1270557285.6073.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xf86-input-evdev: Add evdev 2.4.0 [1].
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
X-List-Received-Date: Tue, 06 Apr 2010 12:38:07 -0000
X-Groupsio-MsgNum: 18435
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-reqvG8gRXhqOJbCJOgb1"

--=-reqvG8gRXhqOJbCJOgb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 06.04.2010, 14:28 +0200 schrieb Koen Kooi:
> On 06-04-10 14:15, Paul Menzel wrote:
> > [1] http://lists.freedesktop.org/archives/xorg/2010-April/049851.html
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> > I do not know if setting `PE` [1] is still needed and has to be carried=
 on to be used. But all *evdev* recipes have it and probably cannot be rese=
t.
>=20
> Right, if one recipe has it, all recipes after that also need to have it
> otherwise version will go backwards.

Thank you for the clarification. If someone or I will have a free
minute, converting the recipes to use `xf86-input-evdev.inc` would be
great.


Thanks,

Paul

--=-reqvG8gRXhqOJbCJOgb1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku7KmQACgkQPX1aK2wOHVj6zACfcyLDXEurmuJS023LoK6r8c+Z
do4AoISZKNHNNnvEke5gu9+d2UlnSapu
=oFGD
-----END PGP SIGNATURE-----

--=-reqvG8gRXhqOJbCJOgb1--
