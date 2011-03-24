Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2hoX-0003Iy-0S for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:30:49 +0100
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2hml-0008OJ-5Q for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 10:28:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2011 11:28:57 +0100
Message-ID: <1300962537.3795.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 0/7] Checksums and LIC_FILES_CHKSUMs
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
X-List-Received-Date: Thu, 24 Mar 2011 10:30:49 -0000
X-Groupsio-MsgNum: 30586
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FODfmBoT/c95FXnAxXkp"

--=-FODfmBoT/c95FXnAxXkp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 24.03.2011, 11:09 +0100 schrieb Martin Jansa:
> Mostly checksums and LIC_FILES_CHKSUMs

I have never heard of 'LIC_FILES_CHKSUM'.

        $ git grep 'LIC_FILES'
        recipes/htop/htop_0.9.bb:LIC_FILES_CHKSUM =3D "file://COPYING;md5=
=3Dc312653532e8e669f30e5ec8bdc23be3"
        recipes/lighttpd/lighttpd_1.4.28.bb:LIC_FILES_CHKSUM =3D "file://CO=
PYING;md5=3De4dac5c6ab169aa212feb5028853a579"
        recipes/ofono/ofono.inc:LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D=
eb723b61539feef013de476e68b5c50a \
        recipes/wpa-supplicant/wpa-supplicant-0.7.inc:LIC_FILES_CHKSUM =3D =
"file://../COPYING;md5=3Dc54ce9345727175ff66d17b67ff51f58 \

It looks like this is something from Pkoy [1]. So is this for the merge
with Yocto?

[=E2=80=A6]


Thanks,

Paul


[1] http://www.yoctoproject.org/docs/poky-ref-manual/poky-ref-manual.html#u=
singpoky-specifying-LIC_FILES_CHKSUM

--=-FODfmBoT/c95FXnAxXkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2LHOkACgkQPX1aK2wOHVjsTwCfZAfyKBnygVqUzzWrv51vZJZU
FpcAnRKld+NdBrgDSJ4UFROlKktuvww0
=onIr
-----END PGP SIGNATURE-----

--=-FODfmBoT/c95FXnAxXkp--
