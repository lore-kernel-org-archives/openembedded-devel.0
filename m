Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B41EE6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 17:57:03 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id uq10so18235119igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gLs0MaOWFso9EDvIZvtryDSdTZ8H9CNLeFMGCWRWtHs=;
	b=xrvABRNy6mjiuUQYUoQRFUkB/Z7KrCGOt1R+wClbDK43FoMUj6NAFNijug6gu5zLWQ
	LI1UhhfBoOoHA0nEaUK+ahUsJ3X0HYGvdJcnqvYfe3gbWnImAfz0uVuRyoLTiUXt4Elo
	TfGbasP4Xxhkqkp319gp2bvHaDrKRaDXtOgpWshhF+mum5JMilLKh1v+OcsjaAelocYA
	jCCkdbGKTurJVUEUJ+t1lEmrrsY5zrmJwGQln5cC1Z264i5gHlb4GyPporqEDBxX/WmO
	fkxkIi7nOl8/pfVpltOkAnsYwL2nSo9ALZnNVjfVstpyEWmB8Rfx9wHrvgi9OQgxE87Q
	dPlw==
MIME-Version: 1.0
X-Received: by 10.42.126.80 with SMTP id d16mr6339999ics.1.1413309424848; Tue,
	14 Oct 2014 10:57:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.130.69 with HTTP; Tue, 14 Oct 2014 10:57:04 -0700 (PDT)
In-Reply-To: <CAOd_LFzDxbcVWX10B=KS5F-LGYVv-XRza-HmqXtGt8QraNMojA@mail.gmail.com>
References: <CAOd_LFzDxbcVWX10B=KS5F-LGYVv-XRza-HmqXtGt8QraNMojA@mail.gmail.com>
Date: Tue, 14 Oct 2014 14:57:04 -0300
X-Google-Sender-Auth: S61dW9M8jtxROQWxTZAb1QAKUKk
Message-ID: <CAP9ODKq7ZbvWsFehHutdvT=ehbTbCtCHvN4g397-3HmcGPxdjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cliff Brake <cbrake@bec-systems.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy] pull request imagemagick: fix SRC_URI
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
X-List-Received-Date: Tue, 14 Oct 2014 17:57:06 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Oct 14, 2014 at 11:52 AM, Cliff Brake <cbrake@bec-systems.com> wrote:
> The following changes since commit 8e6f6e49c99a12a0382e48451f37adac0181362f:
>
>   libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git daisy
>
> for you to fetch changes up to 518cd119a8724dbd485a5d5c5047de59e8fbd652:
>
>   imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)
>
> ----------------------------------------------------------------
> Javier Viguera (1):
>       imagemagick: fix SRC_URI
>
>  meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

