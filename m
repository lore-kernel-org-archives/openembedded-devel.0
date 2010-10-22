Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P9Otu-0001HM-OQ for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 23:11:49 +0200
Received: from f053039111.adsl.alicedsl.de ([78.53.39.111]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P9OtK-00038P-R1 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 21:11:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287730684-14143-5-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
	<1287730684-14143-5-git-send-email-raj.khem@gmail.com>
Date: Fri, 22 Oct 2010 23:11:09 +0200
Message-ID: <1287781869.3671.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/5] gcc-configure-target.inc: --with-sysroot -> --with-libtool-sysroot rename means we dont need to filter out --with-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 21:11:49 -0000
X-Groupsio-MsgNum: 25342
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TcoJG+M91S+W9yBoFboa"

--=-TcoJG+M91S+W9yBoFboa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


I would have squashed several of these patches if someone is using `git
bisect`.

You already pushed this series though, so thanks for your work anyway.


Thanks,

Paul

--=-TcoJG+M91S+W9yBoFboa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzB/eYACgkQPX1aK2wOHVjr6ACeLmzsWnlGUZNqsR2bhapx+lpo
qxcAnRXsg1wJt5f9CtgID0ezDBHAEACh
=sZOi
-----END PGP SIGNATURE-----

--=-TcoJG+M91S+W9yBoFboa--
