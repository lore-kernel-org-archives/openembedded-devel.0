Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8xkV-0001zl-Dt
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 18:12:17 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAN00IYSEAYBR53@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	21 Oct 2010 11:11:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8CD714AF64; Thu,
	21 Oct 2010 12:11:21 -0400 (EDT)
Date: Thu, 21 Oct 2010 12:11:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101021161121.GA12131@denix.org>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
	<1287657524.16386.437.camel@rex>
	<AANLkTimn0RDABjQbJcO3dWHpWPWD6giY1taSVixn0MHp@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3520@dlee06.ent.ti.com>
	<AANLkTi=ut_LSHfYcy-SsC2VLCW0Mxvwao6xEeMwgM+2+@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi=ut_LSHfYcy-SsC2VLCW0Mxvwao6xEeMwgM+2+@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 16:12:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 21, 2010 at 07:21:49AM -0700, Chris Larson wrote:
> On Thu, Oct 21, 2010 at 6:46 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
> 
> > I haven't tried this myself yet, but if you wanted to tie to a particular
> > PR of the base recipe wouldn't you just put the amend.inc in your overlay at
> > recipes/blah/blah-version-pr directory?
> 
> Yes, but bbappend can't do that, its bound to the recipe filename,
> unfortunately.

Right, that's why bbappend is inferior to amend... :)

-- 
Denys


