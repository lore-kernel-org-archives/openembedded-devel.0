Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OjcLu-00072M-PC
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 20:18:22 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7D5D4110009C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 20:17:24 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EA3EB110009A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 20:17:22 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225004191.adsl.alicedsl.de
	[92.225.4.191]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 20:17:22 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1E2133C0C0; Thu, 12 Aug 2010 20:17:21 +0200 (CEST)
Date: Thu, 12 Aug 2010 20:17:21 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100812181720.GA2577@rhein.zuhause.netz>
References: <4C641546.7080605@soundmetrics.com>
MIME-Version: 1.0
In-Reply-To: <4C641546.7080605@soundmetrics.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libgles without X11?
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
X-List-Received-Date: Thu, 12 Aug 2010 18:18:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 12, 2010 at 08:37:42AM -0700, John Faith wrote:
> Hi,
> Is there a way to include libgles-omap3 without including X11?  It
> looks like X is needed to build some demos (DEPENDS in
> libgles-omap3.inc), but for my raw/non-X11 image those demos just
> add more build time.

Make your own recipe with X and build of demos disabled.
> 
> Thanks!
> ,
> John

Bye Henning


