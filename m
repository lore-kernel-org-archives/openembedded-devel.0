Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A2A3C7F437
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 463P6R4S7Bz4s;
	Wed,  7 Aug 2019 09:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565164767;
	bh=Z2aHJWPLtazNo6M8IXh8Z1cm9teqfvfcEUqh3LOxvvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWOZS2R6OvDJ4PpPW/DEDU4cnI08U8bq5V9LsE5F8K0nqKmsKA7nh+nXQ8XsOj7v8
	rlkfvz2TMPJeXqg/z823HBKzmyHeqeIsdDRHeuEmWs3f2wkAs0+wOlGTOY2XMDvDAj
	FPV4d2aImM82FyecsNKoM5pPaZC+MnCE4Vm+ZMK7bLWNJHDHYJ7tngRDFfgY44cgrm
	27F1+SsO/BRuVYaJMZXD4heqz0okGwNpVsYrhWfKZNmTStQAeWcRcNEvJZ501+YR4y
	OVZcv5M2uc+gkbpvm2VO/Ox0UbeqzwnsjBJsP+fLVHsX/oJJTp54PF7G9teLtd7v1w
	Z7vKucXBn5jU/BX9lXx1wWJ8yG9aw3Rk1GHOOXpn6EiZK6LZvHFMHuK7Dop40hMRSZ
	SYO61gchj7DCDU9swR8R5/P4JzwbZpeaavV1JYFYhmTrmgIDkeCV13JUs5MEbANeXv
	+PvPZ5Um15lDcD627HfymIK/qJrnKM8EnW8inP6qzH1+sIMBNFVw6+Imr1fsrZKOjI
	dQ2e0IOJVJwKP/R5G3t/1Zn4YgOUNMbUvTKyIm3Tk9lvpez0n3aCfUBT/2MU67fnTR
	GagrfCEWJUW9EseNEdUiq2wJwT/GlIg4A/xacpRQXLuXpJLF65UeIrVQW3pK/ft7Bz
	OGwq6uGLZTiZc3XK7J0jkOVY=
Date: Wed, 7 Aug 2019 10:59:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20190807075925.GA21771@localhost>
References: <1565195585-37801-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1565195585-37801-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-pbr: Add python3 version
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
X-List-Received-Date: Wed, 07 Aug 2019 07:59:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 08, 2019 at 12:33:05AM +0800, Zheng Ruoqin wrote:
> Providing a python3 version of python-pbr.
>...

python3-pbr is already in oe-core.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


