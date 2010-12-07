Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PPvwD-0005lz-0r
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 12:42:29 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PPvum-0008Vd-9Z by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 12:41:03 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PPvuk-0000cO-VL
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 12:40:58 +0100
Date: Tue, 7 Dec 2010 12:40:58 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101207114058.GI20482@excalibur.local>
References: <4cf4953d.09ab960a.26e7.2e8f@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cf4953d.09ab960a.26e7.2e8f@mx.google.com>
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
Subject: Re: [PATCHv3 3/5] linux-omap-psp-2.6.32:add patch for am3517-crane board support
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
X-List-Received-Date: Tue, 07 Dec 2010 11:42:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-11-30 at 11:39, Anil Kumar wrote:
> 	* Patch Version updated for latest git tree.
> 
>         * This patch adds linux-omap-psp kernel support for am3517-crane board.
> 
>         * CraneBoard is a hardware development platform based
>           on the Sitara AM3517 ARM Cortex - A8 microprocessor
>           device. This is a low cost reference design.
> 
>         * You can find more about CraneBoard here:
>                [1] http://www.ti.com/arm
>                [2] http://www.mistralsolutions.com/products/craneboard.php
> 
> Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>

I only reviewd the OE part, not the kernel patch itself.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


