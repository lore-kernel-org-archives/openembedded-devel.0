Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id E550474A0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 16:06:04 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id q4-v6so608637ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PqFXLrTH1nAWen9BWlPAVOCimXPlzCu71s45YzatpvA=;
	b=BiBl2gpIpNU4QW0eGbDQS3iKchssLcGyS3MsbmBiSBo25N/phCJia9y7fpEUs7kE9e
	UVh3vl43JZ7huAogC/85l14lH8EUh0d4YNSTVAnJGR+nxlvdMFbwWkDRDiYKp+y8LFLs
	Ls+lJtcqVjTkVQLMH4zP+J017YyZBxD/dr/6q7vvDcPXDmFB+tNxkoaRirON31DavfiE
	k1fv1zgHLaoIcYuCy7kV4eca3Y5Xh0CLzS91dcrKvLIb1Ko+oUcwxTd70+YhT2aVsnAV
	HG3GrbWSFx2VkWLFzYYgJrtZgfewBEfV/BWZT860r4dA7WlP0qt03ILIvrVFawBKtcHJ
	IE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PqFXLrTH1nAWen9BWlPAVOCimXPlzCu71s45YzatpvA=;
	b=o0vHRKoej7EqFv47Ignpdf43BueyDD8P3FHd4safgDLOE9sVbmqCxbgCOODe5kl1J3
	Cq7/9GeFjFVtDUsStCfInhm4rKEOCu6ZiVJgJwCcC6V73bEDK7GC8A/ESpNq1li7VpI3
	p9bJObZ21DsUYx/O/FJ7CYIxj156JiBLc7N02t6rzAbSA8YWXiYOeyx5ghl/orhw7Cfy
	r4L0qtI6l71KsUXsR6NgJA34O5Sr2rFnqoCbpN79dfQb6V5T5NeM5M3YLih0v4me8VX0
	8V/beNsX3XrijIAOlfjBZTF9cW601pbZwzNRiGk5QXDuDnT2ldTxc7PdBC2EBkzY/5wZ
	MVWw==
X-Gm-Message-State: ALKqPweqPSgD1lPJOmR4Lh+QWd8VDoY9EQxoyqiL/fJAqPCeYYgl4JXH
	2q0sQ2ibSgjmFYi20mlHossN5WY8qGab5WtsQtM8nw==
X-Google-Smtp-Source: AB8JxZoIuIM/QPgUgjooMEzSxduWZ3avIO75cxX7ekBBd/b3xfPaEwLEpjM8Rg2xaQpWkLac+16ifQcIhfCId3dz5xk=
X-Received: by 2002:a24:496:: with SMTP id
	144-v6mr1809416itb.131.1527005165757; 
	Tue, 22 May 2018 09:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 22 May 2018 09:05:45 -0700 (PDT)
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 May 2018 17:05:45 +0100
Message-ID: <CAJTo0LZhf6nXfT_O6kfZfO8hkfZQz7dJVek0nF93G0fu+L6QKw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 16:06:05 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Armin for all your hard work!

Ross

On 22 May 2018 at 16:40, akuster808 <akuster808@gmail.com> wrote:
> Hello all,
>
> After much thought, I have decided to step away from being the
> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
> kindly stepped up to continue these activities. Maintaining this was
> consuming too much of my free time and I need to focus on other things
> in the community.
>
> Thanks for the opportunity to have served you.
>
> Kind regards,
>
> Armin
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

