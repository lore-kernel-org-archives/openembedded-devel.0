Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWo9s-0003oQ-PW for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 10:44:32 +0100
Received: from f053034131.adsl.alicedsl.de ([78.53.34.131]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWo7k-0005b3-NZ for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 09:42:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263806158.3589.19.camel@balakrishnan-desktop>
References: <1263806158.3589.19.camel@balakrishnan-desktop>
Date: Mon, 18 Jan 2010 10:42:15 +0100
Message-ID: <1263807735.3530.11.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] regulus: Adding pxa270 based machine
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
X-List-Received-Date: Mon, 18 Jan 2010 09:44:32 -0000
X-Groupsio-MsgNum: 15845
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w9G1zH3WdDBSpXEV2BWA"

--=-w9G1zH3WdDBSpXEV2BWA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.01.2010, 14:45 +0530 schrieb balakrishnan:
> Regulus is pxa270 based machine, is to be reviewed and added to oe tree.
> Attached patches are used to create u-boot, kernel and demo-image for
> regulus machine.

I think your patches miss a =C2=BBSigned-off-by=C2=AB-line to get included =
[1].
You can add =C2=BB-s=C2=AB to =C2=BBgit commit=C2=AB or =C2=BBgit format-pa=
tch=C2=AB to get this
appended automatically.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy

--=-w9G1zH3WdDBSpXEV2BWA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktULPYACgkQPX1aK2wOHVg9RQCggSVfa8UlikWAcTTsNlh8jQ0q
kVUAn0UGSEN6V19FxyvZHEnxIog5MKu2
=ZMKK
-----END PGP SIGNATURE-----

--=-w9G1zH3WdDBSpXEV2BWA--
