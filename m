Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GmaiL-0007ZL-LY
	for openembedded-devel@openembedded.org; Tue, 21 Nov 2006 19:51:25 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kALImbLr029088 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2006 19:48:37 +0100
Message-ID: <45634A00.1010307@dominion.kabel.utwente.nl>
Date: Tue, 21 Nov 2006 19:48:32 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611211944.29813.openembedded@hrw.one.pl>
In-Reply-To: <200611211944.29813.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [ERROR] some recipes are unfetchable
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
X-List-Received-Date: Tue, 21 Nov 2006 18:51:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Currently I work on creating source mirror and it is progressing nicely. 
> During that time I collected list of unfetchable packages which need 
> fixing or removal.
> 
> Biggest problem is Maemo stuff - we have old (first?) release of it in OE 
> and it is mostly unfetchable currently. Someone need to update it to 
> IT2006 (or newer) or we will remove most of it.

Right, it's listed in removal.txt

> 
> Next common problem - old Qtopia related applications and games. Many of 
> them are unmaintained upstream so it is also had to find someone who will 
> want to work on fixing them. We will drop them rather.

Add those to removal.txt

> Other are misc packages - some of them was not touched during years, most 
> of them has newer version upstream, some was dropped upstream.

Add those to removal.txt as well


> Some packages are machine related but not marked as ones with 
> COMPATIBLE_MACHINE stuff.

Let's add COMPATIBLE_MACHINE to those.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFY0oAMkyGM64RGpERAjZaAKCRbnouhkFszxZ2Ivx6ryJJ296ZIgCgsnRV
5LPmj9UKr2+RCV06QQ5bs1g=
=ApMI
-----END PGP SIGNATURE-----


