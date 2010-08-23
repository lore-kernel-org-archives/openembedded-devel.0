Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnTVz-0002hg-54 for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:40:42 +0200
Received: from f053041221.adsl.alicedsl.de ([78.53.41.221]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnTVc-0007My-Rd for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 09:40:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
Date: Mon, 23 Aug 2010 11:40:02 +0200
Message-ID: <1282556402.3853.17.camel@mattotaupa>
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
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 09:40:42 -0000
X-Groupsio-MsgNum: 22558
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-UKYB5IELm6DVdaj1yifS"

--=-UKYB5IELm6DVdaj1yifS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 19.08.2010, 00:15 -0600 schrieb AJ ONeal:
> P.S. Is this correct way for me to add a recipe? I didn't notice a
> particular document for it on the website.

You are also missing a Signed-off-by line.

The process is documented in the Wiki [1] including an example. (Left
navigation bar, choose =C2=BBDevs=C2=AB for an overview and choose =C2=BBPo=
licies=C2=AB
under subcategories.)

Please also remember to update the patch queue [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork

--=-UKYB5IELm6DVdaj1yifS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxyQfIACgkQPX1aK2wOHViMbgCdE2d/fNxPZjOBTv/GZgTgE6Z6
UwkAniSy1Saz5kmc0qRgMzlNYqn+5ssK
=rgcY
-----END PGP SIGNATURE-----

--=-UKYB5IELm6DVdaj1yifS--
