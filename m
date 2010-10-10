Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P51i6-0001wS-LV for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 21:37:58 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P51hk-00019v-37 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:37:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir> <1286698831.3808.2.camel@mattotaupa>
	<AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
	<1286703485.3808.10.camel@mattotaupa>
	<AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
Date: Sun, 10 Oct 2010 21:37:06 +0200
Message-ID: <1286739426.3808.117.camel@mattotaupa>
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
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sun, 10 Oct 2010 19:37:58 -0000
X-Groupsio-MsgNum: 24624
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WDSlI4W9EjlfaBe3ovBi"

--=-WDSlI4W9EjlfaBe3ovBi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 12:29 -0700 schrieb Khem Raj:
> On Sun, Oct 10, 2010 at 2:38 AM, Paul Menzel wrote:

[=E2=80=A6]

> > And still, the other thread [1] should find a conclusion, since for me
> > it looks like the current behavior is wrong.
>=20
> what behavior is wrong ?

As the thread subject says: DEPENDS not honored: `do_configure` runs
before `do_populate_sysroot` of dependencies.


Thanks,

Paul

--=-WDSlI4W9EjlfaBe3ovBi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyFeIACgkQPX1aK2wOHVi8ZACeKlijwygI1OCQSApaIhBPuLxa
sf0An2//O+Z5c8ag8ooaYoJI6gWboYTm
=8l2i
-----END PGP SIGNATURE-----

--=-WDSlI4W9EjlfaBe3ovBi--
