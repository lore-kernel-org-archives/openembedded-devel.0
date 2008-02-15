Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JQ61B-0000ky-BN
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 20:14:43 +0100
Received: from Powerbook-2.local (vpn006019.vpn.utwente.nl [130.89.6.19])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1FJEHtS012455 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 20:14:17 +0100
Message-ID: <47B5E488.4010902@student.utwente.nl>
Date: Fri, 15 Feb 2008 20:14:16 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <20080214045433.02de68cd@widy.localdomain>	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>	<20080215110230.526ea6a1@widy.localdomain>	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>	<20080215133238.7d8f7887@widy.localdomain>	<1203076695.8636.30.camel@dax.rpnet.com>	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
In-Reply-To: <1203095510.8636.92.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.9
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Fri, 15 Feb 2008 19:14:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

| I'm actually going to go as far as proposing any recursive bitbake
| recipes are removed from OE.dev ASAP for the reasons I've mentioned
| above. We *need* to find a better way. I will try and help you find that
| and will extend bitbake if needed.

While I agree on what Paul is saying, I don't think having recursive
bitbake is a good idea, and a recursive bitbake that assumes a sane
distro even worse, so realistically I'll have to back up Richard with
the removal policy.

regards,

Koen


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHteSIMkyGM64RGpERAqfeAJ9J4tRGU50ISjuWLksNctZi5gt4IQCbBQyU
sJLLn+fcLx/ujXln45T+23s=
=d5xx
-----END PGP SIGNATURE-----


