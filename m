Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Noix0-0000uM-Jr
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 20:49:18 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NoiEr-0003uH-TW
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 22:03:40 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Mar 2010 22:01:20 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201003082201.30147.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Mon, 08 Mar 2010 19:49:19 -0000
X-Groupsio-MsgNum: 17402
Content-Type: multipart/signed; boundary="nextPart8463171.qxELofyK2u";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart8463171.qxELofyK2u
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all.

Please take a look at "rik/qemu-0.12" branch on OE git repo. 0.9.x removal=
=20
patch is 0.5 Mb, so I think it's not appropriate for mailing list. In gener=
al,=20
0.12.3 addition was easy, but then I've discovered that 0.10.3 version is n=
ot=20
working on openSUSE 11.2, so there is also a change in sanity and proposal =
to=20
remove 0.10.3 from repository.

Comments are welcome.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart8463171.qxELofyK2u
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuVSYoACgkQXJ70z+XgVcOHnACggfI86ej0xEIqoEdfg41gzVg4
od4AoMpgQM56beQwaaitWIFc3tq1VStJ
=A7Xi
-----END PGP SIGNATURE-----

--nextPart8463171.qxELofyK2u--
