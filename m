Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HSGSy-0005XM-5c
	for openembedded-devel@openembedded.org; Fri, 16 Mar 2007 18:43:48 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HSGSk-0003cK-2h
	for openembedded-devel@openembedded.org; Fri, 16 Mar 2007 18:43:34 +0100
Received: from f73d8.f.ppp-pool.de ([195.4.115.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 Mar 2007 18:43:34 +0100
Received: from no2spam by f73d8.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 16 Mar 2007 18:43:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 16 Mar 2007 19:43:05 +0100
Message-ID: <etekva$3ph$1@sea.gmane.org>
References: <etecci$200$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73d8.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <etecci$200$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: Re: RFC after the fact - bug 1987
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
X-List-Received-Date: Fri, 16 Mar 2007 17:43:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Now, to sort things out;

Despite some very kind help from XorA, it did not become clear where 
exactly the problem was coming from.  Thus, I reverted all changes I 
made to packages/glibc/ in the last few days, including the unifcation 
stuff.  My intention is to put this back in after a few more tests.

Here are the changes in the order I had applied them
http://oz.leggewie.org/wip/2c516898480b1bc053c9cbf6da853a016059c4c6.patch
http://oz.leggewie.org/wip/286930242424d10b2503eb290dbc31c7975bab74.patch
http://oz.leggewie.org/wip/a96c9acac99b5599d2b0fb0a518603646414d166.patch



