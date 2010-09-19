Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OxGwz-0004Jx-Np
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 12:16:50 +0200
Received: from [172.16.252.114] (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 22F8E1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 10:18:22 +0000 (UTC)
Message-ID: <4C95E2DB.7050503@freyther.de>
Date: Sun, 19 Sep 2010 18:15:55 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9301E6.8010901@gmail.com>	<4C94DCA8.10405@freyther.de>
	<AANLkTinZo7zFZOXhivEmt7j=-Gm2J29FaOCfS5SzOo2G@mail.gmail.com>
In-Reply-To: <AANLkTinZo7zFZOXhivEmt7j=-Gm2J29FaOCfS5SzOo2G@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xkbd_0.8.15.bb: Fix geometry flag to accept	negative offsets.
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
X-List-Received-Date: Sun, 19 Sep 2010 10:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/19/2010 09:11 AM, Graham Gower wrote:

> 
> It comes from http://bugs.gentoo.org/214353 - as found in the patch header.


Okay, didn't see it.

> 
> PS: What upstream?

Sorry, I thought it is Xorg... but it has no real upstream anymore.

please feel free to apply.


