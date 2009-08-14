Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mbwkf-0000NG-R2 for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 15:23:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbwUY-0000xa-Hu for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 13:06:46 +0000
Received: from p5b3b193c.dip.t-dialin.net ([91.59.25.60])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 13:06:46 +0000
Received: from no2spam by p5b3b193c.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 13:06:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 14 Aug 2009 15:06:31 +0200
Message-ID: <h63ngq$s80$1@ger.gmane.org>
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
	<4A84B3E7.4070602@tait.co.nz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b193c.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.22 (X11/20090804)
In-Reply-To: <4A84B3E7.4070602@tait.co.nz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Fri, 14 Aug 2009 13:23:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Douglas Royds wrote:
> FWIW, Ubuntu Hardy LTS 8.04 is on GCC 4.2.3:
> 
>     http://packages.ubuntu.com/search?keywords=gcc
> 
> Hardy LTS is the "Long-Term Support" version of Ubuntu, that they 
> support for 2 years. It will be replaced in April 2010, which isn't 
> tooooo far away.

Hardy is my main build machine.  I hope OE will continue to work with it.

Hardy will be EOL'd on the desktop in April 2011.  Support for the
console/server version will run another two years after that.

https://wiki.ubuntu.com/Releases



