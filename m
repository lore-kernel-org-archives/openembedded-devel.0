Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IVMTG-0007XK-42
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 09:17:10 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8C7DwxW029705 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2007 09:13:58 +0200
Message-ID: <46E791B9.5080707@student.utwente.nl>
Date: Wed, 12 Sep 2007 09:14:01 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
	<46A60832.30203@dominion.kabel.utwente.nl>
In-Reply-To: <46A60832.30203@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for FIC GTA01	support.
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
X-List-Received-Date: Wed, 12 Sep 2007 07:17:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> florian commit schreef:
> 
>> +PACKAGE_ARCH = "${MACHINE}"
> 
> This has to stop, OE is usable without setting MACHINE. The correct form is either
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"

+++ packages/openmoko2/neod_svn.bb	5425e0836b76f5378b1da4b9f6540f1595380b8d

+PACKAGE_ARCH = "${MACHINE}"

*sigh*


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG55G5MkyGM64RGpERAiSmAJsHvKA7bJAkqv6Uq13WlJKflGScZgCeOjuh
dvChFj0tgwy0g4hQ8v8LpHc=
=SxQJ
-----END PGP SIGNATURE-----


