Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I81SI-00009f-2S
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 00:11:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I81Mr-0001Wv-2k
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 00:06:05 +0200
Received: from p54b972b0.dip.t-dialin.net ([84.185.114.176])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 00:06:05 +0200
Received: from no2spam by p54b972b0.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 00:06:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 10 Jul 2007 00:05:52 +0200
Message-ID: <f6ubg3$97c$1@sea.gmane.org>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>	<126613333.20070709215755@vanille-media.de>
	<f6u4pj$fk0$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: p54b972b0.dip.t-dialin.net
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
In-Reply-To: <f6u4pj$fk0$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: Re: dbg packages
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
X-List-Received-Date: Mon, 09 Jul 2007 22:11:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Packaging is tedious, but let's not automate doing the wrong thing ;)

I certainly agree with the general statement.  But I wonder if in this
case it would not be OK to have just one big -dbg package per bb file
even if there are more subpackages.  Going granular is certainly nice
but I wonder if just having a dbg package suffices even if contains more
than necessary.  I guess the -dbg packages should not be necessary most
of the time.

My vote would go for "bigger size" if it means "easier packaging right
now instead of later" unless that entails "something breaks".



