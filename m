Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NsMhs-0007HU-7Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 21:52:44 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NsMeu-0000bg-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 23:49:37 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Mar 2010 23:47:01 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru> <hnu2gb$ehr$1@dough.gmane.org>
In-Reply-To: <hnu2gb$ehr$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201003182347.06715.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Thu, 18 Mar 2010 20:52:44 -0000
X-Groupsio-MsgNum: 17839
Content-Type: multipart/signed; boundary="nextPart7276129.2JJjqTE1BB";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart7276129.2JJjqTE1BB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 18 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 23:30:03 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Koen Kooi =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 18-03-10 20:12, Roman I Khimov wrote:
> > Hello all.
> >
> > As perl 5.10.1 is a big patch by itself and series overall is 42 patches
> > and I don't want to banned from list for spam ;), I've commited that to
> > the "rik/perl-5.10" branch of OE repo.
> >
> > In general, the most interesting and the most requiring review are the
> > first 4, all the other are just various modules. So, please
> > review/try/test/ack/nack.
>=20
> Do these include the poky tweaks to make new-style staging work (needs
> cpan changes as well iirc)?

No. You mean, this one?
http://git.pokylinux.org/cgit.cgi/poky/commit/?id=3Dca5f36ee6ad756e1e540288=
a56a504c1d8ecc7a3

Looks like a good thing to have, so if Richard will push it to OE.dev I can=
 do=20
a rebase of my patchset.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart7276129.2JJjqTE1BB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuikUoACgkQXJ70z+XgVcP9GwCgveAitJH9E0ZpIyGX+tESLHPn
3B8AnRB094v+pNjSj+PU41xnsq55qjT5
=dv4U
-----END PGP SIGNATURE-----

--nextPart7276129.2JJjqTE1BB--
