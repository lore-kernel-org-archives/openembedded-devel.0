Received: from [207.172.157.102] (helo=smtp02.lnh.mail.rcn.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KqJS4-0004jo-OG
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 05:23:04 +0200
Received: from mr02.lnh.mail.rcn.net ([207.172.157.22])
	by smtp02.lnh.mail.rcn.net with ESMTP; 15 Oct 2008 23:17:53 -0400
Received: from smtp01.lnh.mail.rcn.net (smtp01.lnh.mail.rcn.net [207.172.4.11])
	by mr02.lnh.mail.rcn.net (MOS 3.8.6-GA) with ESMTP id PDR76389;
	Wed, 15 Oct 2008 23:17:53 -0400 (EDT)
Message-Id: <77ts5u$jp3k1o@smtp01.lnh.mail.rcn.net>
Received: from c-24-91-108-154.hsd1.ma.comcast.net (HELO tmt.rcn.com)
	([24.91.108.154])
	by smtp01.lnh.mail.rcn.net with ESMTP; 15 Oct 2008 23:17:54 -0400
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Wed, 15 Oct 2008 23:17:51 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <200810160043.08202.zecke@selfish.org>
References: <200810151022.38477.zecke@selfish.org>
	<200810152153.52020.zecke@selfish.org> <gd5i1h$frs$1@ger.gmane.org>
	<200810160043.08202.zecke@selfish.org>
Mime-Version: 1.0
X-Junkmail-Whitelist: YES (by domain whitelist at mr02.lnh.mail.rcn.net)
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Thu, 16 Oct 2008 03:23:05 -0000
Content-Type: text/plain; charset="us-ascii"

At 06:43 PM 10/15/2008, Holger Freyther wrote:
>Wow, I had to read that a couple of times. In Linux terms I would have to add  
>a S-O-B to the commit. If it goes through your hands you add your S-O-B as 
>well, if you just review and like the patch you ack?

If you write code and add it to a patch, you generally sign it (S-O-B)
because you're asserting that your addition adheres to the relevant
license(s). If you merely approve of code and don't add any, then you
ack it (A-B).

There are lots of other amusing lines that are often added, but the
S-O-B one is the key, since it establishes the chain of responsibility.
Beginning with the submitter!

Do OE recipes have any particular licensing to govern any S-O-B terms?
If that's documented somewhere, I'd be interested to see it. There isn't
a license in the tree, that I've found.

Tom.



