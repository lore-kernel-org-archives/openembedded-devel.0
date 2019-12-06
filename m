Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB457F97A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 16:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TyMn4b8Xz3L;
	Fri,  6 Dec 2019 17:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575648870;
	bh=iK7QFb+ixu8uHOZf7616F/6yqKH0IRgnv/J+UF+dtoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYs/c4ZYy/p+yNY52mW9HSxfT7Zo7e7LRvw1/0Y1AOHejVM/1F6PRr0Rj2IaoNUm3
	keZHEJ7zOrWavaX9qeXXmVQjLrTemStUA4eTd1NKBtUQ34hPH7052o/6zw0XE+Y5hu
	k8v2CEx/s8f2L8EcRYfoqbAaK8RlGUzTNPf/kvtP/yBA6S1vx630nCr1ie8Pj9qHdt
	bgQYIH9CHGW1imaNB8jFMilXyxhxBmz7+Lk4fwUVoXF9OJvelhREjdZ8Is8H4bSJPJ
	eOScn1JWerQMI1COSe7AN+5u3FCuOOUX3kz7f7KSDL+t3FoMPSTvCfppY1d9AAgLzi
	r5SntC11iShjvoA5J2VkILqpUf1QaF1QZ6g6CgWYJDsE+UFfCuDKZsHHLUrJajkAbU
	tVtVOwU++gghSFXgsvcZJXFTOmJYL699HwJWq0uxa4V6yO/OuarnaDxC/hyQvClvbb
	CKGZjdO70q/HAo5QIHbn170FznmcpSOQz7vXttLzQpbtVWoT2bhq3AsZvLJPkefH1M
	gCDt5Z083X73bdRXsvym1e1uTwj1/dap/grkJZnJmZBnolE+4ySobAKrIRcMnejPtj
	SkmQUugU6WdHH5/3MK6cuDtt0u6Dcmm/c2ZhrZTn+DJCNlZApTQqFocRkvf2RhcPNl
	fGRC9DC41dZ7k/96g2YoVX0w=
Date: Fri, 6 Dec 2019 18:14:27 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191206161427.GA7565@localhost>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-11-schnitzeltony@gmail.com>
	<CAMKF1soqrjdjLMipGuumZAAouowsrK4RvNn+65Pv69yvYsmMUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soqrjdjLMipGuumZAAouowsrK4RvNn+65Pv69yvYsmMUQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 10/21] rest: initial add 0.8.1
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
X-List-Received-Date: Fri, 06 Dec 2019 16:14:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 06, 2019 at 07:17:02AM -0800, Khem Raj wrote:
> http://errors.yoctoproject.org/Errors/Details/290481/

So either at/after upstream commit 8f904a8e or configure --without-gnome.

cu
Adrian

