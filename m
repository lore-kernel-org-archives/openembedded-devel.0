Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHzif-0005OD-WA
	for openembedded-devel@openembedded.org; Mon, 06 Aug 2007 12:21:50 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l76AJM1R031448 for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2007 12:19:22 +0200
Message-ID: <46B6F5A4.7040700@dominion.kabel.utwente.nl>
Date: Mon, 06 Aug 2007 12:19:16 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>	<46A895A1.7040400@dominion.kabel.utwente.nl>
	<200708061156.47211.openembedded@hrw.one.pl>
In-Reply-To: <200708061156.47211.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l76AJM1R031448
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
X-List-Received-Date: Mon, 06 Aug 2007 10:21:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia czwartek, 26 lipca 2007, Koen Kooi napisa=C5=82:
>> After multiple success reports I'd like to propose the following
>> timeline:
>=20
>> 20070816: make pkgconfig-native 0.22 the default
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Revision: c575740a3b6935cc9e85bcc4e6f3cec52b4c4028
> Ancestor: 12b138279c360841bb21419b7866a60b4a10932c
> Author: koen@openembedded.org
> Date: 2007-08-05T12:28:40
> Branch: org.openembedded.dev
>=20
> Added files:
>          packages/pkgconfig/pkgconfig.inc
> Modified files:
>          packages/pkgconfig/pkgconfig-native_0.22.bb
>          packages/pkgconfig/pkgconfig_0.15.0.bb
>          packages/pkgconfig/pkgconfig_0.22.bb
>=20
> ChangeLog:
>=20
> pkgconfig: sync with poky
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This changeset enabled pkg-config 0.22 in OE as this removed=20
> DEFAULT_PREFERENCE =3D "-1" from recipe.

Oops, that has been fixed now.

> Anyway it should work - in Poky we=20
> (OpenedHand) use it since Poky Linux 3.0 'blinky' was released.

I know it works, otherwise I wouldn't have proposed it, but I'd like to s=
tick to my own
timeline :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtvWkMkyGM64RGpERAhzxAJ0dE5rvVkmKgo36LRpHhAwpZpa20wCgrS9e
/EyKRz9GjBvIxEVgb7nnbHE=3D
=3DagGv
-----END PGP SIGNATURE-----


