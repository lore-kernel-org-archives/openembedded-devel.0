Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OfANa-00028d-U4 for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:37:33 +0200
Received: from f053040133.adsl.alicedsl.de ([78.53.40.133]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OfANH-0002qE-LU for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 11:37:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimx9o-PzWgVJoPR3W3njy61wu1kowOPV2j-4vKM@mail.gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1280504555-3633-2-git-send-email-aalonso00@gmail.com>
	<1280573475.3721.44.camel@mattotaupa>
	<AANLkTimx9o-PzWgVJoPR3W3njy61wu1kowOPV2j-4vKM@mail.gmail.com>
Date: Sat, 31 Jul 2010 13:37:05 +0200
Message-ID: <1280576225.3721.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Wiki: Added `pwclient` to page Patchwork (was: [PATCH 02/10] xilinx-virtex4: new file)
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
X-List-Received-Date: Sat, 31 Jul 2010 11:37:33 -0000
X-Groupsio-MsgNum: 21681
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ueM/vk1OOhSsgzzP0X+E"

--=-ueM/vk1OOhSsgzzP0X+E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 31.07.2010, 13:25 +0200 schrieb Frans Meulenbroeks:
> 2010/7/31 Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> > Am Freitag, den 30.07.2010, 10:42 -0500 schrieb Adrian Alonso:
> > > +
> > > +PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> > > +PREFERRED_VERSION_u-boot_xilinx-virtex4 =3D "u-boot-xilinx"
> >
> > As far as I can see, those recipes are added in later patches. Would no=
t
> > that make this patch produce a non-working machine and therefore for
> > example also render `git bisect` useless.
> >
> > If I was right, please reorder the patches. I do not know what the
> > preferred way of adding new machines is. A big patch with all needed
> > files or incremental ones.
>=20
> If you reorder please resubmit the full patchset, so it becomes clear wha=
t
> belongs together.
> Also use PATCH v2 or so in he header to distinguish form earlier patches

I updated the Wiki page for Patchwork [1].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Patchwork

--=-ueM/vk1OOhSsgzzP0X+E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxUCuEACgkQPX1aK2wOHVhX6gCcDby72SxJwIrbnD1YD6a+nj22
mt0AnjK5XiAmbhM4NlfAblYFEPtCWyZt
=6vN4
-----END PGP SIGNATURE-----

--=-ueM/vk1OOhSsgzzP0X+E--
