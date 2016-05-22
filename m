Return-Path: <bernard_mentink@trimble.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id D36DB6012C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2016 18:43:17 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id c127so36023305ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2016 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=trimble-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=qmV6ghZxb7FZ6PK0UcHo35/yPCHFI7udGhMU94lARB8=;
	b=QEFnfmy0Ao3iD+i+dzOFFIgVmmBy/TVzoUl7WVupIdr9ifAWg0wQgcrkLOJ2co0Bqz
	azDgv8v9EeK51r6nt1bHSqrrk/wnbY/pPBq4MfOJXWFn9kpWpmSvzYxph0QiUFZi2fcm
	QI6Qa28g4WnECJO2ckg2Yv8HXq7dah4tVixKU47TXC7XbVF9cptbKsuPREXQfYBbcWyC
	X7y4WhTm1MW2qFeZzTZtMQfRZeC/L5NMEzv77s4erD5hXhNnGNLrbZq+Glw//mWZVilw
	8hF7mfA2vxdGVBU9TBLhzTPUluwfqU5eCweLigVWF2XV2njDlGCBLBd66+pX4VigUISd
	6ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=qmV6ghZxb7FZ6PK0UcHo35/yPCHFI7udGhMU94lARB8=;
	b=HMf9EdDCZ2UxoaVvWWa1CJ98G1EXQqGZsyh+twexbl1WlJarjhYXaRQvex/NUii1iJ
	HL+aeaCgm6rZCJ6kWzmnTv1ScY2tI9h/AArTii6Gvk6msSaXHjqEgOmRwdgMtXpRob9p
	QryK9nPAvF9uLA5KiV3rYE5Ld9MSVz/YWnkoDQjXaIeXgcYnF3uBLrU9XLxnGfN2iVgv
	63udZYewTDxajbKvkYTjy0bkIl0KIB1Qvry+r3qvn9inN//CLRO8ZXzaOFY/qisxKeO1
	3npiOSGoVSwFDjcC3jVUiFwXULGyJ8K/LpmFYZ8Gt0V9M1LmZet10BjX3n5EszFo39Y0
	vXzw==
X-Gm-Message-State: AOPr4FUfLEZum74bCKJCFto+kbdXJO1VXzLMEiSBfdtAZsW+dLjPwcHlDHAcSrHO3BBr/A4GTrBV/Vyk/4k/0bIR
MIME-Version: 1.0
X-Received: by 10.129.160.194 with SMTP id x185mr7793583ywg.130.1463942597696; 
	Sun, 22 May 2016 11:43:17 -0700 (PDT)
Received: by 10.129.1.1 with HTTP; Sun, 22 May 2016 11:43:17 -0700 (PDT)
In-Reply-To: <573f2581.d3168c0a.a7019.44b4@mx.google.com>
References: <573f2581.d3168c0a.a7019.44b4@mx.google.com>
Date: Mon, 23 May 2016 06:43:17 +1200
Message-ID: <CAHkvPB+Coq2r+myAT+KOJ1gZ1jdRYJOmk-u38a72zWuwSS2QPA@mail.gmail.com>
From: Bernard Mentink <bernard_mentink@trimble.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Updates to meta-browser (master) in 2016-05-20
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
X-List-Received-Date: Sun, 22 May 2016 18:43:18 -0000
Content-Type: text/plain; charset=UTF-8

Can someone send me a link to unsubscribe from this list ..

Thanks

On Sat, May 21, 2016 at 2:55 AM, Otavio Salvador <otavio.salvador@gmail.com>
wrote:

> Hello,
>
> I pushed following updates:
>
> commit 825ea9349fe9b7da39f1de0c3e8e15d9d62f2774 (HEAD -> pending,
> origin/master, origin/HEAD)
> Author: Carlos Rafael Giani <dv@pseudoterminal.org>
> Date:   Fri May 20 13:41:47 2016 +0200
>
>     chromium: Add workarounds for compiler errors
>
>     Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Regards,
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

