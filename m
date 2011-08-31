Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QylFB-00037O-A6 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:54:17 +0200
Received: from f053046058.adsl.alicedsl.de ([78.53.46.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QylAY-00032H-Nl for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 13:49:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 15:49:23 +0200
In-Reply-To: <j3ld1i$l0g$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org> <1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org> <20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
	<j3lad2$v75$2@dough.gmane.org>
	<CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>
	<j3ld1i$l0g$1@dough.gmane.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314798564.3769.48.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 13:54:17 -0000
X-Groupsio-MsgNum: 33950
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-D2/0wGnp6t3iBJOSO9wA"

--=-D2/0wGnp6t3iBJOSO9wA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 31.08.2011, 15:30 +0200 schrieb Koen Kooi:
> Op 31-08-11 15:02, Otavio Salvador schreef:

[=E2=80=A6]

> > so or you change the policy or you follow it. Otherwise makes no sense =
to
> > have a policy if the person who merge the patches do not follow it.
>=20
> From http://wiki.openembedded.org/index.php/Category:Policy I read:
>=20
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
> http://wiki.openembedded.org/index.php/Commit_Policy
> http://wiki.openembedded.org/index.php/Commit_log_example
> http://wiki.openembedded.org/index.php/Styleguide
> http://wiki.openembedded.org/index.php/Versioning_Policy
>=20
> And none of those say PR =3D r0 is wanted behaviour. OTOH it doesn't say =
it's
> unwanted either.

I am sorry for the confusion. It is actually all over the place in the
user manual [1].

	$ git grep "r0" docs/

This is of course in oe.dev, but the manual is still advertised in the
Wiki [1].


Thanks,

Paul


PS: Koen, thank you for fixing your Thunderbird installation. At least
it looks good in this message.


[1] http://docs.openembedded.org/usermanual/html/

--=-D2/0wGnp6t3iBJOSO9wA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5eO+MACgkQPX1aK2wOHVgx7QCeKPI7YjrT+CCwiATJ62yYsQf+
w/4AoIIWqnUY2sMFkJRYfsF6QciLoisR
=ZWM8
-----END PGP SIGNATURE-----

--=-D2/0wGnp6t3iBJOSO9wA--
