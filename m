Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O6byo-000881-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 06:01:03 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1I00BWSLJ3I566@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	26 Apr 2010 21:57:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0B6E814AF60; Mon,
	26 Apr 2010 22:57:03 -0400 (EDT)
Date: Mon, 26 Apr 2010 22:57:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100427025702.GC10320@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
	<20100426174411.GA22763@denix.org>
	<x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: arago-devel@gforge.ti.com
Subject: Re: [arago-devel] dm365 and OE
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
X-List-Received-Date: Tue, 27 Apr 2010 04:01:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 27, 2010 at 03:48:17AM +0200, Raffaele Recalcati wrote:
> I'll try to go on with both for some weeks.
> But, first of all, I need a dvsdk running on dm365 with Arago.
> By now, I can't build any ti recipe for dm365 in Arago (arago-next).
> I could build dvsdk externally following the readme, but I think it is
> better to re-use you work.
> Which are the recipes that I can build for dm365?

arago-next was merged back to the master branch recently, but it shouldn't 
matter, as DVSDK was buildable before the merge. If you are referring to the 
fact that some components are not fetchable and need to be downloaded 
manually, it's still the case for a few of them, as explained in the README.
AFAIK, codecs for some platforms were not public at the time, I believe dm365 
being one of them. I'll ping some people internally and see if/when this will 
be fixed.

> In case of problem I, and my team, will contribute to the work.

Thanks. Please keep us posted.

-- 
Denys


