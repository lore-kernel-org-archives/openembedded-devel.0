Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1H4GX4-0006ZR-Bv
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 13:56:50 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1H4GVK-0008DM-4w
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 13:55:02 +0100
Received: from r76b2.r.ppp-pool.de ([89.54.118.178])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jan 2007 13:55:02 +0100
Received: from no2spam by r76b2.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jan 2007 13:55:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 09 Jan 2007 13:54:11 +0100
Message-ID: <eo039k$pe7$1@sea.gmane.org>
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>	<20061230235938.GC16490@hezmatt.org>	<1167523571.5626.59.camel@localhost.localdomain>	<459786C7.70000@dominion.kabel.utwente.nl>	<1168200264.15021.54.camel@ip6-localhost>	<1662139633.20070107231632@gmail.com>	<20070107220333.GC6625@hezmatt.org>
	<ens65m$i2b$1@sea.gmane.org>
	<1168279741.4526.12.camel@ip6-localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r76b2.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
In-Reply-To: <1168279741.4526.12.camel@ip6-localhost>
Sender: news <news@sea.gmane.org>
Subject: Re: A question of workflow
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
X-List-Received-Date: Tue, 09 Jan 2007 12:56:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Patrick Ohly wrote:
>       * you have to keep track of which patches have been applied, and
>         you cannot let tools do it for you

Did you mean you wanted to know which of your patches have been applied 
in OE?  That one is also easy.  They are the ones that quilt cannot 
apply anymore when doing "quilt push -a" ;-)



