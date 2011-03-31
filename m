Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5Mq0-0001H0-4N
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:43:20 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIX0070MNRLPSU0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	31 Mar 2011 12:40:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 59F5E14AF6C; Thu,
	31 Mar 2011 13:40:33 -0400 (EDT)
Date: Thu, 31 Mar 2011 13:40:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110331174033.GC23178@denix.org>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
	<4D94AF84.8020000@mentor.com>
MIME-version: 1.0
In-reply-to: <4D94AF84.8020000@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 18:43:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 31, 2011 at 09:44:52AM -0700, Tom Rini wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 03/31/2011 02:10 AM, Koen Kooi wrote:
> > On 31-03-11 09:45, Denys Dmytriyenko wrote:
> >> Tom,
> > 
> >> Please pull these 8 commits for the external Angstrom toolchain fix,
> >> qt4 security advisory fix, as well as for addition of new TI machines.
> >> All are cherry picked from oe.dev
> > 
> > Merging it like this creates a few broken commits because the machines
> > were added first. Is that really what we want?
> 
> We do not.  Denys, please re-order the commits so that things are
> building in each commit.  Thanks!

Done. Please check the same tree and branch. Or do you want me to send a new 
pull request?

-- 
Denys


