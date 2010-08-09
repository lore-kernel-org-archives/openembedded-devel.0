Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiQpD-0003SK-RT for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:47:28 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiQp6-00043C-MS for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 11:47:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E5A@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E5A@deimsg40.de.net.world>
Date: Mon, 09 Aug 2010 13:47:18 +0200
Message-ID: <1281354438.3767.21.camel@mattotaupa>
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
Subject: Re: [PATCH][v2][Resent] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Mon, 09 Aug 2010 11:47:28 -0000
X-Groupsio-MsgNum: 21990
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LnzJFjYile9tybZpKjVp"

--=-LnzJFjYile9tybZpKjVp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 13:34 +0200 schrieb Hauser, Wolfgang (external):
> It seams, attachment with binary mime type is ignored by patchwork.
> Sent again.

Sorry to bother you again. It looks like you appended to patches in your
attachment. Please sent them separately.

(You seem to have to commits in your local repository which is good. You
should be able to create two patches with `git format-patch -2 -s`. You
can adapt the second commit message with `git commit --amend` if it is
the last commit or `git rebase -i =E2=80=A6` (see `git help rebase` under
NOTES)).


Thanks,

Paul

--=-LnzJFjYile9tybZpKjVp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxf6sYACgkQPX1aK2wOHVhQzgCfR8yP6omuldsVuqcATe0UUiVg
tnkAn3V6Uo2Mv9M9VvIuYfcjggLvbECK
=J6Ht
-----END PGP SIGNATURE-----

--=-LnzJFjYile9tybZpKjVp--
