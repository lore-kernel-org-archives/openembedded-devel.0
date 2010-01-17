Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWYTY-00069x-Ic for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 17:59:47 +0100
Received: from g225080206.adsl.alicedsl.de ([92.225.80.206]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWYRR-0001zc-0K for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 16:57:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001171141210.11393@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
Date: Sun, 17 Jan 2010 17:57:30 +0100
Message-ID: <1263747450.3210.50.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 16:59:47 -0000
X-Groupsio-MsgNum: 15803
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-J5SSHEDd+IIT1f4aq9ri"

--=-J5SSHEDd+IIT1f4aq9ri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 11:47 -0500 schrieb Robert P. J. Day:

[=E2=80=A6]

>   a suggestion -- until the issue with gnome-games is resolved, why
> not just remove its inclusion from the bb-demo-image task?  i'm being
> quite serious -- it's obviously not a critical package, and if it's
> the only thing keeping people from building and testing the OE dev
> branch for the beagleboard, take it out so folks can get back to
> testing.

[=E2=80=A6]

In my opinion that would not be the right way to tackle this issue.

Just enter a new bug report in OE=E2=80=99s bugtracker [1], attach a diff p=
eople
can apply *locally* to remove the dependency on `gnome-games`, reference
the report in a reply to this thread and close the report when the issue
is fixed.


Thanks,

Paul


[1] http://bugs.openembedded.net/

--=-J5SSHEDd+IIT1f4aq9ri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktTQXoACgkQPX1aK2wOHViTnwCghvnBAyX4bZeiMu69u9JhSzkE
8V8Anjw40MDFg7CQry1/8znYf/mVHnDz
=8WJg
-----END PGP SIGNATURE-----

--=-J5SSHEDd+IIT1f4aq9ri--
