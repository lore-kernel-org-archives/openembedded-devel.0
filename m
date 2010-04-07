Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NzVJ7-0002nQ-BG
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 15:28:37 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4809C1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 13:30:11 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Apr 2010 14:18:23 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00001-g17459ed; KDE/4.4.2; i686; ; )
References: <4BBC6627.1000407@gmail.com>
In-Reply-To: <4BBC6627.1000407@gmail.com>
MIME-Version: 1.0
Message-Id: <201004071418.24000.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SDK for BeagleBoard development - how do I add linux-omap headers?
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
X-List-Received-Date: Wed, 07 Apr 2010 13:28:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 07 April 2010 13:01:59 Tasslehoff Kjappfot wrote:
> Like the topic says I'm trying to create an SDK to let people develop
> for a BeagleBoard running Angstrom. I have followed the instructions in
> the manual on creating an SDK, and have a basic one compiled.
> 
> I included linux-libc-headers, but found out that it gives me only the
> "vanilla" kernel-headers, while I need the linux-omap-headers with all
> the needed patches. How do I get those into the SDK?


Why do you need these headers?


