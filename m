Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1ObqCb-0000Id-Bb
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 09:28:25 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 00CC3110009F;
	Thu, 22 Jul 2010 09:28:09 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 32F3E110009C;
	Thu, 22 Jul 2010 09:28:08 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225074085.adsl.alicedsl.de
	[92.225.74.85]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu, 22 Jul 2010 09:28:08 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DA1BA3C0EF; Thu, 22 Jul 2010 09:27:52 +0200 (CEST)
Date: Thu, 22 Jul 2010 09:27:52 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722072752.GA22156@rhein.zuhause.netz>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
	<1279721232-24744-2-git-send-email-heinold@inf.fu-berlin.de>
	<20100722071839.GA17760@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <20100722071839.GA17760@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: Re: [PATCH 01/21] ant: backport from openembedded-dev
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
X-List-Received-Date: Thu, 22 Jul 2010 07:28:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2010 at 09:18:39AM +0200, Marc Olzheim wrote:
> I may be wrong, but per
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019112.html
> I have always thought that checksums.ini was to be removed and that new
> checksums are to be added to the .bb files.
> 
> Apart from that, nice job on the patchset. ;-)
> 
> Marc

Hi,

please read the cover-letter, this patchset is against oe-stable(stable/2009),
which still has checksum.ini.

Bye Henning


