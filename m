Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H0QjW-0003pV-Ve
	for openembedded-devel@openembedded.org; Sat, 30 Dec 2006 00:01:51 +0100
Received: (qmail 17463 invoked by uid 813007); 29 Dec 2006 23:01:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.100?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 29 Dec 2006 23:01:08 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Dec 2006 00:01:09 +0100
User-Agent: KMail/1.9.5
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200612300001.09642.openembedded@hrw.one.pl>
Subject: [REMOVAL] devkitidp-pxa255 machine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Dec 2006 23:01:51 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During last week one of my build machines is working on building Angstrom 
bootstrap-image for ALL target devices (all in OE). There are many 
problems with build but as I use Tinderbox (thx goes to Zecke for 
maintaining it) everyone can look how build is progressing:

http://ewi546.ewi.utwente.nl/tinderbox/showbuilds.pl?tree=Angstrom

One of serious problems is 'devkitidp-pxa255' machine. It use own kernel 
patches and own patches to u-boot - both are unfetchable. If someone 
maintain this MACHINE then please submit fixes/patches. 

I will add this machine into removal queue in January 2007 if no one will 
bother with fixing it.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 Don't panic. Count to ten ... then panic!




