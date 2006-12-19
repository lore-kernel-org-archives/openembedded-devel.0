Received: from [216.148.227.153] (helo=rwcrmhc13.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1Gwgmr-0003eo-GG
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Dec 2006 16:21:49 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (rwcrmhc13) with ESMTP
	id <20061219151932m1300ki9sge>; Tue, 19 Dec 2006 15:19:33 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 3B053FF9; Tue, 19 Dec 2006 10:21:20 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1166541679.28807@gatekeeper.stellarwerx.com>
Date: Tue, 19 Dec 2006 10:21:19 -0500 (EST)
MIME-Version: 1.0
Subject: New IXP4XX Machine Question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2006 15:21:49 -0000
Content-Type: multipart/mixed; boundary="bound1166541680"

--bound1166541680
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hello!

I'm new to the list, but I've been following OE for quite some time now.  I've been greatly amazed at the work that you have done putting OE together.  I salute you.

However, I do have a question.  I am trying to bring up a new machine to run on an OE-style distro and I am having trouble with the build environment.  It is an IXP425-powered SBC somewhat similar to the SLUGs but operates more like a firewall device (i.e. multiple ethernet ports).  I've built a whole distro using the GPL'ed IXP4XX network drivers and everything works except for the network.  So, to see if it is the drivers or my board, I've tried to switch to building Intel's library/drivers.  In the OE environment, Intel's library/driver always fails at applying the OE patches.  If I remove all of the patches, it starts building, but it builds little-endian in spite of the big-endian settings I have.

I don't want to blast all of you with messages on this particular issue, so are there a few people here who can help me privately either: (1) get the IXP4XX GPL'ed drivers running, or (2) help me get Intel's software building under OE for my board?

Thank you!
-Mark Gollahon

--bound1166541680--
