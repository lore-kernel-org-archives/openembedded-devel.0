Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id F244D61223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:45:37 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so2765930vea.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2013 01:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=YJDUxFlmWEG+0yPBfZctKHgmVgXpfiVolzYUkIkoYVU=;
	b=bkyBqB7xFz2UI+33RvXctY25bkDC0+B1yv2auIzpYT8lnoPSd19pMUS2B18Co80vcy
	ySBcMVIIIHx7eELZgx5B0IzD1rtTl29SIvrtfMT8PhJJrUFAFhvL2S7zCPSRXL2hkhHD
	YdIxt2nyteDVbhzX89Mjo901AVhjTTK+BekbQT7EiCcOgFVlWDpAdCN1yLXHZYpIk+Jy
	/q8fT8EPpBCzKAJMPieNQH+7PZjWLU//8rc6J98DpoRZgE2iKYSVh4+gYM/6exzg2u7s
	Y5Zwh/92c+rkxCmkMK0dPN1PsfCJVdQ6EA6tovYweeNAy+nCc1y1ryMgazgbp4jCQixA
	7IAg==
X-Received: by 10.58.181.225 with SMTP id dz1mr5486305vec.95.1375692338219;
	Mon, 05 Aug 2013 01:45:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 5 Aug 2013 01:45:18 -0700 (PDT)
In-Reply-To: <1375652867-10498-4-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
	<1375652867-10498-4-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Aug 2013 09:45:18 +0100
Message-ID: <CAJTo0LYsObcmRkiB47Gm8YV+t-gbtMrAQpk4K5pR-F9iVyVG3g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkx+tOYe3EA9+RZKXMM0PaXDeAWHS+2+qJgzvP/iubXyCmfQiB8t770XA1vLuqMHzaPrgyr
Subject: Re: [meta-oe][PATCH 04/15] devilspie: add dependency on startup-notification
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
X-List-Received-Date: Mon, 05 Aug 2013 08:45:38 -0000
Content-Type: text/plain; charset=UTF-8

On 4 August 2013 22:47, Martin Jansa <martin.jansa@gmail.com> wrote:
> * Package 'libstartup-notification-1.0', required by 'libwnck-1.0', not found

Doesn't that say that libwnck should have an explicit dependency on
startup-notification?

Ross

