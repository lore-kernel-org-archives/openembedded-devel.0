Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NnTYW-00072T-HN
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 10:10:49 +0100
Received: from p5b0347f9.dip.t-dialin.net ([91.3.71.249] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NnTVh-0000e8-BU by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 10:07:55 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NnTVh-000220-7c
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 10:07:53 +0100
Date: Fri, 5 Mar 2010 10:07:53 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100305090753.GA20686@excalibur.local>
References: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] xilinx-ml507.conf: fix several options
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
X-List-Received-Date: Fri, 05 Mar 2010 09:10:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Where did you base this patchset on?

I tried to applay it on top of your older patches, but it failed:

Applying: xilinx-ml507.conf: fix several options
error: patch failed: conf/machine/xilinx-ml507.conf:30
error: conf/machine/xilinx-ml507.conf: patch does not apply
Patch failed at 0003 xilinx-ml507.conf: fix several options

Applying it without them does of course not work as the machine file does not
exist.

I would really like to get this in sadly I only have today or it has to wait a
week. Mind sending a patchset with all your patches included to get it working
from git HEAD? That would make my life easier over here.

regards
Stefan Schmidt


