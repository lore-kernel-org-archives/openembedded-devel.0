Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 64DA4601DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:24:10 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j7so2895618qaq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xsfCnGNbBhsFbXGGkEEfGWZJYPWQcIUIXCheixpirFI=;
	b=lvOxyQw9NzSqN70Jna0dPvfJMDh+atIvo2dhCmj8Zbuw88OH/kpsK4cPNjWelvmRQu
	xQFmfdwNVz/RpxT0Kz8aYROW/tKBhI1KlQ41jgP9dW9lEjfVPcjkEyoYkThFcG+Bud0Q
	XosGs/aQWSUh1ZY73Mx5FAcdEaw3pYKXCB6TqXSLbR4727FVFSLxa3APwN84soCR4qxD
	LdZayNfS69a3p2l3Hxstl59HKRmnWlf8rHNwjUrqOj1x+d7QM49ymwGF+4nhNzU64hkH
	TQhtA4rr8ePkXOJ7OKl+QlKp19/OOi9sRhR+MO8PMkWKRc9/SG/UlrMYtIjJlfjF+y/E
	BAVQ==
MIME-Version: 1.0
X-Received: by 10.229.83.196 with SMTP id g4mr407833qcl.18.1423081451573; Wed,
	04 Feb 2015 12:24:11 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Wed, 4 Feb 2015 12:24:11 -0800 (PST)
In-Reply-To: <20150204192932.GC2437@jama>
References: <1423075108-24559-1-git-send-email-danismostlikely@gmail.com>
	<20150204192932.GC2437@jama>
Date: Wed, 4 Feb 2015 14:24:11 -0600
Message-ID: <CACS+7ZQ2kYeY0DZfCNZMvXfsFRQusnHDDYQzivuzKJBVq0F+sg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/5] xserver-nodm-init: only enable for runlevel 5
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
X-List-Received-Date: Wed, 04 Feb 2015 20:24:17 -0000
Content-Type: text/plain; charset=UTF-8

On 4 February 2015 at 13:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 04, 2015 at 12:38:28PM -0600, Dan McGregor wrote:
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>
> This e-mail seems to contain all 5 patches squashed into one.
>
> Patchwork is also confused:
> http://patchwork.openembedded.org/patch/88023/
>
> Please resend.

Oh my, I wonder how that happened.
I shall resend.

