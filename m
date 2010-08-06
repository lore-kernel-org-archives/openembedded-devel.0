Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OhIqE-0003CH-TL for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:03:52 +0200
Received: from f053037080.adsl.alicedsl.de ([78.53.37.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OhIqA-0001JX-SC for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 09:03:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i3f3gm$5lu$1@dough.gmane.org>
References: <i3f3gm$5lu$1@dough.gmane.org>
Date: Fri, 06 Aug 2010 11:03:42 +0200
Message-ID: <1281085422.3809.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork, please keep patches up to date
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
X-List-Received-Date: Fri, 06 Aug 2010 09:03:52 -0000
X-Groupsio-MsgNum: 21936
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yKIZEdDw7kC9WbDWXSet"

--=-yKIZEdDw7kC9WbDWXSet
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Donnerstag, den 05.08.2010, 21:30 +0200 schrieb Koen Kooi:

[=E2=80=A6]

> I had a look around patchwork and I noticed lots of duplicates and
> already applied patches are still in the queue, so I have a small request=
:
>=20
> Could the people sending patches to this mailinglist update their status
> in patchwork? And can people applying patches also update the status?

there is also `pwclient` for the command line. Please take a look at the
Wiki page [1] for more information.

By the way, there are some examples in the Patchwork repository for post
commit hooks to mark those patches automatically as applied. (Since the
Patchwork repository is not browsable take a look at [2] for example.)


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php?title=3DPatchwork
[2] http://lists.ozlabs.org/pipermail/patchwork/2010-February/000224.html

--=-yKIZEdDw7kC9WbDWXSet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxbz+gACgkQPX1aK2wOHVi6ZQCeO094xZq5TYZQaBfqZGV31eRY
usMAnA6FoutguAIkDtmBZj8hkGCUjoH1
=6ZiA
-----END PGP SIGNATURE-----

--=-yKIZEdDw7kC9WbDWXSet--
