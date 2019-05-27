Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E00307C68D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 17:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45CPLJ3dNGz4H;
	Mon, 27 May 2019 19:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558978632;
	bh=AUclpu9NNfudcJ8vWPMSYcDDzJ40goNzaTtM67B1p+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lro7gHcah8rVgolvKFP6PGe/q2Gu1oSvWMU3aGkAaaVTUhXX1A3BfZjEnP37vI5CX
	/IJhqBF8TmP98LX4EqoZb5eSQlrRIXFXm3w/E/UnLVNSHmHNR+Ep6fmDyhi1eqgZiP
	gr7cHaPoB1UyBZMFvGWG6AkpoyqGlhVz6Twsmtxi0v4VnaMR6smNKzLTGM1Kv+Qnj4
	kzxmxLUz/0vOZRX8Yu03k90/y8Knr7IpJ7/6nPhiamxD97TO7OQnJSj8Hq3iXav4Ne
	GyjCJWs9IZwIgnz8CYWd2CnDvyeNIYBP+MLR/QLJR0EqLqVj5WeF2YWjZmq4rPwoBo
	e0Yp27A5gDpFixzVg0nLwO5EfWeDBfmbfYiaPCGvm5EZkympIgRiyLWaZDN/nGokQk
	eNl/T12zh4g4ZzvoUdVYCDTrPwQtSdL+IzDwz08QlhwqgoKLW4ePWeWW8smtk2cjaL
	+6qcKfdmZmahoje+eCL56n+sQXGzDvYf1OoWZ6OmEqmcTAYtFy5gGWE5p8x8PItglU
	oxh5nMMy7DWuUwsH4l5NXAi0SBEWl4Z7QYe4IFE16eB5n5zT4JofoP8Z9UBTdKZFGA
	Br89UFvYSRwhkK7wGWJHbx7rn748Wp16bzVNZR4em737+pVyfmuoWmNNtuAwpYPCmu
	7qvnEYopIC980YMq/sKauROY=
Date: Mon, 27 May 2019 20:37:04 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190527173704.GB27759@localhost>
References: <cover.1558966078.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1558966078.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/34] Warrior pull request
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
X-List-Received-Date: Mon, 27 May 2019 17:37:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 27, 2019 at 07:09:06AM -0700, Armin Kuster wrote:
>...
> Andreas Müller (7):
>...
>   gnome-desktop3: set correct meson gtk doc option
>   evince: add patch to fix build with recent gobject-introspection
>...

You wanted to drop these.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


