Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrKcE-0006V5-TE
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 01:22:40 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHR0024D7FNCGU2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 18:19:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5511D6B83B5; Tue,
	07 Apr 2009 19:18:59 -0400 (EDT)
Date: Tue, 07 Apr 2009 19:18:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407231859.GG11203@denix.org>
References: <200904071212.18247.mickey@vanille-media.de>
	<20090407174351.GD11203@denix.org>
	<200904080039.27928.mickey@vanille-media.de>
MIME-version: 1.0
In-reply-to: <200904080039.27928.mickey@vanille-media.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=AWL,BAYES_20,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPLOY_DIR / packaged staging / persistent toolchains
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
X-List-Received-Date: Tue, 07 Apr 2009 23:22:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2009 at 12:39:27AM +0200, Michael 'Mickey' Lauer wrote:
> Hi Denis,
> 
> > Are you overwriting DEPLOY_DIR_PSTAGE from its default
> > ${DEPLOY_DIR}/pstage?
> 
> No, I didn't touch that.
> 
> > Otherwise it should work and should populate CROSS_DIR from pstage.
> 
> Ok, that simply doesn't happen here.
> 
> How can we debug this further.

Hmm, Andrea has mentioned on irc, that the behavior may depend on whether the 
complete deploy directory is preserved or not... Need to experiment some more.

-- 
Denys


