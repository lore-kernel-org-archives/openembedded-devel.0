Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIFzm-0004l8-VV for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 10:02:43 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIFyJ-0003OL-2R; Fri, 06 May 2011 08:01:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4dc39ffa.515de70a.0357.543a@mx.google.com>
References: <4dc39ffa.515de70a.0357.543a@mx.google.com>
Date: Fri, 06 May 2011 10:00:01 +0200
Message-ID: <1304668801.4041.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com
Subject: Re: [PATCH] u-boot_git: Ethernet MACID display fix for CraneBoard
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
X-List-Received-Date: Fri, 06 May 2011 08:02:43 -0000
X-Groupsio-MsgNum: 31649
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-syE3bBO14LtG9uDa+g8o"

--=-syE3bBO14LtG9uDa+g8o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anil,


thank you for the next version.

Am Freitag, den 06.05.2011, 12:45 +0530 schrieb Anil Kumar:
> CraneBoard u-boot displays the MAC ID wrongly if MAC ID has
>       preceding zeros. This patch fixes it and updates Ethernet
>       NRST GPIO from 34 to 65.

Unfortunately you forgot to add your Signed-off-by line. You do not need
to resend the patch, but just reply to this message with the line.

One question though you did not answer.

1. Did you send this patch upstream?

Some more remarks for the future.

2. Please mark patch iteration with version information. This patch
should have had =C2=BB[PATCH v2]=C2=AB in the subject.
3. The commit message does not have to be indented.
4. Please add below the =C2=BB---=C2=AB a short information what changed in=
 the
patch iteration, like

v2: add commit message
and finish this by an additional =C2=BB---=C2=AB.

> ---
>  ...t-MACID-display-fix-for-am3517-craneboard.patch |  108 ++++++++++++++=
++++++
>  recipes/u-boot/u-boot_git.bb                       |    3 +-
>  2 files changed, 110 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-=
MACID-display-fix-for-am3517-craneboard.patch

[=E2=80=A6]

Koen, will you push this or do you want me to do this?


Thank you,

Paul

--=-syE3bBO14LtG9uDa+g8o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3DqnwACgkQPX1aK2wOHVjouwCdEYU9zcLvSKAEjmgYiCMHf3m5
oWMAn2aX668K0VT4oaLMGO1KW4/mZglF
=KskX
-----END PGP SIGNATURE-----

--=-syE3bBO14LtG9uDa+g8o--
