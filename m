Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HptH1-000534-Fk
	for openembedded-devel@openembedded.org; Sun, 20 May 2007 23:49:07 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4KLmLox032402 for <openembedded-devel@openembedded.org>;
	Sun, 20 May 2007 23:48:21 +0200
Message-ID: <4650C225.9010907@dominion.kabel.utwente.nl>
Date: Sun, 20 May 2007 23:48:21 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
In-Reply-To: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: OpenEmbedded insist on downloading existing package
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
X-List-Received-Date: Sun, 20 May 2007 21:49:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson schreef:
> I have defined the download location to and
> I have linux-2.6.21.1.tar.bz2 in this directory.

is linux-2.6.21.1.tar.bz2.md5 present there?

> OpenEmbedded seems to ignore this and insists on *downloading*
> linux-2.6.21.1.tar.bz2 before use.

if the md5 stamp isn't present it will try to download it again till the downloads
completes and linux-2.6.21.1.tar.bz2.md5 has been created.

> - This is no fun.
> 
> Anything that can be done?

See above.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGUMIlMkyGM64RGpERAus1AKCLYQPDm8IRkOCvT3TqF/UFWiOCogCfdf2T
W/f6t+bzYKRlzcnbqhs2yYA=
=cJI9
-----END PGP SIGNATURE-----


