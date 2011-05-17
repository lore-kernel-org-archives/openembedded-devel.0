Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMKaE-00012z-H5 for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 15:45:10 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMKXU-0004Qo-7M for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 13:42:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305639168-6590-1-git-send-email-noor_ahsan@mentor.com>
References: <1305639168-6590-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 17 May 2011 15:42:18 +0200
Message-ID: <1305639738.4065.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v3] userspace-rcu: Add new recipe for 0.5.4 version.
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
X-List-Received-Date: Tue, 17 May 2011 13:45:10 -0000
X-Groupsio-MsgNum: 32150
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w8bJNHxpjhJbcDHUXUsZ"

--=-w8bJNHxpjhJbcDHUXUsZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 17.05.2011, 18:32 +0500 schrieb Noor Ahsan:
> * Added a new recipe of userspace-rcu for 0.5.4 version

Well this item is redundant to the commit message, so the committer
should remove it.

Will you send a follow up patch to remove `userspace-rcu_0.4.6.bb`
afterward? Or are there still users?

What build configuration has this patch been tested with?

You do not have to resend the patch. Just answer the questions in a
reply.

> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  recipes/lttng/userspace-rcu_0.5.4.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/lttng/userspace-rcu_0.5.4.bb b/recipes/lttng/userspa=
ce-rcu_0.5.4.bb
> new file mode 100644
> index 0000000..e0d98e5
> --- /dev/null
> +++ b/recipes/lttng/userspace-rcu_0.5.4.bb
> @@ -0,0 +1,3 @@
> +require ${PN}.inc
> +SRC_URI[md5sum] =3D "04147d24749be75200173859839207f7"
> +SRC_URI[sha256sum] =3D "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4e=
b28948e234bd89f1"

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-w8bJNHxpjhJbcDHUXUsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3SezoACgkQPX1aK2wOHVi1nwCfWizFkp4Dn8/DY6o+9UtE+Xtn
/GUAnjpFz6RFNNeqejS2v4NwvHxJHE3X
=gXIN
-----END PGP SIGNATURE-----

--=-w8bJNHxpjhJbcDHUXUsZ--
