Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lrdjw-0006K8-EW
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 21:47:19 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHS00DB3S5BIR03@vms173019.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Wed, 08 Apr 2009 14:44:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8F3236B83B5; Wed,
	08 Apr 2009 15:43:59 -0400 (EDT)
Date: Wed, 08 Apr 2009 15:43:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@openembedded.org
Message-id: <20090408194359.GH14502@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome-panel fails due to host bonobo
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
X-List-Received-Date: Wed, 08 Apr 2009 19:47:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

I don't have Gnome on my host. When gnome-panel builds, it tries to compile 
IDLs against host Bonobo library, which I don't have - see logs below.

Happens in stable too!

http://tinderbox.openembedded.net/packages/466913/
http://tinderbox.openembedded.net/public/logs/4218408.txt

-- 
Denys


