Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LnhQf-0003AI-Sl
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Mar 2009 23:55:06 +0100
Received: from gandalf.denix.org ([71.255.242.201]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KH800FD8NKI385D@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	28 Mar 2009 17:53:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 682EB6B83A8; Sat,
	28 Mar 2009 18:53:06 -0400 (EDT)
Date: Sat, 28 Mar 2009 18:53:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090328225306.GA13886@denix.org>
References: <20090328211530.7700adb1@mail.villafam.com>
	<1238277247.30429.11.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1238277247.30429.11.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: TinyLogin
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
X-List-Received-Date: Sat, 28 Mar 2009 22:55:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 28, 2009 at 09:54:06PM +0000, Phil Blundell wrote:
> On Sat, 2009-03-28 at 17:15 -0400, Juan C. Villa wrote:
> > Hey guys,
> > 
> > I deleted my local download cache yesterday and I have not been able to rebuild my distro with OpenEmbedded because the TinyLogin (http://tinylogin.busybox.net/) program got merged into BusyBox. 
> > 
> > recipes/tinylogin/tinylogin_1.4.bb  needs to be updated.

http://thread.gmane.org/gmane.comp.handhelds.openembedded/21701

> Yes, it seems the crazy busybox dudes have removed the old tinylogin
> sources.  That's a bit of a pain.
> 
> Are there any mirrors where the files are still available?

http://www.angstrom-distribution.org/unstable/sources/tinylogin-1.4.tar.bz2

-- 
Denys


