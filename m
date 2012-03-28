Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SChmP-0004ar-3D
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 03:34:29 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1K00A3WJU9I6G1@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	27 Mar 2012 19:25:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B3D5E201F9; Tue,
	27 Mar 2012 20:25:21 -0400 (EDT)
Date: Tue, 27 Mar 2012 20:25:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120328002521.GC17470@denix.org>
References: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
	<20120323140606.00eb484a@eb-e6520>
	<CAMKF1sq742W527ubkcaqyOu5uQ_hDD4ijSHdKq8CeFZKFs5i_Q@mail.gmail.com>
	<CAMKF1spjKz_vGs1=3Yz3230mvBL3nhV4+GVSGJEAnBNYH4W_PA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1spjKz_vGs1=3Yz3230mvBL3nhV4+GVSGJEAnBNYH4W_PA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Wed, 28 Mar 2012 01:34:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 23, 2012 at 08:06:15AM -0700, Khem Raj wrote:
> On Fri, Mar 23, 2012 at 8:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Mar 23, 2012 at 6:06 AM, Eric B??nard <eric@eukrea.com> wrote:
> >> Le Fri, 23 Mar 2012 08:24:14 +0100,
> >> Koen Kooi <koen@dominion.thruhere.net> a ??crit :
> >>
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> Acked-by: Eric B??nard <eric@eukrea.com>
> >>
> >
> > Looks good now
> >
> > Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Koen
> 
> While you are at it I think eglibc 2.12 should either move to
> toolchain-layer or to meta-angstrom layer I dont know if there are any
> other consumers of eglibc 2.12

Yes, there are other consumers. :)

-- 
Denys


