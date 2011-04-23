Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDbK8-0002Oy-7M for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 13:48:28 +0200
Received: from f053045164.adsl.alicedsl.de ([78.53.45.164]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDbIQ-0003bk-Nh for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 11:46:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104231308.08992.sgh@sgh.dk>
References: <201104201007.04378.sgh@sgh.dk>
	<1303501867.4155.11.camel@mattotaupa> <201104231308.08992.sgh@sgh.dk>
Date: Sat, 23 Apr 2011 13:46:02 +0200
Message-ID: <1303559162.4551.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] wvstreams: add patch to add missing header includes
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
X-List-Received-Date: Sat, 23 Apr 2011 11:48:28 -0000
X-Groupsio-MsgNum: 31414
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+urmw9FnkOz2NbWc/3xs"

--=-+urmw9FnkOz2NbWc/3xs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.04.2011, 13:08 +0200 schrieb S=C3=B8ren Holm:
> Fredag den 22. april 2011 21:51:07 skrev Paul Menzel:
> > 1. S=C3=B8ren, please add your Signed-off-by line in front of mine. Thi=
s is a demanded by the commit policy [1].
>=20
> I kind of novice into this. How do I add my signed-off line ?

When committing the change, just add the option `-s` and it is added
automatically by what you have configured using `git config`.

For now, you can just reply to this message and add that line where you
like.

I will add it to the commit message using `git commit --amend`.

> > 2. I am adding Khem, since he seems to be the original author of this p=
atch. It would be great to get his Acked-by too.
> > 3. S=C3=B8ren, please send your patch upstream.
> > 4. S=C3=B8ren, when you have a little time it would be great if you cou=
ld update WvStreams to 4.6.1 and test it.
>=20
> will do
>=20
> > 5. S=C3=B8ren, I removed `apply=3Dyes` since that is the default.
>=20
> great.
>=20
> btw. The emaileaddress mixup won't happen again.

Just tell me what the correct one is and I will push your patch.


Thanks,

Paul

--=-+urmw9FnkOz2NbWc/3xs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2yu/oACgkQPX1aK2wOHVizqACgjPGQAWQ+G55mXAjs1sD+98Vi
/z0AnjgdHACSGJVsl6O1cCbAVqIpXx9J
=a9s5
-----END PGP SIGNATURE-----

--=-+urmw9FnkOz2NbWc/3xs--
