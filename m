Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtaV2-0003iz-9g
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 08:20:46 +0200
Received: by gya6 with SMTP id 6so506236gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lzcpBfRIzUseQ7DeFAFBuWdqCXgAqKxrso1VD5E7C2E=;
	b=jpY/UHh9/1lo/AiULtd9yIl/Jj5U5vKOk/Pvo43EnyjQbQ4QKwPm8QvA+SvaxQyWjR
	OVRbD4kFVurECyuI5QLxAsYriT/89qLFXY3ucROL8NjhZVi6GhTwB/QLJ/LPxtio1D5/
	ImehmdZUc1aneAJh+PF6BUyK1t9mFNlcfQPEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GTs0knwJ+0VR3XHMHr+IyEnnDdqFD/gq0VpqvFP3OkF0yKhC5+/EXXNO2TM1STjara
	6kn5kOGnd4i6GgKIhZJZy/OiyjYTdU3r3nniPrViOvL7Ci2MOAdvYQSOFVAnQEYsaQNg
	Z8N17tK45c5GKZrgDssdONF+SO3dUzyjlWuTU=
MIME-Version: 1.0
Received: by 10.100.231.16 with SMTP id d16mr1320989anh.94.1284013201348; Wed,
	08 Sep 2010 23:20:01 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 23:20:01 -0700 (PDT)
In-Reply-To: <1283996027.3036.1.camel@gnutoo-laptop>
References: <4C85058D.8070506@gmail.com>
	<1283996027.3036.1.camel@gnutoo-laptop>
Date: Thu, 9 Sep 2010 08:20:01 +0200
Message-ID: <AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Thu, 09 Sep 2010 06:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/9 Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>:
> On Mon, 2010-09-06 at 16:15 +0100, Arigead wrote:
>> was trying to build Asterisk for the OpenMoko Free runner and it failed
>> on a dependency on termcap so I tried to bitbake termcap first and that
>> failed. The termcap compile stage is working but it's when it tries to
>> install that the recipe seems to fail but I'm new to this.
>>
>> I'm off to read the openembedded documentation again but in the mean
>> time if anybody can give me a hit that would be great.
> We can't help you if you don't post some logs or console output.
> Copy-pasting the part where it fails, if it's small, could be enough for
> a start.
> Denis.
>
>
Denis, the message from Arigead is 3 days old and has already been dealt with.
There is a patch for asterisk from Eric that makes it build fine for me.

Frans.


