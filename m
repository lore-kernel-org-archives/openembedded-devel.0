Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id E1B1760089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 21:34:44 +0000 (UTC)
Received: by iggg4 with SMTP id g4so51588606igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 14:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=F/di6wO8phjG/22c1mH4Zl2UX4aRs9S1aUwc23uWg3M=;
	b=bzjcHGCW3aA+Hcn4rrdEXMJdJjvGtSOGVdaarHHeuniNsPgbU90Ki+IrDsU7IKFI4d
	aKVcMqNUfKzmEWyRdt99IJwPLBR0c+1MuP1PYZkNxpXrHOI/CzMCWRGKb4cGM7d3nWiT
	5u/o6DeG0MK1yGofUeWIWhjunkHbp/jtiHgMaL3fLq8C/gG3ZZLYrExXhnUOxyAflXgq
	IG8JOWipdOsx0VCbks1g9fjB3s7bfrwErX6qjTIYxpDAqNXdggWXijZeuex/fEN/j1gn
	8hmJ3kt1NJ7E7EbPDpbqI9W86LYWUuRkvffnQm3iNuVs3RM7FjISTPcxHFMMoPP64a1w
	S1GA==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr35358447icb.30.1428528885533;
	Wed, 08 Apr 2015 14:34:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Wed, 8 Apr 2015 14:34:45 -0700 (PDT)
In-Reply-To: <1428518576-11800-1-git-send-email-denis@denix.org>
References: <1428518576-11800-1-git-send-email-denis@denix.org>
Date: Wed, 8 Apr 2015 18:34:45 -0300
X-Google-Sender-Auth: n18gq3niRKYeRBU_xA6MayNSNBc
Message-ID: <CAP9ODKqy+EVbMrYG44jfQbCSHcca8qB6CKQdZJutm-YQjtUp=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] serialcheck: add version 1.0.0
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
X-List-Received-Date: Wed, 08 Apr 2015 21:34:46 -0000
Content-Type: text/plain; charset=UTF-8

Hello Denys,

On Wed, Apr 8, 2015 at 3:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

There are some things I see as possible improvements:

 - a long commit log which says what is the use case for the tool
 - fix homepage to the right cgit URL
 - add Upstream-Status field in the two included patches (btw, it
would be good to send them for inclusion)
 - add nativesdk support as it is useful for SDK deployment so it can
be used for board test

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

