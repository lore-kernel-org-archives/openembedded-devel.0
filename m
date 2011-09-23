Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R72xj-0001wC-7R for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 12:26:31 +0200
Received: from f053044094.adsl.alicedsl.de ([78.53.44.94]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R72sk-0008UJ-A8 for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 10:21:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Sep 2011 12:21:04 +0200
In-Reply-To: <CAL9MRrnNaV9D6U0+O-1NHg3ZNr6NjdT8hK=hMBk_R_ejf3UT9g@mail.gmail.com>
References: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
	<CAL9MRrnNaV9D6U0+O-1NHg3ZNr6NjdT8hK=hMBk_R_ejf3UT9g@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316773272.4162.9.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: Add mini-box.com picoSAM9G45 board support
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
X-List-Received-Date: Fri, 23 Sep 2011 10:26:31 -0000
X-Groupsio-MsgNum: 34462
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-SqXjOCeqHt/oNrkAef2/"

--=-SqXjOCeqHt/oNrkAef2/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nicu,


Am Freitag, den 23.09.2011, 12:51 +0300 schrieb Nicu Pavel:

> On Thu, Sep 15, 2011 at 12:12 PM, Nicu Pavel <npavel@mini-box.com> wrote:
> > This patch series adds machine configuration and kernel recipe for mini=
-box.com picoSAM9G45 board
> > (http://www.mini-box.com/pico-SAM9G45-X).
>=20
> Have these patches been applied ?

I now pushed your patches as ff3282af [1] and 54779791 [2].

> Couldn't find them in openembedded (2011.03-maintenance) branch.

You have to send a separate pull request to the list (and Tom Rini) to
get that applied.

> I want to create a image recipe for our board with some default
> configuration and applications, is this acceptable ?

I guess so as there are TI and BeagleBoard specific images too.


Thanks,

Paul


[1] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dff3282af=
4844af0b72a6c1a069fc48ad87848830
[2] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D54779791=
16e2c93658d827344b6e1aa1c30dfeab

--=-SqXjOCeqHt/oNrkAef2/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk58XZAACgkQPX1aK2wOHViqcQCcCLDtNkStH5QAwlnnR08EkXcV
3hIAoIEh+yGIcBCb+ZzPiGL9sfkFOcT3
=ghXa
-----END PGP SIGNATURE-----

--=-SqXjOCeqHt/oNrkAef2/--
