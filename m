Return-Path: <cazfi74@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 06DA6608A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:53:00 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id hu16so880747qab.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IsvCFDUeUKniZ5zoziQUqhy/+Y+ApNUpd6AfeMSy7/4=;
	b=qb1r/mFkZxWM9vmxqS1ve1mRGCgUbp5OQKGT3AHXTGMAzpEOJ7cNnLzyZR5cmt3XK+
	iCXzG5IJcFlqVxbcbT6I1cbSggXCEgx6Tb5zeRJ4K3DYTYlK4XBL5R8yK44/FRhFbd8d
	Un09wqErWPVcw+1JXsm8Diiod7PIFvr6i3RocikBWde0Wlzb47xfTkMAEYFsOyp/5CUX
	AM6kaTGgoebcUnOLB87VghwpGy8HnINOkgBcIRJ/iNqp/KjYHN4uryzH5ytjijqLab5l
	F1CqRdiPxTWm1Gf6DcH2VCzo0qC8tW20MYDifvYs0LvSLoJ8qLhxo5toT14TxhuI0uOY
	hqAg==
MIME-Version: 1.0
X-Received: by 10.49.58.202 with SMTP id t10mr20348627qeq.55.1377244381161;
	Fri, 23 Aug 2013 00:53:01 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Fri, 23 Aug 2013 00:53:01 -0700 (PDT)
In-Reply-To: <20130823072636.GA3544@jama>
References: <1376647801-30792-1-git-send-email-cazfi74@gmail.com>
	<20130823072636.GA3544@jama>
Date: Fri, 23 Aug 2013 10:53:01 +0300
Message-ID: <CAF6bG8ctQ7ywRbi1cNbsjUsQXVPzMPeZwqZQP0XDh46mOqO+4g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ImageMagick: update to upstream version 6.8.6-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 07:53:01 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2013 10:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Aug 16, 2013 at 01:10:01PM +0300, Marko Lindqvist wrote:
>> - License changed by additional copyright year only.
>> - Patch PerlMagic_MakePatch.patch part of upstream now
>
> Same issue as with 6.8.5
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-June/091027.html
>
> imagemagick-6.8.6: imagemagick: Files/directories were installed but not
> shipped
>   /usr/lib/ImageMagick-6.8.6
>   /usr/lib/ImageMagick-6.8.6/config-Q16
>   /usr/lib/ImageMagick-6.8.6/config-Q16/configure.xml
>   /usr/share/ImageMagick-6
>   /usr/share/ImageMagick-6/english.xml
>   /usr/share/ImageMagick-6/francais.xml
>   /usr/share/ImageMagick-6/locale.xml

 I'll add note to myself to check that when I next time work with that
recipe (updating it to then latest imageMagick). I'm currently giving
that general line of development a break and ended explicitly
disabling freeciv mapimg feature instead (of making it to work).


 - ML

