Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdzwi-0004uv-Oc
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 07:12:20 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00M7ZSBRNI6C@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 23:55:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3892814AF5F; Thu,
	20 Aug 2009 00:55:03 -0400 (EDT)
Date: Thu, 20 Aug 2009 00:55:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820045503.GH32010@denix.org>
References: <4A8C1EB7.4050500@atmel.com> <20090820033157.GB32010@denix.org>
	<20090820042324.GC4952@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090820042324.GC4952@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: fbv neutered
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
X-List-Received-Date: Thu, 20 Aug 2009 05:12:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 09:23:25PM -0700, Tom Rini wrote:
> On Wed, Aug 19, 2009 at 11:31:57PM -0400, Denys Dmytriyenko wrote:
> 
> > > Is there another application one should use?
> > 
> > Try fbida - worked for me just fine
> 
> It didn't when I tried, way way back when.  It also wanted way more
> stuff :)

The dependency list seems reasonable to me, although it would be great if 
font stuff was optional :)

As of trying it way-way back, I fixed it last November, as it was not even 
building for me back then:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=8bef7e6006811ad7e84a8a6d9433f754b15e2ae4

-- 
Denys


