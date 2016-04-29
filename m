Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D6DE577028
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 07:32:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a17so21483657wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 00:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7OT1ZPu4PwJZKgtolqhrWEXmUIKhKXZxn4ZKUXPwse0=;
	b=DmQKMC+pjz36Vjhdh3Q4LbEVLuR3MJnIhcrmqtXRjFOkSHmRUwxWU+05N4Bpu+8EwE
	uRqN1+Bbqx/6tlcEhqO7p/EOhZm8DUEgnV4v4Sis2kpf61YMN385IFa52UN9bqW+qicy
	aVF5UpKZRvl2sC37F6YWpiF06EQLK4cc/1aVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7OT1ZPu4PwJZKgtolqhrWEXmUIKhKXZxn4ZKUXPwse0=;
	b=Ex5rKNd/NpuggWIMoIKk4Bl7r1dWlVTHpZTKjqvYJbY5RxRQ1IS+nZk8SMcYVDcznB
	RM2qNh1AfsUh88qTAtwJaQaHE6q0Fv0GlLx9/QSf+MhHHgAhrZV0uUmGdHuSlymd5imQ
	VKAdnYEvmKq3r7NozCjRtEY829G9MihT9mLIP49IAzspXsF4NWwUHBtZgJJQ6QqRr6q7
	DayEmtgfjP3hKQxaAYNnzXglpHb3INNYtJ2DuG8sNDgbtti2LLQf4Pxf56fft1JoO5s8
	0OIHX0g3MKOQq6+wa0n2ak6sLN5o+OQcifXzpkr+fEgqlocFU35IWpWXxK3RRDOfkUNH
	0z4Q==
X-Gm-Message-State: AOPr4FVhMkXcz0cQcyJsy/7TSG71NuptvjESgTLAVUVN3we1IWkx0h66jtj2ZjEIJy78bLbhfqapa5hV/3YjCrm5
X-Received: by 10.28.139.129 with SMTP id n123mr2147495wmd.13.1461915141757;
	Fri, 29 Apr 2016 00:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.2.2 with HTTP; Fri, 29 Apr 2016 00:32:02 -0700 (PDT)
In-Reply-To: <cover.1461874725.git.akuster808@gmail.com>
References: <cover.1461874725.git.akuster808@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 29 Apr 2016 09:32:02 +0200
Message-ID: <CAP71Wjw8YeH2OiwSpPgGv8WhGcSa0jD6BWQy6ij2eMJRHFD5FQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: akuster@mvista.com
Subject: Re: [PATCH 00/36] Jethro-next pull request
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
X-List-Received-Date: Fri, 29 Apr 2016 07:32:23 -0000
Content-Type: text/plain; charset=UTF-8

hi Armin,

On Thu, Apr 28, 2016 at 11:00 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Please consider these changes for jethro-next
>
> The following changes since commit c305ac5d2f5285d5eec8952a4ca7f3b4f89aed96:
>
>   python-m2crypto: fix SSLv2 symbol issue (2016-03-09 20:10:13 +0100)
>
> are available in the git repository at:
>
>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

I had sent an email to backport this one on jethro as well:

9ece354 openbox: add run time dependency on openbox-theme-clearlooks

I am not sure if you saw the original email, so, i am resending the request.

thanks!
nico

