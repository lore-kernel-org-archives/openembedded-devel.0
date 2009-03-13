Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Li8wX-0007ct-Hm
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 16:05:02 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGG00I6J9V7WQG5@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 10:04:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C309B6B83B5; Fri,
	13 Mar 2009 11:04:18 -0400 (EDT)
Date: Fri, 13 Mar 2009 11:04:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090313150418.GB26373@denix.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF730@hiob.intern.dresearch.de>
	<013a01c9a3e7$1a432270$5e3018ac@Glamdring>
MIME-version: 1.0
In-reply-to: <013a01c9a3e7$1a432270$5e3018ac@Glamdring>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 15:05:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 13, 2009 at 03:19:17PM +0100, Ulf Samuelsson wrote:
>
>>> A while back you mentioned a program that displayed the per core CPU 
>>> utilization. What was it again?
>> Try htop.
>
> On OpenSuSE you just right click on the bottom bar, and add the CPU 
> Frequency meter. I added it 8 times, and configured
> for each Virtual CPU in the Core i7.

You are probably talking about some sort of window manager or desktop 
environment for X Window - luckily we are talking about Linux and it can mean 
pretty much any of the available ones. So, saying things like "right click on 
the bar and add something" w/o specifying your environment doesn't mean much...

> It does not give you utilization, only frequency.
> When not used, it is humming along quietly at 1.6 GHz,
> and when used, then it ups the frequency to 2.67 GHz,

I doubt it is the only meter available in your environment. CPU 
load/utilization is very common and is available on pretty much any WM/DE.

-- 
Denys


