Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJUBX-00041u-JW for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 19:23:55 +0200
Received: from f053041075.adsl.alicedsl.de ([78.53.41.75]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJUA8-0004v8-9L for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 17:22:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F08034AF1C0E1@dlee06.ent.ti.com>
References: <1304618837-18698-1-git-send-email-Chase.Maupin@ti.com>
	<4DC304E9.6050103@mentor.com>
	<131E5DFBE7373E4C8D813795A6AA7F08034AF1C0E1@dlee06.ent.ti.com>
Date: Mon, 09 May 2011 19:21:11 +0200
Message-ID: <1304961671.3939.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] ncurses: add missing patch file
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
X-List-Received-Date: Mon, 09 May 2011 17:23:55 -0000
X-Groupsio-MsgNum: 31805
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TTMRHrrwc8BRrKbbBwGr"

--=-TTMRHrrwc8BRrKbbBwGr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase, dear Tom,


Am Donnerstag, den 05.05.2011, 16:13 -0500 schrieb Maupin, Chase:

> > Sent: Thursday, May 05, 2011 3:13 PM

> > On 05/05/2011 11:07 AM, Chase Maupin wrote:
> > > * The 20110115 patch file has gone missing.  Add it to the
> > >   OE repository like the previous patch file.
> > > * Bump the PR
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >=20
> > Maybe we need to consider just moving to vanilla 5.9 and drop 5.7?
>=20
> I asked Koen to submit a pull request to the maintenance branch to add
> 5.9 so I agree there.  I just thought I would go ahead and submit a
> patch to the dev branch to fix version 5.7 in case someone is using
> that version.
>=20
> Personally I'm fine with going to 5.9 directly.

I would vote for getting this patch applied to improve the quality since
one more package build with no problems.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Chase, can you push to the repository?


Thanks,

Paul

--=-TTMRHrrwc8BRrKbbBwGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3IIocACgkQPX1aK2wOHViZzQCdGa3TH/arC5iU+/ch8yYhDf15
bU0An0ZYCheIl+HHxAOM/K0mcpBKI7ur
=9bSz
-----END PGP SIGNATURE-----

--=-TTMRHrrwc8BRrKbbBwGr--
