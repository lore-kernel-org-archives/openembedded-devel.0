Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NiDJo-0001Mb-Hv
	for openembedded-devel@openembedded.org; Thu, 18 Feb 2010 21:49:55 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:07 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:07 +0100
Received: from localhost.localdomain ([80.117.36.203]) by
	FBCMCL01B09.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:06 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2010 21:45:45 +0100
Message-Id: <1266525946-8354-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <E1Ngbii-0008Ch-On@melo.openembedded.org>
References: <E1Ngbii-0008Ch-On@melo.openembedded.org>
X-OriginalArrivalTime: 18 Feb 2010 20:46:06.0404 (UTC)
	FILETIME=[6481E040:01CAB0DB]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : gnome-doc-utils: skip generation of docs to avoid weird python error
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
X-List-Received-Date: Thu, 18 Feb 2010 20:49:55 -0000


Hi,
Was your issue related to python not finding libxml2.py?
If so does this patch fixes better your issue?
I had it in queue and didn't push it yet because I wasn't exactly
 shure on why it fixed it(see commit message for better explanations).

Denis.




