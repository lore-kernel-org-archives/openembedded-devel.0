Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GzsI9-0003qH-6t
	for openembedded-devel@openembedded.org; Thu, 28 Dec 2006 11:15:20 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBSAEgLr002481 for <openembedded-devel@openembedded.org>;
	Thu, 28 Dec 2006 11:14:42 +0100
Message-ID: <459398ED.3090607@dominion.kabel.utwente.nl>
Date: Thu, 28 Dec 2006 11:14:05 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45939836.4050900@dominion.kabel.utwente.nl>
In-Reply-To: <45939836.4050900@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: monotone 0.32 release
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
X-List-Received-Date: Thu, 28 Dec 2006 10:15:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> FYI, Monotone 0.32 has been released today which includes massive speedups for 'mtn log'
> and 'mtn annotate <file>', but it requires a bit of information to be added to your database.
> 
> See http://venge.net/monotone/UPGRADE for details on how to do that.

The most important part: the netsync protocol hasn't changed since monotone 0.26, so push,
pull and sync will work regardless of which version is used on either end.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFk5jtMkyGM64RGpERAjzqAJwIaAHwmwvQCvRAz9+6VRYtTUjEWgCgvbVg
DyUdD+993PHulknVkx/nLnI=
=bZ7V
-----END PGP SIGNATURE-----


