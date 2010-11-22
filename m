Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKZdM-0001E6-Gp for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 17:52:54 +0100
Received: from f053040216.adsl.alicedsl.de ([78.53.40.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKZcE-0004b2-Re for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 16:51:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CE9D604.5040202@balister.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
	<4CE9D604.5040202@balister.org>
Date: Mon, 22 Nov 2010 17:51:41 +0100
Message-ID: <1290444701.3703.66.camel@mattotaupa>
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
Subject: Re: [PATCH 1/3] gtk+-1.2: convert to new style staging (fixes xmms build)
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
X-List-Received-Date: Mon, 22 Nov 2010 16:52:55 -0000
X-Groupsio-MsgNum: 26429
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Fy3pYWu5BJNmtI0c7ln4"

--=-Fy3pYWu5BJNmtI0c7ln4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 21.11.2010, 18:31 -0800 schrieb Philip Balister:
> On 11/21/2010 03:59 PM, Andreas Oberritter wrote:
> > * gtk+-1.2 didn't install its pkg-config file, but gtk-config
> >    depended on it and went crazy without it. xmms uses gtk-config.
> >
> > Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> > Tested-by: Yury Bushmelev<jay4mail@gmail.com>
>=20
> Tested-by: Philip Balister <philip@balister.org>

Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "483d58d"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "2010.7-test-20101122"
        TARGET_FPU        =3D "hard"

[=E2=80=A6]

--=-Fy3pYWu5BJNmtI0c7ln4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzqn50ACgkQPX1aK2wOHVgnQACcCNvdRupsGJw0KBCtKBDzdl+2
wQ4An2V8wiGvUAikkeKS1ae4jk787NUZ
=j5QS
-----END PGP SIGNATURE-----

--=-Fy3pYWu5BJNmtI0c7ln4--
