Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtbBl-00069J-KZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 07:28:10 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI200FKQSC338CD@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 00:24:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AD7116B83A8; Tue,
	14 Apr 2009 01:24:03 -0400 (EDT)
Date: Tue, 14 Apr 2009 01:24:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414052403.GB22247@denix.org>
References: <20090414050720.GA22247@denix.org>
MIME-version: 1.0
In-reply-to: <20090414050720.GA22247@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: e2fsprogs is broken in configure/autoreconf
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
X-List-Received-Date: Tue, 14 Apr 2009 05:28:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 01:07:20AM -0400, Denys Dmytriyenko wrote:
> Hi,
> 
> XorA's commit[1] seems to break e2fsprogs for me (omap3evm/davinci), not fix. 
> I know, it's not a bug, it's a feature! :) All I know it used to work and it's 
> too late now for me to debug it...
> 
> Anyway, the logs are at [2] and [3]. Thanks!
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d187eec071bb0afe8bda13cbf7b89170fe99e384
> http://tinderbox.openembedded.net/packages/477200/
> http://tinderbox.openembedded.net/public/logs/4350191.txt

And to add to the confusion, sometimes it builds fine, according to tinderbox:

http://tinderbox.openembedded.net/packages/e2fsprogs/

Any ideas? Or am I doing something completely wrong due to a late hour? :)

-- 
Denys


