Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtavN-0000et-2g
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 07:11:11 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI200EN3RK8ITIE@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 00:07:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 677D76B83A8; Tue,
	14 Apr 2009 01:07:20 -0400 (EDT)
Date: Tue, 14 Apr 2009 01:07:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414050720.GA22247@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: e2fsprogs is broken in configure/autoreconf
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
X-List-Received-Date: Tue, 14 Apr 2009 05:11:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

XorA's commit[1] seems to break e2fsprogs for me (omap3evm/davinci), not fix. 
I know, it's not a bug, it's a feature! :) All I know it used to work and it's 
too late now for me to debug it...

Anyway, the logs are at [2] and [3]. Thanks!

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d187eec071bb0afe8bda13cbf7b89170fe99e384
http://tinderbox.openembedded.net/packages/477200/
http://tinderbox.openembedded.net/public/logs/4350191.txt

-- 
Denys


