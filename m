Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or9mK-0000Xx-LQ for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 15:24:33 +0200
Received: from f053037242.adsl.alicedsl.de ([78.53.37.242]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Or9ln-00018V-M7 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 13:23:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283432785-13292-1-git-send-email-noor_ahsan@mentor.com>
References: <1283432785-13292-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 02 Sep 2010 15:23:57 +0200
Message-ID: <1283433837.3990.39.camel@mattotaupa>
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
Subject: Re: [PATCH] sqlite: Merge target and native recipe using BBCLASSEXTEND
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
X-List-Received-Date: Thu, 02 Sep 2010 13:24:33 -0000
X-Groupsio-MsgNum: 23077
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pYZlpCzS4VNg9AuvtK3u"

--=-pYZlpCzS4VNg9AuvtK3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 02.09.2010, 19:06 +0600 schrieb Noor Ahsan:
> * Merge target and native recipes using BBCLASSEXTEND, Set BBCLASSEXTEND =
=3D "native"
> * Bump PR to "r7"
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  recipes/sqlite/sqlite_2.8.17.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

As Frans pointed out in another comment to a patch, please remove the
old native recipe in the same patch.

[=E2=80=A6]


Thanks a lot for your effort,

Paul

--=-pYZlpCzS4VNg9AuvtK3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx/pW0ACgkQPX1aK2wOHVhT9wCfYogPBtCPEhpeZ1yhpeOaYvMA
OOkAnis80xeyR/fI6KcpRZELcXyTk7bR
=cCsE
-----END PGP SIGNATURE-----

--=-pYZlpCzS4VNg9AuvtK3u--
