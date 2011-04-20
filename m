Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCUx5-0000KL-Fh for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 12:48:24 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCUvK-0005iY-Hn for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:46:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104201219.22239.sgh@sgh.dk>
References: <201104201007.04378.sgh@sgh.dk>
	<1303292840.3979.20.camel@mattotaupa> <201104201219.22239.sgh@sgh.dk>
Date: Wed, 20 Apr 2011 12:45:45 +0200
Message-ID: <1303296345.3979.33.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Please pull 'wvstreams-fixes' of http://sgh.dk/~sgh/oe.git
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
X-List-Received-Date: Wed, 20 Apr 2011 10:48:30 -0000
X-Groupsio-MsgNum: 31362
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uk8j6Sd8CCqf9T073rrq"

--=-uk8j6Sd8CCqf9T073rrq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear S=C3=B8ren,


Am Mittwoch, den 20.04.2011, 12:19 +0200 schrieb S=C3=B8ren Holm:

> The server should be responding now.

I am now getting the following error.

        $ git fetch http://sgh.dk/~sgh/oe.git wvstreams-fixes
        error: Unable to find a76908145053c3f4a90988ce4c6e312fa7578e42 unde=
r http://sgh.dk/~sgh/oe.git
        Cannot obtain needed object a76908145053c3f4a90988ce4c6e312fa7578e4=
2
        error: Fetch failed.

> I added the compiler error to the commit and changed the branchname.

Thank you.

> You could consider to do :
> $ git fetch http://sgh.dk/~sgh/oe.git wvstreams-fixes
>=20
> the fetched HEAD will then end in the FETCH_HEAD refname.

Thank you very much for the hint. I should send a patch to the Git
developers to add that to the example section.


Thanks,

Paul

--=-uk8j6Sd8CCqf9T073rrq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2uuVkACgkQPX1aK2wOHViUYACeOOXUs1/GoVlWH17/ugdI82w8
CZsAnAp//c9Z1l8/dXyAU9sldL9w0nfd
=lkjR
-----END PGP SIGNATURE-----

--=-uk8j6Sd8CCqf9T073rrq--
