Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7C36A73BB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 16:45:36 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so125480355igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Acwy69hMfj/N6gASM75WehqTkuz6J29VNJXEUOyASYQ=;
	b=t7ckWl3rnanvEAbrolWbj+bOHX034KwA1VpId2zc+wtkbnOKPvqrquOP1wT6ZkE124
	p5UJnfw61I3owp3BGFnfCP0UD6S+v1BrwlrqTZDJSKgxcn+QOkcD1EY13awFfCiaKvJk
	SvQ5GBctG93XW+KJs9rIFev8/9yifIjYjjW6S80jv+O4v8XvXJQb7Gg2iFZio5yQ5EHx
	auO3nCmsTzljPBvdR6VBrZFCbc83LPldAWgPNaYIwqhosfJFiMAtrnhAC0QYgfAU5Lmc
	lH3NEN8ZEvFf3LAr/oU9m3o1N8/oP9HSJlkO+BhDGZApghXTjrL4Eq97IYl0FUeAV173
	bEEA==
MIME-Version: 1.0
X-Received: by 10.50.80.6 with SMTP id n6mr26308655igx.78.1443113136461; Thu,
	24 Sep 2015 09:45:36 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 24 Sep 2015 09:45:36 -0700 (PDT)
In-Reply-To: <5603FD45.5030308@topic.nl>
References: <5603FD45.5030308@topic.nl>
Date: Thu, 24 Sep 2015 18:45:36 +0200
Message-ID: <CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: "libgudev" fails to build with current master
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
X-List-Received-Date: Thu, 24 Sep 2015 16:45:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> | checking for LIBUDEV... no
> | configure: error: Package requirements (libudev >= 199) were not met:
> |
> | Requested 'libudev >= 199' but version of libudev is 182
> |
> ...
>
> ERROR: Task 5548
> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_configure)
> failed with exit code '1'
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
Which init system are you using - I guess not systemd

Andreas

