Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou99R-0008VT-1H
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:20:46 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00JVKPOU5RZ4@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 14:19:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2433614AF64; Fri,
	10 Sep 2010 15:19:42 -0400 (EDT)
Date: Fri, 10 Sep 2010 15:19:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910191942.GJ28148@denix.org>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
	<4C88EC2B.2090208@balister.org> <20100910185004.GF28148@denix.org>
	<AANLkTi=mk=GbouoAuh-roSwrKa0Mdt3P+CJN9fzL_gds@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi=mk=GbouoAuh-roSwrKa0Mdt3P+CJN9fzL_gds@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 19:20:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 10, 2010 at 11:55:13AM -0700, Chris Larson wrote:
> On Fri, Sep 10, 2010 at 11:50 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > >> I'd agree with this quite strongly.  I'm generally pretty careful to let
> > >> others review the changes from my coworkers, to avoid any bias.
> >
> > Not to point any fingers, but mishaps happen and numerous reverts would be
> > a
> > living proof of that in the repository... :) Nobody's perfect.
> 
> 
> Mishaps have nothing to do with this, nor does being perfect, or reverts.
>  You're missing the point entirely here.  The point is, if the only people
> who acked a patch are from the same company as the person who wrote it, they
> can't be considered to have been entirely unbiased in their review of it.

Chris,

Didn't mean to offend you by that joke, sorry about that. And I didn't mean 
you specifically, as we all had our share of revert...

But in the second, important :) part of my message, which you chose to ignore 
and remove from the reply, I did acknowledge the problem and agreed to the 
proposed changes. But, as I also mentioned, there should be a failsafe 
mechanism to eventually accept changes, if nobody cared to comment or 
strongly object, after the review period is over.

-- 
Denys


