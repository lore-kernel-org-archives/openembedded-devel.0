Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8UGG-0004Fd-3Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 10:10:49 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8UCe-0006an-Qj
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 12:07:05 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 May 2010 12:07:04 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
	<1272748338-23051-2-git-send-email-ken@codelabs.ch>
In-Reply-To: <1272748338-23051-2-git-send-email-ken@codelabs.ch>
MIME-Version: 1.0
Message-Id: <201005021207.04306.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] tzdata: update to latest version (2010i).
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
X-List-Received-Date: Sun, 02 May 2010 08:10:49 -0000
X-Groupsio-MsgNum: 18925
Content-Type: multipart/signed; boundary="nextPart2896679.R3LGc4f5pu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2896679.R3LGc4f5pu
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 02 =D0=
=BC=D0=B0=D1=8F 2010 01:12:18 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Adrian-Ken Rue=
egsegger=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
> ---
>  recipes/tzdata/tzdata_2010h.bb |   10 ----------
>  recipes/tzdata/tzdata_2010i.bb |   10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 recipes/tzdata/tzdata_2010h.bb
>  create mode 100644 recipes/tzdata/tzdata_2010i.bb

Acked-by: Roman I Khimov <khimov@altell.ru>

Tested, pushed, thanks.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2896679.R3LGc4f5pu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvdMqgACgkQXJ70z+XgVcMxBwCgxqUiUM6dkkw0An22ChpbCwMX
DiwAoKgBGMBO0R21efzhm6M2r+XW0L2H
=7ngy
-----END PGP SIGNATURE-----

--nextPart2896679.R3LGc4f5pu--
