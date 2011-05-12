Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKRMf-0007Op-FH for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:35:21 +0200
Received: from f053044015.adsl.alicedsl.de ([78.53.44.15]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKRLJ-00074l-8P for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 08:33:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305145805-14609-3-git-send-email-eric@eukrea.com>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-3-git-send-email-eric@eukrea.com>
Date: Thu, 12 May 2011 10:32:34 +0200
Message-ID: <1305189154.4254.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/6] minimal: prefer qt 4.7.3
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
X-List-Received-Date: Thu, 12 May 2011 08:35:21 -0000
X-Groupsio-MsgNum: 31928
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Q6Nu2vh0kiso7EMuqoB5"

--=-Q6Nu2vh0kiso7EMuqoB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem, dear Eric,


Am Mittwoch, den 11.05.2011, 22:30 +0200 schrieb Eric B=C3=A9nard:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/minimal.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 090a4db..18bcfae 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -115,7 +115,7 @@ require conf/distro/include/preferred-opie-versions-1=
.2.5.inc
> =20
>  PREFERRED_PROVIDER_opkg ?=3D "opkg"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
> -PREFERRED_QT_VERSION ?=3D "4.7.2"
> +PREFERRED_QT_VERSION ?=3D "4.7.3"
>  PREFERRED_VERSION_qt4-tools-native =3D "${PREFERRED_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${PREFERRED_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded =3D "${PREFERRED_QT_VERSION}"

sorry for the slight off-topic question. But I how I understand minimal,
it normally takes the latest recipes available. So could setting the Qt
version be actually be dropped in a future patch?


Thanks,

Paul

--=-Q6Nu2vh0kiso7EMuqoB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3LmxsACgkQPX1aK2wOHVgZ5QCeP+qESQwvSvr04fxJtgFFO073
uuMAoIoxwzo7EEYE1OYrQ3fpC0m1tLYN
=SYv9
-----END PGP SIGNATURE-----

--=-Q6Nu2vh0kiso7EMuqoB5--
