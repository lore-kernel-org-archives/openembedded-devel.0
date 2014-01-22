Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9D02460017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:21:46 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at1so9039756iec.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=98wBR52vOGPOO9cqN13+2bL3/3U58AMAm5TOrgdqOzw=;
	b=FlMDEOKTVym/nTY5/odU9SJ0kZm1U4tAyNO+AgawJ5049LMabvONUHoWj8MhZMwz2d
	QcK+7b297lqbLlRq+lHk/9ze8gOhkNyxXlW3zEXZ64VGFvMWMYNzYAayVevUoBMcxJ8V
	2Yl0OnM775v+Gq1khov03Tt7ECxkr4GDo6viMZWztzqpQw4D5LJPzpAygpDEM8MlLUMf
	1DiuddHnRFjB+sC2Ykylev/fESFme5+7rKVfyRqIOGA7kUQCeP8ATs444LxlcihlrV4a
	DFFkaX/GhFxAdvgTyBNLZ/sr5qi7lIKQrKOwoEeY6VHuwyQ64ycCokU+VUFDa9LcbhMI
	vRvg==
X-Received: by 10.43.153.68 with SMTP id kz4mr2100618icc.29.1390411307445;
	Wed, 22 Jan 2014 09:21:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Wed, 22 Jan 2014 09:21:17 -0800 (PST)
In-Reply-To: <CAP9ODKrEm_WCLnx2quebWu8rrpnGbvjXKp9Vn5_8c_J1unhMwg@mail.gmail.com>
References: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
	<1688777.CYGoEHJ1ll@leo>
	<CAP9ODKrEm_WCLnx2quebWu8rrpnGbvjXKp9Vn5_8c_J1unhMwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2014 09:21:17 -0800
Message-ID: <CAMKF1sru7FBY7o5guup7zvHD6BxJzkvav+DRqSzoe9t+KTnyJA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-initramfs][PATCHv2] dracut: add git version
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
X-List-Received-Date: Wed, 22 Jan 2014 17:21:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 22, 2014 at 6:35 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> I am not sure this is 'core'; maybe 'recipes-support'?


well we are in initramfs layer and dracut could be a core recipe for
initramfs layer

