Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D2FD67568E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 10:46:32 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so39141185pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hKfTyqKCUI6yCEKCAcZgA6TtEPFckkSbwgXMnRQ7EBI=;
	b=vsdB2IfNnra8VCUNsxyynjjuAHO3vilJroVRV1LAXVTBjNReQNmRiBkS2yqcJtNZeY
	8kPHtK2/3OIBTXqNGK9Jk+FnCJL7c0ZF7MdNPs8TzL5dit82QrdNLMgyUoAA+MVNkSeX
	EvSrwkaHm7BZoLnRaBJYYWANFaanVTCemGTWMNUM9WQm9rbi9Ifom/U2jNyGYHMnQW9Z
	GaJGTlmefIModM7piYOBSiuEwSLxWys65axv/QnG6Du4i3GpSaYFHk+f6Bj1zlr6Rs8b
	paWJxRGuGsSeoPWFXBMN58xyvY7PxPoUDFlDGvWNqNBGBarcdAfjR9zDbpofzrXE82Mh
	Tevw==
MIME-Version: 1.0
X-Received: by 10.70.118.73 with SMTP id kk9mr4379287pdb.150.1432809993594;
	Thu, 28 May 2015 03:46:33 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Thu, 28 May 2015 03:46:33 -0700 (PDT)
In-Reply-To: <20150528103631.GF2383@jama>
References: <20150528103631.GF2383@jama>
Date: Thu, 28 May 2015 12:46:33 +0200
Message-ID: <CALbNGRS6mWddxw+L76PSt9HMUkhtJL9Q=zDOXtE91rsbyKz2Og@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Dropping tarball recipes from meta-qt5
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
X-List-Received-Date: Thu, 28 May 2015 10:46:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 28, 2015 at 12:36 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> I'm still working on finishing 5.5-beta1 recipes for qt5, I'm getting
> tired of maintaining 2 sets of patches and 2 versions of recipes in the
> same layer branch.
>
> 1) Would people mind dropping 5.4 support in master branch (who wants to
> use 5.4 can continue to use "fido" branch of meta-qt5, there are patches
> for 5.4.2 git recipes as well).
>
As soon as 5.5 is out I have no problem.

> 2) Would people mind having only git recipes? It will be easier to
> update them. Only disadvantages I can think of are the need to clone
> from git and not being aligned with exact release for long time (git
> recipes usually track newer revisions in e.g. 5.4 branch than 5.4.0 or
> 5.4.1 tarbal recipes.
Advantage for me would be that recipe-wise changing versions for test
is easier - so no I appreciate.
>
> If we all use the same version from the same recipes then we can test it
> better and it will be much easier to maintain.
>
I think it's time to mention: Thanks for maintaining qt5 and other
layers - you do an excellent job!

Andreas

