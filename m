Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H1pxJ-0001QS-Ew
	for openembedded-devel@openembedded.org; Tue, 02 Jan 2007 21:09:53 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l02K8jLr018290; Tue, 2 Jan 2007 21:08:45 +0100
Message-ID: <459ABBCC.9030601@dominion.kabel.utwente.nl>
Date: Tue, 02 Jan 2007 21:08:44 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>
	<285929428.20070102220611@gmail.com>
In-Reply-To: <285929428.20070102220611@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] A question of workflow
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
X-List-Received-Date: Tue, 02 Jan 2007 20:09:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Sunday, December 31, 2006, 12:07:57 AM, you wrote:
> 
> []
>> Do what virtually every DSCM does to support that: make a branch
> 
>   Well, that's what I wanted to ask for a long time: if I make my
> private branch in the local OE checkout, do I need to do some steps to
> ensure it won't be pushed to the upstream repo (assuming I have commit to
> .dev branch)?

'mtn push org.openembedded.dev' instead of 'mtn sync', as outlined in the monotone doc:
http://venge.net/monotone/monotone.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFmrvMMkyGM64RGpERAn0uAKCB8UWfx2KUJ9zUEzANzDr3FgJM2gCdHnFm
G99bqMalZy6qgUsfDM1JPVs=
=ONFz
-----END PGP SIGNATURE-----


