Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id EDE8777E4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:18:22 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id p129-v6so839739ywg.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JF5/9TWJqTWlVdGMys7j1qwkioEl45VVi2usTHXMlCU=;
	b=qpEpK7fUvlGHIb9yi6th3/rDV1Q3UflN6seOPP3Lc1RZu12xOXk6PtAPlkJl+ye4fs
	iwitZC4hlmGFLx1hiIHkETU4Tpylf13QGhsBhIVMMaC9P7KoFEd44qNw2DhL1hyflPJC
	ljuwpvI40QgApKt3WFoByh729c3GShFnRFQiOB5FH9hVURzuT76BusnPwmXxYNYo79Y4
	DOs6L5nr/exbInMmRJKASGcmGCAtekfxHu+BgbJpN0lh/k7hdHPVXQy0EcvuO5VNInNy
	Ojb0iP3ilAM55qxUpngaC/0rZqRx1IfdKkzcpZnZl5dHc/sgsF53ocLoqrNZeMMo4Rwr
	GEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=JF5/9TWJqTWlVdGMys7j1qwkioEl45VVi2usTHXMlCU=;
	b=pV+3JnylLpNDRkXpUWsMiPx+HSUMjBWCz/TL0VQLwKpRx9lDaBsN+JmzU5lE5yI251
	5wD9YiGyJSCQzku28hwcPl/yq1v8Dl9RqsAal1RWnITYnF9fot0udUUgQSHYaTUywyeZ
	r2ZPQdCf9JSDCv1ex0ZLECJbgFUClWSXLZQLnYHxleR4TB2HpnZd32+0FdMHmfyz4db1
	pX58tL1er9OIMQa3zbbnSvQT0dIZnURUSfrKIMqe4vhT7vVPWKKhrsUwRoawuUYlP/c+
	EhlXddKdNkp5YQ1v05PkvsVhw1Rc0NQENB12pKXDB//B6mLVCaKA0T8D6KcDUEU0JqGY
	r+ew==
X-Gm-Message-State: ALKqPwfCUJ/HrK9r5RGUVkOjbuXjaLTBbh2FL3ZhTd7StiqnLQztQgc4
	suIEwEk19O2MVr7PStNW0Hq1IOL01VVVROz6crU=
X-Google-Smtp-Source: ADUXVKKyKW/M/GI19j4sbRHdvjgO3VNWN/NJlnu7WG4dPxuIk+lHYz8rWLJ5a7Xjd0b/ps6neF0B8+IofLK3ISrhl/4=
X-Received: by 2002:a81:7482:: with SMTP id
	p124-v6mr8251998ywc.210.1528211903677; 
	Tue, 05 Jun 2018 08:18:23 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:3dc7:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 08:18:22 -0700 (PDT)
In-Reply-To: <10630413.xVAl2E7OaH@yow-masselst-lx1>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 5 Jun 2018 11:18:22 -0400
X-Google-Sender-Auth: yFM5ttm5Gjh5wwR9pHqyK6NBouE
Message-ID: <CAPuovE+waNG3XcJshTPBiyRDyLN54vbiVf--_hAaKbMVOsqnOA@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>,
	Maxin John <maxin.john@intel.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] maintainer status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2018 15:18:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 5, 2018 at 11:11 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Several of us have noticed that nothing has been merged to meta-java since
> mid-April (roughly 8 weeks ago). With about a dozen commits sent to the list
> and pending merges I thought I might email you, the maintainers, directly to
> determine if this is expected to continue. Should we be looking to update the
> maintainers list and/or recruiting new people to restore the vitality of this
> repo? Have your roles or positions changed making it no longer viable for you
> to contribute to this repo?
>
> Thanks in advance for your responses.

I got this back upon sending this out:
       ----- The following addresses had permanent fatal errors -----
    <mario@ossystems.com.br>
        (reason: 550-5.1.1 The email account that you tried to reach
does not exist. Please try)

So dropping him from the list and guessing that means we are down at
least one maintainer.

Mark

>
> Mark
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

