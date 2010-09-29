Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0sTH-0005Yl-Ok for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 10:57:07 +0200
Received: from f053038023.adsl.alicedsl.de ([78.53.38.23]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0sSw-0004Ab-PM for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:56:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA2FE48.8060703@dresearch.de>
References: <1285666009.4168.28.camel@mattotaupa>
	<1285666476-3020-1-git-send-email-t.fromm@dresearch.de>
	<1285748455.3876.22.camel@mattotaupa> <4CA2FE48.8060703@dresearch.de>
Date: Wed, 29 Sep 2010 10:56:41 +0200
Message-ID: <1285750601.3876.51.camel@mattotaupa>
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
Subject: Re: [v4] wvstreams-4.6: Remove dbus support (breaks build)
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
X-List-Received-Date: Wed, 29 Sep 2010 08:57:09 -0000
X-Groupsio-MsgNum: 24129
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+Gm1Nnfu740DkIWlMqdn"

--=-+Gm1Nnfu740DkIWlMqdn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 29.09.2010, 10:52 +0200 schrieb Thilo Fromm:

[=E2=80=A6]

> > I am not sure, but your patch is an improvement for GNU Libc based
> > distributions and so your patch could as well be commit.
>=20
> Weird, though. My patch didn't introduce anything obvious that would=20
> make non-glibc builds fail. Did you try building wvstreams-4.6 / eglibc=
=20
> or wvstreams-4.6 / uClibc without my patch applied?

Yes and it failed with the same error your patch is fixing. I guess it
has never worked with uClibc or eglibc.


Thanks,

Paul

--=-+Gm1Nnfu740DkIWlMqdn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkyi/0kACgkQPX1aK2wOHViH5ACUDCbdG25EMibmpdBhy2TEJ1r+
gACdH3oBZeHm72Et1HTbD7XKQQKqqfM=
=D6z9
-----END PGP SIGNATURE-----

--=-+Gm1Nnfu740DkIWlMqdn--
