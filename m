Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (unknown [209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E713565E58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 19:43:50 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rl12so10423386iec.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=4+iQdYfT6KhcEHDEJNji5vE9GrSLcb8MzkJTxsxwknA=;
	b=MwFpf5hzRFJb2XQNN7xaYReuwZWva/dUQv8uJW0DKtu3dMBwkXIbK99H6WXgh23N1k
	uyh0VkP+1hlYVxSndjObRXdaSANKH2A0zm+f/isZ3wGXBXwjNCqf+MiI4RCo2iO6kaUD
	6j4iUYGzQT1sOpJf0UK620KfXpAgBq8LIjjbG8yBnbBFq4TGpM5S4UqawaB54yRsyrPi
	uokRnyIO/QcHOnIRD7xIS9VKMk6UAwPSEgoQ+0Ji9DiA18R+I2VhQjkaIc+0i4P9oBjv
	266s6T76Cklwgb/Gff/uvnS8oRNjPj9JXGJAIiWCQbk49trGMwo2Odvk1x+5KdtUTTAt
	VMlQ==
X-Received: by 10.50.43.229 with SMTP id z5mr4444763igl.2.1401306231446; Wed,
	28 May 2014 12:43:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 12:43:21 -0700 (PDT)
In-Reply-To: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<20140527091813.GA2426@jama>
	<CAK8F28=UYXL+YmzrCcWnYppsSNhUA3vJq92awZqvV=ihsL8bTA@mail.gmail.com>
	<CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 12:43:21 -0700
Message-ID: <CAMKF1sq6v8-wiO35hRY_X3bzerESiqTQxkNGvhvd4N8WTOg97g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Wed, 28 May 2014 19:43:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 8:32 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> You need to change the configure.am (or .in) and Makefile.am.

configure.ac is the new norm not configure.am

