Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Jxqw8-0003Ch-5W
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 May 2008 00:01:01 +0200
Received: from andromeda (e180151064.adsl.alicedsl.de [85.180.151.64])
	by drlauer-research.com (Postfix) with ESMTP id 36FE3584C3A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 May 2008 23:59:07 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 May 2008 23:58:50 +0200
User-Agent: KMail/1.9.9
References: <20080516214710.GA21911@rhein.zuhause.netz>
In-Reply-To: <20080516214710.GA21911@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <200805182358.50192.mickey@vanille-media.de>
Subject: Re: MIPS machine.confs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 22:01:06 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 16 May 2008 23:47:10 Henning Heinold wrote:
> there are serval .conf under machine/ (rb500.conf,wrt54,wl500g.conf)
> which using TARGET_CC_ARCH = "-Os". I suggest this should be not set
> there, becaue it's a distribution-thingie. If no one minds I will clean it
> up.

Not at all, thanks a lot! We need to find more MIPS people.

Cheers,

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


