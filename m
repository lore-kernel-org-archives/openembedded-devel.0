Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3A176B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:31:58 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so501001oag.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=aph6CD4hqlH4Ge9yuY0fXu8y9INQO+kHt4Bo8YK+jQY=;
	b=vVKFmcB7/i0Cv45LivytSbEmtZj6ArgWYQEvvcHy5H2SYGr2I0TLurwpZ0pkGESCXG
	gPCzOOQ8AgDuNBb78Ml7M7axNGUDwmrxQLjL5zsSEqvLvXziVLAQZnTSH8SXjQ4i6Fw+
	wlHLrYODYz4iYK0k9cdKMFyT8lY+2kU2NmmqvtirzLLt1MY39Fqvr0ealKMP63USJiFp
	/IKZNfmnFRABXs5c+xXJVkJY/IflHX6RNHqEoBc2erLUj6fDCNltmiCSiol9IYvxa4ty
	y260+3mqnkt1RdRmS/IVSr27yQT/ZAga0zAxeMCogVNiBti0co21s0+tMRtKwfgVh3/m
	a0IQ==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1511310obc.62.1390401119621;
	Wed, 22 Jan 2014 06:31:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:31:59 -0800 (PST)
In-Reply-To: <d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
References: <cover.1389979930.git.paul.eggleton@linux.intel.com>
	<d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
Date: Wed, 22 Jan 2014 12:31:59 -0200
X-Google-Sender-Auth: 5Vf4SxepCxLpz2BHMTt1lw53cxI
Message-ID: <CAP9ODKqBucf99MSJphErZw1dsu6CKqGTQzxXrGSVxQbanJ8iSQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [meta-filesystems][PATCH 1/1] aufs-util: add new recipe
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
X-List-Received-Date: Wed, 22 Jan 2014 14:31:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 17, 2014 at 3:36 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Introducing the aufs-util target recipe. This would be used in
> conjuction with the aufs kernel feature to provide union mounts suitable
> for live boot applications.
>
> Only the target binaries are currently packages, with man pages,
> libraries and other artifacts skipped in this initial integration.
>
> (Integration work done by Bruce Ashfield <bruce.ashfield@windriver.com>
> and Chen Qi <Qi.Chen@windriver.com> .)
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

