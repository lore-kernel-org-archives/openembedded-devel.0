Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nw74s-00047s-83
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 06:59:55 +0200
Received: (qmail 20821 invoked by uid 813007); 29 Mar 2010 04:56:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Mar 2010 04:56:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 06:56:44 +0200
User-Agent: KMail/1.13.1 (Linux/2.6.34-rc2; KDE/4.4.1; x86_64; ; )
References: <1269652058-31406-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1269652058-31406-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Message-Id: <201003290656.49082.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] procps_3.2.8: add missing checksums
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
X-List-Received-Date: Mon, 29 Mar 2010 04:59:56 -0000
X-Groupsio-MsgNum: 18207
Content-Type: multipart/signed; boundary="nextPart1380243.XsTUKqrv2C";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1380243.XsTUKqrv2C
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 27 marca 2010 o 02:07:38 Andrea Adami napisa=C5=82(a):
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/checksums.ini |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 6a171e8..ed06efc 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -20674,6 +20674,10 @@
> sha256=3D6d52c706401af197bd9d7e0187c35b4a3463ea720392ffa0c020d94899b361e5
> md5=3Df490bca772b16472962c7b9f23b1e97d
>  sha256=3Db439e04adab9b1e66e11f59c4331680da48f1722f2123123f7c16dfbed2c38dc
>=20
> +[http://procps.sourceforge.net/procps-3.2.8.tar.gz]
> +md5=3D9532714b6846013ca9898984ba4cd7e0
> +sha256=3D11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535
> +
>  [ftp://ftp.nl.uu.net/pub/unix/ftp/proftpd/ftp/distrib/source/proftpd-1.3=
=2E2
> .tar.gz] md5=3D756f762883cc8eed03d99dc3b1c56a8e
>  sha256=3D5e00c20d74bbf98fb8bcc63bd4aecfd08480a87ec731dae8955bd9fca6a01bb3

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1380243.XsTUKqrv2C
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuwMw0ACgkQeQ6MlGH/2qs68ACbBWMiumywdq20BwXZtwpADifu
+tgAnRoe1PhpUhFGoCBsrgparlN0y600
=SuGK
-----END PGP SIGNATURE-----

--nextPart1380243.XsTUKqrv2C--
