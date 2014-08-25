Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id E1E67601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:53:56 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so13868905lab.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=/cN8WjkzF1DwSD9ITj72WF6QDFJ7wGyRLjTrLBjDlQ4=;
	b=Hu0EDxl30pUoO7LGH9IyGrTczr5OmYX4gSb+0FV106v0dMJQCQOWjqNAKBEqzaU8yB
	ZxTQFn0KMqEyUBJ6n3DGh7RTqdh0T9dVDuyxKOuNTM8KeiQReN+I5t3OWHXHDK2HP6tQ
	+Rfn5CfcVfAJM3x3wPq6cxPZaAfd8h/sCRLrM4nwUqVWbHzIJFqN20N8cPCgwKDJvTXp
	oBqjjtdu2Uecb8DclL23o/gGz8Xk2HwMD0IEWquQUQ5/ICgTnwZUkOn4qSzMdJbBHWfx
	X7yGkDI2HbGEHF255Mu5RtyPvNq1Ruc4SIH5197AA6vFSihMhlRw45TiHTHVvctOKlql
	+sFQ==
X-Received: by 10.153.4.6 with SMTP id ca6mr23441578lad.32.1408992836376; Mon,
	25 Aug 2014 11:53:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 25 Aug 2014 11:53:36 -0700 (PDT)
In-Reply-To: <20140825185443.GA23339@haswell>
References: <1408991911-47249-1-git-send-email-yasir_khan@mentor.com>
	<20140825185443.GA23339@haswell>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 25 Aug 2014 11:53:36 -0700
X-Google-Sender-Auth: fdGMNPTgJToo_T4-3FdZujvYxOo
Message-ID: <CABcZAN=OaZWwXTa4_pm5E3=MYN5_UM5fbr4=yMjjXkVnJrR8Eg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] lmbench: add lmbench-exception LICENSE
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
X-List-Received-Date: Mon, 25 Aug 2014 18:53:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 11:54 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On 14-08-25 23:38:31, Yasir-Khan wrote:
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> > ---
> >  meta-oe/licenses/GPL-2.0-with-lmbench-restriction  |  108
> ++++++++++++++++++++
>
> Is there some SPDX compliant naming convention for this



Afaik this is already the convention, see e.g. GPL-2.0-with-bison-exception
on https://spdx.org/licenses/. Of course, this specific exception isn't in
the SPDX license list, but it follows suit.

-Chris

