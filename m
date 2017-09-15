Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id EC1CF7199D;
	Fri, 15 Sep 2017 01:16:17 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 108so658847wra.5;
	Thu, 14 Sep 2017 18:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VjHkHrxbAU8yOZPWnjGZQUgyh7SbYsJigCqN8GLkQDk=;
	b=qipNTNWZoNQ/HvskhYwQiF8B4ETu0/HkmZHgQntyz8EylgZRElVF6aVgZsyaNc5FF6
	wDvMaon1QdLY65baIjhI1OLCl44P7lBEV9a1Jb7JpVTNbUbTwrXDfYTkBl3MWUTzJ6ue
	cdAqvFVSNCHv9mcUt0ub+fS19YDNZbcmTHjFJ6zcpYPpdzumEuhT5U6ck0qILm2//vi6
	9sqzHBkjPm7sbJPEGSAyZnAREZjE4Y2kJCPEmpwkYUNgOeMCJOtfG6dHnvvzDxNUr9fz
	qpag7OqYt6kXWQo1asJqzwWpDM3ufCkGOqWbQqGdyIxnKyOz2JIRxgC0Vvmxt/UGtE8G
	FE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=VjHkHrxbAU8yOZPWnjGZQUgyh7SbYsJigCqN8GLkQDk=;
	b=CdsJjgn9pAQ9vcIkRDla89kqjwoZy3EG9xj1frlaUhnZ64NcaApWpiOq+3EII1fC7j
	T2Z50d3d2b4dSHqs3fveLJlFaRYXU1BfwkwUv8UkcrJj6wtH8mcWkwC30K8VL31oks1Z
	VT8dRsin51uaHmicqHnIMaZlmdFRVjkBDMq21w50CBQ+SkOzyuAnOI0IrVa4DlA5/SfI
	3Hn60Vi1BvCU17WKa9ijR7+RiAz1Ji3mpoXEfRJs/3I9TsZ93B2mrgfecM69+t56Y5jw
	V8yv11qSZkx+e5kjopsZH3tq5pMj0itMDoFU91QQF6GcCcGgBM0S+3gM3LSrigorYAvV
	HPtQ==
X-Gm-Message-State: AHPjjUhtUYcUkEaZz2th/XG+FKIOADlucwv5eUUFCTg3AiF3DL+CYzxY
	dDuAXxfcZs3TQhQFqzD0LNuhXanc1aJHr6xFt0E=
X-Google-Smtp-Source: ADKCNb7Uit5rZ83f46qCXaYd2LXGGifNrru66F60NQYK01cPZjdSvE1SIPX1+kuO8Q0yiam1a5gCWtN1105lHjgdTFQ=
X-Received: by 10.223.145.5 with SMTP id j5mr18330892wrj.114.1505438178625;
	Thu, 14 Sep 2017 18:16:18 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Thu, 14 Sep 2017 18:16:16 -0700 (PDT)
Received: by 10.223.134.180 with HTTP; Thu, 14 Sep 2017 18:16:16 -0700 (PDT)
In-Reply-To: <5008540a-cf80-328d-1388-eedff7830ad4@gmail.com>
References: <CA+YB3rZCwnyLaogUF1iyX01XQuZ8MzfjFE--KSffW7YzMAAq6Q@mail.gmail.com>
	<5008540a-cf80-328d-1388-eedff7830ad4@gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Thu, 14 Sep 2017 18:16:16 -0700
X-Google-Sender-Auth: JVlLIut38ODsj3NP0rt5V-zRRhg
Message-ID: <CA+YB3rbyPVfqsn2_TXzeRY3+RZ0bmC2WMYRKUU7ptA7mfszJMQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-members@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: OEDEM : venue change
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
X-List-Received-Date: Fri, 15 Sep 2017 01:16:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Sep 14, 2017 4:45 PM, "akuster808" <akuster808@gmail.com> wrote:



On 09/14/2017 11:12 AM, Jeff Osier-Mixon wrote:

> Reminder: the OEDEM page is at  https://www.openembedded.org/w
> iki/OEDEM_2017
>
> The venue has changed. OEDEM will be at the Jury's Inn, across the street
> from the Hilton.
>   Lunch and coffee etc. will be provided on site.
>
Do they have beer?


Thinking of a better place for beer afterward



> Let me know if you have any questions, comments, rants, etc
>
>

