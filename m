Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A6BA66FA65
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jun 2014 17:02:02 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl10so2455743igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jun 2014 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=SmwD4LocK/twXEeLh0LgsYuZ/vpbpphR2MHSYP3wIxU=;
	b=le+WpSddS5//702wz/CaoKjwU2OKqBWpqsLKdvJ6xl2IeuoUBnW1teOnSMctkxn+fw
	gaR/iKadMqogKg9M/GNjJaQI2+0BWkOJ0y+9aP4AVPi2fzZkn7Pa+SLUT6Q/j1gs35vT
	1b9GFb/LW6pwekbSTyymW7tRoVJRKKHtANd/VAYYlueZbBKlfOBEP3RLTvkIRGCIJalz
	RZTio1f9Dfy/XvAjcoAxcEE/o1tlEHKi9jD8ZOfgWFJNukfeeBEE4kKBVilejP1LLgeg
	SOrxKpZVuOdHutsmMAIwglxZAudBIVTH810Uj9pHTugjYddBqinRFO1spzPU80eQjvuR
	b/+A==
X-Received: by 10.50.20.8 with SMTP id j8mr13456214ige.17.1401642122741; Sun,
	01 Jun 2014 10:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Sun, 1 Jun 2014 10:01:32 -0700 (PDT)
In-Reply-To: <CAAPegz0Bvz4xiUBfpQ_R5CTrSUMBnpbNjfqW6GAhj_3rQCpJvA@mail.gmail.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
	<CAMKF1sq00_iLbSEhsYbGh39VZbJQ7hdHoDN=hcQj7EYGUjTDhQ@mail.gmail.com>
	<CAAPegz0Bvz4xiUBfpQ_R5CTrSUMBnpbNjfqW6GAhj_3rQCpJvA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jun 2014 10:01:32 -0700
Message-ID: <CAMKF1srL9BJ1nTKqJdjrj+ZxaU=k=BNONuLhExwoitzDJMvc1Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Sun, 01 Jun 2014 17:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 1, 2014 at 3:57 AM, Chris Morgan <chmorgan@gmail.com> wrote:
> I can send a patch to remove 0.4 as well. Wanted to wait until the two
> easier patches were in before stacking another one up behind them.

this all could be just 1 patch

