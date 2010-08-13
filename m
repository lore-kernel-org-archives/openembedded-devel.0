Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OjpIP-0004w7-Jj for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 10:07:39 +0200
Received: from g225081126.adsl.alicedsl.de ([92.225.81.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OjpIC-0005CK-3T for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:07:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
Date: Fri, 13 Aug 2010 10:07:05 +0200
Message-ID: <1281686825.3858.0.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 08:07:40 -0000
X-Groupsio-MsgNum: 22141
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mzBgwvAiN04XEuWpAo3c"

--=-mzBgwvAiN04XEuWpAo3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 13.08.2010, 11:39 +0600 schrieb noor_ahsan@mentor.com:
> genboot: Removing legacy staging
>=20
> * Replaced do_stage function with do_install and replaced ${STAGING_BINDI=
R} with ${D}${bindir}=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentorg.com>

A =C2=BBg=C2=AB slipped in your email address.

[=E2=80=A6]


Thanks,

Paul

--=-mzBgwvAiN04XEuWpAo3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxk/SMACgkQPX1aK2wOHVg/lQCfZgTCEYhWzhH9lQi9nMvglAAj
kgEAnj6Nak0+tCKsfs7jnnQUKeXDB4QL
=r/cF
-----END PGP SIGNATURE-----

--=-mzBgwvAiN04XEuWpAo3c--
