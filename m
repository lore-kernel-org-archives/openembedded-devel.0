Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwKYP-0003BE-3T
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 21:55:34 +0200
Received: by iwn2 with SMTP id 2so1289862iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VBd2YqYf+v8LAin0AgKVuv8Rw9XG9AurxL83tvrgGbw=;
	b=DMD6vdUkC5hC/7uMM5wamqvw/LfDBgbx576N4Bk6dodDAfb76aooBur9jSOl1Gd+xH
	kffw5Sold73ddXfowkqPvTMrExFZ+Vg431KDlPb52o5iZXAOUsbT2YsEbRwHzx7+KUte
	JWuetAQW7Ccq5we/bh7avS0sD2zD1UcrmGhNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nUXqCecyk4ohr0ec5uoyc7d2Wu3mEoA9xQ8SSgWPl6OfAPRC7H0vDBWdR0ZL2fzWpX
	aCYRiJ7Jrdyi95ZZHyp/SWt345LTaeTPQIqxJo6GdJFgvORnsAh22Ptu99stZMK8AO1c
	YOjrRkR32g7tzq5v3W/GrjxgDqyahI7NJ71To=
MIME-Version: 1.0
Received: by 10.231.193.81 with SMTP id dt17mr3414026ibb.177.1284666881889;
	Thu, 16 Sep 2010 12:54:41 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 12:54:41 -0700 (PDT)
In-Reply-To: <AANLkTikuQ0nTe5GaHGe_muyqJYUpJx0o2JJPf5SZAnvT@mail.gmail.com>
References: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
	<AANLkTimiUfDtop++PS6YhwtYh3b_e7pMpEN7GuE2LLYc@mail.gmail.com>
	<i6sflf$qq$3@dough.gmane.org>
	<AANLkTikuQ0nTe5GaHGe_muyqJYUpJx0o2JJPf5SZAnvT@mail.gmail.com>
Date: Thu, 16 Sep 2010 21:54:41 +0200
Message-ID: <AANLkTimQtOT_eta-W2NKN4WDaJJmR_Wkyo2oeNHAwc03@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nodejs: replaced v0.2.0 with v0.2.1
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
X-List-Received-Date: Thu, 16 Sep 2010 19:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/16 AJ ONeal <coolaj86@gmail.com>:
>>
>> Could please pay more attention next time? This introduces 2 big
>> regressions that were previously fixed by:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3967caeb=
51d7427980e06fd8b6e23c8fdc75e791
>>
>
> I'd like to make note of a few things
>
> =A0 - From the feedback I got - "please correct and submit again" - I was
> =A0 unaware that my prior submission been accepted.
> =A0 (I created this patch on a different machine with a fresh copy of oe =
and
> =A0 I just copied my old recipe over, not noticing it was in - my mistake=
)
>
> =A0 - Who is the maintainer of this recipe? I assumed that I was since I
> =A0 submitted it.

I'd say yes.

> =A0 I thought the policy was something along the lines of letting the
> =A0 maintainer know of changes made.

The policy is here: http://wiki.openembedded.net/index.php/Commit_Policy

It says:
 * It's fine to fix a recipe you don't maintain, but its polite to talk to
   any else actively maintaining that recipe. Try to contact the maintainer
   or, if no maintainer is listed, send a note to the OE developer mailing =
list

but apparently some people feel the rules do not apply to them
(although they bitch others if they do deviate from the rules)

> =A0 Granted, had I noticed earlier that it was in the tree I would have I
> =A0 would have modified the files in the tree rather blindly copying my s=
tuff
> =A0 in.
>
> =A0 - I posted to the list about the oe_runmake install issue and didn't =
get
> =A0 a response, yet the correction was made and submitted.
>
>
> That said, thanks for the help; I appreciate it. I'll figure out how OE
> policy and such works as time goes on. Forgive me of my ignorance as I
> learn.

Welcome to OE.Your contribution is really appreciated.
And we all make mistakes and we all were in your situation at some
point in time.
You'll learn it (and feel free to ask advice here or on irc)

And most of all: have fun!
Frans.


