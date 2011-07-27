Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qm5Bu-0007mb-NB for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 16:34:30 +0200
Received: from f053035191.adsl.alicedsl.de ([78.53.35.191]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qm58t-0003dm-UV for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 14:31:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311710326.3735.447.camel@mattotaupa>
References: <1311709612-3664-1-git-send-email-tom_rini@mentor.com>
	<1311710326.3735.447.camel@mattotaupa>
Date: Wed, 27 Jul 2011 16:30:17 +0200
Message-ID: <1311777017.18419.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [meta-oe] patch review for meta-oe (was: [meta-oe][PATCH] rp-pppoe: Port from oe.dev)
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
X-List-Received-Date: Wed, 27 Jul 2011 14:34:30 -0000
X-Groupsio-MsgNum: 33354
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-g8K5vveW51QCOpZlMeOY"

--=-g8K5vveW51QCOpZlMeOY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen, dear Tom,


I am surprised that you applied Tom=E2=80=99s patch without incorporating m=
y
review.

        commit 77d31f8d3027f6ef96bff61da4bf22cf9618bf21
        Author:     Tom Rini <tom_rini@mentor.com>
        AuthorDate: Wed Jul 27 03:46:52 2011 +0000
        Commit:     Koen Kooi <koen@dominion.thruhere.net>
        CommitDate: Tue Jul 26 21:51:39 2011 +0200
       =20
            rp-pppoe: Port from oe.dev
           =20
            The difference between this and oe.dev are:
            - Reset PR
            - Add bitfields site variable to the endian site file
              This was wrong in oe.dev for BE (mips).
            - Add LIC_FILES_CHKSUM
           =20
            Signed-off-by: Tom Rini <tom_rini@mentor.com>
            Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

First of all, the dates do not make any sense at all, so it looks like
you applied it already three minutes after Tom had sent the patch.

I would suggest, that patches get a little more time for review before
you apply them, which is of course disadvantageous for people wanted to
see their patches applied right away.

But I would like to prevent that =E2=80=9Cmessy=E2=80=9D patches get applie=
d to the new
repositories to get a better quality.

So Tom, it would be nice if you could sent improvement patches to fix
the `HOMEPAGE` field, the patch headers and the whitespace. The `PR`
cannot be fixed now.


Thanks,

Paul

--=-g8K5vveW51QCOpZlMeOY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4wIPkACgkQPX1aK2wOHVgORgCghDmwVVsWO2lVHfBAeP8/Rkxn
qb0AmwVbjviJCimJis3TtYjolMbJHAUC
=5J+B
-----END PGP SIGNATURE-----

--=-g8K5vveW51QCOpZlMeOY--
