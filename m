Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LreBW-0006vV-MM
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 22:16:01 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHS00ILYTH324V6@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2009 15:12:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 047936B83B5; Wed,
	08 Apr 2009 16:12:39 -0400 (EDT)
Date: Wed, 08 Apr 2009 16:12:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408201238.GI14502@denix.org>
References: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
	<20090408004514.GI11203@denix.org> <49DC6CB1.7080205@bolloretelecom.eu>
	<20090408185813.GD14502@denix.org> <49DD0366.8000202@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <49DD0366.8000202@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=AWL,BAYES_05,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gsoap: actually stage headers and	libraries..
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
X-List-Received-Date: Wed, 08 Apr 2009 20:16:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2009 at 10:04:54PM +0200, Jeremy Lain? wrote:
> > Overall it looks Ok to me. But I have 2 questions about a proper procedure:
> > - should the .dev have the same fix?
> > - should PR be incremented by 1?
> 
> Yes, the dev branch has the exact same .bb file. In fact the patch is simply the diff
> between stable and dev.

Sorry, I missed it in .dev - both questions retracted.

Acked-by: Denys Dmytriyenko <denis@denix.org>

-- 
Denys


