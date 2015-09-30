Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 734E377000
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:11:25 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so98157341igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 03:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QSPlMD3No5V043fOcC3UBGXfQ+8ensUtXTRyOYs937E=;
	b=nzs++pGq/mTE3tgklslw6vXlGsVYvjRFfdW7hE8z1F1A2MUzHCl+sz3DObbIstNtam
	4TNES6HO6BlmhOfYTDU72WA6jVRLcyV3K2/4jns6r/DHXoMhRTlAdrATcEwwCWy6keey
	6ReujeGRQqkuEpEsV5l/AwETmzV+Y4AXF1HWgf0mC7K86Udis6Tu6ubkzTQsiGph1nBB
	wHXGQABFYPT7MNslwo/ChUlms0tOZ8fs7HEvuSxBtqyf3D/XFSgTfCE1huC5zxoXV2sY
	y3H6zkx1zHpGEG14bZQdFHg2zJTu4hjr+HJWMBs+Izmw9/ezOsFTl+SjrbE0Xw8YvM9V
	GVLA==
X-Received: by 10.50.117.100 with SMTP id kd4mr3143661igb.75.1443607886053;
	Wed, 30 Sep 2015 03:11:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 30 Sep 2015 03:10:56 -0700 (PDT)
In-Reply-To: <1443601616-25650-2-git-send-email-ulf@emagii.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<1443601616-25650-2-git-send-email-ulf@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Sep 2015 03:10:56 -0700
Message-ID: <CAMKF1spL0-FpdJVNrPjDQNfrGzHztqUqCjeHR2YBtRbvBSH=Ag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Wed, 30 Sep 2015 10:11:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com> wrote:
> -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
> +LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"

IIRC both are correct

