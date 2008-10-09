Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ko2Kf-0001la-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 22:42:03 +0200
Received: from gandalf.denix.org ([71.255.232.65])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K8H005GENXSHP74@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	09 Oct 2008 15:37:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1F7B46B83B5; Thu,
	09 Oct 2008 16:37:04 -0400 (EDT)
Date: Thu, 09 Oct 2008 16:37:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <69E6C70090A0A14498CC98FAE5E06B6E3CF43D@hiob.intern.dresearch.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081009203704.GA2490@denix.org>
MIME-version: 1.0
References: <200810081757.57676.zecke@selfish.org>
	<48ED467B.5080208@whitby.id.au>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF43D@hiob.intern.dresearch.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: git and branches
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
X-List-Received-Date: Thu, 09 Oct 2008 20:42:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 09, 2008 at 11:39:18AM +0200, Sledz, Steffen wrote:
> As an OE beginner I'm a bit confused with the different branches. Is there an overview about all the branches available in the new git system. I made some searches in wiki.openembedded.net but could not found really helpful info.
> 
> 'git branch -r' lists these branches:
> 
>   origin/HEAD
>   origin/master
>   origin/org.openembedded.dev
>   origin/org.openembedded.documentation
>   origin/org.openembedded.dreambox
>   origin/org.openembedded.entity
>   origin/org.openembedded.stable
>   origin/org.openmoko.april-update
>   origin/org.openmoko.dev
>   origin/org.openmoko.xora.qtopia
>   origin/org.openmoko.zecke.april-update
>   origin/org.openmoko.zecke.autotools-bustage
>   origin/org.openmoko.zecke.random-breakage
> 
> <http://wiki.openembedded.net/index.php/DevelopmentBranches> lists these ones (without any description :( ):
> 
>   org.nslu2-linux.bitbake
>   org.nslu2-linux.dev
>   org.openembedded.dev
>   org.openembedded.documentation
>   org.openembedded.dreambox
>   org.openembedded.oetest
>   org.openembedded.oz354fam083
>   org.openembedded.oz354x
>   org.openembedded.packaged-staging
>   org.openembedded.stable
> 
> 'master' ist used as the default when getting the data with 'git clone git://git.openembedded.net/org.openembedded.dev' like described on <http://wiki.openembedded.net/index.php/Git#OpenEmbedded_Git_repository>. But what branch is 'master'? And which branches should one use for which purposes?

Please don't hijack threads - replying with the new Subject usually does not 
create a new thread.

As was discussed earlier, master was just another name for 
org.openembedded.dev branch, which is checked out now by default.

.dev is where all the latest development occurs, while .stable is the branch 
supposedly good enough for production, i.e. for day to day use by end users.

-- 
Denys


