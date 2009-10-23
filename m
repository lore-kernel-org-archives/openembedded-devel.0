Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N1QER-0002FK-14
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:55:30 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRZ00FXTGM9OWXY@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Oct 2009 14:54:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D919B14AF60; Fri,
	23 Oct 2009 15:54:08 -0400 (EDT)
Date: Fri, 23 Oct 2009 15:54:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091023195408.GC28604@denix.org>
References: <381446.79903.qm@web53903.mail.re2.yahoo.com>
MIME-version: 1.0
In-reply-to: <381446.79903.qm@web53903.mail.re2.yahoo.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: omap3-console-image broken?
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
X-List-Received-Date: Fri, 23 Oct 2009 19:55:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 23, 2009 at 12:30:23PM -0700, Charlie Woloszynski wrote:
> I am trying to build an omap3-console-image, but i get the following error.  
> 
> I have done a 'git pull' for org.openembedded.dev this morning
> 
> 
> NOTE: Running task 1038 of 4072 (ID: 1010, /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch)
> fatal: Not a git repository
> NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/charlie; export PATH=/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/overo-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin:/home/charlie/pixhawk.oe/tmp/cross/armv7a/bin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/bin:/home/charlie/pixhawk.oe/bitbake/bin:/home/charlie/pixhawk.oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git fetch git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git master failed with signal 128, output:
> fatal: Not a git repository
> 
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb do_fetch failed
> ERROR: Task 1010 (/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch) failed
> NOTE: Tasks Summary: Attempted 1037 tasks of which 1032 didn't need to be rerun and 1 failed.
> ERROR: '/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb' failed
> 
> Any ideas on how to address this?

Wrong list?

There seems to be no omap3-console-image nor linux-omap3 recipes in OE...

-- 
Denys


