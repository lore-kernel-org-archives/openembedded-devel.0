Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P4isF-0005oJ-CB
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 01:31:19 +0200
Received: by iwn7 with SMTP id 7so1160423iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 16:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=IqRYgsBn1bJkHjlXQb1j1cQ38v4QKR0uBRHz/BCkSFQ=;
	b=fKnKyWfePFaxxT+EYFva7vl9jwD66zefOcYHsU7soWsFqji5mKG0te5cT3FguArdYh
	LWrkDewFKVZ+A/s9RWAc1lCYBZI9NX39BI1KzOM0d2HQgLIlAyK+NtEPXy3dlIMCDDbV
	DaW8xChWhqI7URxDe3AbiLmjV/UKWXs04d4I8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XwDrWKzB36KjDxtOHJc2fxGHNU14tU8NqIo1c/7h84l7IWbo+XbYHirTQW3ERithON
	k2+AzkaKXFpVhuUwoOlAy1W4VlBDWa5SR6zW7kc7HVR61yGtufXOL/84i2my7jIQVaXv
	JwXhWP8ttyGE/zLRWJ1XyhYscajX7Fpcq/LZ0=
MIME-Version: 1.0
Received: by 10.42.194.71 with SMTP id dx7mr876369icb.397.1286667020953; Sat,
	09 Oct 2010 16:30:20 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Sat, 9 Oct 2010 16:30:20 -0700 (PDT)
In-Reply-To: <AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
Date: Sun, 10 Oct 2010 10:00:20 +1030
Message-ID: <AANLkTi=78EZJtAyU+KmteXCnFdshT2K7SdfkKXJRPX47@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Sat, 09 Oct 2010 23:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 October 2010 17:40, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> Thanks for doing this Cliff.
> I've got my 6 builds already scheduled on our autobuilder.I will
> report back on the wiki.
>
> One small remark: timewise, I would prefer creation of the branch of
> your friday morning. For us europeans the weekend is already started.
> Doing it a little bit earlier allows people like Steffen and me to
> kick it off before we go home.

How about Thursday, that way us UTC+9:30ians (+1hour daylight
savings!) can kick it off before our weekend :)

> Alternately it might help if we can define a time before which the
> branch is made. That would allow a cron jub or so to kick things off.

I like this idea too.

-Graham


