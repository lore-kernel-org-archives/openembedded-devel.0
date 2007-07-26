Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE2oA-0000Q3-S3
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:51:14 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QCnm1R029869 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 14:49:48 +0200
Message-ID: <46A89869.4030202@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 14:49:45 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>	<46A895A1.7040400@dominion.kabel.utwente.nl>
	<200707261444.36655.openembedded@hrw.one.pl>
In-Reply-To: <200707261444.36655.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l6QCnm1R029869
Subject: Re: Activating autotools updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2007 12:51:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia czwartek, 26 lipca 2007, Koen Kooi napisa=C5=82:
>=20
>> After multiple success reports I'd like to propose the following
>> timeline:
>=20
>> 20070802: make m4-native 1.4.8 the default
>> 20070809: make autoconf-native 2.61 the default
>=20
> make automake 1.9.6 or 1.10 the default

I haven't tested that, has anyone done builds from scratch with that?

>> 20070816: make pkgconfig-native 0.22 the default
>> 20070816+: remove autotools hacks in recipes (e.g overriding
>> do_configure)
>=20
> Who will do each test?

I'd guess the person that encounters such a hack. IOW "I have no idea".

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqJhpMkyGM64RGpERAjHNAJ9NpE9/OwI6elauyGB/RRKTgDJPBACgkOzW
n6wN2AzyCbxH9O/SoGCs2l8=3D
=3DLLHF
-----END PGP SIGNATURE-----


