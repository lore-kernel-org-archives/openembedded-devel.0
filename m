Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3DACC7E17F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:55:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457RNG3vlsz44;
	Tue, 21 May 2019 08:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558421710;
	bh=wgn6tAoQhsc3tstWZZHzya9nzTluav3SehuZdjTC5F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLuApYXLUzXvvWj473O7WPvGpovzTqCvYmcKWSHuZgw3uEh8uM3zkAH5oz6ZoICie
	92OyEdFqSs+SdmfSHuNu72I4A/YuDG38qhDU0hUEGOrY8ffsnqpMIAISoRnWS6d6B2
	breRjQsdO9E3rU1r9gGpBSxNtPuwYoL6s4bOc0c3o0pA722CBkgUHRzvaHO6NKoMw6
	KxJJimVStrxVWp768J9LTgqlKNKBf3VVKoIMIbPTKmmGHk0iUtZ+UGT186G6jRsPQ6
	7FGMawLgspV8PjPfdjn2cHydcacL8lQ0tJBb8iH/PISUfRRpLKzZWlAJmb6pJivTr1
	2KGvY5dK5EwLPqKDSgayXy7WVh0TGBE2CG/xi6P+VSzV/IeTQAuui9Tphd57jQhQD6
	GBdfn3RjOnU+VMdbpvsXoID26G/BxypBQ/Kv7pieRjRQxMKqGog8C/To+xzgabnY4p
	xK3fTUuS4my9FYwCQjMw+h8auTMX0N2Xo3NzPbmncmG+zIlgGpARYw0/3xpBafv7z8
	fpCbIsUwA/4FIqrSGcJGovq2RpjW+ebb/fFsnXUbmvU1l++hhMytR/LB95NQ2PWFBs
	WgOmRytu9jK20eelJT84/TIEhww8EvqvtxRakq/XWstQna5YU76wX6z2tvpCMSdweA
	wh8vZ0VKZPYuSFGsaL3dg7hk=
Date: Tue, 21 May 2019 09:55:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521065508.GA13319@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<8ed452ec4f7baf03256bb1811a717594a5d673bb.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8ed452ec4f7baf03256bb1811a717594a5d673bb.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 31/34] openvpn: update to 2.4.7
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
X-List-Received-Date: Tue, 21 May 2019 06:55:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:31PM -0700, Armin Kuster wrote:
> From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>...

No reason is provided why this should be upgraded in a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


