Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RDuPT-0007DD-Fi for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 10:43:31 +0200
Received: from f053046227.adsl.alicedsl.de ([78.53.46.227]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RDuK4-0001Wa-Dg for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 08:37:56 +0000
Message-ID: <1318408668.3556.6.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 10:37:48 +0200
In-Reply-To: <1318384589-17127-1-git-send-email-raj.khem@gmail.com>
References: <1318384589-17127-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-intel][PATCH] xorg-xserver: Include xserver-xorg-lite.inc instead of xserver-xf86-dri-lite.inc
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
X-List-Received-Date: Wed, 12 Oct 2011 08:43:31 -0000
X-Groupsio-MsgNum: 34668
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-0trYN8wE3DMll/u0gNGV"

--=-0trYN8wE3DMll/u0gNGV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Dienstag, den 11.10.2011, 18:56 -0700 schrieb Khem Raj:

please add the reason for the change to the commit message. In this case
the rename in oe-core and the corresponding parse errors Andreas
reported.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb    |    2 +-
>  .../xorg-xserver/xserver-psb_1.7.99.2.bb           |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

[=E2=80=A6]


Thanks,

Paul

--=-0trYN8wE3DMll/u0gNGV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6VUd0ACgkQPX1aK2wOHViSjQCcCoFBqr5isROaH2xS62OmsiYK
ddsAn3szurgu4CPn608JujaUCPKs+CG4
=yr8U
-----END PGP SIGNATURE-----

--=-0trYN8wE3DMll/u0gNGV--
