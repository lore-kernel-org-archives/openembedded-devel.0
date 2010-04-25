Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O6270-0003ZK-Co
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 15:43:07 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 25 Apr 2010 15:39:25 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 25 Apr 2010 15:39:25 +0200
Received: from [192.168.1.116] ([80.117.39.139]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 25 Apr 2010 15:39:25 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272114888-16964-3-git-send-email-eric@eukrea.com>
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>
	<1272114888-16964-2-git-send-email-eric@eukrea.com>
	<1272114888-16964-3-git-send-email-eric@eukrea.com>
Date: Sun, 25 Apr 2010 15:39:23 +0200
Message-ID: <1272202763.2387.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Apr 2010 13:39:25.0441 (UTC)
	FILETIME=[B8686F10:01CAE47C]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Sun, 25 Apr 2010 13:43:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-04-24 at 15:14 +0200, Eric Benard wrote:
> this patch fix the following error (met for a x86 target) :
it also fails to load libXss.so.1

Thanks a lot for the patch by the way.

Denis.




