Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H2a3j-0004j0-CF
	for openembedded-devel@openembedded.org; Thu, 04 Jan 2007 22:23:35 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l04LMALr028429; Thu, 4 Jan 2007 22:22:11 +0100
Message-ID: <459D7001.8040507@dominion.kabel.utwente.nl>
Date: Thu, 04 Jan 2007 22:22:09 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <53610736.20061228191750@gmail.com>	<459403F2.4080102@dominion.kabel.utwente.nl>	<1167337946.5596.77.camel@localhost.localdomain>	<1065634639.20061229040545@gmail.com>	<1167392044.5616.16.camel@localhost.localdomain>	<271237233.20070104210332@gmail.com>
	<1167944118.7757.164.camel@localhost.localdomain>
In-Reply-To: <1167944118.7757.164.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Thu, 04 Jan 2007 21:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-01-04 at 21:03 +0200, Paul Sokolovsky wrote:
>>   No. My original mail said that it lead to broken snapshots released
>> for hx4700, so I RFCed its removal for it, and for another PocketPC
>> machine, htcuniversal, because I'm pretty sure it can live without it.
> 
> Why were the snapshots broken? Was the problem not the total lack of a
> zImage file. The fact that doesn't automatically deploy atm is actually
> a bitbake trunk issue as it doesn't see any dependency to trigger that.

Worked around in the buildscripts by doing 'bitbake virtual/kernel' before the image.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFnXAAMkyGM64RGpERAlmrAJ9EnziALoKwLdjf5lELigVz7QaGfACdF4mP
JacO3VQYsKJjMQPxnvvRGfs=
=sQTs
-----END PGP SIGNATURE-----


