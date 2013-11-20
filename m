Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 40AA66D734
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 15:52:39 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lf12so1521779vcb.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 07:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KnN3XoQgPXxbav0JjvyNb9NX6aDJUE49N53Rqbhzx58=;
	b=hDZFpbxks9e3zTkjrUhZxk1n34NhJqtI/XX6U19Geq4OqX/Ae3DCdi+SWJmIvwC76k
	awiVdZW03KqVWiS0E6gCXRuQWGlgxLs9vZ5bDf6ouQm5hSRHTCQODUeYd5qYdwnbRmtO
	XJBrsZbObN5T7m8hvWvm4FxRDsMwmnavwYXLg03Nj9+XIlwcCuhDq68d9zO4Uq02YO+c
	YTD/ZHXKMLJV5j2V2b4ulesjbN0bAQXdIVEs3R70m390ESJERW8KtccjtMDJx556cJLr
	wkSy4aqePlTwTUL/c1iauM4bzN8irairy6gSMDVeCbtbA1CTzEUifkto/hUo+WTKhC0t
	eLgQ==
X-Gm-Message-State: ALoCoQkYovjBJO3rWnuvu3iZabhWUmvjsiRThabq4WgXaULuJ7OxzsAaPXsrtSzprAzRjk+2n0ta
X-Received: by 10.220.174.200 with SMTP id u8mr984610vcz.6.1384962760459; Wed,
	20 Nov 2013 07:52:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 20 Nov 2013 07:52:20 -0800 (PST)
In-Reply-To: <20131120122126.GM3708@jama>
References: <20131120122126.GM3708@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Nov 2013 15:52:20 +0000
Message-ID: <CAJTo0LbddOTBfon=xp4WByGCzB9aiNxH+jD2KiGxJcjBfdUAfg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks Wed Nov 20
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
X-List-Received-Date: Wed, 20 Nov 2013 15:52:40 -0000
Content-Type: text/plain; charset=UTF-8

On 20 November 2013 12:21, Martin Jansa <martin.jansa@gmail.com> wrote:
>     * openembedded-core/meta/recipes-graphics/wayland/weston_1.3.0.bb, do_patch

This is a patch in your branch that isn't in oe-core.

>     * openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb, do_fetch

For anyone who isn't aware the upstream repository was deleted and the
best available clone (git.debian.org) has just had catastrophic disk
failure.

Ross

