Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id EEA2271A1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:07:42 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id 137so378641642vkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=N7FDzVj0ZucvDA0h+9HFG4Xw34KQPIQVuaCir2SVBHc=;
	b=G8GtRtXTATS73oxNZFbFSljI7XPx+Gtt+1kr+dk/k1kFd0M3vqA8hvJcxl35rvD5yT
	hMpFjc+PmGbTDXy8mvsj98BsMRqFB1rvGpRQryOBGxcgX0veNQ2UlwE0ROiWtlogrV+7
	QptlnwhsLqN8g+xS+AEvOBmGiMoixz5DAzFUX6w9bFusGbt7snXJFHTyi76f27AZml02
	Sdj8wdoHQJGJ07Hi+E9pMF0wkR5JOOGl7mQx2zpKaIsVmYVcu0n0ZqdJ038hHm700aWZ
	KpAwngHFIpsWOBXW+zOaYsLL7cRcwUxlxGfQNC32HK61UwFx51Ng8bfKZGaUR3f7l965
	mLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=N7FDzVj0ZucvDA0h+9HFG4Xw34KQPIQVuaCir2SVBHc=;
	b=q3IOAwENSUgZYhQ6cPaWg5oCYsqcZrYE8LnCr5VG/U8b/malm8mOAfsDSM/vBvk9Sr
	xIMjykJCq9aXjDfIXeQHG5pVkL3Wta03yrrkRBm5oPiaJ8uFW42Ih7ZwT9zYluN+uZSX
	gnm5NzQLUHy4FC/6Oo/GP5augWEugt4uZHcT8AXgTHdwoY57hotYSQrAefdGj94UsCZo
	JJHu2EXOD8L1zlIrGmPOz0HSUBIIfiX2dC5bMcLR2ewD0OAONZ/Err+9xtmP0X1913sQ
	uicSlLSgLvxZ7cA045V/yV24zVOgkCb4CXjVjj01suKSd8o1ATtrD3RnKWqnmYAWUYM+
	drSQ==
X-Gm-Message-State: AIkVDXKDBV4bkf0ra/01oCnl4LvzYAm15UeubEFeiZ8rxP8TnCIsekbOv60O1Bwp3hSGOy9jj5lhxRIXbM8N7w==
X-Received: by 10.31.88.1 with SMTP id m1mr4082038vkb.83.1484136462310; Wed,
	11 Jan 2017 04:07:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Wed, 11 Jan 2017 04:07:41 -0800 (PST)
In-Reply-To: <CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 11 Jan 2017 13:07:41 +0100
Message-ID: <CALbNGRSOCgDRk+Md_FcJSGrdDjrTMoDw6mKcS-M39yx9hbg5ww@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:07:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 12:57 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> This patch doesn't apply.

is git://github.com/OSSystems/meta-browser.git

still correct repo for meta-browser?

Andreas

