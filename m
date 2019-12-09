Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 74C367FC42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Wmrv1XhHz3H;
	Mon,  9 Dec 2019 16:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575904351;
	bh=Xs193UVabkBp7CQkQ2ROpnysWZHurowIwqv57XG74bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTvBE8eBEkQFYaKMLE+KtBgYzRS5sAd22RD/qjtH1++JfFQAfTKCngz2dRR3dlj7G
	/OkyPqQrXLklZ7uaACm8k76LIvNtuJejaM4Qr9G6iRh/nYmK/YTaQ6+/ULUrLbbzQ+
	FOsAqgwMce1LPrKIQ1Y+FS8/EjIrFBjDShEymd5++DFQt3kvllkY3QUFSZcT6CBxCw
	FRSeBum8T5uVfgIEndUdi7ZHW8lMmdjj/JktgofDhoCLZd9iozG+5nIrSIQvAFsd8I
	TLKA872v1Mmxe8/CbeE2/M40f1ABtp0nll6QKJs3CELVC+B1vdtTRIA5283KFYhoEr
	vNy0RhjQBOr09D9uzENUg8QX2jU0mBNK3F9C9mN6weem0hJvHJIHpP21gV1sG4IyRJ
	XQsn2ZzFEi+u82pmsxhs59NRGVA9CXyc9W8IKJA22gMeFfrxk7bazdirhcTUBeWlte
	Hn0yOdW+0QFOUL727A1YVe/h/1cWNsvmuyddOCP5w1P4xCAe+fi9mXdfZH/gCRTCiX
	IgCZivT6h6F5o1M+y/V9sB69yCdUb14bJZHlHm5TheQuk8zFo3BnIlTqZmuo2JqEr+
	9RApgq+ulYsJJZdzj5HSwNeMOYololC8Zqy0bzK6bcUcV9Wj9ASDMp2mfgnbjb6VOK
	DI/kCM18vQCoJmMZce+JBmOg=
Date: Mon, 9 Dec 2019 17:12:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20191209151229.GB5701@localhost>
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
	<CAMRc=McwqcgGDfhxegUunZd7kVK6kJQ=hYhncRSLujB1jNTKkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=McwqcgGDfhxegUunZd7kVK6kJQ=hYhncRSLujB1jNTKkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 15:12:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Dec 09, 2019 at 04:00:49PM +0100, Bartosz Golaszewski wrote:
> pon., 9 gru 2019 o 15:53 Stefano Babic <sbabic@denx.de> napisał(a):
> >
> > Hi Bartosz,
> >
> > On 09/12/19 15:46, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > rdiff is a popular tool for calculating binary delta patches. It's
> > > provided by the librsync package (unrelated to rsync already available
> > > in poky).
> > >
> >
> > Nice, I added it (really, 2.1) to my public layer, but this definetely
> > belongs to OE:
> >
> > https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/librsync/librsync_2.1.0.bb
> 
> Ha! Somehow it didn't pop up in google search.
>...

Better than Google is
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=librsync

cu
Adrian

