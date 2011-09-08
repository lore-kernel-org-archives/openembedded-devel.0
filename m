Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1avm-00065L-Ri for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 11:29:58 +0200
Received: from f053034059.adsl.alicedsl.de ([78.53.34.59]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1ar3-0000AW-0s for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 09:25:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 08 Sep 2011 11:24:56 +0200
In-Reply-To: <1315435137-5591-1-git-send-email-errordeveloper@gmail.com>
References: <1315435137-5591-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315473897.17658.42.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Thu, 08 Sep 2011 09:29:58 -0000
X-Groupsio-MsgNum: 34140
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-J3w4c3Y828JgpF1plIi4"

--=-J3w4c3Y828JgpF1plIi4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ilya,


Am Mittwoch, den 07.09.2011, 23:38 +0100 schrieb Ilya Dmitrichenko:
> Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
>
> ---
>  recipes/binutils/binutils_2.20.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

[=E2=80=A6]

thank you for your patch. Unfortunately we cannot apply it as is. Please
read [1] for the reason.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/=
034885.html

--=-J3w4c3Y828JgpF1plIi4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5oiegACgkQPX1aK2wOHVg48QCeNt/nuCrXFEO0aQP0Pgtm6DZU
takAoIV/XxZy5Oga7p8UH6QLO97H6qbx
=jh6v
-----END PGP SIGNATURE-----

--=-J3w4c3Y828JgpF1plIi4--
