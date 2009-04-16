Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LuXzm-0000Fc-UH
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 22:16:16 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI700JOQMRCWETT@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	16 Apr 2009 15:11:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D5FF16B83B5; Thu,
	16 Apr 2009 16:11:35 -0400 (EDT)
Date: Thu, 16 Apr 2009 16:11:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090416201135.GA8535@denix.org>
References: <20090402005356.GN14278@smtp.west.cox.net>
	<200904071021.20322.marcin@juszkiewicz.com.pl>
	<20090416194707.GK17629@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090416194707.GK17629@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox 1.13.2: Add more upstream patches, bump PR
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
X-List-Received-Date: Thu, 16 Apr 2009 20:16:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 16, 2009 at 12:47:07PM -0700, Tom Rini wrote:
> On Tue, Apr 07, 2009 at 10:21:19AM +0200, Marcin Juszkiewicz wrote:
> > Dnia czwartek, 2 kwietnia 2009 o 02:53:56 Tom Rini napisa??(a):
> > > This adds the awk, killall, printf, syslogd, top24, unzip and wget
> > > patches from http://busybox.net/downloads/fixes-1.13.2/
> > 
> > Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> > 
> > I will also Ack it for stable/2009 branch.
> 
> Looking for 1 more ack.  The awk patch is needed to fix problems that
> are seen on MIPS/FPU systems (for example, malta).

Acked-by: Denys Dmytriyenko <denis@denix.org>

-- 
Denys


