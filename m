Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48ao-0004zf-Jo for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:50:50 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48Vw-0003Fi-N3 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 09:45:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:45:40 +0200
In-Reply-To: <CAL9MRr=T=WpYHWe0JKnf1FXXRRdiCmFx6HfeS75Rnn35cyKdMg@mail.gmail.com>
References: <CAL9MRrnBVWmZ06rYdp-PomBj=n_4OSMSRx9ejdSJnfn5V7Hokw@mail.gmail.com>
	<1315995214.6686.46.camel@mattotaupa>
	<CAL9MRr=T=WpYHWe0JKnf1FXXRRdiCmFx6HfeS75Rnn35cyKdMg@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316079941.4523.38.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] Add support for mini-box.com picoSAM9G45 board
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
X-List-Received-Date: Thu, 15 Sep 2011 09:50:50 -0000
X-Groupsio-MsgNum: 34252
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Sm0gr1gLBxb3h1WjcGle"

--=-Sm0gr1gLBxb3h1WjcGle
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nicu,


Am Donnerstag, den 15.09.2011, 12:15 +0300 schrieb Nicu Pavel:

> On Wed, Sep 14, 2011 at 1:13 PM, Paul Menzel wrote:
> > [...]
> > Please resend with these comments addressed as [PATCH v2] [4].
>=20
> Thanks for your comments, I resent  the patches per your instructions.

thank you very much for addressing my comments. It is much appreciated.
As Otavia pointed out, you should consider moving to oe-core and meta-oe
in the future. meta-oe lacks some recipes available in oe.dev
(oe-classic) but it is actively developed and gets more testing and
security support.

> For some reason registering on patchwork, gives me and error
> and I don't receive the activation email, so I'm unable to update the
> status of the previous patch.

Several people have reported problems with Patchwork. I hope an admin
will look into it.


Thanks,

Paul


[1] http://openembedded.org/index.php?title=3DOpenEmbedded-Core

--=-Sm0gr1gLBxb3h1WjcGle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xyUQACgkQPX1aK2wOHVjHhwCfXDUZytkjBRKdyCEhhAD8iuh9
5Z8An1eCh9lDrdSbawVX9omcSSSuJZsQ
=UN/J
-----END PGP SIGNATURE-----

--=-Sm0gr1gLBxb3h1WjcGle--
