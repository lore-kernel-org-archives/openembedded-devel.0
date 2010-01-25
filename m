Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZQ5K-0005E4-3O
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 15:38:37 +0100
Received: from cpe00e0b8e80755-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.244.198] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZQ34-000250-LJ for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:36:14 -0500
Date: Mon, 25 Jan 2010 09:35:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
In-Reply-To: <BAY127-W22F0F525D60D5F6AD43D37D85F0@phx.gbl>
Message-ID: <alpine.LFD.2.00.1001250935080.2587@localhost>
References: <BAY127-W22F0F525D60D5F6AD43D37D85F0@phx.gbl>
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
Subject: Re: Erorr in bitbaking console-image
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
X-List-Received-Date: Mon, 25 Jan 2010 14:38:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 25 Jan 2010, saleh usman wrote:

>
> Hi I am building console-image but I am getting error while ding this.Terminal window  is looking like below.
>
> [saleh@localhost ~]$ export PATH=/oe/bitbake/bin:$PATH
> [saleh@localhost ~]$ export BBPATH=/oe/build:/oe/openembedded:/oe/ossie_collection
> [saleh@localhost ~]$ bitbake console-iamge
> NOTE: Handling BitBake files: | (7648/7648) [100 %]
> NOTE: Parsing finished. 7041 cached, 300 parsed, 307 skipped, 0 masked.
> ERROR: Nothing PROVIDES 'console-iamge'
                                   ^^^^^

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


