Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7B15771ABF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:30:25 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id t8so13342741vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=uI5VdB8WDoygAjzhrA0xLHTm3c3yHta11ZrRx3lolUY=;
	b=NHzrFK4xLcin98f13J3c5vtrPuQWO0L2yLYOwrQcPpHm96xWHSVFcLyBpn1w3j0aC5
	EaPwWBPwH4BCy7fKWbcGczMwAEvdFcT4MnfR6CgNA1R/MCGdnjNizef9OhpADBSBxfAR
	26SHE+hRpm8SKnp/G56hvWXcb+MMWtGiuJoFiusYUkyqqTGtx2uXa9JEod9GP/CzpdbE
	fqrNEwzHheVp+xBoIx7cNhaGFjBAHMv8y/IVFvM1vN6ELNda/7x0JQbbaOK1KM1w8g91
	HH8dYvOSTJf2mKW1ROd4J+B1honSsgKO6vC+7asFR15R4vJfnCiN9MMP2A3QypQzwarU
	kZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=uI5VdB8WDoygAjzhrA0xLHTm3c3yHta11ZrRx3lolUY=;
	b=LDhXPxHvAQixfyfPy8ql1SRgJIP9X/6U+dWrWpOEm2pWYNAlmaJBLeSTgr3aiw1isC
	/8X45Gp5L9m6tGVEgHQZAlhEV6rKufSMbrqC4VJgfkk3mNANxDDzgPUhzEbUrVIUyCIt
	5L+qFwxmSwD+qmbT6Q+WCEpq6wbPuxv2GTeKV7upbkmpsyFs66q3/NrDZKKiwWzI26xp
	NnBBG7BdLuASv7Wh/VlM7uOClcPK5v8iQxICFT3Slb5bRUubQnXaj8IfYzzoT0H9pXRi
	DnO45HwjAw2pVI1s4zoZCm5KJpoRu1XVShbOyt8hGejh9DN0xDlOiy5U+eZMk2zcQ8yK
	v1TQ==
X-Gm-Message-State: AIkVDXLiFHzDipvWHu8Ukeb/VmtHT1q9CulRIzbGgpgqWF6KA1JOU/lEkHJnivr17kHdx4K94pqFH4sU/ROvyA==
X-Received: by 10.31.234.199 with SMTP id i190mr31798504vkh.31.1483986625942; 
	Mon, 09 Jan 2017 10:30:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 10:29:55 -0800 (PST)
In-Reply-To: <CAJ86T=WKT4CVhFh2s8cxNcqg4L6nhFTWxMnqaTLPh4M5b2TLYA@mail.gmail.com>
References: <CAJ86T=WKT4CVhFh2s8cxNcqg4L6nhFTWxMnqaTLPh4M5b2TLYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 10:29:55 -0800
Message-ID: <CAMKF1srk+oeBbTG5a-BMY0B+cNbqqTjJpn8ja_axnMvEiJEJag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Testing meta-efl?
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
X-List-Received-Date: Mon, 09 Jan 2017 18:30:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 8:13 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Is there a recommended image for testing changes/updates to efl?

in angstrom we have https://layers.openembedded.org/layerindex/recipe/3160/

but I havent tested this image in atleast 6 months

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

