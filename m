Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3r0U-0003eH-ND for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 17:04:10 +0200
Received: from f053036201.adsl.alicedsl.de ([78.53.36.201]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3qva-0008Iy-8M; Wed, 14 Sep 2011 14:59:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 16:58:59 +0200
In-Reply-To: <4E70BD97.4060401@dresearch-fe.de>
References: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
	<1315925466.4195.58.camel@mattotaupa>
	<4E6FB151.2030701@dresearch-fe.de>
	<4E70BA87.2010304@dresearch-fe.de>
	<1316010999.6686.108.camel@mattotaupa>
	<4E70BD97.4060401@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316012340.6686.112.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Wed, 14 Sep 2011 15:04:10 -0000
X-Groupsio-MsgNum: 34229
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-faMR2FBPM0VF2eiuTu6C"

--=-faMR2FBPM0VF2eiuTu6C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 14.09.2011, 16:43 +0200 schrieb Steffen Sledz:
> On 14.09.2011 16:36, Paul Menzel wrote:
> >>>> The patch header is missing [1].
> >>>
> >>> Hmmm? After reading [1] i could not find what exactly is missing.
> >>
> >> Does the guidelines require that the patch files itself (make-3.82.pat=
ch in this case) need a header (in addition to the commit comment)?
> >=20
> > Yes, that is correct.
>=20
> It would be very helpful if [1] could be modified in a way that makes cle=
ar that it talk about to separate things: the commit message *and* the patc=
h header.
>=20
> This was totally unclear for me after reading it.

I remarked that too when the guide lines were reviewed. And it is
explained in the second paragraph in the guideline [1].

        This policy refers both to patches that are being applied by
        recipes as well as commit messages that are part of the source
        control system, usually git. A patch file needs a header in
        order to describe the specific changes that are made within that
        patch, while a commit message describes one or more changes to
        the overall project or system. Both the patch headers and commit
        messages require the same attention and basic details, however
        the purposes of the messages are slightly different. A commit
        message documents all of the changes made as part of a commit,
        while a patch header documents items specific to a single patch.
        In many cases the patch header can also be used as the commit
        message.

Any suggestions are welcome though. And (the lame response) it is a Wiki
so everybody can improve the document.


Thanks,

Paul


> [1] http://openembedded.org/index.php?title=3DCommit_Patch_Message_Guidel=
ines

--=-faMR2FBPM0VF2eiuTu6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5wwTMACgkQPX1aK2wOHVjv2wCfZHzYBXSvgAwCSEUvpRx/f7Dn
zmcAn1lWbGQwdAJcZ/4tc57Vb3yRKl/6
=aS16
-----END PGP SIGNATURE-----

--=-faMR2FBPM0VF2eiuTu6C--
