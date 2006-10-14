Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GYesY-0001z4-Rx
	for openembedded-devel@openembedded.org; Sat, 14 Oct 2006 10:28:22 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9E8LfZS028103 for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Oct 2006 10:21:46 +0200
Message-ID: <45309E2B.2020901@dominion.kabel.utwente.nl>
Date: Sat, 14 Oct 2006 10:22:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061014063527.GA4522@twibble.org>
In-Reply-To: <20061014063527.GA4522@twibble.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: bugzilla & word wrapped text
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 08:28:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> Is there anyway to stop bugzilla from word wrapping the text that's
> placed in bug reports? It makes any sort of command output and
> code/patches etc pretty damn difficult to make sense of.

You can, by using the 'attach' feature, which is sadly only visible after creating the
inition bugreport. It's like inline patches in email, the kernel dudes love'em, I hate
them :). The ideal bugreport would be:

* someone files bug and puts a summarized error message in the comment
* that person opens the bug again and attaches full log
* some guru has a fix and attaches the path
* patch will be applied and bug closed.

Sounds good?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFMJ4rMkyGM64RGpERAjAvAJ4jXHx9SD+2D+yoL0KokF/wT13PLQCdFIte
Sy7Oq0HCL2fHO8EjMsGLXEs=
=IxHy
-----END PGP SIGNATURE-----


