Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MwBOv-0004EA-02
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 11:04:40 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id EC9671B10C05;
	Fri,  9 Oct 2009 09:11:48 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 9 Oct 2009 11:03:37 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.32-rc2; KDE/4.3.1; i686; ; )
References: <1255043385-5606-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1255043385-5606-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200910091103.37284.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf: Decosmetize TARGET_OS
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
X-List-Received-Date: Fri, 09 Oct 2009 09:04:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 09 October 2009 01:09:45 Khem Raj wrote:
> * This patch reverts the cosmetic change which used linux-gnu instead of
>  linux
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Holger Freyther <zecke@selfish.org>

This makes bitbake meta-toolchain-qte at least start to compile again. Once 
you put your changes in a branch I can do test builds and fixes for MIPS.

regards
	holger


