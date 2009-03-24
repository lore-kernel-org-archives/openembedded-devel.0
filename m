Received: from [213.36.80.91] (helo=mail.libertysurf.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LmCm8-0001Uk-SV
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 20:59:04 +0100
Received: from blini.bolloretelecom.eu (62.210.194.121) by mail.libertysurf.fr
	(8.5.016.1) id 498AE76200F6EC83; Tue, 24 Mar 2009 21:47:19 +0100
Received: from [192.168.95.60] (unknown [192.168.95.60])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 5C64C23E4A;
	Tue, 24 Mar 2009 20:57:31 +0100 (CET)
Message-ID: <49C93B2B.5040002@bolloretelecom.eu>
Date: Tue, 24 Mar 2009 20:57:31 +0100
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, jims@russound.com
References: <49BFA406.6030802@bolloretelecom.eu>	<20090317143526.3e79150c@vanille.zapto.org>	<49BFADB1.3090207@bolloretelecom.eu>
	<20090317171705.208a7d31@kmfms>
In-Reply-To: <20090317171705.208a7d31@kmfms>
X-Enigmail-Version: 0.95.0
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 24 Mar 2009 19:59:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Jim!

> Greetings!  I had a couple of Qt recipes that used "inherit
> qtopia4core" and worked just fine.
>
> Now if I "inherit qt4e" they fail with something like this:
>
> | NOTE: using qmake spec in
> /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux-=
gnueabi-oe-g++,
>  using profiles '' | NOTE: qmake prevar substitution:
> QT_LIBINFIX=3DE | Failure to read QMAKESPEC conf

I have just commited some cleanups to the Qt packages, could you
please let me know if it works for you?
- --
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknJOyoACgkQCL1n3lVB9EYu5gCdGiwOuPFHo/JGmkAjgOW0Osnk
td8AoKH5iRCXqF9Mos8MuNTWc8D2U3MY
=3DpeGe
-----END PGP SIGNATURE-----



