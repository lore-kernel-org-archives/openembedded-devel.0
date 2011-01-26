Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pi2Xe-0003Jx-Fv
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:23:59 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pi2Wt-0000Wi-GR by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 11:23:13 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pi2Wr-0000Hg-G6
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:23:09 +0100
Date: Wed, 26 Jan 2011 11:23:08 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20110126102308.GA29416@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Wed, 26 Jan 2011 10:23:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

During last OEDEM we set out a timeline for quarterly releases. The first one
hit on time in december 2010 (Thanks Khem).

The next one would be scheduled for 2011-03. As our plans towards oe-core are
getting into shape I wonder if and how these both are going to conflict.

Will we go ahead and make the 2011-03 release, maybe the last one before moving
over to oe-core? Personally I don't think these two block each other. Syncing
would be needed, but people will keep working on the OE repo for a bit longer
anyway I would think.

If we are going to scratch the release what would be the next target for it?
Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
for this in time, including yocto movs to it and we base the rest of OE on top
of it. Am I wrong here and that is the actual plan?

regards
Stefan Schmidt


