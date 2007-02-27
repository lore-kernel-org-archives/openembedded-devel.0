Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HMA3w-0001aH-Gc
	for openembedded-devel@openembedded.org; Tue, 27 Feb 2007 22:40:44 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1RLeYLr019317 for <openembedded-devel@openembedded.org>;
	Tue, 27 Feb 2007 22:40:34 +0100
Message-ID: <45E4A553.2060004@dominion.kabel.utwente.nl>
Date: Tue, 27 Feb 2007 22:40:35 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <407130732.20070227223500@gmail.com>	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
In-Reply-To: <1828813817.20070227233137@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Tue, 27 Feb 2007 21:40:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:

>   Well, that's good explanation from the point of view of birbake's
> limitation we (still) have, but I'd like to approach from another side -
> of what usecases we face. So, there was one case when
> base_conditional() was used for checking ROM size too,

Checking for ROM size is bogus, since you can't write to it anyway, and should be removed.
I suspect you mean 'flash size'.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5KVTMkyGM64RGpERAsZbAKC9n7KBtnxojUdF40WOUxQdnULchwCgry0h
moaj6DeDPPLbCphzHl/yyPE=
=mzUU
-----END PGP SIGNATURE-----


