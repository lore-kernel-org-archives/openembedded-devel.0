Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HwagS-0006cV-30
	for openembedded-devel@openembedded.org; Fri, 08 Jun 2007 11:23:07 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l589KKLr030471 for <openembedded-devel@openembedded.org>;
	Fri, 8 Jun 2007 11:20:20 +0200
Message-ID: <46691F5B.9080504@dominion.kabel.utwente.nl>
Date: Fri, 08 Jun 2007 11:20:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46665B15.8090401@dominion.kabel.utwente.nl>	<74d0deb30706060046q7a91542bl6591542175161eb5@mail.gmail.com>	<466669AD.6050809@dominion.kabel.utwente.nl>
	<200706061022.11908.openembedded@hrw.one.pl>
In-Reply-To: <200706061022.11908.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l589KKLr030471
Subject: Re: RFC: splitting task-boot out of task-base
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
X-List-Received-Date: Fri, 08 Jun 2007 09:23:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia =C5=9Broda, 6 czerwca 2007, Koen Kooi napisa=C5=82:
>> +# packages which content depend on MACHINE_FEATURES need to be
>> MACHINE_ARCH +#
>> +PACKAGE_ARCH_task-boot =3D "${MACHINE_ARCH}"
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> And then commit.

Done

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGaR9bMkyGM64RGpERAg3aAJ9Hi66DKLWbaOQhne7c2g1hTt4AJwCfc0wr
/n9qnV/WkYeyupssmMveVMg=3D
=3DX3UP
-----END PGP SIGNATURE-----


