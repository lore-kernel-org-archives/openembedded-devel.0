Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O9Jym-00026I-0T
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:24:13 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:09 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:06 +0200
Received: from localhost.localdomain ([87.2.136.88]) by FBCMCL01B07.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 4 May 2010 17:19:06 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 17:19:00 +0200
Message-Id: <1272986341-17094-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1272921755-7414-1-git-send-email-eric@eukrea.com>
References: <1272921755-7414-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 04 May 2010 15:19:06.0167 (UTC)
	FILETIME=[22EA8C70:01CAEB9D]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] compat-wireless: Add latest Linux wireless drivers
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
X-List-Received-Date: Tue, 04 May 2010 15:24:14 -0000

On Mon, 2010-05-03 at 23:22 +0200, Eric Benard wrote:
- provides latest (linux-next) drivers for older kernels
> - ath driver was tested on x86 (on Asus eeetop with Linux 2.6.33)
> - other drivers were only compile tested for x86
> Interesting...
I made a compat-wireless-all,modded the config.mk to make it compile for me but it didn't install.
I've a fix for that,I've attached the patch.

Denis.



