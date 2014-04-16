Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB7760CEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 23:51:00 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so66785igq.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=B5aATB0AasN4H+c+HVkLcWt6VckNnLy9lg4xfaQoOqg=;
	b=H17faG5vNk1b0D76lgvt6rCv8oE45FIozEP8NTcS5E4IZUwUXP7TJRcfgDkHrAQqes
	zdGRnERYbVDuXYrZMACYZjMFBc6mfCJQGfeyWzUQjGC7FxQ+i7ebuULR+diM26AgMsBr
	z261ylZWRxYTHpHJI3ZMl2rMEmaE689LqsbMZoeWERlha/mK+wwWLLfqs65nNv/swkQJ
	/gleWJlck2krCx4enFQ5xQ6g9Cwxw9DfAkzp/jvfkVU2Ap0/EXHCjwSzmGBjhkUg5Bxa
	FgA2sQf1avccIYTA72lA4e5G5439PmOp1zjnsdu5Eo8euiug0l0J9Jvvb3shDuftROlB
	AQJA==
MIME-Version: 1.0
X-Received: by 10.50.62.178 with SMTP id z18mr7824353igr.49.1397692261149;
	Wed, 16 Apr 2014 16:51:01 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Wed, 16 Apr 2014 16:51:01 -0700 (PDT)
In-Reply-To: <CAP71WjzyBZ6ZhbaeOvYiqbuvbux8jYRXDMeg_K27LCrVHcUyJg@mail.gmail.com>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
	<534E7151.5030504@balister.org>
	<CAP71WjzyBZ6ZhbaeOvYiqbuvbux8jYRXDMeg_K27LCrVHcUyJg@mail.gmail.com>
Date: Thu, 17 Apr 2014 08:51:01 +0900
Message-ID: <CALYKT1jWHnv+Ja2kAj-UpHWngCNO3s5i88R6r5-ScNpmDDSnOg@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 23:51:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys Dmytriyenko,

I would recommend you to talk to someone from your company who's more
> familiar
> with the code base that you are trying to look at and how it is derived
> and/or
> relates to OpenEmbedded and the Yocto Project.


This is what exactly I am sorry for..
I, in my team, the only one who works with linux.
There are people who works with linux but, until now, I cannot meet them
easily. I feel mail-list more kindly than them..
And I am new to this company...
Telling this story doesn't look fit to the purpose of this maillist but,
this is just my story..

And this is the reason why I thank you for your kindness..
But I agree I should try to talk with people in my company.

I don't know what "OE for MSM" is, that you keep referring, probably
your company's
> product based on OE.


I think this might be the OE for MSM:

https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome

Thank you ...
Sincerely
Journeyer



----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-16 23:42 GMT+09:00 Nicolas Dechesne <nicolas.dechesne@linaro.org>:

> On Wed, Apr 16, 2014 at 2:02 PM, Philip Balister <philip@balister.org>
> wrote:
> >>
> >> I found this from the git remote url of my surce code. It is
> >>   git://codeaurora.org/quic/le/openembedded/openembedded-core
> >>
>
> this tree is just a fork of oe-core (upstream) which is stuck at a
> 2-year old commit. if this is what you are calling "OE for MSM" well
> then it's just a 2-year old OE. You might be calling that "for MSM"
> because it comes from QCOM Code Aurora git tree.. but there is no
> vendor change in [1]
>
> [1]
> https://www.codeaurora.org/cgit/quic/le/openembedded/openembedded-core/
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

