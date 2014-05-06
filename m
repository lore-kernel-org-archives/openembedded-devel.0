Return-Path: <trevor.woerner@linaro.org>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE7BB65FF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 15:46:59 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so2174161ykq.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 08:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8beNjh3E+O1+GGic0QqPP8zIODlWJNNu+qqijT3mhU4=;
	b=EvyjKdYDY0QjZrg8dDrNufwskvEI+8rTEHMtCYa6Y5u215olgzQRdZUHbofRCdkox9
	OPJh6EaHl0XDOZA53sIvYB6zYwRqqfr5utYn9KyvFOek/9zNrksUNchNhsGxptqZ6j4x
	55lCot4ozLHBpM+LBoNwbF1ZOoiGLvDdxwQ2ZqulTDNL8xRLATmU3FPO8JGXIi2C6nS/
	U5A71i/PTc4seX7kVMK6wJOmDx2ErXLfCMcJNSGE33lkoPmZm4i7/Bx+9c/jT07W0fgK
	TSDTu8mklkdfkRSXPpHf6uDaqE//JVNH0hlHVRxY0Uzbl9pGA3c39gnLcYcyqT6ZyKxT
	k/JQ==
X-Gm-Message-State: ALoCoQm4iQH6qXdOy1aC5o/jfoFbNMeS9gNMOHxiLoeWLuHaLwwwcdICpp5r4oSuBk/U/nTzleHM
MIME-Version: 1.0
X-Received: by 10.236.142.204 with SMTP id i52mr59460464yhj.6.1399391220646;
	Tue, 06 May 2014 08:47:00 -0700 (PDT)
Received: by 10.170.156.8 with HTTP; Tue, 6 May 2014 08:47:00 -0700 (PDT)
In-Reply-To: <5364B398.5000802@embed.me.uk>
References: <5364B398.5000802@embed.me.uk>
Date: Tue, 6 May 2014 11:47:00 -0400
Message-ID: <CALmOhg=xAZehYF48AMcwX4Ugcpm4YE1yEdWH1+w9W0Y=TfDuew@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Website Text
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
X-List-Received-Date: Tue, 06 May 2014 15:47:02 -0000
Content-Type: text/plain; charset=UTF-8

On 3 May 2014 05:15, Jack Mitchell wrote:
> The current website address is http://frontpage.openembedded.org/

My feeling is that there is a chance people will be coming to the OE
website with a board already in front of them, looking to find out if
OE supports it and how they might go about creating an image for
what's on their desk.

As such I think a set of links to various OE project website might be
useful, organized by board:

freescale: http://freescale.github.io/
gumstix: https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/master/README.md
beaglebone: http://www.angstrom-distribution.org/ (?)
various intel boards: ??

