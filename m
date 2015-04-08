Return-Path: <denis@denix.org>
X-Greylist: delayed 1125 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Apr 2015 19:02:01 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id DFC9160089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:02:01 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00GWR4V97P80@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 14:02:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10	a=6CtkAtYOAAAA:8 a=Q4-j1AaZAAAA:8
	a=Iq7JZEiU9KeQ_HJGnY8A:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 48C9C2016F; Wed,
	8 Apr 2015 15:01:57 -0400 (EDT)
Date: Wed, 08 Apr 2015 15:01:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150408190157.GO6952@denix.org>
References: <CA+chaQdFo2M-=_PP7x-KnPEvEAQLX9vkudnaC9VJQxe90AhTbQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+chaQdFo2M-=_PP7x-KnPEvEAQLX9vkudnaC9VJQxe90AhTbQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5] Qt 5.5 Alpha Recipes?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2015 19:02:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

FWIW, qt 5.5 will have some revamped touchscreen support, which is still 
mostly broken in 5.4.x...

-- 
Denys


On Mon, Mar 30, 2015 at 05:41:47PM +0200, Martin Jansa wrote:
> Hello Stephan,
> 
> they usually follow "stable" branch, but that's not a rule, it can be
> changed to any branch as long as you update corresponding variable.
> 
> For myself I don't know if we'll be more interested in trying newer
> revision in 5.4 (e.g. if we find critical bug in 5.4.1 which is supposed to
> be fixed in 5.4.2) or trying new features from 5.5.
> 
> I think it's safe to say that "fido" branch should only get 5.4.x* in git
> recipes and lets leave 5.5-alpha only for master branch. Fido branch will
> be created soon (1-2 weeks).
> 
> How does this sound?
> 
> CCing oe-devel in case someone else wanted to start on it.
> 
> On Mon, Mar 30, 2015 at 1:13 PM, Stephan Binner <stephan.binner@basyskom.com
> > wrote:
> 
> > Hello Martin,
> >
> > with which Qt development release (Alpha, Beta, RC) are the qt*_git.bb
> > recipes
> > usually upgraded to next major version? If with Alpha are you working on or
> > aware of anybody currently working on upgrading qt*_git.bb to Qt 5.5
> > Alpha?
> >
> > I don't want to promise anything but I may have some time to spend on it...
> >
> > Regards,
> > Stephan
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

