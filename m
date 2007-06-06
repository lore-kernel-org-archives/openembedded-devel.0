Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvpGd-0005ja-S5
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 08:45:15 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l566gmox009226 for <openembedded-devel@openembedded.org>;
	Wed, 6 Jun 2007 08:42:48 +0200
Message-ID: <4666576A.9030608@dominion.kabel.utwente.nl>
Date: Wed, 06 Jun 2007 08:42:50 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>	<4663C0AC.7020804@dominion.kabel.utwente.nl>	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>	<46641153.2050207@dominion.kabel.utwente.nl>	<ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>	<ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>	<7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>	<4665CF19.2030501@dominion.kabel.utwente.nl>	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
In-Reply-To: <4666520C.8060000@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l566gmox009226
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Wed, 06 Jun 2007 06:45:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Lu=C3=ADs Cargnini schreef:
>> so just to make it fast before I could upload everything to some serve=
r here
>> follow my local.conf:
>=20
>=20
>> TARGET_ARCH =3D "arm"
>> TARGET_OS =3D "linux"
>=20
> Remove those
>=20
>> DISTRO =3D "angstrom-2007.1"

That one is ok as well

>=20
>> GLIBC_GENERATE_LOCALES =3D "en en_GB.UTF-8 fr pt_BR.UTF-8"
>> INHERIT =3D "package_tar"
>=20
> remove those
>=20
>> IMAGE_FSTYPES =3D "jffs2 tar cramfs"
>=20
> that one is ok
>=20
>> BBDEBUG =3D "yes
>> BBINCLUDELOGS =3D "yes"
>=20
> and remove those as well

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZldqMkyGM64RGpERAv+NAKCDQjW7q7ickqaTwJdZD5DQhZEAtACgrx8p
Gez+xEq2RxWhnkZcrw97Ook=3D
=3Dz96W
-----END PGP SIGNATURE-----


