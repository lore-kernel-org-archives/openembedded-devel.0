Received: from [207.172.157.102] (helo=smtp02.lnh.mail.rcn.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KohVb-0000yE-0h
	for openembedded-devel@openembedded.org; Sat, 11 Oct 2008 18:40:03 +0200
Received: from mr02.lnh.mail.rcn.net ([207.172.157.22])
	by smtp02.lnh.mail.rcn.net with ESMTP; 11 Oct 2008 12:35:11 -0400
Received: from smtp01.lnh.mail.rcn.net (smtp01.lnh.mail.rcn.net [207.172.4.11])
	by mr02.lnh.mail.rcn.net (MOS 3.8.6-GA) with ESMTP id PDJ12079;
	Sat, 11 Oct 2008 12:35:07 -0400 (EDT)
Message-Id: <77ts5u$jn3rjl@smtp01.lnh.mail.rcn.net>
Received: from c-24-91-108-154.hsd1.ma.comcast.net (HELO tmt.rcn.com)
	([24.91.108.154])
	by smtp01.lnh.mail.rcn.net with ESMTP; 11 Oct 2008 12:35:07 -0400
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Sat, 11 Oct 2008 12:35:04 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
Mime-Version: 1.0
X-Junkmail-Whitelist: YES (by domain whitelist at mr02.lnh.mail.rcn.net)
Subject: xserver-kdrive preferred version
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
X-List-Received-Date: Sat, 11 Oct 2008 16:40:04 -0000
Content-Type: text/plain; charset="us-ascii"

I'm having trouble with xrandr on my h1940 and noticed that
the Angstrom preferred version of xserver-kdrive is set to 1.4.0.90.
Is there some reason it's not 1.4.2 to match the latest recipe?
1.2.0 previously worked for me, so I'm fishing for versions while
building from the new metadata...

Thanks for any info.

Tom.



