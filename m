Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RzcTW-0001eU-Ad for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 00:16:54 +0100
Received: from f053041163.adsl.alicedsl.de ([78.53.41.163]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RzcLX-0000Pq-TS for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:08:40 +0000
Message-ID: <1329779316.8910.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 00:08:36 +0100
In-Reply-To: <1329745909-21013-1-git-send-email-eric@eukrea.com>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 23:16:54 -0000
X-Groupsio-MsgNum: 37265
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-gxLAs5Rb1QSRtJEv2Ut3"

--=-gxLAs5Rb1QSRtJEv2Ut3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 20.02.2012, 14:51 +0100 schrieb Eric B=C3=A9nard:
> - imported 2.0.5 from oe-classic
> - upgrade to 2.3.5 which is latest stable
> - tested on ARMv5 with Angstrom

Please add the version number to the commit summary too.

> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  meta-oe/recipes-connectivity/vsftpd/files/init     |   41 ++++++++
>  .../recipes-connectivity/vsftpd/files/vsftpd.conf  |  108 ++++++++++++++=
++++++
>  .../vsftpd/vsftpd-2.3.5/makefile.patch             |   47 +++++++++
>  .../vsftpd/vsftpd-2.3.5/nopam.patch                |   12 ++
>  .../recipes-connectivity/vsftpd/vsftpd_2.3.5.bb    |   48 +++++++++
>  5 files changed, 256 insertions(+), 0 deletions(-)
>  create mode 100755 meta-oe/recipes-connectivity/vsftpd/files/init
>  create mode 100755 meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf
>  create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/make=
file.patch
>  create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopa=
m.patch
>  create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb

[=E2=80=A6]


Thanks,

Paul

--=-gxLAs5Rb1QSRtJEv2Ut3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9C0nQACgkQPX1aK2wOHVjmWwCfffyabPllg5tJf+8wT1WzpH0O
HqAAmwXWVccVYPDDuXrqWKjVdb7jTo8D
=ovP5
-----END PGP SIGNATURE-----

--=-gxLAs5Rb1QSRtJEv2Ut3--
