Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J1qp2-0006N7-Rk
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 23:09:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBAM5kpp015105;
	Mon, 10 Dec 2007 22:05:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-10-2; Mon, 10 Dec 2007 22:05:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBAM5ThU015054
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 10 Dec 2007 22:05:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <475D0D46.2030303@road.de>
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>
	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
	<1197275254.4804.8.camel@localhost.localdomain>
	<475D0D46.2030303@road.de>
Date: Mon, 10 Dec 2007 13:43:44 +0000
Message-Id: <1197294224.25415.26.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 22:09:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-12-10 at 09:56 +0000, Uli Luckas wrote:
> On Friday, 7. December 2007, Hans Henry von Tresckow wrote:
>  > On Dec 7, 2007 3:38 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>  > I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
>  > patch to filter out the Sharp command line (for poodle at least). Let me
>  > know if that approach makes more sense.
>
> I think I am missing something here. Didn't you (Hans Henry) report my 
> kernel
> patch to work on poodle?
> As I don't have a Sharp, could someone clue me in what problem you guys are
> trying to sove here?

It can work but the changes needed to the kernel to make it work are not
acceptable in my opinion (and likely in mainline's opinion too). I'm
therefore trying to find a way we can add the feature in a way
acceptable to mainline

Regards,

Richard



