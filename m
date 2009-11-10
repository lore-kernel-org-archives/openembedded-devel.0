Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N7qSg-0004YP-GX
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 14:08:45 +0100
Received: from [192.168.1.7] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 24104584D29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 14:53:17 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
Organization: Vanille-Media
Date: Tue, 10 Nov 2009 14:07:26 +0100
Message-ID: <1257858446.3077.3.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2009 13:08:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

===========
Poky and OE
===========

RP still works on Poky, since Poky is easier to break, RP has more
freedom to break stuff and try new ideas for improvements that will
also benefit OE.

Intel owns Poky as the brandname, however there seems to be no clear
direction right now where they want to take it.

OE is being improved gradually to support the merits of Poky, although
due to the sheer amount of recipes it will probably always lack behind
in perceived quality. OE and Poky do try to remain in sync, though.

As a product, it is important for Poky to have a short list of
people with commit access. This already adds up to the quality of the
metadata. The dictator model works for Poky, but does not work for OE.

It is noted that the current dev process does not work particularly
well,
some people think it is too easy to get commit access to OE.
(Editor's note: See also stable branch session)

=======================================
Hosting
=======================================
The prefix of the member's mailinglist has been removed, reply-to-list
has been enabled. Various people work on getting the remaining services
on amethyst to work on LTG (which is a powerful machine these days).
Phil and Phillip are improving the server configuration to get rid
of our mail/DNS problems.

We will do changes on the git layout, e.g. org.oe.dev is becoming
'master'
and user branches will live in a seperate repository.

=======================================
Bugtracker
=======================================
We will keep the bugtracker, but perform a radical cleanup, i.e.
all non-OE and non-BB versions/milestones/components will be dumped.
We will improve the description of what belongs into the bugtracker
and what not. We will also reinstatiate the bug squashing weekends.

Cheers,

:M:




