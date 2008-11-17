Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L22Vl-0006oV-F5
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 12:43:21 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L22TT-0004pO-4Q by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 12:41:02 +0100
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L22TR-0003mH-TI
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 12:40:58 +0100
Date: Mon, 17 Nov 2008 12:40:57 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081117114057.GA11401@datenfreihafen.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
	<gfpdr0$6vm$1@ger.gmane.org>
	<20081117094617.9a4ad7a9.raster@rasterman.com>
	<gfrbvd$8h9$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gfrbvd$8h9$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Mon, 17 Nov 2008 11:43:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2008-11-17 at 10:02, Koen Kooi wrote:
>
> opkg doesn't install all files from a package on upgrade. I noticed this  
> before, but haven't been able to reproduce this.
>
> So there was indeed a bug in upgrading, but not in e :)

Nice work guys. I already opened the mail, downloaded the logs and was ready to
dive into it. Good that I checked mails once a gain before. :)

We should file a bug about this for opkg I guess. Koen, will you do this?

regards
Stefan Schmidt


