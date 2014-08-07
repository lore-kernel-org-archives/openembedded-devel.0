Return-Path: <eduardo@monkey.io>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBFB60C19
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 04:51:17 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so3952098igb.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 21:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=uWtVOivVD2riKH6+9t3nxgR81L2BUbiLxQzJj2/hEMA=;
	b=HuMjz2PaL1ZKFt6psZh9haonOpsklem8xoLVnyGvxeKf2hurF7aTIOQSzEl1HfmAcU
	k/tGWPgiVfN3/Huc0xWqgk/zg+8EN1pDkqIYQPa14WRGtMbsQI82JTcO8plLz7hGrI8D
	Ip535bRJgr4inic0Y/M3vG3Iq6RR65PWX0DtRpiUKiG4WqWOQgDyW0NcGr9LhaGMkhL+
	rE+bB3qXVSxubWwpt1Q49kB1Dv/EdJhVQe3PPEIpWFH0JjR1WdVLBbsvoGkDzGZpG2UG
	C5zUFaig0K6/gGsavdVLdb+1YV7fjhVZpT+w6rDXqFI+zleUpsW0Ac04raxD4XjS8vce
	J6rg==
X-Gm-Message-State: ALoCoQn+XjevkAn9PPJtXAW9kibOgzg5dpVPUPr4qq1fSMG2dNz1y3WStPmkAnrkWYsZMeU3zAj6
MIME-Version: 1.0
X-Received: by 10.42.82.148 with SMTP id d20mr735643icl.39.1407387078428; Wed,
	06 Aug 2014 21:51:18 -0700 (PDT)
Received: by 10.107.133.199 with HTTP; Wed, 6 Aug 2014 21:51:18 -0700 (PDT)
In-Reply-To: <20140805075013.GG2465@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
	<20140720214725.GG22875@jama> <20140725100507.GS2492@jama>
	<CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
	<CAEaCVQhOqybiwMXyAX=jA2B12cvehYUkNsiDGhHMbB_5+ORLww@mail.gmail.com>
	<20140805075013.GG2465@jama>
Date: Wed, 6 Aug 2014 22:51:18 -0600
Message-ID: <CAEaCVQiXko=z8XwQxfH-ScA6tUUpEmVVCEBggOQwn62FOQvHeg@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Thu, 07 Aug 2014 04:51:26 -0000
Content-Type: text/plain; charset=UTF-8

>
> hing OE specific or something in your own environment ?
>
> It's IPK specific, see my last reply in this thread with explanation:
> "Directories in CONFFILES Was: [oe] [meta-webserver][PATCHv4] monkey:
> new v1.5.1 release."
>
>
thanks.

All changes will come in the bb file for v1.5.2 release.

-- 
Eduardo Silva
Monkey Software

