Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1R37yT-0005AZ-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 16:59:05 +0200
Received: (qmail 18730 invoked by uid 2404007); 12 Sep 2011 14:53:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 12 Sep 2011 14:53:58 -0000
Message-ID: <4E6E1D06.7000307@juszkiewicz.com.pl>
Date: Mon, 12 Sep 2011 16:53:58 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110906 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.4a1pre
Subject: PC Engines Alix.1c to take
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
X-List-Received-Date: Mon, 12 Sep 2011 14:59:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

Few years ago we got (few) Alix.1c boards as donation from PC Engines
company. One of them served me well, was running misc systems, had few
functions but got replaced by younger, more powerful board.

So - is there a person in EU which will take care of Alix.1c board?

It is powered by AMD GeodeLX cpu (500MHz) with 256MB ram (no way to
expand). Has CompactFlash slot, MiniPCI, normal PCI (3.3V only), ATA44
connector (think hard drive or laptop optical drive), VGA out, 2xRS232,
parallel port and some GPIO lines. Board is powered by 12V power supply
and do not require ATX PSU to run (as PSU is integrated on board).

What in package? Board + pci riser to connect card on left side
(parallel to mainboard).

Cost for volunteer? None - I will pay for sending it by normal mail.
What I would like to see is merging my patch set which dropped alix
machine in favour of geodelx one - never finished testing of it.


