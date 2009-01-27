Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LRmDd-0000kQ-6H
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 12:35:01 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LRm6E-00040I-Fl by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 12:27:29 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LRm6K-0003z2-WE
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 12:27:29 +0100
Date: Tue, 27 Jan 2009 12:27:28 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090127112728.GA14725@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Fix for angstrom.inc
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
X-List-Received-Date: Tue, 27 Jan 2009 11:35:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

As there have been problems before if people touch core angstrom files here is a
fix that may be interesting to apply.
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=fso/milestone5&id=6d3445928a08ee36950e91274bbe282022c4da1a

The recipes for the openmoko kernel got renamed and the match for OABI compat
must changed accorndingly.

(Sidenote: Other stuff in this release branch will come back once we have it out.
The fastboot patches revert will bring some discussion I guess. :))

regards
Stefan Schmidt


