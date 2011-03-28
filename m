Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q3zwM-00051W-Lq
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 02:04:14 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIQ003FMQREX9N1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	27 Mar 2011 19:02:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 20E1914AF6C; Sun,
	27 Mar 2011 20:02:02 -0400 (EDT)
Date: Sun, 27 Mar 2011 20:02:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110328000202.GA15392@denix.org>
References: <20110326023201.GA13132@denix.org> <4D8F5910.1060803@mentor.com>
MIME-version: 1.0
In-reply-to: <4D8F5910.1060803@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] Pull request for external	toolchains updates and matrix-gui
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
X-List-Received-Date: Mon, 28 Mar 2011 00:04:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 27, 2011 at 08:34:40AM -0700, Tom Rini wrote:
> On 03/25/2011 07:32 PM, Denys Dmytriyenko wrote:
> > Tom,
> > 
> > Please pull these 8 commits for the external CSL and Angstrom toolchains, as well
> > as a trivial SRCREV update for TI's matrix-gui. All are cherry picked from oe.dev
> > 
> > 
> > Pull URL: git://arago-project.org/git/people/denix/openembedded.git
> >   Branch: 2011.03-maintenance
> >   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> > 
> > Thanks,
> >     Denys Dmytriyenko <denys@ti.com>
> 
> $ git pull git://arago-project.org/git/people/denix/openembedded.git
> 2011.03-maintenance
> fatal: The remote end hung up unexpectedly
> 
> Otherwise I'd apply this.  Thanks!

Can you try again - seems to work here. Thanks. Otherwise I'd have to dig 
deeper at what's going on...

-- 
Denys


