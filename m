Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1MUpHy-0008AA-84
	for openembedded-devel@openembedded.org; Sun, 26 Jul 2009 00:00:22 +0200
Received: from [64.208.221.2] (helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MUp3v-0005Bi-BH
	for openembedded-devel@openembedded.org; Sat, 25 Jul 2009 17:45:51 -0400
Date: Sat, 25 Jul 2009 17:43:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <200907251651.19932.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0907251719260.3720@localhost>
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<200907251452.41374.holger+oe@freyther.de>
	<alpine.LFD.2.00.0907250858080.9674@localhost>
	<200907251651.19932.holger+oe@freyther.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 22:00:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 25 Jul 2009, Holger Hans Peter Freyther wrote:

> On Saturday 25 July 2009 15:01:20 Robert P. J. Day wrote:
>
> >   for consistency, either bitbake should be included in an OE
> > checkout, or it shouldn't.  it shouldn't depend on which branch
> > you're working with.  that way lies confusion.
>
> In which way do you see breakage? bin/bitbake is gone when you
> switch from stable to dev? So you executed the host bitbake (which
> you said was bitbake 1.8.10). What error happened?

  it was temporary breakage since, when i switched to the dev branch,
the invocation of bitbake reverted to the fedora-installed package,
which was 1.8.10, which was rejected as being too old for the dev
branch.  it just took a few seconds to realize what had happened.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================


