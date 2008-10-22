Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KseQd-00017J-Qa
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 16:11:15 +0200
Received: from p5b0375ed.dip.t-dialin.net ([91.3.117.237]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KseQA-0003BW-HX by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 16:10:49 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1KseQL-00030h-NX
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 16:10:57 +0200
Date: Wed, 22 Oct 2008 16:10:57 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Some review for the stefan/xo-support branch
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
X-List-Received-Date: Wed, 22 Oct 2008 14:11:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I just pushed a branch which adds a machine file for the XO, aka OLPC, laptop
and a kernel recipe for it.

This allows me to build images for the xo machine in Angstrom.

I don't see how these commits could break anything, but as it is my first
machine I would like to get some review/acks before pushing it into the main
tree.

Only three commits:
http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=f5fbcf7e4e0228e10fa2c29f802ea0eaabf7a202
http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=eff435600359d5f13d846be1480de73e8837133d
http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=ed58062633bdba98098044e94ffce9207300e4be

regards
Stefan Schmidt


