Received: from 206-248-190-39.dsl.teksavvy.com ([206.248.190.39]
	helo=yow-jmacdona-d2.wrs.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1StSs7-0001rE-PZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 02:21:08 +0200
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)
	id 274D06A351A; Mon, 23 Jul 2012 20:09:41 -0400 (EDT)
Date: Mon, 23 Jul 2012 20:09:41 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120724000940.GA4014@windriver.com>
References: <500D4B57.3020800@mentor.com>
MIME-Version: 1.0
In-Reply-To: <500D4B57.3020800@mentor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Tue, 24 Jul 2012 00:21:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[[oe]  Proposal: Creating meta-networking] On 12.07.23 (Mon 17:02) Firago Alexey wrote:

> Hi all,
> 
> On 6/15/2012 8:15 AM, Joe MacDonald wrote:
> >We've been talking about this on-and-off at Wind River for a while now,
> >but it now seems like a reasonable time to bring a proposal to the OE
> >community at large.  We're thinking about creating a new layer to house
> >recipes, etc.  for networking packages.
> >...
> >So what does everyone think?  Awesome idea?  Terrible idea?  (Hopefully)
> >something in between?  All feedback is welcome.
> 
> I think creating software support layer for network related packages
> is good idea.
> We've updated some of the recipes from OE Classic mentioned above
> for our projects at Mentor Graphics.
> We've been thinking to place these updated recipes in meta-oe layer.
> But I think now that separate layer like meta-networking
> would be much more suitable place.  Also we've created some new
> packages like mipv6-umip or multipath-tools
> that are good candidates for being placed in meta-networking.
> 
> So, I suggest Mentor Graphics would contribute to meta-networking.

That's great to hear!  As you can probably tell there's been not much
activity on this front for the last week or so, but I anticipate getting
back at it in the next day or two.  I'll be sure to copy the list on
anything of interest.

-- 
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind River
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283


