Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OdIPB-0005FB-FC
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:47:37 +0200
Received: from test3.ibr.cs.tu-bs.de ([134.169.35.210] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OdIOg-0001QU-2l by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:46:52 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OdIOa-0007Zk-1o
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:46:44 +0200
Date: Mon, 26 Jul 2010 09:46:43 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100726074643.GC27921@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1279651497-20918-4-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1279651497-20918-4-git-send-email-morphis@gravedo.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] lvm2.inc: add machine specific configuration file
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
X-List-Received-Date: Mon, 26 Jul 2010 07:47:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 2010-07-20 at 20:44, Simon Busch wrote:
> For some machines we need a specific lvm configuration to detect the captable devices
> which can contain a lvm volume.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>


