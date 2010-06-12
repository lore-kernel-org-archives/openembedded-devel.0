Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ONOhd-0004ZT-LR
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 13:16:42 +0200
Received: by bwz14 with SMTP id 14so1023865bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=MgtzZLldDcROQVNrLdEZw5xQynljhnMKf81cm93pjxc=;
	b=POGra26LdUwhIZ0Voyy1LMF80o6USC2C3vePzdtoh1jWcEvFPME9hdiMQR27WTkXHm
	Z/UwsnGIjzhloUthMXKQ/BXv8bJ46tApVpKg1+fBLejyoBUUcjSKeys5NaRQ8QemJ4zf
	DLnlQCjgHe/picHB0Mx+Qsty5I6H0sx4f/E10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ETAqoti/lo228EN5EuEGHYrl4POGALW3fS8F+6+21AUXBpp1oNPiiGGRq3WrvrLgaZ
	Fqci7u3gmomBLJC6U+y76JSz5fUrVjuClLv2n5UMmdby86LGKnELAhHrrB4fgvOmV2fM
	3UQUipV/scbk9QfWBtB89ELsL1lWAXEk5K3Ek=
MIME-Version: 1.0
Received: by 10.204.160.140 with SMTP id n12mr2258189bkx.60.1276341138813; 
	Sat, 12 Jun 2010 04:12:18 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Sat, 12 Jun 2010 04:12:18 -0700 (PDT)
In-Reply-To: <1276292268.29314.2660.camel@rex>
References: <4C0F9119.3000909@freyther.de>
	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
	<hutv9r$ekh$1@dough.gmane.org> <1276292268.29314.2660.camel@rex>
Date: Sat, 12 Jun 2010 13:12:18 +0200
Message-ID: <AANLkTile7PE4T0U7yeW73jGm2nlpMrAg4Dn4bqmyClbF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Sat, 12 Jun 2010 11:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/11 Richard Purdie <rpurdie@rpsys.net>:
> On Fri, 2010-06-11 at 20:29 +0200, Koen Kooi wrote:
>> > Personally the org.openembedded.dev branch name does not bother me
>> > although I know master is the 'standard' git name.
>> > Afaik renaming does not really solve a problem.
>>
>> Ah well, seeing that the TSC completely failed to implement anything of
>> the things they decided on last month I think we can stop worrying about
>> this for the next few months. Does the TSC use FIFO or LIFO for their
>> targets?
>
> You've always got to be destructive and negative ;-).

If people pick up actions (like removing old minor versions of
recipes, someone will complain that they are touching other peoples'
recipes without consent, RFC or whatever.
It would be nice if  owners/maintainers of recipes would start to
implement the policies as outlined  by the TSC, instead of bashing
others. But no, instead of having 8 abiword recies (when I tables this
issue) we now have 10.
>
> How about suggesting the TSC improves its process by assigning actions
> to people? That would be a bit more constructive and might address the
> problem.
>
> We're all volunteers doing this, we all have lots of things we're all
> involved in and we do the best we can.
>
> There is also nothing stopping anyone from helping the TSC, it was asked
> to make a decision, not necessarily implement it although I'd agree it
> would be desirable if someone on the TSC could help.
>
> FWIW, I'm about to take a weeks vacation which is my first proper
> holiday in a long time. I'll pay for it when I get back but until then
> I'm aiming to enjoy it.

Richard, enjoy your vacation! I hope you have lots of fin.

Frans (who scurries back to the corner he decided to hide into after
the last round of negative feedback when he tried to update a recipe
for the benefit of all, without needing it  himself)


