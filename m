Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM2g5-0003yg-Un
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 18:28:58 +0200
Received: (qmail 22426 invoked by uid 813007); 1 Jul 2009 16:17:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 16:17:02 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Jul 2009 18:17:01 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: QEMU and OLDEST_KERNEL related changes
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
X-List-Received-Date: Wed, 01 Jul 2009 16:28:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I know that it takes more time then it should but I had other things to 
do too.

This patchset updates QEMU to 0.10.3, adds misc versions of gcc3 for 
those who use QEMU 0.9.x and adds OLDEST_KERNEL thing to get binary 
locales working.

I also enable binary locales for armv6/7 in Angstrom with this set.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




