Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4417F7726C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 16:03:49 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 186so48941991itf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=sZ7tW5il5OTdg0y4mPjEfY/T3NoYHwEcH15PZ2nHV4Q=;
	b=nPFXgH9Prr+RmUkUTUMYVpdXIZQWse0lMTNMu6hV/8rzhNvIwYW3V/9B4w818Dm8FR
	83U0awoSHHj3Ahe2kAQ3R3phvbySGiZHdbG1+q/cTkyQwWCzMz/sV9Rpc46cnYiyyEpT
	eDxdR09BFpjDK+ndqQ5MmyEA+6Al+HuyFnYxlvG/JwNxiYO7iYClUDwJFE8Qojappv54
	jUCqLy7dkOnvbEcUUAxq7mzZ7ASnwKXGL+oyDFT9NvaK/Kn1WVMkVCBoTsWzFs/xdKfU
	u40v7E+o6xuPI9N4pkZ97I9T/dF6pXvaeg2z6j+cVrS54ITzu6OucNgQXP3bkznW3OMq
	RhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=sZ7tW5il5OTdg0y4mPjEfY/T3NoYHwEcH15PZ2nHV4Q=;
	b=bqb1ruoGoEZz3nIjfgYaLR5sM10Fc9fyaL5RxEWkDeHc0/lsFnbjjf3Z1rjfG0u0Bd
	UGONs/ZZCjeL3ls2vNC2W46Q+Y+PcUAE9qOFV0RyNoXxgRU6LkeNmldDS+jloupL12sb
	Qo23Q9A+YzZDqv2qmfmt4Ew/XvQKF532v7T++LD5VazlmYdfv8S74XF+ctLLALD1td4m
	k+SF/CAYCJXYgNwjkC3wUPM5rrPby2iP0O/K2uLBvkmD/LaXl2iTYy+3BsGDZyudLsGF
	H3JIHBIlBz9yjXesMsSrCuW949LezHx+eLHHRj/X0e8bLRoKDi9F+U8MfnEHybdAbyXs
	GSOA==
X-Gm-Message-State: AE9vXwNu25p9zKEBKYNkKcBSABUj3fA53n3Ma1fk3wRan7JsFZJGLtpzOHCa+jBMNg3VncwaVkpcWsygECsnrFBL
X-Received: by 10.107.130.203 with SMTP id m72mr3357195ioi.8.1473782607225;
	Tue, 13 Sep 2016 09:03:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 13 Sep 2016 09:03:06 -0700 (PDT)
In-Reply-To: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
References: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Sep 2016 17:03:06 +0100
Message-ID: <CAJTo0LY7k+XDcwumMzfZLzOj_iOeKG_svL=QK_drDv_hHdbXhA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: update_font_cache intercept: qemu: uncaught target signal 4 (Illegal instruction)
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
X-List-Received-Date: Tue, 13 Sep 2016 16:03:50 -0000
Content-Type: text/plain; charset=UTF-8

On 13 September 2016 at 16:27, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> NOTE: Running intercept scripts:
> NOTE: > Executing update_font_cache intercept ...
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> Illegal instruction
>

What MACHINE?

Ross

