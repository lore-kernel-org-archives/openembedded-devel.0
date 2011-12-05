Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RXT1l-0001kL-UZ for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 08:31:53 +0100
Received: from f053043049.adsl.alicedsl.de ([78.53.43.49]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RXSvG-0004rO-NM for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 07:25:10 +0000
Message-ID: <1323069908.3449.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 05 Dec 2011 08:25:08 +0100
In-Reply-To: <1323030626-564-1-git-send-email-eric@eukrea.com>
References: <jbgcgc$tmh$1@dough.gmane.org>
	<1323030626-564-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-oe v4] add nostromo webserver
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
X-List-Received-Date: Mon, 05 Dec 2011 07:31:54 -0000
X-Groupsio-MsgNum: 35868
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-NfqnXix6dXRQGDn7uYhf"

--=-NfqnXix6dXRQGDn7uYhf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Sonntag, den 04.12.2011, 21:30 +0100 schrieb Eric B=C3=A9nard:
> this recipe was imported from OE-classic and upgraded to latest
> version

could you add the version number to the commit summary? That would be
great. Also the OE-classic commit SHA sum would be useful.

> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  ...ile-add-possibility-to-override-variables.patch |  141 ++++++++++++++=
++++++
>  .../recipes-extended/nostromo/files/nhttpd.conf    |   55 ++++++++
>  meta-oe/recipes-extended/nostromo/files/nostromo   |   34 +++++
>  meta-oe/recipes-extended/nostromo/files/volatiles  |    2 +
>  .../recipes-extended/nostromo/nostromo_1.9.5.bb    |   51 +++++++
>  5 files changed, 283 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/nostromo/files/0001-GNUmakef=
ile-add-possibility-to-override-variables.patch
>  create mode 100644 meta-oe/recipes-extended/nostromo/files/nhttpd.conf
>  create mode 100644 meta-oe/recipes-extended/nostromo/files/nostromo
>  create mode 100644 meta-oe/recipes-extended/nostromo/files/volatiles
>  create mode 100644 meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb

[=E2=80=A6]


Thanks,

Paul

--=-NfqnXix6dXRQGDn7uYhf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7ccdQACgkQPX1aK2wOHVhiTQCdE5nJBgyqtb+iKrXzknf/cuW8
iU0An2KyhLbhc3d1Bccs5LIDs/eQVYeW
=WoiR
-----END PGP SIGNATURE-----

--=-NfqnXix6dXRQGDn7uYhf--
