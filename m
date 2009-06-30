Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MLhg7-00039R-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 20:03:57 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM20065SC8TF3LK@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	30 Jun 2009 12:51:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7A9BA14AF5F; Tue,
	30 Jun 2009 13:50:53 -0400 (EDT)
Date: Tue, 30 Jun 2009 13:50:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090630175053.GE6573@denix.org>
References: <1246379971-1420-1-git-send-email-k.kooi@student.utwente.nl>
	<20090630174402.GM23935@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090630174402.GM23935@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] myththv: bump SRCREV
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
X-List-Received-Date: Tue, 30 Jun 2009 18:04:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 30, 2009 at 10:44:02AM -0700, Tom Rini wrote:
> On Tue, Jun 30, 2009 at 06:39:31PM +0200, Koen Kooi wrote:
> 
> > From: Koen Kooi <koen@openembedded.org>
> > 
> > 
> > Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> Acked-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> > ---
> >  recipes/mythtv/mythtv_0.21.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/mythtv/mythtv_0.21.bb b/recipes/mythtv/mythtv_0.21.bb
> > index 3594afb..89b9b11 100644
> > --- a/recipes/mythtv/mythtv_0.21.bb
> > +++ b/recipes/mythtv/mythtv_0.21.bb
> > @@ -5,7 +5,7 @@ inherit qmake qt3x11
> >  PR = "${SRCREV}+r5"
> >  REALPV = "0.21"
> >  
> > -SRCREV = "19479"
> > +SRCREV = "20763"
> >  SRC_URI = "svn://svn.mythtv.org/svn/branches/release-0-21-fixes;module=mythtv;proto=http"
> >  
> >  SRC_URI += " \
> > -- 
> > 1.6.1
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > 
> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


