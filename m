Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jtjp2-0003uP-Gg
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 15:36:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JtjoV-0004pz-0s
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 13:36:07 +0000
Received: from wlan137219.mobiel.utwente.nl ([130.89.137.219])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 13:36:07 +0000
Received: from k.kooi by wlan137219.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 13:36:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 07 May 2008 15:35:56 +0200
Message-ID: <fvsb7t$nk1$1@ger.gmane.org>
References: <fvpr9t$4vh$1@ger.gmane.org>	<fvq5c7$alo$1@ger.gmane.org>	<fvrtn6$93p$1@ger.gmane.org>	<fvs0bo$h8r$1@ger.gmane.org>
	<fvs8g9$de9$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan137219.mobiel.utwente.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008040803)
In-Reply-To: <fvs8g9$de9$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 13:36:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Hello Koen,
>
> thank you for the answer.
>
> Koen Kooi wrote:
>> That isn't a problem right now, since a patch requires review and
>> approval on the stable-branch *mailinglist*.
>
> Well, I guess it was clear this whole thing is about the possibility of
> circumventing that medium

Sorry, that wasn't clear to me, it took me a while to realise that 'bp' 
means 'backport'. I thought you where cataloging bugs for Angstrom 
developers to review, which I think is very cool. The thing is that "OE 
stable branch patch process" is different from "Angstrom patch process", 
even if it involves largely the same people. Ideally angstrom developers 
review a patch and post a "ready to commit" one for review on the stable 
branch mailinglist.
If you don't use angstrom, or even no distro at all, you post your 
(hopefully "ready to commit") patch to the stablebranch mailinglist.
The main point is that your patch applies cleanly and has been tested 
before you post it (unless it's an RFC).

> Let me ask a blunt question: Is there really any activity on the stable
> branch?

There hasn't been much traffic on the mailinglist lately since I was on 
holiday and PaulS still is on holiday and Leon is swamped at work.
I am however currently cleaning up my patch queue to send them for 
review, but I need to test things on actual devices first, which takes 
time. I take "stable" seriously, sorry if that gets mistaken for sloth.

If you think you have patches that should get applied to the 
stablebranch, please post them for review on the stablebranch 
mailinglist. I can't speak for other developers, but I aim for a "same 
day review" timeframe.

Sorry if I caused confusion about this.

regards,

Koen



