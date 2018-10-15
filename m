Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9923571BF0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:05:16 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id q12-v6so11095875qkl.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 22:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E6FZeOb9lZy1CV2YInmXdlUiz7b9Y9+mgHi2UAm0XoM=;
	b=OUchd4Eb4HP45+NZxHG03XlqKzvuGskvBv8ntJR5TcqQEEckcgFS+YosLPVwNeaICi
	CEYSzowq+zCYeM7kFepaAwnYcp6TRYbpClnE4o5txl+hBlTPk1oP9o99tqZ8zQLKmYuw
	cvg25FdJS8b0OehvBxur0tvmAhxrgEPKbBFXqA7+MMMR16OvaE1FLAADUmF/BQj/pKKD
	PI62lVl3NC5VxNUDfvA6tW0/tDtxdHaSKNuhclY3XAbMXy7NOxZb+MRqhR11n5If7M2S
	grYtRIsM1M71G8MY8l/kn1GqC7SzRsbBcH+ik+UXifEySA36fxoKFs+AAvCHf1MRH2rQ
	UwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6FZeOb9lZy1CV2YInmXdlUiz7b9Y9+mgHi2UAm0XoM=;
	b=oF/z2udL61hp3UNfdpbKzWaWHgUah7x5E6JLb0sww/bWqf9l/k9hcju4dxScHsM0OM
	RbDzI+7MwjL1KJP+OfpwflZ0wR7zDxxjORH7JwU4aXZtQyNyn1rOjJcDnYu45kko15FP
	ZLfSQu+y8R0eIwAo1xfSSY7p6pdkhi2SUo4KigVj9GmRdSIKDnk+aw8eF9XRs9DvZFFe
	7RclzXZTGxep8iEN6OVL7W78wQF5Q/S3SnWg1jJqcLFstHyKpyI0K0ux/oN7lnsYuHcv
	GhiPNPuZAiDSS6UFlGaO8FuWjV98vPAuJH4km3sGKNyar2Gt6VPkDi8xftIvfVuxEuKR
	Ztyg==
X-Gm-Message-State: ABuFfohouqkPSZOkUeJjxrhOrvkszLaQBHyZOhGXqhYHqQpi0cXZE9b2
	mcBB0kVfDhDKp2eS4odnRBtjJuDz4x9CwCzy6WzBXw==
X-Google-Smtp-Source: ACcGV625cireUwuRHi01uPsk9BvQpxNc2ia8U3nJ7TXodWrtoGTPda9ismsaHBRyLJi6VxKb37dA0HkHtqHcCSuy7mw=
X-Received: by 2002:a37:655:: with SMTP id
	82-v6mr14478412qkg.223.1539579917205; 
	Sun, 14 Oct 2018 22:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20181015034620.GC7186@denix.org>
In-Reply-To: <20181015034620.GC7186@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Oct 2018 22:04:51 -0700
Message-ID: <CAMKF1soJ_zWahqTPNYeqqwQsRUdEpYL+GiFKziWfZYK6MrTN7g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] commits w/o patches on the list?
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
X-List-Received-Date: Mon, 15 Oct 2018 05:05:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 14, 2018 at 8:46 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> I noticed there are commits to meta-qt5 that didn't have corresponding patches
> sent to the list and didn't have any discussions around those. Is that the new
> norm?

in a way yes. meta-qt5 has recently started to accept github pull requests.

>
> --
> Denys
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

