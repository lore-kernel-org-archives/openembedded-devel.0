Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8DVW-0004XW-Go
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 15:12:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8DNt-0003u5-9U
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 13:05:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 13:05:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 13:05:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 May 2009 15:04:50 +0200
Message-ID: <gvbgli$1iu$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>	<1243095832.4226.105.camel@lenovo.internal.reciva.com>	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>	<gvb066$tov$1@ger.gmane.org>	<1243157020.4226.124.camel@lenovo.internal.reciva.com>	<gvbbh9$m3s$1@ger.gmane.org>
	<1243168060.4226.161.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <1243168060.4226.161.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 13:12:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-05-09 14:27, Phil Blundell wrote:

> It seems fairly clear that, as the originator of the patch in question,
> the onus is on you to minimise any resulting damage to other users.

I'm gradually fixing kernel as I encounter them, but since I don't have 
access to all hardware present in OE, or computing power to test all 
toolchain permutations needed to build all kernels (e.g. kernels 
requiring gcc 2.93.3), I am currently limiting that effort to kernel I 
can actually test.
Furthermore, only kernel actually used by machines present in OE can get 
fixed, we have a number of kernels that have recipes, but no machines 
using them.

regards,

Koen



