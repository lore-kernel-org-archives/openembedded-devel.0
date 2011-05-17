Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMKbj-0001AB-1f for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 15:46:43 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMKYz-0004R1-0p for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 13:43:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305639196-6624-1-git-send-email-noor_ahsan@mentor.com>
References: <1305639196-6624-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 17 May 2011 15:43:50 +0200
Message-ID: <1305639830.4065.65.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] ust: Add new recipe for 0.12 version
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
X-List-Received-Date: Tue, 17 May 2011 13:46:43 -0000
X-Groupsio-MsgNum: 32151
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NaGUvLQG1iff/oXpGvbj"

--=-NaGUvLQG1iff/oXpGvbj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 17.05.2011, 18:33 +0500 schrieb Noor Ahsan:
> * Add new recipe of ust for 0.12 version

The same comments and questions as in my other mail apply here too.
Please send a reply with the respective answers.

> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  recipes/lttng/ust_0.12.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/lttng/ust_0.12.bb b/recipes/lttng/ust_0.12.bb
> new file mode 100644
> index 0000000..1efb853
> --- /dev/null
> +++ b/recipes/lttng/ust_0.12.bb
> @@ -0,0 +1,4 @@
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "fae6e324a56016658c5b83ec14ba0043"
> +SRC_URI[sha256sum] =3D "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f6=
41df40b08314ab0c"

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-NaGUvLQG1iff/oXpGvbj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Se5YACgkQPX1aK2wOHVj4kQCZARP9AtQMj/0W1PtEaly3La2S
lpwAnR0YerLtgFQ0Ij97Wxo0gguMHb0V
=lZeO
-----END PGP SIGNATURE-----

--=-NaGUvLQG1iff/oXpGvbj--
