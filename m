Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgEQs-0006Gy-5J for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:41:30 +0100
Received: from f053036037.adsl.alicedsl.de ([78.53.36.37]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgEQE-0007ot-Ml for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 10:40:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 11:40:49 +0100
Message-ID: <1295606449.12720.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: problems with Git server: `fatal: unable to connect a socket (Connection refused)`
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
X-List-Received-Date: Fri, 21 Jan 2011 10:41:30 -0000
X-Groupsio-MsgNum: 28263
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-x6HGm39nkF3z5fmBZlfT"

--=-x6HGm39nkF3z5fmBZlfT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I just wanted to inform you that I have trouble with the Git server.

        $ git remote update
        Fetching origin
        git.openembedded.org[0: 140.211.169.165]: errno=3DConnection
        refused
        fatal: unable to connect a socket (Connection refused)
        error: Could not fetch origin

I am able to reproduce this from two different locations.


Thanks,

Paul

--=-x6HGm39nkF3z5fmBZlfT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk05YrEACgkQPX1aK2wOHVjTjACdFcdnY2DOgihCIQ8mb4v0f46B
4akAnRJg8oPmAHoaH4x5Le7p0hJmMIyo
=Iaf8
-----END PGP SIGNATURE-----

--=-x6HGm39nkF3z5fmBZlfT--
