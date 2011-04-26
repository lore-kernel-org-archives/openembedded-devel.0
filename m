Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEjoe-0007wm-S9 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 17:04:40 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEjn1-0006VY-5t for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:02:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 17:02:11 +0200
Message-ID: <1303830131.4073.76.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: QA: Please respect commit policy!
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
X-List-Received-Date: Tue, 26 Apr 2011 15:04:41 -0000
X-Groupsio-MsgNum: 31485
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7drj5+JVWjQ4kqLPhdDA"

--=-7drj5+JVWjQ4kqLPhdDA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE developers,


looking through the commit log during the last few days I noticed that
some commits are missing the Signed-off-by line. For example [1]. The
line is required by our commit policy [2] though.

Additionally I kindly ask everyone to write good commit messages. (I
know I am getting on your nerves already.) For example in [2]

        commit e557584a06b312e19811e07fdf75d1a7f123ed91
        Author: Tom Rini <tom_rini@mentor.com>
        Date:   Tue Apr 26 07:17:07 2011 -0700
       =20
            bluez4: Move the update-rc.d bits to 4.42 only
           =20
            Noted by Martin Jansa, taken from what he did in oe-core/meta-o=
e.
           =20
            Signed-off-by: Tom Rini <tom_rini@mentor.com>

it would have been nice to have a link to the commit in oe-core and
meta-oe, so that people do not have to search for this themselves.

The example commits are only examples and I am of course doing similar
errors as can be seen by [4].

This message is just a friendly reminder.


Thanks and thank you for your work,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dce56683=
db5a9efe9b44ed7d1c64a88028ea87ff7
[2] http://openembedded.org/index.php/Commit_Policy
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De557584=
a06b312e19811e07fdf75d1a7f123ed91
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3cb4c65=
dbd0fba178208bc908ce93e6b1ae9fe9b

--=-7drj5+JVWjQ4kqLPhdDA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk223nMACgkQPX1aK2wOHViEQQCfdUKEl7mRlqfM0T7g7Gr4QdAW
UWoAn2lCNk8ezalJmL/levGsfbpxbGRT
=jF4h
-----END PGP SIGNATURE-----

--=-7drj5+JVWjQ4kqLPhdDA--
