Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0tEB-0000Ym-1x for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:50:03 +0200
Received: from f053044007.adsl.alicedsl.de ([78.53.44.7] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0t9P-0007VG-8O for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 10:45:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Sep 2011 12:45:02 +0200
In-Reply-To: <CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
	<CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315305904.4717.9.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:50:03 -0000
X-Groupsio-MsgNum: 34088
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-P/9XfwHGqoadZkQdhZcM"

--=-P/9XfwHGqoadZkQdhZcM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 06.09.2011, 12:22 +0200 schrieb Sylvain Par=C3=A9:

> thank you. I was just seing these *@# line breaks..
> So yes I will use git-send.
>=20
> So about my patch I re-send a new one right?

Yeah, fix the commit message with `git commit -s --amend` or `git rebase
-i =E2=80=A6`, create a new file with

        git format-patch -s -1 -M -M -C -C -C --subject-prefix=3D"PATCH
        v2"

and use `git send-email =E2=80=A6`.


Thanks,

Paul


[1] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

--=-P/9XfwHGqoadZkQdhZcM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5l+a8ACgkQPX1aK2wOHVjT2wCfYMsjEtwAAj+qzFiU/sQKIvJj
soYAnA4Y5ReB/mUkrjAvC6D3/7bdHMbB
=BONk
-----END PGP SIGNATURE-----

--=-P/9XfwHGqoadZkQdhZcM--
