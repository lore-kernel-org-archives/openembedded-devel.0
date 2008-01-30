Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JKFzk-0007oA-OB
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 17:41:10 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0UGesnr017304; Wed, 30 Jan 2008 17:40:54 +0100
Message-ID: <47A0A895.9070004@student.utwente.nl>
Date: Wed, 30 Jan 2008 17:40:53 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "angstrom-distro-devel@linuxtogo.org"
	<angstrom-distro-devel@linuxtogo.org>, 
	Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <20080130173351.08571987@widy.localdomain>
In-Reply-To: <20080130173351.08571987@widy.localdomain>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Tracking proposed changes to linux-handhelds-2.6 kernel (PocketPCs)
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
X-List-Received-Date: Wed, 30 Jan 2008 16:41:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
| Hello,
|
| I've finally opened a ticket to track changes for the next upgrade of
| linux-handhelds-2.6. If you have an idea what to enable, or made such a
| proposal before, please add a comment to that bug.

How did you manage to do that? The bugtracker has been down for a few
days now, and nothing is mentioned on openembedded.org or the oe
mailinglists about the problem or a solution....

regards,

Koen


|
| Specific requests ("enable option CONFIG_XXX because it allows Y") are
| preferred to vague ("make support for my card!!!!").
|
| http://bugs.openembedded.net/show_bug.cgi?id=3724
|
|
| I also would like to ask developers/testers/users of specific devices
| to look thru
|
http://bugs.openembedded.net/showdependencytree.cgi?id=1585&hide_resolved=1
| and see if some issues are resolved now and can be closed, or some
| additional info can be provided for them.
|
| P.S. There're lots to re-review for other devices, too:
|
http://bugs.openembedded.net/showdependencytree.cgi?id=3488&hide_resolved=1
|
| P.P.S. Don't forget that all the bugs mentioned here are release bugs,
| i.e. track status of what's available for end users with 2007.12 distro
| (release images + current feeds), so if some issue is resolved, say,
| in .dev, but not available for end users, it should not be closed, but
| instead RFC should be submitted for merging the fix to the stable
| branch.
|
|


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHoKiVMkyGM64RGpERApiqAKCAquWgO99603Asn3RB6nNsjmAp+gCbBCfq
5+LCu25cx3xXUAQG+94zVdI=
=EYdK
-----END PGP SIGNATURE-----


