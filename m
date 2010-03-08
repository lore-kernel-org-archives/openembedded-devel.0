Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NolWo-0000nH-Bp
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 23:34:26 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NolTz-0004B3-3K
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 01:31:28 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Mar 2010 01:29:12 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003082201.30147.roman@khimov.ru>
	<1268081324.16526.82.camel@trini-m4400>
In-Reply-To: <1268081324.16526.82.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201003090129.19439.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Mon, 08 Mar 2010 22:34:26 -0000
X-Groupsio-MsgNum: 17407
Content-Type: multipart/signed; boundary="nextPart3219686.1fh2hmB5Gh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3219686.1fh2hmB5Gh
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 08 =D0=
=BC=D0=B0=D1=80=D1=82=D0=B0 2010 23:48:44 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 To=
m Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Mon, 2010-03-08 at 22:01 +0300, Roman I Khimov wrote:
> > Hello all.
> >
> > Please take a look at "rik/qemu-0.12" branch on OE git repo. 0.9.x
> > removal patch is 0.5 Mb, so I think it's not appropriate for mailing
> > list. In general, 0.12.3 addition was easy, but then I've discovered th=
at
> > 0.10.3 version is not working on openSUSE 11.2, so there is also a chan=
ge
> > in sanity and proposal to remove 0.10.3 from repository.
> >
> > Comments are welcome.
>=20
> Looks good except maybe we should move to BBCLASSEXTENDS while we're in
> here?

Sure, an updated version is pushed.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3219686.1fh2hmB5Gh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuVej8ACgkQXJ70z+XgVcP2RACcCVH2IJa8/l9De9vll0hFVzLY
XzwAn044MCeGVQ2xn6Raoxw1+qcoH6gD
=IaFK
-----END PGP SIGNATURE-----

--nextPart3219686.1fh2hmB5Gh--
