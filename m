Received: from asmtpout028.mac.com ([17.148.16.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P4r8x-00076u-Am
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 10:20:32 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.78])
	by asmtp028.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0LA200KKBF5ECA80@asmtp028.mac.com>
	for openembedded-devel@lists.openembedded.org; Sun,
	10 Oct 2010 01:20:05 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sun, 10 Oct 2010 12:19:56 +0400
Message-id: <FD426904-426F-4A7A-B223-675FCA94946C@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.103
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Changing u-boot-omap3 provider
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
X-List-Received-Date: Sun, 10 Oct 2010 08:20:32 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Hi,
      When I'm building omap3-console-image for the overo, it uses the u-boot-omap3_git.bb recipe. 

What should I change to make it take a u-boot-omap3-overo_2010.06.bb recipe located in my user.collection folder?

Best regards,

Elvis



