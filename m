Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LOrKJ-0001L1-Tj
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jan 2009 11:25:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 146792C8A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2009 10:18:51 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MmU1+ACbQUY
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2009 10:18:45 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id D6C7F2C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2009 10:18:44 +0000 (UTC)
Message-ID: <49745395.6090907@gmail.com>
Date: Mon, 19 Jan 2009 11:19:01 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gl1i9t$5dv$1@ger.gmane.org>
In-Reply-To: <gl1i9t$5dv$1@ger.gmane.org>
Subject: Re: Online image builder available for angstrom
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
X-List-Received-Date: Mon, 19 Jan 2009 10:25:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> Hi,
> 
> After a few weeks of hacking and testing I am proud to announce the
> online image builder:
> 
> http://amethyst.openembedded.net/~koen/narcissus
> 
> You can select a machine and packages you want and the image builder
> will create a tar.bz2 image using the packages available in the feeds.
> That means you can create an up-to-date image at anytime from anywhere!
> 
> The autobuilder tries to keeps the feeds populated for all machines
> evenly, but some packages aren't in all feeds, e.g. kismet is missing
> from the armv7a feeds since it breaks with gcc 4.3.x. When that happens
> the image builder will display a big red X on the screen next to the
> package that failed to install. It will continue to install the other
> packages you selected so you can still use generated image, but without
> the missing packages.
> 
> If you have suggestions, feedback or bugreports, send a mail to the
> angstrom-devel mailinglist.
> 
> The source is available from:
> 
> http://dominion.thruhere.net/git/?p=narcissus.git;a=summary
> 
> Patches welcome, especially to improve the look & feel

Definitely cool!
Thank you
I am sending my thoughts to angstrom-devel mailinglist.
--
Marco Cavallini


