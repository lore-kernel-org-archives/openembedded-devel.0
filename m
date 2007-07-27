Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IELEa-0002zE-LJ
	for openembedded-devel@openembedded.org; Fri, 27 Jul 2007 10:31:40 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6R8UC1R010119 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2007 10:30:12 +0200
Message-ID: <46A9AD11.2050701@dominion.kabel.utwente.nl>
Date: Fri, 27 Jul 2007 10:30:09 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>	<46A895A1.7040400@dominion.kabel.utwente.nl>	<200707261444.36655.openembedded@hrw.one.pl>
	<46A89869.4030202@dominion.kabel.utwente.nl>
In-Reply-To: <46A89869.4030202@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Fri, 27 Jul 2007 08:31:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Marcin Juszkiewicz schreef:
>> Dnia czwartek, 26 lipca 2007, Koen Kooi napisaB:
> 
>>> After multiple success reports I'd like to propose the following
>>> timeline:
>>> 20070802: make m4-native 1.4.8 the default
>>> 20070809: make autoconf-native 2.61 the default
>> make automake 1.9.6 or 1.10 the default
> 
> I haven't tested that, has anyone done builds from scratch with that?

I brief test showed breakage, so automake 1.10 proponents have some work to do before
asking it to be activated :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqa0RMkyGM64RGpERAk32AKCQAbVqg/QWf4zEy7HAHIzeZhGHwgCgvQhX
WOvufiuPWa0VDYC6ZmzbkRM=
=CcZn
-----END PGP SIGNATURE-----


