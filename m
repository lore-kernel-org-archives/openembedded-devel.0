Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 716827391D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 05:45:25 +0000 (UTC)
Received: by ietj16 with SMTP id j16so26441939iet.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BMITaK1+1LUBl0ONxhea6bJIaLfTgCysHGQoh0WF7to=;
	b=P2C97hErMd7Li8dH3okPPSiZKOvGIyHHdLxlJgSe/0S/dbL/MAS/Y5vGJ7nSuCOK2J
	sea+J3LrGKcrZMkP+MZOY8VTEZAHPxuiPpq7JpIdO/4lQ7d9iQhZy5KwftFdRjdDHM/5
	J5h5KIN59pLHcpVsi6UztQ398NbGe6n2z6fRgE2SnKMpj/I2cdqNUxXSx8q8xZxf1Zcb
	piqQC6eh52e890+a3FmkHHOId7PjWPrXEPsx+vb3hKNW8qqq0dZdQx7c8Yzeqawqet75
	AoKk6NjpQ+4hKQ7xszxjkwwtQ6xJ8gf9tiUjBBHaYkjuozVN9Ze7w0D6lhj6Ln3nfHUX
	fupw==
X-Received: by 10.50.225.35 with SMTP id rh3mr24048009igc.29.1436939125957;
	Tue, 14 Jul 2015 22:45:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Tue, 14 Jul 2015 22:44:56 -0700 (PDT)
In-Reply-To: <55A36046.6030508@windriver.com>
References: <1436520866-18584-1-git-send-email-wenzong.fan@windriver.com>
	<CAMKF1srTMRj=YHJWH99AvySmbbEDOdEVzopsu74ry_PFd_jmjg@mail.gmail.com>
	<55A36046.6030508@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jul 2015 22:44:56 -0700
Message-ID: <CAMKF1sqpyTgjw66K==ohfXYgTAG88+tBBix8-vETLiEcgw1HjA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Wed, 15 Jul 2015 05:45:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 12, 2015 at 11:52 PM, wenzong fan <wenzong.fan@windriver.com> wrote:
> This logic is from the old recipe file. I cleaned it and run a test build,
> there's not any issue.
>

I understand that. however while you are doing it. Its good if you
could see if this is needed still.
most of the times such opportunities should be availed during updates.

> Please refer to:
>
> [oe] [PATCH v2] libxml-libxml-perl: update from 2.0116 to 2.0121

