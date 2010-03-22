Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ntm9W-0006OE-RA
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 19:15:08 +0100
Received: from p5b037b4e.dip.t-dialin.net ([91.3.123.78] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ntm6J-0003YC-O4 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 19:11:57 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Ntm6J-0005bF-3F
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 19:11:43 +0100
Date: Mon, 22 Mar 2010 19:11:43 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100322181143.GB19274@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1269278693-2935-1-git-send-email-aalonso00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1269278693-2935-1-git-send-email-aalonso00@gmail.com>
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
Subject: Re: [PATCH v2] u-boot_git.bb: add xilinx ml507 support
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
X-List-Received-Date: Mon, 22 Mar 2010 18:15:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-03-22 at 11:24, Adrian Alonso wrote:
> * Based on xilinx official repos
> * If a hardware project dir is set in local.conf XILINX_BSP_PATH
> * it will over write xparameters header and append some canonical
> * definitions. It also install u-boot elf executable for bare metal
> * execution, early development stages.
> 
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>

Applied and pushed out.

regards
Stefan Schmidt


