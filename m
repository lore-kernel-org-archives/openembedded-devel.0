Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NrBUV-0000Ri-Vc
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:42:33 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2B6281B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 14:41:54 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 15:38:10 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<4B9E3BE8.1070800@mwester.net>
In-Reply-To: <4B9E3BE8.1070800@mwester.net>
MIME-Version: 1.0
Message-Id: <201003151538.10288.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 14:42:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 14:53:44 Mike Westerhof wrote:

Dear Mike,

> Sigh.
> 
> I really don't think this recipe is worthy of this much controversy.
> It's essential (hence the name) for certain very small NAS devices.
> 
> I fail to see how its presence is impacting others -- if you don't like
> it, don't use it.  Simple.

See. This is not the point of liking or not liking a given recipe. I don't 
like the fact that this recipe is not maintained for years and has the 
possibility of damaging the reputation of distros built with OE. I assume
even users of SlugOS do not like if their device gets owned via known and 
circulating exploits?

It would be nice if we could establish a shared responsibility for maintaining 
software that listens on network ports and is handling multimedia content (the 
two kind of things most likely to be suffering flaws). I don't think it is that 
difficult. If there is a remote hole and exploits are floating around, upgrade 
the recipe?

anyway, you don't have the time..




 


