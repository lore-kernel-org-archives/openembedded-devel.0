Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <u.luckas@road.de>) id 1J1fRA-0000Kz-3N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 11:00:34 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id AF5C7390001;
	Mon, 10 Dec 2007 10:56:23 +0100 (CET)
Received: from [192.168.116.44] (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id CF594AD400B;
	Mon, 10 Dec 2007 10:56:22 +0100 (CET)
Message-ID: <475D0D46.2030303@road.de>
Date: Mon, 10 Dec 2007 09:56:22 +0000
From: Uli Luckas <u.luckas@road.de>
User-Agent: Mozilla-Thunderbird 2.0.0.4 (X11/20070828)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200711121044.32094.u.luckas@road.de>	<200711121102.51877.u.luckas@road.de>	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
	<1197275254.4804.8.camel@localhost.localdomain>
In-Reply-To: <1197275254.4804.8.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 10 Dec 2007 10:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On Friday, 7. December 2007, Hans Henry von Tresckow wrote:
 > On Dec 7, 2007 3:38 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
 > > On Fri, 2007-12-07 at 11:06 +0000, Uli Luckas wrote:
 > > > Hans Henry, thanks for testing. Good to know it worked for you. Let's
 > > > see how we can get this thing pushed upstream.
 > > >
 > > > 1) I put this on the OE list as the original code is maintained 
in OE.
 > >
 > > And
 > >
 > > > that's why I'd like the code to be pushed to the OE repository first.
 > > > I am not really an OE developer though. Is someone willing to do 
the OE
 > > > integration to give my patch a home?
 > >
 > > I'm happy for the userspace side of things to be added in OE. I have
 > > some reservations about the way the kernel patch is added to the zaurus
 > > code, particularly about the way the kernel commandline is handled 
from
 > > the broken bootloader and I need to find some time to look at that. I'm
 > > fine with the patch in principle though, I just want it right when its
 > > added (and preferably upstream too, the existing zaurus changes 
will not
 > > be accepted upstream).
 > >
 > > > 2) I need to push the kernel patch via Russell. Mike, I have not 
heard
 > > your opinion. Will you support this patch?
 > > >
 > > > 3) I need to push my userspace work. My work is based on code by
 > > > Richard though. Richard, please jump in and let us know how you'd 
like
 > > > to
 > >
 > > proceede?
 > >
 > > I did try and find the kexec-tools maintainer but got distracted and
 > > never got back to it. Does anyone know who we need to send this to? I
 > > will try and get that done this weekend...
 > >
 > > > I'd really like to see kexec working on arm without any patches soon.
 > >
 > > Agreed. I'm sorry I haven't found time to look at this yet, I will try
 > > hard to do so this weekend.
 > >
 > > Regards,
 > >
 > > Richard
 > >
 > >
 > >
 > > Richard,
 >
 > I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
 > patch to filter out the Sharp command line (for poodle at least). Let me
 > know if that approach makes more sense.
 >
I think I am missing something here. Didn't you (Hans Henry) report my 
kernel
patch to work on poodle?
As I don't have a Sharp, could someone clue me in what problem you guys are
trying to sove here?

 > http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace kexec
 > patch.
 >
Thanks for forwarding the patch to the right channel.

Regards,
Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit



