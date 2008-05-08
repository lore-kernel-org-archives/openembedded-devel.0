Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ju68u-0004ea-FP
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 15:26:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ju68F-000358-Fw
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 13:25:59 +0000
Received: from wlan140130.mobiel.utwente.nl ([130.89.140.130])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 13:25:59 +0000
Received: from k.kooi by wlan140130.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 13:25:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 May 2008 15:25:50 +0200
Message-ID: <fvuv0v$16v$1@ger.gmane.org>
References: <fvu8b8$kl2$1@ger.gmane.org> <fvunn9$73m$1@ger.gmane.org>
	<74d0deb30805080534v6be5f293xa14fe5c159968555@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan140130.mobiel.utwente.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <74d0deb30805080534v6be5f293xa14fe5c159968555@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Disapproval of revision b8e46b797b32111526a2116d020fdd9e1c079965
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
X-List-Received-Date: Thu, 08 May 2008 13:26:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> On Thu, May 8, 2008 at 1:21 PM, Rolf Leggewie
> <no2spam@nospam.arcornews.de>  wrote:
>> Koen,
>>
>>   thank you for continuing to keep such a close watch on every single
>>   commit I make and raising hell every time you find a chance.
>
> Actually, I was just about to do the same thing (reverting, sending a
> notification, wouldn't call that raising hell) when I noticed Koen's
> disapproval, so thanks for the quick fix.
> Just saying, this is because gmp is a pretty prominent package, not
> because Koen is closely watching your every step. Of course the latter
> part is only an assumption.

I've been (trying) to build x11-image from scratch for various targets 
the past week and fix any breakages I encounter. If you check the commit 
messages you'll see that I'm also raising hell for the breakage Mickeyl 
was so kind to add (removing packages that angstrom has as 
PREFERRED_VERSION, etc).
It's nothing personal, Rolf just happened to be the person that made the 
same mistake twice in a week.

FWIW: bitbake -c patch is IO limited, no cpu limited.



