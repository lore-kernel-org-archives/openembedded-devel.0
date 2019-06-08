Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 218287E511
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jun 2019 06:28:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45LTxH5MXDz2C;
	Sat,  8 Jun 2019 08:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559975316;
	bh=vRnxUDzzDGpHcFaz0ViE9b0H4nn60yMjiERPuG6qL8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8jz9nJ9FSzNvxE6gb0yPFRkZvcaW3leYQ2HFF9/DLswag6As7BXVnNXoe2kwLNKj
	GNacIS2sgSlsaKgfKiVX9WviuwuySr6spzUdOEyR32f/6uwyRQYCon+ig3+pXmTkS2
	IQ7kNOZxLo3E9BUGJtilhcXhAFEoqMeLCtqEdlocVHtC6zqxyeAzirqsWSlFl1crbj
	iaa3XD8K9mYy2rM+GmkdQqawc73OOedHBJPDSOgjOYZRf+1AHbagXStbyvh/ajlJND
	hVkd+8I5Jd97bN+uvQhlFYx+pfJa4SjfhNN5/+c8NUIgws/xCNs5nGT5jkkQ26iaSK
	UzzC7tvZFea9adEOCtJjRlYcBtZy5qYveSYgyMRON0j7V/76gY9Nn3BzAqMKHu1hJQ
	aP3BtYM3GGB2guWM3JVARC18WamwpfsyB0vxcZwdlryRnC+0QDpKqNn9xWzl6Bxd81
	vzAkfR3h5rq/7Q5yNmefRY9/060mRzBZ9bKlwwodInarYRl+939s7j2UDTX2ugkztL
	d3wCiUx+72SlRSku8uTvZDUeI9TMArlf0/XZ6LqWZO0yqvw2evo7Eqhav86efMDQmr
	sSK7jo/8iU1r1RSN4crfXngK+KPhg4ED1baoS8i9dfzm36y4iazOvm0m+RnO8U53FM
	DnLjVwPEGnyEHUgonGBpYSQQ=
Date: Sat, 8 Jun 2019 09:28:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190608062833.GA3645@localhost>
References: <20190607201822.28898-1-bunk@stusta.de>
	<02e81d03-9a69-1650-1847-8a40983c595f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <02e81d03-9a69-1650-1847-8a40983c595f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH] recipes-devtools: Move back from meta-networking to meta-perl
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
X-List-Received-Date: Sat, 08 Jun 2019 06:28:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 07, 2019 at 02:51:05PM -0700, akuster808 wrote:
> On 6/7/19 1:18 PM, Adrian Bunk wrote:
> > It needs both freeradius and perl-module-data-dumper,
> > so neither place would fulfill all dependencies.
>...
> can this be run w/o meta-networking?

No, as I wrote.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


