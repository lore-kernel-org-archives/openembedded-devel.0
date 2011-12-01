Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RWDrb-0006d7-NA for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 22:08:15 +0100
Received: from f053046128.adsl.alicedsl.de ([78.53.46.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RWDlI-0001dB-9b for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 21:01:44 +0000
Message-ID: <1322773288.3834.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Dec 2011 22:01:28 +0100
In-Reply-To: <1322759816-16498-1-git-send-email-rafaelignacio.zurita@gmail.com>
References: <1322759816-16498-1-git-send-email-rafaelignacio.zurita@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH v2] directvnc: Add initial recipe with version 0.7.7
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
X-List-Received-Date: Thu, 01 Dec 2011 21:08:15 -0000
X-Groupsio-MsgNum: 35794
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-3C7cT3bsf6pEJX5q/fxg"

--=-3C7cT3bsf6pEJX5q/fxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Rafael,


thank you for your patch.

Am Donnerstag, den 01.12.2011, 14:16 -0300 schrieb Rafael Ignacio Zurita:
> DirectVNC provides a very thin VNC client for unix framebuffer systems.

I find it useful to add to the commit message what distribution and
machine you tested the recipe with.

> Signed-off-by: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
> ---

Please add changes in the patch iteration (v2) below that line to help
reviewers.

>  recipes/directvnc/directvnc_0.7.7.bb |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/directvnc/directvnc_0.7.7.bb

[=E2=80=A6]

I pushed your patch to the repository as a4f35de0 [1].

Please also consider adding that recipe to meta-oe. The license checksum
is used in OE classic but in meta-oe, so porting it should be just
copying it to the right directory.


Thanks a lot,

Paul


[1] http://git.openembedded.org/openembedded/commit/?id=3Da4f35de0f6ca17e92=
763d5a5f32422c56e5d8882

--=-3C7cT3bsf6pEJX5q/fxg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7X6ygACgkQPX1aK2wOHVhoxQCeLDkxCLscZ57uKcTKXDQVdm2i
9gYAnRVLFqNVKB/Fa/cpGwe/V0QvADfK
=Andq
-----END PGP SIGNATURE-----

--=-3C7cT3bsf6pEJX5q/fxg--
