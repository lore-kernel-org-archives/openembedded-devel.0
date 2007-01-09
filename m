Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H4H9E-0008JO-KF
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 14:36:16 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l09DYTLr028035 for <openembedded-devel@openembedded.org>;
	Tue, 9 Jan 2007 14:34:30 +0100
Message-ID: <45A399E0.3020609@dominion.kabel.utwente.nl>
Date: Tue, 09 Jan 2007 14:34:24 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200701081618.46665.openembedded@hrw.one.pl>	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>	<200701082034.43447.openembedded@hrw.one.pl>
	<200701091430.38026.openembedded@hrw.one.pl>
In-Reply-To: <200701091430.38026.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l09DYTLr028035
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Tue, 09 Jan 2007 13:36:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia poniedzia=C5=82ek, 8 stycznia 2007 20:34, Marcin Juszkiewicz napis=
a=C5=82:
>=20
>>> Is there any easy way in angstrom to specify oabi?
>> Yes - DISTRO=3D"angstrom-2007.1-oabi" makes it. I will do such build s=
oon
>> for armv4 and compulab-pxa270 machines.
>=20
> I did "angstrom-2007.1-oabi" build for collie, h3600, h3800, simpad,
> compulab-pxa270. Results:
>=20
> collie, h3600, compulab-pxa270: built
>=20
> h3800, simpad: broke in same way as h1910/htcbluengel/rx3000 in previou=
s run
>=20
> Someone who maintain linux-handhelds kernel need this patch applied:

I don't maintain it, but added the line you pasted on irc anyway.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFo5ngMkyGM64RGpERAj7TAJ9RMxZNVf5oSpqAF5XF/6Hjv+PpjACcCUf1
wYhM8rcYhj24CLOsQ8QtneQ=3D
=3DzuGD
-----END PGP SIGNATURE-----


