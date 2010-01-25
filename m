Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZVJ8-0007y8-V5 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 21:13:13 +0100
Received: from e178248235.adsl.alicedsl.de ([85.178.248.235]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZVGu-0007JS-Ht for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 20:10:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jan 2010 21:10:50 +0100
Message-ID: <1264450250.3984.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [10a1258] hal 0.5.14+git: teach linux devices.c about 'input.touchscreen'
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
X-List-Received-Date: Mon, 25 Jan 2010 20:13:14 -0000
X-Groupsio-MsgNum: 16229
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PrJ2cRgE0nnaotLPmtnJ"

--=-PrJ2cRgE0nnaotLPmtnJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen,


do you plan to get this upstream? Were all your touchscreens not
recognized or just a certain one?

In [1] it says regarding touch*pads*

        Keying on ABS_PRESSURE is
        definitely not correct as some touchpads to not report it and many
        touchscreens do. Is this on 32 or 64 bit kernels? What about usersp=
ace?

so I wonder that no one else reported this on the HAL list.


Thanks,

Paul


[1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D562052#46

--=-PrJ2cRgE0nnaotLPmtnJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktd+r0ACgkQPX1aK2wOHVi+5ACgiNRMKYljsOsaZiLIljbQ7YY8
eUcAn1PP7BTsHZMCGeMUH06GK3mDOkyz
=z517
-----END PGP SIGNATURE-----

--=-PrJ2cRgE0nnaotLPmtnJ--
