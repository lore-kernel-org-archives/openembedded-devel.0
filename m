Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JurGw-0004tT-SD
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 17:46:06 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JurFy-0005dT-I9
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 15:45:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 15:45:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 15:45:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 10 May 2008 17:44:57 +0200
Message-ID: <g04ftr$krb$1@ger.gmane.org>
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
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
X-List-Received-Date: Sat, 10 May 2008 15:46:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello,
>
> On Sat, May 10, 2008 at 3:53 PM, Rolf Leggewie
> <no2spam@nospam.arcornews.de>  wrote:
>
>> I am concerned about the loss of reputation that OE is incurring because
>> the .stable guys are willfully ignoring the official bug tracker.  I
>
> I'm not ignoring the bug tracker, I just don't have time to work on
> stable currently.
>
>> think it should be renamed back to angstrom$whateveritwasbefore.  We
>> can't seriously be telling guys all the time "report your problems to
>> the BTS" and then have the "official" stable branch completely and
>> willfully ignore it.  I'd go as far as requesting it should be denied
>> the org.openembedded.* namespace in monotone.
>>
> I understand your problem. Some thoughts:
>
> The only way to have the OE community to maintain .stable, is to have
> the OE community use it. Currently, we are in a chicken and egg
> situation there.

Not quite, we already have a number of vendors releasing products based 
on the stable branch. They just prefer be anonymous and push patches 
through developers instead of mail/bugzilla/whatever. Since "loss of 
reputation" was mentioned: stabbing vendors in the eye is one way of 
accomplishing that.

> Personally, I do not have the time to maintain .stable, but I will
> probably use the next stable branch and maintain it.

I have enough time to review patches people send to the stable mailing 
list. The time has decreased a bit since I started using a faster 
computer for the simulations I need to run during daytime :)

> Telling people to report problems to the bugtracker is sane, whether
> we have a stable branch or not.

There was never any question where to report problems, the bugtracker is 
the canonical place for that. The 'question' was how to get the 
resulting patches applied to the stable branch. The answer is simple and 
documented:

Send them to the stablebranch mailinglist for review.

It's not rocket science.

> Maintaining recipes that are _cvs or _svn are not feature freeze.
> Stable does not match with the SCM versions and should not be chosen
> in any stable distro.

I have trouble parsing that statement. Are you saying "do not use _<scm> 
recipes in a stable distro" or something else?



