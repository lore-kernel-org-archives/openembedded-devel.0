Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBD8601A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 16:33:08 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l89so202651lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vx23Q3EalJLf/F7AFmWVXbYpr7OJJxea0rEB1Pc5scI=;
	b=FgqpaHHpv527GP6PwO8THIFqEpMRHfdMSetmiG3NRfc515PKOqCijYSXJkGcS3lzs5
	Jxw5USsSfJXMl+CZZEHfv0laD+GX20T/s5ykD+OsFKxSkiv8sGUilg6eyl7Y7MCgtYwG
	3ML6pfZsZAIfFNgm47K0zocWUh/M46uviTja5bJCJtQNHlv6IozoHfkyR+b447XvxvNc
	1Ww/HZmrUCm4BN7SMWz7kySX9xA0d8/JNnqD65dqntXNkrqGk2TrxV7KeAq76Vj2Z7w6
	B/OqywO/3wmoWufems2NJ0EIrsSTF7FY5eq6gRRS/gazYr4tp50pYX7pMucAxyLNHrcY
	jI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vx23Q3EalJLf/F7AFmWVXbYpr7OJJxea0rEB1Pc5scI=;
	b=UyAa22uLj7QzgM3GBXOBE4ApHyAVmvr7RbZRlQXKAOMxj5mwSqfO1YZH05npw2lyaK
	NNisXpwWVkpEEQe0prn6qiMk++6hgRRvvyzbUD+5QwhiRXd/PxklYTe8tPHtIzxkDDEW
	4u3G8LaOdePNu40Bv+otAJ/mKcy30vD9iYhIartw/DuricwZX8SlqZz1eR3q5tHdDPLy
	vMkYMcENwVX8mrt5EcZOKML5d83+UkXsUo5lOICNrI5o2BhuI9fHE+T65PRIVpeb0U6g
	9KtZa+gOqAlr7S+6T+4JZNGn3K75mIV8gymJG0qIwjKkgHsctpxHJf8XHlYI1LPU6NE6
	9EvQ==
X-Gm-Message-State: ALyK8tIIOZBxEU4MwRajV7iEOQpQnsAmcQ3AOMFu2vNdieOeztKcBJFj4/AivL/LZFMX70qh2tn1z38uS+5fFA==
X-Received: by 10.25.21.223 with SMTP id 92mr2331256lfv.19.1468081988473; Sat,
	09 Jul 2016 09:33:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Sat, 9 Jul 2016 09:33:07 -0700 (PDT)
In-Reply-To: <1468065358-32604-1-git-send-email-derek@asterius.io>
References: <1468065358-32604-1-git-send-email-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 9 Jul 2016 09:33:07 -0700
Message-ID: <CANx9H-DDmHxmn8rkBq3-MKVMdjFbhHY=uNrtaxCw-UCBtO14tg@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Jul 2016 16:33:10 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Tim Orling (Intel Open Source Technology Center) <
ticotimo@gmail.com>

On Sat, Jul 9, 2016 at 4:55 AM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
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
>          Tim "moto-timo" Orling <TicoTimo@gmail.com>
>          Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
> +        Derek Straka <derek@asterius.io>
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

