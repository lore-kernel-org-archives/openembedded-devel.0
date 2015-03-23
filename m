Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id E0BFA6AC33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:00:44 +0000 (UTC)
Received: by ykek76 with SMTP id k76so78906043yke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3hUCqu4Ml3H3XNgl5wsQ2uWhQeOQsxN7HoFQA/27Rvc=;
	b=gTQyu81KIjBKPP8dyT6/lF/DrdlgMxGdo/T/g2xFFyjN/1fz2D0ZKsG71nl0mw1Nyb
	carqpF7cBnpYvbgOSzQJ0jPWIyNl62w/xTfvjxra45w0UubNmTBeePTQSRqrcQ5dodmC
	+3YtUIiS0Ot7EAOTVwbwDi+IAANrDB/Q5lxLApgZxwZWrzJaeZv6uDMHAjFN/cxIhf22
	uUBmvk+ouh8bRr7CoRIszbCLIM8dBpd+G266kBf6feXvOjxvZEgf9kxUZZUWKXc8Czqq
	uSbvijYTNwxDW4PAKmYhcW14e+SOMkU8/o45WQjbMH0uJv1FvBl4roTDIDKgR+RbL2kK
	l4Fg==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr915403yhq.90.1427140845130;
	Mon, 23 Mar 2015 13:00:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Mon, 23 Mar 2015 13:00:45 -0700 (PDT)
In-Reply-To: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 23 Mar 2015 17:00:45 -0300
X-Google-Sender-Auth: m5012c8C3J4NjWbvdKOYyEmXTaM
Message-ID: <CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 23 Mar 2015 20:00:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 22, 2015 at 2:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> CEF is a framework to embed chromium based browsers into other
> applications
>
> Change-Id: Ieabae43042101331f67cf6e673391f6fe320561f
> Signed-off-by: pnandyala <Pavan.Nandyala@LntTechservices.com>
> Signed-off-by: knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Couldn't it reuse the Chromium recipe we use?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

