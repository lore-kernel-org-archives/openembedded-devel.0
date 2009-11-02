Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4t9v-00013U-2B
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 10:25:10 +0100
Received: (qmail 11782 invoked by uid 813007); 2 Nov 2009 09:23:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Nov 2009 09:23:58 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 10:27:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <1257106657-22380-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1257106657-22380-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200911021027.18094.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] uclibc-initial_0.9.30(.1).bb: Fix do_stage for ubuntu karmic
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
X-List-Received-Date: Mon, 02 Nov 2009 09:25:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


Just FYI: with this patch my Debian 'sid' machine built uclibc for avr32, 
armv5te, armv7a, i586, 486sx architectures.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




