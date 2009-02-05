Received: from [83.222.24.104] (helo=smtp-4.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LV9CB-0002eT-6Q
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 19:43:27 +0100
Received: (qmail 4276 invoked from network); 5 Feb 2009 18:42:52 -0000
Received: from unknown (HELO mate.hex) (rik@osrc.info@84.17.11.114)
	by smtp1.masterhost.ru with SMTP; 5 Feb 2009 18:42:52 -0000
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Thu, 5 Feb 2009 21:42:45 +0300
User-Agent: KMail/1.9.9
References: <200902051836.25770.roman@khimov.ru> <gmf4nv$lmm$1@ger.gmane.org>
	<200902052118.26879.roman@khimov.ru>
In-Reply-To: <200902052118.26879.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <200902052142.50027.roman@khimov.ru>
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 18:43:27 -0000
X-Groupsio-MsgNum: 7564
Content-Type: multipart/signed; boundary="nextPart2069014.uThMNopTI5";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2069014.uThMNopTI5
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Roman I Khimov:
> So, I don't actually know, how to better handle this. Any ideas are
> welcome.

Hmm. I know now, my bad, there are actually versioned tarballs on=20
ftp://invisible-island.net/byacc/ , they're just not referenced anywhere.

OK, will fix.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2069014.uThMNopTI5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmLMyUACgkQXJ70z+XgVcMu+ACg5YJ95tENIWQOl0Z+IdwxoYVQ
uiEAoLabgCdWEOtKQqxg8FElngDdrGb/
=X0+1
-----END PGP SIGNATURE-----

--nextPart2069014.uThMNopTI5--
