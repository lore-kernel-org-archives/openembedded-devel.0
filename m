Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PHPkP-0001ks-Ve
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 00:43:11 +0100
Received: by ywo32 with SMTP id 32so1174192ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 15:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=n6iDmkSuX6XgRtFgNu8FtMwCMs/VwVuedtXdOvdvksg=;
	b=RU40uuKGDB10uLsPtcEvY6zoryNfCQvku7FUr4eCAFX7MBP43Nh38+hpQDSG+FbJzY
	BHIdrsQiWzUW4Pd0K/+C86KjVgCba5L1Nd58rqPbuGbCCu82NmeAAfF6hLBxTQRQm+3l
	cBi4ezfGJEUuTaI1GzU9XqrstrKfjXAnhowT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=TeCCf7jX6xWj0Yf5hVQlEv68EgB5qbbD7ZcrmI7t+Je0UQ9jzb1qYhswi8E81YvpU+
	HkYktING6RJkB0SGDwmH9ideDq0dSxXHEX2GH604j5HukBsox2RX9HHRxeW6J6X46txF
	6rC/GzxhPvtKla9rr2SXwk/GRH5GRvXG5H+zo=
Received: by 10.91.51.19 with SMTP id d19mr5518946agk.183.1289691722684; Sat,
	13 Nov 2010 15:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 13 Nov 2010 15:41:42 -0800 (PST)
In-Reply-To: <1289656078.3521.0.camel@gnutoo-laptop>
References: <1289596368-4717-1-git-send-email-GNUtoo@no-log.org>
	<201011122319.43035.anarsoul@gmail.com>
	<1289656078.3521.0.camel@gnutoo-laptop>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Nov 2010 15:41:42 -0800
Message-ID: <AANLkTinOiXBGERuUJPYLLEr7r=VAExTx-iwTFzo_Mth1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-x11 1.2.14 : fix alsa detection
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
X-List-Received-Date: Sat, 13 Nov 2010 23:43:12 -0000
Content-Type: text/plain; charset=UTF-8

Denis,

If the deletion works for you. You have my ack. No need to send the patch to ml.

-Khem

On Sat, Nov 13, 2010 at 5:47 AM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
> On Fri, 2010-11-12 at 23:19 +0200, Vasily Khoruzhick wrote:
>> On Friday 12 November 2010 23:12:47 Denis 'GNUtoo' Carikli wrote:
>> > hi,
>> >
>> > Here's a patch that fixes alsa detection with libsdl-x11 1.2.14
>> >
>> > on irc(#oe on Freenode) khem asked me to send a patch for that so he could
>> > review it.
>> >
>> > Here it is.
>> >
>> > Denis.
>>
>> And you forgot to attach patch :)
> I think I know why the patch never made it.
> The patch was 1.4M big...
> what should I do?
>
> Denis.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


