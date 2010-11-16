Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PIUCn-00009V-Mu for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 23:40:50 +0100
Received: from f053034203.adsl.alicedsl.de ([78.53.34.203]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PIUBm-0003EA-90 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 22:39:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
Date: Tue, 16 Nov 2010 23:39:44 +0100
Message-ID: <1289947184.11873.3.camel@mattotaupa>
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
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Tue, 16 Nov 2010 22:40:50 -0000
X-Groupsio-MsgNum: 26188
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iDISNpZFBZN8jCEjGYjc"

--=-iDISNpZFBZN8jCEjGYjc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Dienstag, den 16.11.2010, 10:20 -0800 schrieb Khem Raj:

> In order to get to the 2010.12 release, I would like to request to
> stop pushing any changes to master until release. Please keep your
> changes in you local tree ready for when the window
> opens again after the release.

would it be a good idea, to either have each developer with commit
access create his/her own =E2=80=9Cnext=E2=80=9D branch or to have a common=
 next branch,
where those changes could be published, so that work is not duplicated?

[=E2=80=A6]


Thanks,

Paul


PS: Khem, thanks for taking the lead in getting this release done!

--=-iDISNpZFBZN8jCEjGYjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzjCCQACgkQPX1aK2wOHVjtAACeOnQo8D+OpkvWTEvc38a2OoWy
yQwAnivIg0xvzmkHohylqUjpSAMQac33
=WCnk
-----END PGP SIGNATURE-----

--=-iDISNpZFBZN8jCEjGYjc--
