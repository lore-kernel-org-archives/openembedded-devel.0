Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LpOvP-0003wC-Bc
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 17:34:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 7A5C12C823
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 15:29:59 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQehPvqRzpWn
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 15:29:57 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 767982C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 15:29:57 +0000 (UTC)
Message-ID: <49D4DA4D.1090400@gmail.com>
Date: Thu, 02 Apr 2009 17:31:25 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200903311837.28324.marcin@juszkiewicz.com.pl>	<gqti8d$6qs$1@ger.gmane.org>	<20090331171727.GK14278@smtp.west.cox.net>	<200903312149.25409.marcin@juszkiewicz.com.pl>
	<gr258f$lhg$1@ger.gmane.org>
In-Reply-To: <gr258f$lhg$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] more streamlined review procedure, was: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 15:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> I've found that there's a huge flaw in this setup:
> 
> Currently there are 8 people signed up as 'maintainers' for the stable
> branch, but only 2 (yes, two) have looked at some of the patches posted
> 2 days ago. Another said he didn't want to look at patches for machines
> he didn't build for. No idea why the other 4 haven't responded, but if
> this continues then the stable branch can be closed down immediately.
> 
> Why? The current procedure requires an ACK from a stable 'maintainer'
> (not including yourself, of course), but you won't get an ACK or even a
> NACK.
> 
> This is annoying since I've had the first bugreports from users that
> were solved by patches that are 'under review'.
> 
> The previous stable branch tried to guarantee that you'd get at least a
> reaction on all your patches within 24 hours, so submitters knew what
> was happening. A 'reaction', not a 'review', so "will look at it next
> week" is perfectly well.
> 
> So my proposal:
> 
> * within 24 hours of posting at least 1 reaction from any stable
> 'maintainer'
> * No review within a week means automatic approval, commit must have
> "UNREVIEWED" marker to signify that.

Hi
I'm trying to understand the best way to proceed.
I think you shouldn't ACK a patch that you can't test.
Maybe I'm wrong or I'm misunderstanding the goal of a 'stable' branch?

/marco


