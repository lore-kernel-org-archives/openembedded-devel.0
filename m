Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GKDzC-00043u-LS for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 14:55:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id F2A9E8BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 14:52:55 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 23376-06 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 14:52:52 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 81FBB8B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 14:52:52 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0609040028l59aa15cfrebcf105c6eb250c8@mail.gmail.com>
References: <432beae0609040028l59aa15cfrebcf105c6eb250c8@mail.gmail.com>
Organization: VanilleMedia
Date: Mon, 04 Sep 2006 14:52:52 +0200
Message-Id: <1157374372.16945.64.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: bitbake freeze
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 12:55:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 04.09.2006, 00:28 -0700 schrieb Justin Patrin:
> I just remembered the old "freeze" command that John Bowler wrote a
> while ago and tried to use it. Unfortunately it doesn't seem to work
> with the current OE.

[...]

> I realize the shell isn't really the right place for this and that
> this might be nicer in a bb file somewhere but this is how I could get
> it working.

The shell is _exactly_ the right place for it -- since the command line
parsing
went so fast, we need to come up with new use cases ;)

> Let me know what you think and any suggestions for making the code better.

I'm not familiar with the old freeze command (or I forgot it...), can
you summarize
what you want to achieve?

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




