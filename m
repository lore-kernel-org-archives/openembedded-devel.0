Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06759779CA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 May 2017 08:19:34 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id j135so2379320vka.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 May 2017 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O3MJ3Go+sPmbYhP46rqKBPnuVH7zJhEjgokYt1V/Izk=;
	b=mdVJgY1A2sG/0Oymvhr2bl/dvGEiE4Jqz23sOVKo941JbrGyNl4VCnk84mM/3o4mUJ
	7mnojWqYVUla5dgO9FpM9rn6KlFQz1/e64g9eWh4hfiQelZahaiNnEZRty32BCMmDFwU
	0fhuldFd4dJchm1hvvlWSqSAzKzEj4IH9O8qm4Ud/lP9IaL2CpHibVW0q3wZNl88fuuf
	Z4Taq/yjr3VjYPaRGEBUUJZu4ogzUaq4KQ8kE9uI9rtxyZ2kwosdHV/fINS8Q8dXkwK6
	i+sJZ5UChHPRGVNdH6f56yw+NUGDn1bEg3cbxHaTJsDoK/ycW4gX2+m1Q8MPPOsQ01yf
	R/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O3MJ3Go+sPmbYhP46rqKBPnuVH7zJhEjgokYt1V/Izk=;
	b=nxSMv6PTzmplbp232Un5kR6DYQ8Q2I3K8d80tdY6bOkLHPN+CJmT829rsbA71U2Qmx
	RQXvixcS/8TJ3tytdawUJdr2qCQ65jdmSKFYcVzY99TxOM0tqi3eFw17l/yoZNKX6SVF
	BQ4cTEFs4qWLNhlLu8mLWF26fGmLO8oyHWsU9stRFBOFhNuoaBFl4T6XPwKSvU0TSxJ3
	pGXMQN6dE6eIdjOyEIYFCnyeet1C8SKepLepaMufK0afVYag+hlZV5oqVY4VQuXPJCy8
	3Sy9Y9VgVvh2oN6eLaqF5k6QStBHynjmPZIZM1dkwn6b32Skyr+le7mhxwDrjLrRff38
	uUbg==
X-Gm-Message-State: AN3rC/4jhnnore8ezJGwEs1GvHi4xeqzCAVb4oY6+nGwWY0yiiT3qoI4
	r0jRLlG/UVI2cz6cYblvoPbw9J5/9g==
X-Received: by 10.31.185.66 with SMTP id j63mr21509656vkf.19.1494145175562;
	Sun, 07 May 2017 01:19:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Sun, 7 May 2017 01:19:35 -0700 (PDT)
In-Reply-To: <e827e9a5-cbee-5eea-33a5-0e32ef3ac111@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
	<CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
	<e827e9a5-cbee-5eea-33a5-0e32ef3ac111@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 7 May 2017 04:19:35 -0400
Message-ID: <CAHUNapSNATvH3rgy4pLfqaKN-=hQV=ZeWVbn2HJg3VE1NyAKjQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Sun, 07 May 2017 08:19:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 5, 2017 at 6:52 PM, akuster808 <akuster808@gmail.com> wrote:
> On 5/4/17 7:02 AM, Martin Jansa wrote:
>> As always, thanks armin!
> You are welcome.
>
> I believe we all owe you a big thanks for level of care taking you have
> been providing on the entire meta-openembedded mega layer.
>
> "Thanks Martin"

+1
absolutely! :-)

