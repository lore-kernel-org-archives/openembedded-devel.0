Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IDQ28-0000OF-E7
	for openembedded-devel@openembedded.org; Tue, 24 Jul 2007 21:27:00 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B01BB851B for openembedded-devel@openembedded.org;
	Tue, 24 Jul 2007 21:24:45 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 24 Jul 2007 22:25:49 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHEEPLLLAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <1185298639.8376.21.camel@localhost.localdomain>
Importance: Normal
Subject: Re: [Angstrom-devel] Angstrom Core Team
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
X-List-Received-Date: Tue, 24 Jul 2007 19:27:01 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I believe there is a need to formalise things, if we want to move to the
next step, which IMHO is a "universal" acceptance of OE/Angstrom for
embedded devices
The last part is also something that has been puzzling me for sometime now.

What are the "core" targets of Angstrom as a distribution ?
At the beggining it looked to me as a PDA targeted distro, the console image
was bloated and "unsuitable" for embedded targets with limited resources
(i.e devices like the wrt, magicbox etc) but with minimal-image and the
changes it introduced this "bloat" has been removed at a large extend.
Still there are issues but now we can get an image that fits on a 4MB flash
and is working

A lot of the "clone" distro's (and i include ours, OPLinux in that category)
where created because although we would like to use OE/Angstrom, the bloat
problem existed and also (and most importand) .dev was a fast moving target
where changes happened at lighting speed and there was no control over them
(at least from our side).

Having the latest/gratest/cutting edge version is good but a lot of the time
it means breaking stuff that worked.
If that happens and you are hobbiest doing stuff/coding/hacking on your
spare time its not a big deal, but if you are a company and need to ship
things to your client at a certain date and  that happens, its a *big*
problem.

There are also, a lot of different needs out there and people have different
ideas of what "embedded" is, and from experience if you try to cover all of
these needs you are bound to fail.
There are people that want OPIE others that want GPE and other that are
looking for X + custom applications just to mention a few.
So i believe that among the other things proposed for the core team, would
be to define what is the  Angstrom goal/targets are, get a stable version
and define a release cycle.
Without these things clearly defined,people will keep creating "clone"
distro's of Angstrom whatever you or me think about it and its going to
spread the availiable resources even thinner.


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com




