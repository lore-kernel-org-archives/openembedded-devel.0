Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHHPW-0002zg-RQ for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 17:21:14 +0200
Received: from f053037176.adsl.alicedsl.de ([78.53.37.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHHNz-0005BU-AO for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 15:19:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC0192E.3010808@kernelconcepts.de>
References: <1304434485.13481.79.camel@mattotaupa>
	<4DC0192E.3010808@kernelconcepts.de>
Date: Tue, 03 May 2011 17:18:36 +0200
Message-ID: <1304435916.13481.82.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: error in push of origin/org.openmbedded.dev
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
X-List-Received-Date: Tue, 03 May 2011 15:21:14 -0000
X-Groupsio-MsgNum: 31595
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qVj37EQyYgTAFKPqZLFv"

--=-qVj37EQyYgTAFKPqZLFv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Florian,


Am Dienstag, den 03.05.2011, 17:03 +0200 schrieb Florian Boor:

> Am 03.05.2011 16:54, schrieb Paul Menzel:
> > you pushed to org.open*mb*edded.dev and therefore a new branch was
> > created.
>=20
> Args - sorry my bad, I have a typo in the local branch name. Interesting =
what
> can happen working on a fresh tree :-)
>=20
> > Before you push to the correct branch could you maybe clean up the
> > commit log using `git rebase -i =E2=80=A6` or take the improved patches=
 I
> > attached.
>=20
> Ok great - many tanks. What else did you change?

I also squashed the `ubootchart` commits. Everything else was just the
commit messages.

Somehow Git should be able to show the differences, but

	$ git diff origin/master -- origin/org.openmbedded.dev

does not work for me.


Thanks,

Paul

--=-qVj37EQyYgTAFKPqZLFv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3AHMwACgkQPX1aK2wOHVgf6gCdFXwMOdDeYGRS9E/ltkX5IiK3
XeMAn2BoKDO5XFcVBvgkCQzZmgtoYmHW
=v+k0
-----END PGP SIGNATURE-----

--=-qVj37EQyYgTAFKPqZLFv--
