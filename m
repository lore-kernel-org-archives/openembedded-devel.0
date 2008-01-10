Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JCvs7-0004xq-DX
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 12:46:55 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0ABkefr008687 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2008 12:46:43 +0100
Message-ID: <478605A1.5030209@student.utwente.nl>
Date: Thu, 10 Jan 2008 12:46:41 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4785F736.5050707@student.utwente.nl>
	<200801101221.53018.zecke@selfish.org>
In-Reply-To: <200801101221.53018.zecke@selfish.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: a5c7b007eaa675cc904f5285291d2f8a597efc84
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
X-List-Received-Date: Thu, 10 Jan 2008 11:46:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| On Thursday 10 January 2008 11:45:10 Koen Kooi wrote:
|> ~ * gfortran is NOT needed to build a gfortran cross-compiler, something
|> else is wrong.
|
| Hi,
|
| feel free to disapprove it, there are at least two open bug reports
regarding
| fortran that we will have to look into.

I don't have a (better) solution on how to pull in the deps needed or
fix the -native ones in OE, so it can stay as it it, I just wanted to
raise some awareness of the issue and why fortran was enabled.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHhgWhMkyGM64RGpERAmgBAKC1Io3+VFpqG24HTkGELawUFaJeiwCgqkzi
2x2WvpLfnAY5o8cbMs4iZzU=
=65Fg
-----END PGP SIGNATURE-----


