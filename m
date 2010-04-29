Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O7TyT-0002O3-Kh
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 15:40:22 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 15:36:34 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 15:36:34 +0200
Received: from [192.168.1.116] ([80.117.39.139]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 29 Apr 2010 15:36:33 +0200
From: gnutoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272206485.2387.3.camel@gnutoo-desktop>
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>
	<1272114888-16964-2-git-send-email-eric@eukrea.com>
	<1272114888-16964-3-git-send-email-eric@eukrea.com>
	<1272202763.2387.1.camel@gnutoo-desktop>
	<1272205477.2387.2.camel@gnutoo-desktop>
	<1272206485.2387.3.camel@gnutoo-desktop>
Date: Thu, 29 Apr 2010 15:36:31 +0200
Message-ID: <1272548191.2313.0.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 29 Apr 2010 13:36:34.0086 (UTC)
	FILETIME=[FBECBC60:01CAE7A0]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Thu, 29 Apr 2010 13:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-04-25 at 16:41 +0200, GNUtoo wrote:
> I also had to bitbake and install libxxf86dga_1.1.1.bb.
> Now it works.
> 
> Thanks
Could you re-send a patch with all the fixes and the PR bump?
So I could push it(I bet you don't have commit access yet)

Denis.




