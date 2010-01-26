Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NZnhx-0004tq-Vz
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 16:52:05 +0100
Received: (qmail 5949 invoked by uid 813007); 26 Jan 2010 15:49:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Jan 2010 15:49:42 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2010 16:49:38 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <1263577018-9627-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1263577018-9627-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <201001261649.42070.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] base.bbclass: in base_contains, check for var existance before using it
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
X-List-Received-Date: Tue, 26 Jan 2010 15:52:05 -0000
X-Groupsio-MsgNum: 16237
Content-Type: multipart/signed; boundary="nextPart8605740.bxVtAGKWjf";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart8605740.bxVtAGKWjf
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 15 stycznia 2010 o 18:36:58 Chris Larson napisa=C5=82(a):
> From: Brian Pomerantz <bapper@mvista.com>
>=20
> When using base_contains() to check for a string in a variable for a,
> if the variable is not defined an exception occurs.  By checking the
> existance of the variable and returning false if it isn't there,
> a value can be checked for a variable regardless of whether or not it
> is defined.
>=20
> Signed-off-by: Brian Pomerantz <bapper@mvista.com>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart8605740.bxVtAGKWjf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktfDxIACgkQeQ6MlGH/2quLNgCfcaRZMnKrxSquq/VU8UmPgq/v
ZDsAoIdO8BthkCPrIokGCCpA61ZLwq/z
=4JZn
-----END PGP SIGNATURE-----

--nextPart8605740.bxVtAGKWjf--
