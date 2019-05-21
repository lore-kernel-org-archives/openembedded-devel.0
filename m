Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9757D2BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 08:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457T0f5BYqz24;
	Tue, 21 May 2019 10:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558426099;
	bh=zHOSVLw9ZZgiQgPsF/ijSRm3FasA2zznlwMxXkrpmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0/IvIXfweJOW9MupQd2eflYo+RwetySykbJ7jZ1HckL7dq/Uq+oCVwGGtpOmrKXU
	HEFhnedWUlTAb7JTGS3kvGauFoNDxQNlSOoKPw0UVBq/1hj/vT2XxlqU1lnpfTZObY
	RjPZjJaBEayJd8sKb3aDNbmGF/9Dugm+mq/bDY/Afl69XzclbUs0t9iUzNeooJkAZJ
	xp9WDBqmcewlqqArV+17HCGahZi/OGJR/0yipvRSBZlaW0SU6CMTBG6HV7Xh8f+qfd
	NxxK8T9YCeIB37VdLmWWreqshl0MkfR84F6zdhSLzu2bA/CEEbSO1gMQNMO0H3j4/I
	Nr3EABOVQubNaP+TbqGnzj1fxV8SMLwSwGQhRN9atL6XDOMdUSduvXU5pHIx9zcEXi
	FhQHPXwMBGzSQt2vv3a56oiy0ybl8H5Q7Iv2rlmX6kFI7Hb200nNyL+sgO0l35Vv4J
	mK1NOOpsbnPLkA0zB3zvTJS7RjA+WXQaOpyJiND1E51+8m12yF3NaZONimCFfTGJ+V
	sWezglDgJ9cQGfWkakLX046ph9VBnyNij9b1PeMdxZtaRxvIIOwHk2io96G9sJDrip
	UkyNVV/DP7fUMhRsh9Wn+Q6W0bD1hc2Evmx6hTAb0TKnlglbq0pmKojhtTmTbBw/fO
	k3BYZbXWFV4dQb76dH4MBv9I=
Date: Tue, 21 May 2019 11:08:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521080814.GB15108@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<3265bb67550f49b0dd4a4ec9ad98af56c14cbb5d.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3265bb67550f49b0dd4a4ec9ad98af56c14cbb5d.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 08/34] gnome-desktop3: set correct meson gtk doc option
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
X-List-Received-Date: Tue, 21 May 2019 08:08:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 20, 2019 at 08:56:08PM -0700, Armin Kuster wrote:
> From: Andreas Müller <schnitzeltony@gmail.com>
> 
> Fixes:
> | ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: docs [unknown-configure-option]
>...

This was a post-warrior breakage.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


