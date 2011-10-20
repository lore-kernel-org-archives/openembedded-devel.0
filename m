Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RH02q-0000Gc-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 23:20:58 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTD00268V0XC370@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Oct 2011 16:14:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CDE0514AF5D; Thu,
	20 Oct 2011 17:14:57 -0400 (EDT)
Date: Thu, 20 Oct 2011 17:14:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111020211457.GU26170@denix.org>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
	<1319057924.12686.10.camel@mattotaupa>
	<20111019211838.GH3522@jama.jama.net>
MIME-version: 1.0
In-reply-to: <20111019211838.GH3522@jama.jama.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
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
X-List-Received-Date: Thu, 20 Oct 2011 21:20:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 19, 2011 at 11:18:39PM +0200, Martin Jansa wrote:
> On Wed, Oct 19, 2011 at 10:58:44PM +0200, Paul Menzel wrote:
> > Am Mittwoch, den 19.10.2011, 17:10 +0200 schrieb ulf_samuelsson@telia.com:
> > > From: Ulf Samuelsson <ulf_samuelsson@telia.com>
> > 
> > again, please comply with our commit policy [1].
> > 
> > binutils: Update from 2.20.1 to 2.20.1a
> > 
> > > Tarball is updated to 2.20.1b so checksums have changed.
> > 
> > I am not aware of any binutils version 2.20.1b. Do you mean 2.20.1a?
> > 
> > Please create a new recipe since doing it this way the already
> > downloaded sources would be made invalid and archives on mirrors would
> > cause problems too.

Darn it, from the subject line I got my hopes high that someone bit the bullet 
and made a proper patch for 2.20.1a... Guess not. :)


> > Please see commit f4faecdb [2] as an example and take a look at the list
> > discussion [3].
> 
> Better example commit in [4]
> 
> > [1] http://www.openembedded.org/wiki/Commit_Policy
> > [2] http://git.openembedded.org/openembedded/commit/?id=f4faecdbd0b7c83e5787735ef1495a34aca861e4
> > [3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/034885.html
> 
> [4] http://git.openembedded.org/meta-openembedded/commit/?id=15832ab1f64f2bc2ee7d342e5bff0351b5e2479b


