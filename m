Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LlTDl-0001sJ-6q
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 20:20:33 +0100
Received: (qmail 2611 invoked by uid 813007); 22 Mar 2009 19:19:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2009 19:19:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 20:19:02 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <20090321211351.BAC5718934F@amethyst.openembedded.net>
In-Reply-To: <20090321211351.BAC5718934F@amethyst.openembedded.net>
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200903222019.02947.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Chris Larson : base.bbclass:
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
X-List-Received-Date: Sun, 22 Mar 2009 19:20:33 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Why those changes were not sent for review to ML? They touched core of 
system so should be sent first. Especially when they broke many recipes 
and added extra work for other developers.

Now we can not use wildcards in SRC_URI which broke many recipes 
(alsa-state for example) which is totally wrong. I hope that fix for it 
is on a way - otherwise I would vote for reverting those changes.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




