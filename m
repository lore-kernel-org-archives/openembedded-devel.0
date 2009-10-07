Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MvXYX-0006uU-3F
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 16:31:56 +0200
Received: (qmail 30650 invoked by uid 813007); 7 Oct 2009 14:31:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Oct 2009 14:31:05 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Oct 2009 16:31:04 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.1; x86_64; ;
	)
References: <1254925696-8813-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1254925696-8813-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200910071631.05318.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] xserver-common: added 1.30 + patches
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
X-List-Received-Date: Wed, 07 Oct 2009 14:31:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit


We have 1.31 and 1.32 in metadata but they are just 1.30 + some subset of 
patches. The version in this patch has one thing more then 1.32 (place of 
xmodmaps).

This is not used by default but I need it on some devices where I run 
stable/2009 branch.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




