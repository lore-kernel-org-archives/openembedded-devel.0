Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 303D476E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 16:39:46 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t140so10991893oie.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=3JoS0qcbujQrPUTqoAUA4MozYCsEIM2m4a0bzTUJBHs=;
	b=v3FrTdNrZRbbsxP2jA3yOXWTvbzI7+wA/g1sWPos4phoBj2GntLeNhJlcgTdiLb2MR
	OQKlPWWLgch4aYd0thYUFsmgaxotrhcUlZlnGZ+fcVA2q5iwphIKZFKYcZGdKXs+D5jq
	HT6J70xrrU8YXSceIM7O1M/cl2WNVR4pZssHSEujOzHtB5CcSpEqCLvIg/WOC6N/IllS
	GHHzjxK/luIZWPEXhGKx1mtaxaLG0gDP3qslflZY3Bw0/Plr09O9B7JmAJV3qvZ3rfDF
	POKr84C3tbu8M06uhft0jALOfHk4BBAdCrlVNaha8o2Nl0w083U9XVn5D9dwNnUVLN3V
	rkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=3JoS0qcbujQrPUTqoAUA4MozYCsEIM2m4a0bzTUJBHs=;
	b=IAUR6qbKaoYJ795X1hBbKF5qRsuXE6aivJktmdG5PY4mjNc9NXtA/oeEKO0+546d8B
	iTANqslhD8Vq1llsqo/i3dM+l3JNRGQMpjWMk9RVBoMSRkwFqhUao/WzfIDgvgcYdV/6
	ZdP19ZdeNJpwjEo+gNaC3D/KLWQsPLBN+DqbPOplAyKu3Aws8Rpr2ZAYE0CaeEMo0W5f
	rXD7lx4j84zEbNYtIHB/3TNX2oSRRlNYOXvZXDrNzxsIQlo8ZYI+JiRqmREiU0KjhD3f
	uNT7wHGG061A9yEe9e4Dw5rAGZNYetD9+1NEbwjDzL7GwvUBn0zwxUVbjkQoajR63tp9
	ANvA==
X-Gm-Message-State: AOPr4FViLlfrq5yEVwW2ze7YwpPPTjIqs8rz/GqoDiEhlayfoPGA+nn1wJW5Rvp3miiXpzuUMG1EmWGd0uAucA==
MIME-Version: 1.0
X-Received: by 10.202.212.196 with SMTP id l187mr4952478oig.191.1463589587250; 
	Wed, 18 May 2016 09:39:47 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 18 May 2016 09:39:47 -0700 (PDT)
In-Reply-To: <d1c192ed-565f-c0f8-fe1d-9be335743e71@eumx.net>
References: <d1c192ed-565f-c0f8-fe1d-9be335743e71@eumx.net>
Date: Wed, 18 May 2016 12:39:47 -0400
Message-ID: <CADkTA4MCY-QGz9_sQ6MYXaFLUdwj5WzXEf16K8oTsB36t4qpXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virt] google code docker hg dependancies 404
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
X-List-Received-Date: Wed, 18 May 2016 16:39:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 5:36 AM, Jack Mitchell <ml@embed.me.uk> wrote:

> I'm hitting 404 errors with a couple of the docker dependancies. Can we
> host these somewhere or does anyone know of alternative places these can be
> obtained? I looked for the go-sqlite package but it seems to have been out
> of development for some time.
>

FYI: Copy the meta-virt mailing list for issues with meta-virtualization, I
almost missed this.



>
> /home/jack/projects/meta-virt.git/recipes-devtools/go/go-net_hg.bb,
> do_fetch
> /home/jack/projects/meta-virt.git/recipes-devtools/go/go-sqlite_hg.bb,
> do_fetch
>
> An alternative would be to possible host someones cached downloads in the
> alternative mirrors?
>
>
I just cleaned my build and I'm seeing them as well. I'll take care of
figuring out what has happened
and fixing it.

Cheers,

Bruce


> Cheers,
> Jack.
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

