Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NeSur-0000IO-Nh
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 13:40:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o18Cc4bk021584;
	Mon, 8 Feb 2010 12:38:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21427-04; Mon,  8 Feb 2010 12:38:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o18Cbttb021578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Feb 2010 12:37:56 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: C Michael Sundius <msundius@sundius.com>
In-Reply-To: <18e217241002051031l4aac7560vb78618cf63d027be@mail.gmail.com>
References: <18e217241002031259o46bb47f1md0f00da47d055b62@mail.gmail.com>
	<18e217241002051031l4aac7560vb78618cf63d027be@mail.gmail.com>
Date: Mon, 08 Feb 2010 12:37:54 +0000
Message-ID: <1265632674.24683.4.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] [RFC] BB_STAMP_BLACKLIST
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
X-List-Received-Date: Mon, 08 Feb 2010 12:40:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-05 at 10:31 -0800, C Michael Sundius wrote:
> I sent this to the bitbake-dev list but thought that the discussion
> would be useful to others in the wider OE world... 
> 
> Also I'm realizing that maybe I should have called it a Request For
> Comment :]

I like the idea and I think you're not the only person who'll find it
useful. I'll probably merge the patch, I just need to find a few minutes
to check the code out properly :)

Cheers,

Richard



