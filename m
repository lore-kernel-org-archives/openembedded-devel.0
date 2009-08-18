Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MdSy3-0005eJ-Mh
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 19:59:31 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KOL00LUW2HY4UL1@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	18 Aug 2009 12:42:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9B26D14AF5F; Tue,
	18 Aug 2009 13:41:57 -0400 (EDT)
Date: Tue, 18 Aug 2009 13:41:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090818174157.GB25000@denix.org>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
MIME-version: 1.0
In-reply-to: <1250612879.6785.12.camel@conroy-linux>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Tue, 18 Aug 2009 17:59:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 18, 2009 at 12:27:59PM -0400, Chris Conroy wrote:
> However, I've run in to a different problem. It seems that Debian
> Renaming does not play nicely with the external toolchain. Digging into
> the code, it seems that Debian renaming relies on the package being in
> the workdir to do its magic, which for any prebuilt SDK packages will
> not hold true. Any thoughts on the proper route to fix this aside from
> just turning of Debian Renaming?

Can you please provide more details on the problem? Thanks.

-- 
Denys


