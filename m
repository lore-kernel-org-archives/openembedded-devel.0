Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R4DRW-0008Ha-BD for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 17:01:34 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R4DMe-0004oB-IP for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 14:56:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:56:23 +0200
In-Reply-To: <4E71E760.1090105@dresearch-fe.de>
References: <1316072892-27367-1-git-send-email-sledz@dresearch-fe.de>
	<1316073352-27826-1-git-send-email-sledz@dresearch-fe.de>
	<1316077506.4523.10.camel@mattotaupa>
	<4E71E760.1090105@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316098584.4523.87.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v4] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernel
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
X-List-Received-Date: Thu, 15 Sep 2011 15:01:34 -0000
X-Groupsio-MsgNum: 34270
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-EZTmVY4edRaL252O3gH2"

--=-EZTmVY4edRaL252O3gH2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 15.09.2011, 13:54 +0200 schrieb Steffen Sledz:
> On 15.09.2011 11:05, Paul Menzel wrote:
> > PS: It is hard for reviewers to see what changed in your patch iteratio=
ns. For example between v3 and v4. Please add a short note below the commit=
 message and separate that with an additional `---`. `git am` will not pick=
 that comment up then.
>=20
> Is it possible to add such a comment while running "git format-patch" or =
"git send-email"?

I do not know of a way and I did not find anything in the manual. I
guess you have to edit the mbox file created by `git format-patch` and
then send it.

Other people also use the cover letter feature. But in all cases it
seems to be one step more.

> Or is it necessary to mix this into the commit comment itself?

No, since `git push` is not leaving the comment out.

Thank you again for addressing my comments.


Thanks,

Paul



--=-EZTmVY4edRaL252O3gH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5yEhcACgkQPX1aK2wOHVgutQCeN56oTU3CvKyOSiPG/fLwD5pS
8WsAnA/5iV33UN+c51ns4Ah0x530HIdA
=zhZN
-----END PGP SIGNATURE-----

--=-EZTmVY4edRaL252O3gH2--
