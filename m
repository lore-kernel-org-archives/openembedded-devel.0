Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 651BC7F2E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 464fRw5ZDxz4s;
	Fri,  9 Aug 2019 11:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565341437;
	bh=PnVoFDVaYTANI9GLfzIP2zgM+i5P1KhJsBQnVoFpewo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnZbLy4NzHuhzdFy2hmqRjtdumJPC0iZ/wClmfmn9zbid84z/1t0DdmuMbqHW+re7
	pfaX5YSc2Vo1abQ0TcKONUHAEGIS2Yqfua+BNVKwPDt29q8l53LAxG/sD14lCUONwq
	jLm1kzWtz/oSnP3iFFw32rGlXZvjPWjbfQAqwsb5V6Mp4CErJi4nSqsjBS0LNZc446
	XM9zxz9kIOymY2Dxeeo9dCwxxyyKcP8UUFPs2kco9Hav8ndFvIw/Nsr5GjABvPBKxO
	3phWu/qTLngD7j3iNsMGXA1kLf1cqjDtN8B/VvAYrmoUqNwh9hbh5zvhnXGb3o/Zfi
	u5lI+aDOh/nv2ngOcjCliBQQpXnp/nQCK/bQDTNnfVfQZ2yU5vLo+Dqu7U1QnBIwcE
	KPVe1vfUYAhgQ8c9FjOp8gxyLlpx71BTjaezIRLp7Oi4Bkefrjq5RDUJpBPFUUZjpG
	JEaS9i5oavcAvqecq2Y15d1QNDZKcOKzU8aEGqLopAEDW/lPI62plVnT+2/AClD5V/
	D7XXGojquLuPz/4ilBBttdAllH9kT3cxZDsnAq3RuY+645rkqi2fUWSrA//nhz1aAY
	J+Kr8BbbwUkQFBI5fjTZAEymQ9tKzYl862lfhkVaO3NaaNhcs64kus+314j5GLUHrC
	Z/eCuKV9DdqbgBKmeDVZMOZY=
Date: Fri, 9 Aug 2019 12:03:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190809090349.GA6295@localhost>
References: <1565340356-11073-1-git-send-email-vincent.prince.fr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1565340356-11073-1-git-send-email-vincent.prince.fr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] mongodb: add mongo shell as a PACKAGECONF option
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
X-List-Received-Date: Fri, 09 Aug 2019 09:03:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 09, 2019 at 10:45:56AM +0200, Vincent Prince wrote:
>...
> -                 mongod mongos"
> +                 core"
>...

Was this change unintended?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


