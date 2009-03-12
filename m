Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lhmv0-0007ED-LT
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 16:33:59 +0100
Received: (qmail 28423 invoked by uid 813007); 12 Mar 2009 15:33:44 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Mar 2009 15:33:44 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2009 16:33:40 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.1; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200903121633.44051.marcin@juszkiewicz.com.pl>
Subject: Benchmarks on our devices
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
X-List-Received-Date: Thu, 12 Mar 2009 15:34:01 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

Some time ago I wrote post about Vortex86sx device [1] and its speed. In 
it I compared results of 'hdparm -T /dev/sda' on misc devices. But many 
people thought that it touches storage controller (which it does not in 
this test) I decided to run better set of benchmarks on embedded 
devices.

The question which I want to ask is: Which benchmark tools would people 
like to see in such comparison? And which devices to compare?

I can do tests on: 

- AT91SAM9263-EK devboard (at91sam9263 180MHz)
- BUG (i.mx31/533Mhz)
- Openmoko Neo1973 (s3c2410/200MHz and /266MHz)
- Nokia N810 (omap2420/400MHz)
- Nokia 770 (omap1510)
- Zaurus c760 (pxa255/400MHz)
- Linksys WRT54GS (mipsel/216MHz)

I want tests to cover speed of CPU, FPU, memory, SD/CF/ATA/USB storage 
(if available) - maybe also Ethernet speed.

1. http://marcin.juszkiewicz.com.pl/2009/02/20/does-vortex86sx-based-
devices-are-worth-something/

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




