Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GdCPh-0006dG-BS
	for openembedded-devel@openembedded.org; Thu, 26 Oct 2006 23:05:21 +0200
Received: from [192.168.21.150] (cp1080952-a.ndwrt1.lb.home.nl [84.30.9.91])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9QL53vD006915 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2006 23:05:04 +0200
Message-ID: <454122FF.5030507@dominion.kabel.utwente.nl>
Date: Thu, 26 Oct 2006 23:05:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453EAEE0.8020704@dominion.kabel.utwente.nl>
In-Reply-To: <453EAEE0.8020704@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Report of QA issues with 'bitbake angstrom-image'
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
X-List-Received-Date: Thu, 26 Oct 2006 21:05:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> I decided to use insane.bbclass to hunt down spurious .debug/ entries in .debug packages,
> but insane.bbclass is so cool that I want to share the full list with you:
> 
> http://ewi546.ewi.utwente.nl/tmp/QA-issues.txt
> 
> I suspect we can ignore the .so warning for modules (gnumeric-plugins, abiword-plugins)
> and debug packages, but that still leave a fair deal of packages to investigate.

After filtering out modules:

http://ewi546.ewi.utwente.nl/tmp/QA-issues-2.log

Lots of low-hanging fruit to be picked :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFQSL+MkyGM64RGpERAn0zAKCDg0P8ZN/XtKLmKd4Fl2LqB4DuygCeOW4x
njJi7m4gK+A5vUf3rS7ZMFM=
=YnDZ
-----END PGP SIGNATURE-----


