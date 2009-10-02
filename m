Received: from [76.96.30.48] (helo=QMTA05.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1MtYMa-0007eo-AF
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 04:59:23 +0200
Received: from OMTA07.emeryville.ca.mail.comcast.net ([76.96.30.59])
	by QMTA05.emeryville.ca.mail.comcast.net with comcast
	id nevS1c0021GXsucA5eybcG; Fri, 02 Oct 2009 02:58:35 +0000
Received: from [192.168.1.101] ([67.188.141.116])
	by OMTA07.emeryville.ca.mail.comcast.net with comcast
	id neya1c00C2WszPn8TeyaTY; Fri, 02 Oct 2009 02:58:35 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Oct 2009 19:58:33 -0700
Message-Id: <1254452313.25385.2.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.48
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Message - %n in writable segment detected
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
X-List-Received-Date: Fri, 02 Oct 2009 02:59:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I get this message in the log.  

NOTE: Running task 40 of 2678 (ID:
1757, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
do_patch)
NOTE: Running task 41 of 2678 (ID:
1758, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
do_configure)
*** %n in writable segment detected ***



Is this something to be concerned about?

Thanks
ed



