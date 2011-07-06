Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeQOb-0000S6-9N for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 13:35:57 +0200
Received: from f053037185.adsl.alicedsl.de ([78.53.37.185]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeQLD-0006TK-FC for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 11:32:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d0771ab59e5a19cd41045ecaf5f390926a78e229.1309949770.git.a.sappia@biotechware.com>
References: <cover.1309949770.git.a.sappia@biotechware.com>
	<d0771ab59e5a19cd41045ecaf5f390926a78e229.1309949770.git.a.sappia@biotechware.com>
Date: Wed, 06 Jul 2011 13:32:07 +0200
Message-ID: <1309951927.4583.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/1] dbus-glib-native and dbus-glib were not compiling. This patch corrects dbus-glib-native to install required files in order to let dbus-glib to compile on target.
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
X-List-Received-Date: Wed, 06 Jul 2011 11:35:57 -0000
X-Groupsio-MsgNum: 33004
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+L4JhiKnGNuXOQVAW97W"

--=-+L4JhiKnGNuXOQVAW97W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alessandro,


Am Mittwoch, den 06.07.2011, 13:12 +0200 schrieb Alessandro Sappia:

unfortunately you seem to have forgotten to insert line breaks when
composing the commit message. Please correct that for example using `git
commit --amend`.

Please also follow OE=E2=80=99s commit policy [1] and resend your patch as =
v2
[2].

> Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
> ---
>  recipes/dbus/dbus-glib.inc     |    4 ++--
>  recipes/dbus/dbus-glib_0.86.bb |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-+L4JhiKnGNuXOQVAW97W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4UR6QACgkQPX1aK2wOHVi5qACcC/+LdIX/1fOTG5lBgknrD0xa
agUAn2rwgSe3DvErNeVJRDXDfSlqKZQI
=X6r2
-----END PGP SIGNATURE-----

--=-+L4JhiKnGNuXOQVAW97W--
