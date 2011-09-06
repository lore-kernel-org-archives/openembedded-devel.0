Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0skf-00085D-SW for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:19:33 +0200
Received: from f053044007.adsl.alicedsl.de ([78.53.44.7] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0sft-0007Ge-QX for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 10:14:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Sep 2011 12:14:15 +0200
In-Reply-To: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315304074.4717.6.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:19:33 -0000
X-Groupsio-MsgNum: 34082
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-kWpynpcJE4i3IA9u6wE1"

--=-kWpynpcJE4i3IA9u6wE1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Sylvain,


thank you for your patch.

Am Dienstag, den 06.09.2011, 11:58 +0200 schrieb Sylvain Par=C3=A9:

1. Please use

	binutils*: Update to version 2.21.1

as the commit summary. It is clear that a recipe is updated because of
the prefix with the recipe name.

> Signed-off-by: Sylvain 'GarthPS' Par=C3=A9 <sylvain.pare@gmail.com>

2. Unfortunately Google Mail mangled your patch again by adding line
breaks. Please use `git send-email =E2=80=A6` or a =E2=80=9Cbetter=E2=80=9D=
 mail program/MUA to
fix this.

> ---
>  recipes/binutils/binutils-cross-sdk_2.21.1.bb |    2 ++
>  recipes/binutils/binutils-cross-sdk_2.21.bb   |    2 --
>  recipes/binutils/binutils-cross_2.21.1.bb     |    2 ++
>  recipes/binutils/binutils-cross_2.21.bb       |    2 --
>  recipes/binutils/binutils_2.21.1.bb           |   21 +++++++++++++++++++=
++
>  recipes/binutils/binutils_2.21.bb             |   21 -------------------=
--
>  6 files changed, 25 insertions(+), 25 deletions(-)
>  create mode 100644 recipes/binutils/binutils-cross-sdk_2.21.1.bb
>  delete mode 100644 recipes/binutils/binutils-cross-sdk_2.21.bb
>  create mode 100644 recipes/binutils/binutils-cross_2.21.1.bb
>  delete mode 100644 recipes/binutils/binutils-cross_2.21.bb
>  create mode 100644 recipes/binutils/binutils_2.21.1.bb
>  delete mode 100644 recipes/binutils/binutils_2.21.bb

[=E2=80=A6]

3. Please use `git format-patch -M -M -C -C -C =E2=80=A6` (I do not know if=
 you
need to duplicate the option) to create patches when you move something.
The shown differences will be smaller and this is easier to review.


Thanks,

Paul

--=-kWpynpcJE4i3IA9u6wE1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5l8ncACgkQPX1aK2wOHVjcKgCdGTwqppMysd7SBlnsGu4exSl1
6MQAn062bIfobVRi/e8B7UcBCrtSrgft
=00yh
-----END PGP SIGNATURE-----

--=-kWpynpcJE4i3IA9u6wE1--
