Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEN7v-0003gm-25 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 16:51:03 +0200
Received: from f053045128.adsl.alicedsl.de ([78.53.45.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEN6G-0002TX-7M for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 14:49:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104231404.34882.sgh@sgh.dk>
References: <201104201007.04378.sgh@sgh.dk> <201104231308.08992.sgh@sgh.dk>
	<1303559162.4551.15.camel@mattotaupa> <201104231404.34882.sgh@sgh.dk>
Date: Mon, 25 Apr 2011 16:48:35 +0200
Message-ID: <1303742915.15311.21.camel@mattotaupa>
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
X-List-Received-Date: Mon, 25 Apr 2011 14:51:03 -0000
X-Groupsio-MsgNum: 31435
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-E/xPEu5JLvTCYQuBwh9t"

--=-E/xPEu5JLvTCYQuBwh9t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.04.2011, 14:04 +0200 schrieb S=C3=B8ren Holm:
> L=C3=B8rdag den 23. april 2011 13:46:02 skrev Paul Menzel:
> > Am Samstag, den 23.04.2011, 13:08 +0200 schrieb S=C3=B8ren Holm:
> > > Fredag den 22. april 2011 21:51:07 skrev Paul Menzel:
> > > > 1. S=C3=B8ren, please add your Signed-off-by line in front of mine.=
 This is a demanded by the commit policy [1].
> > >=20
> > > I kind of novice into this. How do I add my signed-off line ?
> >=20
> > When committing the change, just add the option `-s` and it is added
> > automatically by what you have configured using `git config`.
> >=20
> > For now, you can just reply to this message and add that line where you
> > like.
>=20
> Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>
>=20
> I rebased my branch at github repo to master. Now ait lso contains a 4.6.=
1 recipe if your would like.
> I added my Signed-Off to both commits there also.
>
> > I will add it to the commit message using `git commit --amend`.
> >=20
> > > > 2. I am adding Khem, since he seems to be the original author of th=
is patch. It would be great to get his Acked-by too.
> > > > 3. S=C3=B8ren, please send your patch upstream.
> > > > 4. S=C3=B8ren, when you have a little time it would be great if you=
 could update WvStreams to 4.6.1 and test it.
> > >=20
> > > will do
> > >=20
> > > > 5. S=C3=B8ren, I removed `apply=3Dyes` since that is the default.
> > >=20
> > > great.
> > >=20
> > > btw. The emaileaddress mixup won't happen again.
> >=20
> > Just tell me what the correct one is and I will push your patch.

I pushed this commit yesterday [1]. I am sorry I messed up and omitted
the commit summary.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3cb4c65=
dbd0fba178208bc908ce93e6b1ae9fe9b

--=-E/xPEu5JLvTCYQuBwh9t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk21ib4ACgkQPX1aK2wOHVhKIACfbA2+2rQqZMFusCHTwAaZ82Di
m9gAmwSrDBl7O7AYL+2WnTslrrdM8b6K
=oopo
-----END PGP SIGNATURE-----

--=-E/xPEu5JLvTCYQuBwh9t--
