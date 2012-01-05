Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RisLY-0006IA-Iv
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 19:47:31 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LXC00H7G96DXQWW@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 Jan 2012 12:39:54 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5D8B6201BF; Thu,
	05 Jan 2012 13:39:49 -0500 (EST)
Date: Thu, 05 Jan 2012 13:39:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120105183949.GD28075@denix.org>
References: <1325761243-6703-1-git-send-email-eyalr@ti.com>
	<1325771284.3742.131.camel@mattotaupa>
MIME-version: 1.0
In-reply-to: <1325771284.3742.131.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] iw_git: Update to commit 8b2b1c6a (version 3.2)
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
X-List-Received-Date: Thu, 05 Jan 2012 18:47:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 05, 2012 at 02:48:04PM +0100, Paul Menzel wrote:
> Am Donnerstag, den 05.01.2012, 13:00 +0200 schrieb Eyal Reizer:
> > Upadte to the latest formal release of iw whcih has wowlan and p2p support.
> 
> Typos: Update, which. Spell checkers should find those without problems.
> 
> > This version was tested together with official R4_SP2 nlcp release from TI
> > Using the following platfors:
> > 
> > am335x-evm, am180x-evm, am37x-evm
> > 
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  recipes/iw/iw_git.bb |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
> > index c98e1bc..f0dc7ff 100644
> > --- a/recipes/iw/iw_git.bb
> > +++ b/recipes/iw/iw_git.bb
> > @@ -4,9 +4,9 @@ SECTION = "base"
> >  PRIORITY = "optional"
> >  LICENSE = "BSD"
> >  
> > -SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
> > -PR = "r0"
> > -PV = "0.9.22"
> > +SRCREV = "8b2b1c6a77ee17e4128b22845cb8c5901de296c9"
> > +PR = "r1"
> > +PV = "3.2"
> >  PR_append = "+gitr${SRCPV}"
> >  
> >  DEPENDS = "libnl pkgconfig"
> 
> Presuming the PR bump is needed:
> 
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> 
> Does the rule still hold that only TI folks should push TI patches?

I'll push v3 then.

-- 
Denys


