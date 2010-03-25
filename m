Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NueP4-0002Yo-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 05:10:46 +0100
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZT007OGKRSYTA4@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Mar 2010 23:07:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9831214AF60; Thu,
	25 Mar 2010 00:07:01 -0400 (EDT)
Date: Thu, 25 Mar 2010 00:07:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100325040701.GD31551@denix.org>
References: <4BAAD653.2050404@mwester.net>
MIME-version: 1.0
In-reply-to: <4BAAD653.2050404@mwester.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What happened to e2fsprogs-libs?
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
X-List-Received-Date: Thu, 25 Mar 2010 04:10:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 24, 2010 at 10:19:47PM -0500, Mike Westerhof wrote:
> Builds failing (see below).  I think I found the commit (pretty obvious
> with git log) but I presume that reverting it is not my best course of
> action :-)
> So, now that e2fsprogs-libs is gone, what am I to depend upon instead?

Mike,

Please see this thread:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/31421

-- 
Denys


