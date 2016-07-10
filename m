Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5D8606D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 03:27:42 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l89so481191lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 20:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=A+3YFhsWAB7BXrE6LDQLCtSfgwMMpb3hMdCDXqWmCLs=;
	b=DwyMb8wVNX+LFsbwfpgegE0z6mC4unxlTuutJen9C2JT3PULiasS9/EY4OgxlVJrvk
	czZiVXBMrdExH7UJ7nd8DyG8V51kVWbaWmkJrdmYTZ2FmR7gtB53xQoWC/pV9DBYw8wQ
	Gmtb8mtYfJeO5CbQgjxfbVbIsJyu4IDTu7UBPNll5KPLzDX/rZl8M1/icvoISoWIDJB9
	9FDHAZFQqyOxyaGUCnvciNK2EWgBkeOdvxFDySn0o8ps0lJv2RhJmi3ZkxAg7R6oqVwk
	M2FxYRnsrUcva6BnRrD+ePqW9j+BNSz3bl54jTR3pIvhBAkpZwP7w7AJLfDA11JZsBKP
	HZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=A+3YFhsWAB7BXrE6LDQLCtSfgwMMpb3hMdCDXqWmCLs=;
	b=bBX4XL4tonDcPM8nq1CYpZLcklS2u8SYfWfLNdfIgRaPqjN5wrwkdgX9AsZmnBCqZm
	sH/NGU/yqf/LkJsSKPeLorbTE1ewIOsXj9GNz3xHL6LtgMEbXjH9Ta75VTzfo42+OMmb
	EiFMQyrldW5KVKPzFKIkW0UtupPWmbeUO6FGaC3X1gjlPHtQYRGEexICGKPRdMhYHlAW
	w7DyluUg22uoc8lsh9XhyNI35ZNWUUzvyLG2XYA0LFRymgqE5Oqg2FAxRlP2eZf9PNDa
	Y1+1E47Ek7+ViwsbzEFoRuOnSTJNLQ9M5kweq/AD3JB9W5Dyt37eKnOMP7YmnOivmve/
	uKzg==
X-Gm-Message-State: ALyK8tLInfDp1dzV92BaGMJFH+ypjHV6fRQJLz7/iYo34RO8ummK46+aPg/dsqTaGQa27LTquhdn0vlWegkh2g==
MIME-Version: 1.0
X-Received: by 10.25.159.8 with SMTP id i8mr3414057lfe.74.1468121261831; Sat,
	09 Jul 2016 20:27:41 -0700 (PDT)
Received: by 10.25.10.10 with HTTP; Sat, 9 Jul 2016 20:27:41 -0700 (PDT)
In-Reply-To: <1468065358-32604-1-git-send-email-derek@asterius.io>
References: <1468065358-32604-1-git-send-email-derek@asterius.io>
Date: Sat, 9 Jul 2016 20:27:41 -0700
Message-ID: <CANx9H-C-UzjAwi6XO4PAe0Qm9eDJ=kZ76VMV0DjCVbHqbH3D=Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] Add Derek Straka as a maintainer for the meta-python layer
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
X-List-Received-Date: Sun, 10 Jul 2016 03:27:44 -0000
Content-Type: text/plain; charset=UTF-8

Welcome aboard. I am very thankful for all that you have already done. I
look forward to working with you :)

Cheers,
--Tim

On Saturday, July 9, 2016, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io <javascript:;>>
> ---
>  meta-python/README | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/README b/meta-python/README
> index f62ab8f..905d5ee 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -50,4 +50,5 @@ Maintenance
>  Maintainers:
>          Tim "moto-timo" Orling <TicoTimo@gmail.com <javascript:;>>
>          Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com
> <javascript:;>>
> +        Derek Straka <derek@asterius.io <javascript:;>>
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

