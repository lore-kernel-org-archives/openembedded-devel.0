Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoOQd-0006Ga-Ca for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 00:26:48 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoOQE-00051i-AH for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 22:26:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282754664-7480-1-git-send-email-norguhtar@gmail.com>
References: <1282754664-7480-1-git-send-email-norguhtar@gmail.com>
Date: Thu, 26 Aug 2010 00:26:15 +0200
Message-ID: <1282775175.3711.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] sysvinit_2.86.bb: change sysvinit-utils for compatible with upstart
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
X-List-Received-Date: Wed, 25 Aug 2010 22:26:51 -0000
X-Groupsio-MsgNum: 22660
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mmgTC2zBy8OY4NXOJ4V2"

--=-mmgTC2zBy8OY4NXOJ4V2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 22:44 +0600 schrieb Anatoly Shipitsin:

Maybe change the commit summary to

	sysvinit_2.86.bb: make sysvinit-utils compatible with upstart

> From: Norguhtar <norguhtar@gmail.com>

Where does that name come from? This line will be taken as the author
information (`git log`, `git log --pretty=3Dfuller`) because it differs
from your name in the email address. (That is the reason the From: line
got added in the first place.)

Being different from your other message, you should decide using one of
them, because it makes it easier to look at the statistics having you
turn up as one person only.

> * move shutdown to sysvinit package
> * move killall5 to sysvinit-utils
> * change PR =3D "r59"

Next time, =C2=BB=E2=80=A2 bump PR=C2=AB or =C2=BB=E2=80=A2 increase PR=C2=
=AB is enough.

Reading your commit message a more elaborate explanation is missing what
the problem is with current `sysvinit-utils`. The commit summary says it
has something to do with upstart, but explanation, of why it is a
problem, would make it a perfect commit message.

This is in my opinion even more important than the information you
provided, since I could look those up. But I cannot grasp the =E2=80=9Cwhy=
=E2=80=9D.

This would make reviewing and judging and therefore committing your
patch much easier and faster.

> Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>

Otherwise I did not find anything else reviewing this. I did not test it
though.

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

[=E2=80=A6]

If you decide to adapt the commit summary/message and to send a v4, you
can add my Reviewed-by line manually.

I do not have commit rights. So if nothing happens during the next two
days, please join the IRC channel and bug the people there =E2=80=93 most o=
f
them have commit rights =E2=80=93 to apply and commit your patch.


Thanks,

Paul

--=-mmgTC2zBy8OY4NXOJ4V2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx1mIcACgkQPX1aK2wOHVjCiACdGNo+o5lIC4CKks+ixpWEidwy
zcgAn2MVcPSZ9WfWN1+j1EraSEGNGllc
=uMJd
-----END PGP SIGNATURE-----

--=-mmgTC2zBy8OY4NXOJ4V2--
