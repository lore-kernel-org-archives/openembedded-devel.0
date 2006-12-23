Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Gy5Nu-0001k2-GO
	for openembedded-devel@openembedded.org; Sat, 23 Dec 2006 12:49:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Gy5Nl-0005dx-5d
	for openembedded-devel@openembedded.org; Sat, 23 Dec 2006 12:49:41 +0100
Received: from r77a6.r.ppp-pool.de ([89.54.119.166])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 23 Dec 2006 12:49:41 +0100
Received: from no2spam by r77a6.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 23 Dec 2006 12:49:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 23 Dec 2006 12:49:28 +0100
Message-ID: <emj54a$b6s$1@sea.gmane.org>
References: <BAY102-W7D12C0528A63863A6E8F3D6E40@phx.gbl>	<456EA72F.1060507@sun.com>	<456EBA6B.90501@dominion.kabel.utwente.nl>	<456F10F2.5060807@sun.com>
	<458BF100.1090602@dominion.kabel.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r77a6.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.8 (X11/20061115)
In-Reply-To: <458BF100.1090602@dominion.kabel.utwente.nl>
Sender: news <news@sea.gmane.org>
Subject: Re: Initial attempt to get cdc to build in OE
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
X-List-Received-Date: Sat, 23 Dec 2006 11:49:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> I was getting very annoyed with all the people complaining "OMG! we need java!!!!! LOL", 
> but doing absolutely nothing to help getting java into OE (and hence making it available 
> to the neo1973). So I decided to actually do something:
> 
> http://www.openembedded.org/~koen/java/
> 
> It errors out somewhere in do_compile, probably because kaffeh isn't sun j2se (on my build 
> machine).

I tried unsuccessfully to get kaffe compiled on OE.  I doubt it will be 
much help, but what I have done is available in bug 410.



