Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oqtja-0005lR-6N
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 22:16:39 +0200
Received: by wwb31 with SMTP id 31so172266wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Bpnok5nYrQGEaG2yV+y+29WAkwqEHngUV3zBtm6y40o=;
	b=BDBemVaf5BGwsr97S4XhlDc0P8yi9I3PxJxFd4wypSQR6N2acuINOyUMGltpmb+Lp4
	qd27B6pV5Z8HActCuo3gSXxafXP4r/xg8kQz+SiMa+ifFAm/9z7g6JmanxbvBbEI9crJ
	pSJ7eMWPyWvmYgwAKYkB5AvqgFFHZxRxcBYyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E7efziEYlhM0n6dUKbetsGs7uLlGRhH60NQ89XtkpaF0nGAxvUD9XpWMtqltwMU2Xa
	Vn4Wt+6j1XMrgQ7Sf/Zm8hQ5yZvayJUOUggJlbLUSLRtzpcSMJQh3TgXvXVOrRVEIR3e
	UeOWdZ0K7VmOBz/2Yps1CbdfIA+krHk1drD5M=
MIME-Version: 1.0
Received: by 10.216.155.206 with SMTP id j56mr8291479wek.67.1283372164028;
	Wed, 01 Sep 2010 13:16:04 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 1 Sep 2010 13:16:03 -0700 (PDT)
In-Reply-To: <AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
Date: Wed, 1 Sep 2010 13:16:03 -0700
Message-ID: <AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 20:16:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

so if i set up CPAN properly on the build machine that should get
through that part? Did I understand that properly? I will try that out
though, thanks a ton for the response. I will post if that works or
doesnt regardless



On Wed, Sep 1, 2010 at 1:08 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>> I am trying to get this to build and it seems to be stuck on the
>> do_configure part, I let it run for over 24 hours before killing it
>> and when I tried to alt C to kill it, it endlessly looped showing
>> something about selecting the country your in and loops through the
>> choices endlessly the only way I could kill it fully was to close the
>> terminal. I noticed in May someone else brought up this or a very
>> similar issue, what is the work around and or fix for this? Thanks for
>> any help or tips
>
>
> I think I had this once too.
> Not sure how I solved it, it is quite some time ago.
> However, it could be that I configured cpan manually on the host system
>
> No idea how to fix this permanently.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


