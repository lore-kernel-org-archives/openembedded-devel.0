Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE2ck-00005i-Is
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:39:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QCbu1R027599 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 14:37:56 +0200
Message-ID: <46A895A1.7040400@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 14:37:53 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
In-Reply-To: <46A711DB.6000205@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Thu, 26 Jul 2007 12:39:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> At guadec we discussed activating autoconf-native 2.61, pkgconfig-native 0.22 and
> m4-native 1.4.8. The test builds we did didn't show any errors but we'd like more people
> to try to build their favourite target and report back.

After multiple success reports I'd like to propose the following timeline:

20070802: make m4-native 1.4.8 the default
20070809: make autoconf-native 2.61 the default
20070816: make pkgconfig-native 0.22 the default
20070816+: remove autotools hacks in recipes (e.g overriding do_configure)

what do you think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqJWhMkyGM64RGpERAvBcAJ0YKMzrl8ASaDjhA6xzAN+JxS9X/gCeL8GI
7n/RcjqzkspmMk/RWkel9q0=
=B3QE
-----END PGP SIGNATURE-----


