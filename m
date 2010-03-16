Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrTjq-000681-En for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 11:11:06 +0100
Received: from f053036046.adsl.alicedsl.de ([78.53.36.46]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrTgw-00070W-11 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 10:08:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 11:08:00 +0100
Message-ID: <1268734080.3990.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: author dates in commits: Times are converted incorrectly?
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
X-List-Received-Date: Tue, 16 Mar 2010 10:11:06 -0000
X-Groupsio-MsgNum: 17719
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Wx9FHidqp+6XmHuMJC3r"

--=-Wx9FHidqp+6XmHuMJC3r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks (especially Philip and Martin),


is something wrong with the time of the applied patches? I refer to the
following commits.


commit 0315e512f4b5d71dc0dbeb6fee9ada5b7b7b2bea
Author:     Paul Menzel <paulepanter@users.sourceforge.net>
AuthorDate: Mon Mar 15 12:35:00 2010 +0000
Commit:     Martin Jansa <Martin.Jansa@gmail.com>

Date in my message header.

Date: Mon, 15 Mar 2010 23:35:00 +0100


commit 356d0ec42b023761e1e9e1a6bd5f3ab83b87033f
Author:     Paul Menzel <paulepanter@users.sourceforge.net>
AuthorDate: Mon Mar 15 12:34:27 2010 +0000
Commit:     Martin Jansa <Martin.Jansa@gmail.com>

Date in my message header.

Date: Mon, 15 Mar 2010 23:34:27 +0100


commit f92b2201ab4974bc1e2fed1b6ee9906774baf928
Author:     Paul Menzel <paulepanter@users.sourceforge.net>
AuthorDate: Mon Mar 15 04:55:56 2010 +0000
Commit:     Philip Balister <philip@balister.org>

Date in my message header.

Date: Mon, 15 Mar 2010 15:55:56 +0100


Is that a problem with Git not coping correctly with 24 h and 12 h
representation?

Did you both use `pw-am.sh`?


Thanks,

Paul

--=-Wx9FHidqp+6XmHuMJC3r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkufWIAACgkQPX1aK2wOHVhgLgCghnYQxZZAZqwl0TCSi/SA2Epd
B8AAn1Oo97piGOsrv0ASl6x2ZDMsfDa8
=ckmc
-----END PGP SIGNATURE-----

--=-Wx9FHidqp+6XmHuMJC3r--
