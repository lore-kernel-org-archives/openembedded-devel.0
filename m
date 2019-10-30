Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 163007FB21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:13:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4732n056SHz5h;
	Wed, 30 Oct 2019 10:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572426804;
	bh=Kgf5yCF23TAvAXbKjfYmnuITcNdc/lc480A4SIJGiE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtjxdLj+Uuz5FnDaTBXD3ccE55YWC6mAk1uKCgPMRFZnEyOfI3fNray/6ktiFImnQ
	EDhuAAWrh3UMKd4OK9CaLwrKwPmvIeGTXj//E0oggm3h8CtnjvLxMRbHOk/Ohqrkbf
	g7llxkW4aojpeStmxaZOzPveul7Zm/Jj7MrjI9if78dIDZgICnjaqUhgyFgYdYsHrN
	M3VvjwaePqHB4aEl/SL3msyx8Sg0frHweN4Q3/iWy3YR/i6/0uREkwnpYN4SUrbdCq
	PGBcn27Ct7T+eHDMueSEC9cv2nQ9f92fLjgqsr+k81MlgJWlSb+bT9506DyJpQJRRV
	nvw/98Vk10CmEjav5IdSeQ2Z02Voyt2YK8DUsDOP8LUT/WBstEMbZwmjPMUrsFfqqp
	DTkOkmCidzIEGPKlzpo+o7RbDTDW6RT3qNH+X1K0XoTcg+LTbXFhjL7Dlptr3EeO78
	CTjjlmqqj+nCAZf60YIjxsZQHDD/QzwgvmkWukRJvXac53HxyaADLxaiczABrcFAu0
	VVyNC8IuAbVpOzFVu0gCDqZFQmz4MJcbpPsLboZ3ePaIlJxnzNjY2ZuJNOwzcgCNrh
	AjjqQnp+S3GsO9vBEwrCv5+mvvjCC4mz2jTx56/TOMmMzjFooBDtT5BKLaEuhssVPJ
	eoajJAxsM7YY68TY9WT80lgQ=
Date: Wed, 30 Oct 2019 11:13:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191030091322.GA27883@localhost>
References: <20191029183123.1868-3-bunk@stusta.de>
	<CAMKF1so_r3VT5XVGSJkYw0bQrnxtdTpdqBcMFtEKiyPbBnz+ew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so_r3VT5XVGSJkYw0bQrnxtdTpdqBcMFtEKiyPbBnz+ew@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cgdb: Upgrade 0.6.8 -> 0.7.1
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
X-List-Received-Date: Wed, 30 Oct 2019 09:13:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 30, 2019 at 07:56:14AM +0100, Khem Raj wrote:
> fails on mips
> https://errors.yoctoproject.org/Errors/Details/274947/

Thanks, fixed in v2.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


