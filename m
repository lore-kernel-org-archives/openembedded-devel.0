Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEThi-0007kt-89 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 23:52:26 +0200
Received: from f053045128.adsl.alicedsl.de ([78.53.45.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QETg3-0006gr-5m for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:50:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302858743.4203.28.camel@mattotaupa>
References: <1302858743.4203.28.camel@mattotaupa>
Date: Mon, 25 Apr 2011 23:49:57 +0200
Message-ID: <1303768197.15311.127.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] omapfbplay: move patch to new location after switch to Libav
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
X-List-Received-Date: Mon, 25 Apr 2011 21:52:26 -0000
X-Groupsio-MsgNum: 31458
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-I4B44HUGbIlVkbke7lbH"

--=-I4B44HUGbIlVkbke7lbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fr, 2011-04-15 at 11:12 +0200, Paul Menzel wrote:
> This patch fixes up commit 692d43ee [1]
>=20
>         commit 692d43eeb6596df52b5984ae1bd14739f9ec9e0f
>         Author: Koen Kooi <koen@openembedded.org>
>         Date:   Mon Mar 28 15:47:23 2011 +0200
>=20
>                   libav: add proper recipe for git version
>                   omapfbplay: switch to libav
>=20
> which did not move the patch referenced in the recipe to the new location=
.
>=20
>         NOTE: package omapfbplay-0.0+r30+gitr34293052c5a2ae328eac6903512e=
6b4ce19b5639-r30: task do_patch: Started
>         ERROR: [Errno 2] No such file or directory: '/oe/openembedded/rec=
ipes/libav/./omapfbplay-errorhandling.patch'
>         NOTE: package omapfbplay-0.0+r30+gitr34293052c5a2ae328eac6903512e=
6b4ce19b5639-r30: task patch_do_patch: Failed
>=20
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D692d4=
3eeb6596df52b5984ae1bd14739f9ec9e0f
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

I pushed this commit [1]. Patchwork somehow did not record this patch.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dfd4a829=
460ee27e95f2dcfddcadc5d4869fe4ac4

--=-I4B44HUGbIlVkbke7lbH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk217IUACgkQPX1aK2wOHVjI1ACfbnvWEr+sa5PIqRsJZzcOGCKI
j7oAniCfPRvOBFg/2rAv/3uDSd667MzE
=eVYN
-----END PGP SIGNATURE-----

--=-I4B44HUGbIlVkbke7lbH--
