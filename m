Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KSAqn-00006u-Oo
	for openembedded-devel@openembedded.org; Sun, 10 Aug 2008 15:20:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KSAqP-0007dc-4A
	for openembedded-devel@openembedded.org; Sun, 10 Aug 2008 13:20:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 10 Aug 2008 13:20:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 10 Aug 2008 13:20:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 10 Aug 2008 15:20:15 +0200
Message-ID: <g7mpug$ifp$1@ger.gmane.org>
References: <g7f0tb$n8m$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080100)
In-Reply-To: <g7f0tb$n8m$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: oe.net down
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
X-List-Received-Date: Sun, 10 Aug 2008 13:20:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Hi,
>
> *.oe.net is down, so please use the mirror to get updates and push commits:
>
> * opensource.wolfsonmicro.com
>
> to get updates :
>
> mtn pull opensource.wolfsonmicro.com org.openembedded.dev ; mtn up
>
> to push commits:
>
> mtn sync opensource.wolfsonmicro.com org.openembedded.dev

The git mirror script runs on oe.net, so the git repos aren't getting 
updated at the moment. People that want to get OE via git can pull last 
weeks status from:

git://git.linuxtogo.org/home/angstrom/openembedded.git
git://ewi546.ewi.utwente.nl/git/openembedded.git
git://dominion.thruhere.net/git/openembedded.git

With their respective gitwebs:

http://git.linuxtogo.org/ (once the gitweb config gets updated)
http://ewi546.ewi.utwente.nl/git/
http://dominion.thruhere.net/git/

Linuxtogo and ewi546 are on a 100Mbit link, dominion on an adsl link. 
Those are all read-only mirrors at the moment.

regards,

Koen



