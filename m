Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PDvBl-0001yx-4H
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 09:28:59 +0100
Received: from [134.169.35.223] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PDvAt-0008EN-JX by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 09:28:02 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PDvAt-0006TO-4t
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 09:27:59 +0100
Date: Thu, 4 Nov 2010 09:27:59 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101104082759.GG19934@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Patchwork cleanup weekend in two days
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
X-List-Received-Date: Thu, 04 Nov 2010 08:29:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Its time for some house-keeping again. I know many people are working on
patchwork on-going, thanks for that.

Looking throught it during OEDEM did still show up way to many entries. Some are
still from 2009. Next Saturday and Sunday I would like to reduce our  current
count from 273 patches. 100 or less would be a nice goal imho.

Steps to help out:
1) make sure you have a patchwork account and are added to the admin group to
   change patches
2) Hang out on IRC on saturday and sunday
3) Go through the patchwork and find all patches from yourself and up date them
   with a current status. e.g. mark them as superseeded if you send a new version
   or applied if they hit the tree.
4) After your own patches pick other ones and try to find out about their
   current staus. Usually git log, the ml or asking people on IRC helps here to
   find out stuff about the patch.

If you cleaned up more then 10 patches a day you are allowed to drink a beer in
the evening. ;)

regards
Stefan Schmidt


