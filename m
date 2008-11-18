Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L2T1t-0000bv-Eb
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 17:02:17 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L2SzW-0005g6-GT by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2008 16:59:52 +0100
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L2SzV-0000dK-Ek
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 16:59:49 +0100
Date: Tue, 18 Nov 2008 16:59:49 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081118155949.GA2279@datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: E-Ten Glofiish M800 support
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
X-List-Received-Date: Tue, 18 Nov 2008 16:02:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I just pushed a branch with basic machine and kernel support for the M800 from
E-Ten. Normally Winodws Mobile based device. Linux support is ongoing.

http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=0ea0875a3e5456f701df08e0974821a4e8852f55

As it is just machine, kernel recipe and sane-srcrev it should not break
anything. Still I would like to ask for review before pushing it in.

How does folks feel about it?

regards
Stefan Schmidt


