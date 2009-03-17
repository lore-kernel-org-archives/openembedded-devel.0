Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ljewl-0007Hg-SW
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:27:38 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO0009Z0NV8C70@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 14:26:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4105D6B83A8; Tue,
	17 Mar 2009 15:26:19 -0400 (EDT)
Date: Tue, 17 Mar 2009 15:26:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090317192619.GA15734@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net>
MIME-version: 1.0
In-reply-to: <49BEF545.4040608@dls.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier	agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 19:27:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 16, 2009 at 07:56:37PM -0500, Mike (mwester) wrote:
> 
> Denys Dmytriyenko wrote:
> > Renaming packages/ directory to recipes/, as one of the several structural
> > changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
> > currently doesn't have time/ability to do the change, and some people are
> > too eager to wait any longer, he asked me to do it. Please ack/nack.
> 
> Ack.   But can you please tag the revision immediately preceeding the
> commit of this change so we have some easy-to-reference point[*] in the
> history?

Done. mv-packages-to-recipes-pre and mv-packages-to-recipes-post are the tags 
applied right before and right after the change.

> [*] In accordance with the laws of Murphy, doing this will ensure that
> nobody will ever actually have to use this easy-to-reference point.

Good point! Let's hope.

-- 
Denys


