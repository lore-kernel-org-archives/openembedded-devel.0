Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H2lCY-0000cF-5H
	for openembedded-devel@openembedded.org; Fri, 05 Jan 2007 10:17:26 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l059Ftox017893; Fri, 5 Jan 2007 10:15:55 +0100
Message-ID: <459E1747.8000500@dominion.kabel.utwente.nl>
Date: Fri, 05 Jan 2007 10:15:51 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <53610736.20061228191750@gmail.com>	<1167392044.5616.16.camel@localhost.localdomain>	<271237233.20070104210332@gmail.com>
	<200701050941.46341.openembedded@hrw.one.pl>
In-Reply-To: <200701050941.46341.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l059Ftox017893
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific messing with [linux-handhelds-2.6] kernel packages
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
X-List-Received-Date: Fri, 05 Jan 2007 09:17:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia czwartek, 4 stycznia 2007 20:03, Paul Sokolovsky napisa=C5=82:

>>   But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=3D=20
>> "remove_zimages; " thing is still useful. It doesn't mean that machine=
s
>> should switch to it, but it offers nice, potentially
>> machine-independent, way to remove zImage file from the image.=20
>=20
> Which will get back when user update kernel-image package. Which is BAD.

I think the easiest solution is to remove empty kernel-image* files from =
the feeds.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFnhdHMkyGM64RGpERAh01AJ92+KNMVx1wPw6XYb7zqOgaRPEMRwCfSyRn
O/XMT8vBywOXSt84pf9jPzY=3D
=3DFyhh
-----END PGP SIGNATURE-----


