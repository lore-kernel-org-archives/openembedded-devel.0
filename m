Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P5mA0-0000Wg-58
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 23:13:24 +0200
Received: by wyb40 with SMTP id 40so701837wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=IWMaept3DjV/myc0gkIS6y7pS/dHKuBVbaQ0DrzYc4o=;
	b=JJGILjAhSjxJNxNFmMy1OWoGf2VRByVyd0TzRyPv2ezVWVn7yLfdjZtvzOjMwEpEBN
	s0xzo5TcdD8gB2Z24w0S6FInCViUDIpkM2NTLxtrJRvNjrVJcHitvfCOeIR4Gddc3EmS
	gFGAvexAdMtq2tuJuxebIA95p1sK05C5trleI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=avWAK6bg8yrtHkvXwgWfsZ0MDNZfOnJQMCMzR59YZjnDMyFAGyhhEyB3OQHHXczZ0a
	Che7R7pPH7FPCdoOPmxht5sKsxfqI7L2JSN0pMAkfMFdoKKIubBUw2dWqe0wL7U+pw9z
	y5VZq05O/ee3p3FzNj8pxrEBF/ae4yj8YG9/o=
MIME-Version: 1.0
Received: by 10.216.8.14 with SMTP id 14mr5818395weq.7.1286917976551; Tue, 12
	Oct 2010 14:12:56 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Tue, 12 Oct 2010 14:12:56 -0700 (PDT)
In-Reply-To: <AANLkTi=78EZJtAyU+KmteXCnFdshT2K7SdfkKXJRPX47@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTi=78EZJtAyU+KmteXCnFdshT2K7SdfkKXJRPX47@mail.gmail.com>
Date: Tue, 12 Oct 2010 17:12:56 -0400
Message-ID: <AANLkTi=cW6tB_AMAyqUu45n0qHsndJZLq8S4URNgp_Ef@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Tue, 12 Oct 2010 21:13:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 9, 2010 at 7:30 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 9 October 2010 17:40, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> Thanks for doing this Cliff.
>> I've got my 6 builds already scheduled on our autobuilder.I will
>> report back on the wiki.
>>
>> One small remark: timewise, I would prefer creation of the branch of
>> your friday morning. For us europeans the weekend is already started.
>> Doing it a little bit earlier allows people like Steffen and me to
>> kick it off before we go home.
>
> How about Thursday, that way us UTC+9:30ians (+1hour daylight
> savings!) can kick it off before our weekend :)
>
>> Alternately it might help if we can define a time before which the
>> branch is made. That would allow a cron jub or so to kick things off.
>
> I like this idea too.

I'll plan on merging testing-next at end of business day Thursday
(EST), 9:00PM GMT.  That way people can start their builds any time on
Fri and we still have most of Thurs to report issues, etc.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


