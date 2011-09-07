Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1DE0-0004PB-KG for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 10:11:14 +0200
Received: from f053046110.adsl.alicedsl.de ([78.53.46.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1D9F-0003Rd-Nw for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 08:06:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Sep 2011 10:06:11 +0200
In-Reply-To: <CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
References: <1315341136-25548-1-git-send-email-eric@eukrea.com>
	<CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315382772.3553.33.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-oe] bianutils-2.20.1: fix checksums
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
X-List-Received-Date: Wed, 07 Sep 2011 08:11:14 -0000
X-List-Received-Date: Wed, 07 Sep 2011 08:11:14 -0000
X-Groupsio-MsgNum: 34109
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Xj/3n9049zOahLGL8VJd"

--=-Xj/3n9049zOahLGL8VJd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin, dear Eric,


Eric, there is a typo in the commit summary: An =C2=BBa=C2=AB slipped in bi=
nutils.


Am Mittwoch, den 07.09.2011, 09:58 +0200 schrieb Martin Jansa:

> This is probably caused by replacing 2.20.1 tarballs with links to 2.20.1=
a.

the archives were replaced because of the =E2=80=9CGPL violation=E2=80=9D I=
 think.

http://nickclifton.livejournal.com/9067.html

> IMHO would be better to change recipes to say 2.20.1a and force
> everybody to redownload it with new name (otherwise breaks checksums
> for everybody with old 2.20.1 in downloads dir)

Good point.

> Also please provide at least "diff -rq" when sending fix checksums
> patches, otherwise checksums are quite useless.

Do you mean of the archives? To see the differences in the source?

This is the first time I heard of that, but it is a reasonable
suggestion.

> The same applies to "fix checksums for binutils-2.18"..


Thanks,

Paul

--=-Xj/3n9049zOahLGL8VJd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5nJfMACgkQPX1aK2wOHVjhMgCeOJMJPLcDfN7biyexpMVqi3FE
1/QAnRJ5re5djxBdkStzvEr82ZTTXd05
=tl8A
-----END PGP SIGNATURE-----

--=-Xj/3n9049zOahLGL8VJd--
