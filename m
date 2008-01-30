Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JKJ78-0001xU-3u
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 21:00:54 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0UK0unr032618 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 21:00:56 +0100
Message-ID: <47A0D778.5010402@student.utwente.nl>
Date: Wed, 30 Jan 2008 21:00:56 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <fnqakr$ffa$1@ger.gmane.org>
In-Reply-To: <fnqakr$ffa$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Wed, 30 Jan 2008 20:00:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Funny, I made similar comments a few years ago about bugs.oe.org being
treated as bugs.oz.org, at which point I was made clear by then OE core
developers (and even by nearly all OE founders) that it was The One And
Only Way(TM) and that all OE-based distros should use bugs.oe.org and
claim bugs as their own. A few years down the road Angstrom is doing
exactly that.

To put it in Graemes words: "This is a wind-up, right?"

Rolf Leggewie schreef:
| Hello,
|
| I have witnessed some aggressive usurpation of the bug-tracker by
| Angstrom devs recently, especially concerning meta-bugs.  This has to
| some extent brought back the bickering we all try to avoid.
|
| I want to discuss this with you but cannot offer an immediate solution.
|  I think the whole structure needs some reconsideration to make sure
| that different distributions don't step on each other's toes or one
| distribution claims the BTS all for itself.  The information in the bug
| tracker is there for all to share and make OE better.
|
| The problem - which I have been considering for almost a year now -
| stems from the fact that OE vs. distribution vs. on-device is not
| clearly distinguished.  bugzilla also does not allow marking two entries
| for field X.
|
| * there are issues at time of compilation, but they can be
|   distro-specific, host-specific, foo-specific or generic
| * there are issues on-device and they can be device-specific,
|   distro-specific, foo-specific or generic
| * It is also possible that one bug exists in A* 2007 and Sharp ROM,
|   but not in A* 2008.  Currently, this is impossible to mark correctly.
|
| We don't clearly distinguish and our field labels reflect that, making
| it hard for people to carve out the bugs that affect them as well as not
| step on one another when trying to resolve the problem for their
| specific distro.  launchpad for example does this much better, but
| generally sucks even more with regards to fields and searchability.
|
| The problem partly stems from the fact that bugzilla is usually not used
| in a cross-compile environment (what does the Hardware field mean?, what
| does OS mean?).  We have tried to work around this with meta-bugs in the
| past but it becomes increasingly difficult.
|
| So much for the status quo.  I think we eventually will need to rework
| the labels and fields and communicate their meaning more clearly, but I
| cannot present "the" solution yet.  Suggestions and discussion welcome.
|
| Regards
|
| Rolf


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHoNd4MkyGM64RGpERAnXfAKCzA7P4MhoAKvASgBr9cc4b2M/w6wCfayCN
IW+2TkSfhyeI65u9ey5cU4g=
=L6Zn
-----END PGP SIGNATURE-----


