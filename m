Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NpLtm-0004ZN-8Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 14:24:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 18EE72C7E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 13:16:52 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhSC9vrVZSFH
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 13:16:48 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 92BF52C7DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 13:16:47 +0000 (UTC)
Message-ID: <4B979CD6.2000505@gmail.com>
Date: Wed, 10 Mar 2010 14:21:26 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <536913655.6343051268191558593.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
	<4B978B57.8050406@koansoftware.com>
In-Reply-To: <4B978B57.8050406@koansoftware.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake failure after git pull
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
X-List-Received-Date: Wed, 10 Mar 2010 13:24:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Leo ha scritto, Il 10/03/2010 13:06:
> Il 03/10/2010 04:25 AM, John Buckley ha scritto:
>> NameError: global name 'os' is not defined 
>> jgb@jgb-desktop:~/overo-oe/user.collection/recipes/vidplayr2$ 
> 
> 
> Somewhere missing (maybe in bitbake config file): import os
> Read this: http://forums.xkcd.com/viewtopic.php?f=20&t=50227
> I hope can be useful! :D
> 
>       bye bye    .hachreak.

hmmm... that shouldn't happen after a git pull.
May well be something different, like old python version.




