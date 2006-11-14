Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GjuHY-0007HD-SU
	for openembedded-devel@openembedded.org; Tue, 14 Nov 2006 10:08:40 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAE96ZLr023204 for <openembedded-devel@openembedded.org>;
	Tue, 14 Nov 2006 10:06:35 +0100
Message-ID: <45598719.3040108@dominion.kabel.utwente.nl>
Date: Tue, 14 Nov 2006 10:06:33 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611141038.01935.giancarlo.formicuccia@gmail.com>
In-Reply-To: <200611141038.01935.giancarlo.formicuccia@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Networking problem with glibc 2.5 and old arm ABI
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
X-List-Received-Date: Tue, 14 Nov 2006 09:08:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Giancarlo Formicuccia schreef:
> Hi *,
> 
> I hit a libc bug building an image for arm with old ABI; the problem is the 
> same described here:
> http://sources.redhat.com/ml/libc-ports/2006-10/msg00038.html
> In my case the assert is triggered by applications using networking (i.e. 
> ssh, ...)
> 
> I applied the patch described here
> http://sources.redhat.com/ml/libc-ports/2006-10/msg00069.html
> and the problem seems to be fixed.
> 
> Maybe the patch should be included to the dev repository?

Done.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFWYcZMkyGM64RGpERAg6vAKC3QI+FemknDzcvjfP5aVQPGUsgFQCbBWg9
PA7ibpqYj2wQ5PhlZlN9Jog=
=3zw8
-----END PGP SIGNATURE-----


