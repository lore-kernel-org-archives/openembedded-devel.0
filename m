Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFIU-0005EX-OM for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 10:06:30 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFFj-00035C-V0 for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:03:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305570476-7207-1-git-send-email-raj.khem@gmail.com>
References: <1305570476-7207-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 17 May 2011 10:03:38 +0200
Message-ID: <1305619418.4065.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: Backport epoll implementation
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
X-List-Received-Date: Tue, 17 May 2011 08:06:30 -0000
X-Groupsio-MsgNum: 32132
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Lf8MN+eJsa0ejrxRBPiu"

--=-Lf8MN+eJsa0ejrxRBPiu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Montag, den 16.05.2011, 11:27 -0700 schrieb raj.khem@gmail.com:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> Many applications e.g. firefox need it
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../uclibc/uclibc-git/uclibc-epoll.patch           |  378 ++++++++++++++=
++++++
>  meta-oe/recipes-core/uclibc/uclibc_git.bb          |    3 +-
>  2 files changed, 380 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc-epoll.p=
atch

[=E2=80=A6]

is that patch different from what was merged upstream [1]?

If no, could the revision just be updated?


Thanks,

Paul


[1] http://git.uclibc.org/uClibc/

--=-Lf8MN+eJsa0ejrxRBPiu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3SK80ACgkQPX1aK2wOHViZSwCcDE3MUwxaXTSAV0AI5cOxTSAW
mjwAniJwV2AbKYSTUvpn/BRCI50oASLm
=9nxY
-----END PGP SIGNATURE-----

--=-Lf8MN+eJsa0ejrxRBPiu--
