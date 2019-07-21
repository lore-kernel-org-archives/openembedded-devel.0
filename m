Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E53BD7EE93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7nR3Vthz56;
	Sun, 21 Jul 2019 17:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563722651;
	bh=vhVI8YVKaPzDL+eNzk7hJqtBhGZKh/HyCinvrKLZL/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNs92ePpkyIsjH/fuCHfSm/wSZs1Hoddcptjr8U9ctg38Z+NepmO32xmPK0UbpwaE
	1tKhWbLMGnubrE81KGJhwYNERTG0IJC/S5kMdrPxLjBMpUgll3vN+NzdeZOAYYyyag
	13cYZxy51X/oDLzBXYemSlpZuVjRGGaZgOsilJEdLIcvFSbzusBhUG7Zlf7LgduM1y
	CBSuHhNPg86TJFFUTzM3QfpP2WD3JxN411RyDEjhnBBGq5E59hlmmPrkfhgkU0gfFZ
	X2wKDZ2FIEHxxXp9qpueZBBgnQ/mgVpjQ+4TIa1Mfbl8XYqfhMNnLRHW7BHDH2J0cu
	DTBzKSRISCaGoGIfDtLIY/iiwdZcqtZTkMY9l2nfpCkbh9McTYAP4rEUr9UV17Nfwp
	UWUaJcfNOA+MAR6ZZWlUE1Q6OVYU2I0ffKnQJEBjd0gmZiTfQ4/7IkfRLP/hfqXDoe
	3ukI+XB/RhDB5R15hxJlImiA1wwdkrQvrTkztSwB3cPhHprE5eVCl6CUaRVT1wmjgJ
	7IO0X1ba5NK/cVJBJrvaciZr3yVWbdF1yWZPy4Leet9p/psGITXM07FjKFh3vueS3R
	/3N2VqqAtuPZaQ11jqjIfgDrYil7bKn4IGsPAHJWPQp/73J0PWiviiAVuRQIECfmbq
	ybG4okQT1CXD2XIJqSffciMo=
Date: Sun, 21 Jul 2019 18:24:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190721152409.GA5886@localhost>
References: <cover.1563719996.git.akuster808@gmail.com>
	<b58af98c6cd8e45ba4839844151ae7508b81460c.1563719996.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b58af98c6cd8e45ba4839844151ae7508b81460c.1563719996.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior] 1/8] gnome-desktop3: set correct meson gtk doc option
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
X-List-Received-Date: Sun, 21 Jul 2019 15:24:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jul 21, 2019 at 07:41:29AM -0700, Armin Kuster wrote:
> From: Andreas Müller <schnitzeltony@gmail.com>
> 
> Fixes:
> | ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: docs [unknown-configure-option]
>...

Not needed, see
http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199723.html

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


