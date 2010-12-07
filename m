Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PPyd8-0006zC-B7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 15:35:11 +0100
Received: from localhost.localdomain (80.117.37.237) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C041AC9EA for openembedded-devel@lists.openembedded.org;
	Tue, 7 Dec 2010 15:33:19 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 15:32:49 +0100
Message-Id: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 82.57.200.97
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] add iphone3g support
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
X-List-Received-Date: Tue, 07 Dec 2010 14:35:16 -0000


hi, 

Android was ported to the some apple devices(iphones,ipod etc...)
Fortunately the kernel is standard enough to be able to run some
  GNU/Linux distributions such as SHR.

So Chris Spehn(Lopi on irc) tried an htcdream shr-image on the iphone3g
  and got it working modifying the configurations files.

Then I helped him to add all theses configuration files to openembedded.

Chris Spehn is part of the iX project ( http://www.ixproject.org )

He did all the testing and the configurations files, I just helped to make 
  the openembedded patches.

Note that I didn't have an iphone3g for testing the changes.

Denis.



