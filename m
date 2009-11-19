Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NB7bg-0005Fk-4C
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 15:03:35 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NB7aK-0003lo-H7 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 09:02:08 -0500
Date: Thu, 19 Nov 2009 09:02:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B054E1E.80602@balister.org>
Message-ID: <alpine.LFD.2.00.0911190859090.4820@localhost>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
	<alpine.LFD.2.00.0911190818300.16520@localhost>
	<4B054E1E.80602@balister.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 14:03:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Nov 2009, Philip Balister wrote:

> You should be fine with the "mainstream" distros since it is likely
> someone on the list is using it and can help you with any issues
> that crop up. As you can see at the moment, the Fedora users are
> working out a potential issue with F12.

  what philip said.  as near as i can tell, guile-1.8.7 *must* have
once built on f12 since, after all, a binary rpm for it exists for f12
and it's on my system right now.

  but now, you can't build it which suggests that some other package
update must have broken the build.  that is, it built for the official
general release of f12, but no longer builds on an updated system.

  i've got top men working on it.  *top* men.

rday

p.s.  actually, philip, that suggests that a fresh install of f12
*should* work.  once you update, though, all bets are off.  but just
wait until we have a resolution.

--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


