Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYEU4-0005wd-7I for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 11:40:00 +0200
Received: from f053044243.adsl.alicedsl.de ([78.53.44.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYEQj-0002w5-1O for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 09:36:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jun 2011 11:36:30 +0200
Message-ID: <1308476190.18748.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Git server error: `fatal: read error: Connection reset by peer`
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
X-List-Received-Date: Sun, 19 Jun 2011 09:40:00 -0000
X-Groupsio-MsgNum: 32746
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5PIYpOfuAUGeeOoU5yJd"

--=-5PIYpOfuAUGeeOoU5yJd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE administrators,


`git remote update` fails using `git://git.openembedded.org/openembedded`.

        $ git remote update
        Fetching origin
        fatal: read error: Connection reset by peer
        error: Could not fetch origin


Thanks,

Paul

--=-5PIYpOfuAUGeeOoU5yJd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk39wxgACgkQPX1aK2wOHVjIyACeM7g68Rs2DNYD0lWa+QyRZpm2
zI0An0ZTfsgiwQ9CPeD//Jc3OqZWpKSq
=orAV
-----END PGP SIGNATURE-----

--=-5PIYpOfuAUGeeOoU5yJd--
