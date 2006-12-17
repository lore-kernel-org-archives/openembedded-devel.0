Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Gw1X1-000405-1s
	for openembedded-devel@openembedded.org; Sun, 17 Dec 2006 20:18:43 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Gw1Uw-00027z-1W
	for openembedded-devel@openembedded.org; Sun, 17 Dec 2006 20:16:34 +0100
Received: from r76c6.r.ppp-pool.de ([89.54.118.198])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 Dec 2006 20:16:34 +0100
Received: from no2spam by r76c6.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 Dec 2006 20:16:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 17 Dec 2006 20:16:20 +0100
Message-ID: <em4528$huv$1@sea.gmane.org>
References: <E1GvaCY-0007Dp-Ur@linuxtogo.org>
	<1714613746.20061216152106@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r76c6.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.8 (X11/20061117)
In-Reply-To: <1714613746.20061216152106@vanille-media.de>
Sender: news <news@sea.gmane.org>
Subject: Re: [oe-commits] org.oe.dev autoconf: unify recipes
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
X-List-Received-Date: Sun, 17 Dec 2006 19:18:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Laibsch commit wrote:
>> [...] unify recipes
> 
> Thanks for the cleanup!

I made a list of recipes for inspection at
http://bugs.openembedded.org/show_bug.cgi?id=1688 which I intend to go
through from A to Z.  If anybody feels like participating...

Today's patches are up for review at 
http://oz.leggewie.org/btsco.unify.patch and 
http://oz.leggewie.org/busybox.unify.patch

Blueprobe was rather straightforward so I committed straight away.



