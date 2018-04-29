Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97CE470057
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 14:59:40 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id 131-v6so3767897vkf.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DqWdfn4E3cwXayI62+ADnvRaSyHLH6E+Zm5ePxuEFxY=;
	b=agCNCBGUrdcQandic0GhA9zwMy9XDJXZ7nLTd2HpfHwkFV0pFH45zCvliqcTlhipRA
	3FN1ooHYurVOLmvwoT2znKAvhOPwwE/PY2CbY0SgjR1sZXyKwv9VVUqvtGodb2oSicDw
	I9ZXPi3j+HBQJsrnJALVekixVWzeMqIhiZl+3sDhcyVdgf7Ugmjbs9iEQF5As4RDhau8
	m6w0rPovayiC/wwlqGlWD2ZshN4ecBvU7kQPHDqaLWJ6ZjWnpNB2oVJjQxhk2yVTQtR4
	bQfICZOG6FYz7Qs5dt0GjvvMv7MSGojwWnPmAOUU2hCnE9TiTMPe0tlwuaqfTYiDXysG
	1BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DqWdfn4E3cwXayI62+ADnvRaSyHLH6E+Zm5ePxuEFxY=;
	b=UTWDWhWrty4NEh5zEZ07V7cxSKrXLR4yRYL1/UzqXNX/4K47wfb+L3luq4HHIUEJ4A
	dMPpuHKOhxuZu9xiBc8vkG+UFdaqRgn8zrHzwjxzaDdNZGVLFGqVGhIsg0eyYFs40G1r
	VX6kungq6qJXdaJzizrC8rcUHDKdL99Z798ryS7P9WOg69cDOAXG6OdGnTBKkULdyetW
	oEAx/5BQRX0x7Adxv3ZtJJSWb8/rpI7tT47+p1QxnF+/NuI+jaojfrcybkhbWHM0Xv8z
	suYisN1J6XBy9j9GhMF6DUnU8nOwBtnnE5an7FDWQNrnFNKI+ZkYajjyhubrAYiK2bjH
	X9hw==
X-Gm-Message-State: ALQs6tDdnf5Kk/OQV2NVlSAP4MWDJ4cg7wiU83c02DMhL04uFHuqB9At
	B9FIPJ9b5MG97ZVfCbEHLgUw2tX7wWg49DWrBJU=
X-Google-Smtp-Source: AB8JxZorcbj7ZnsskzcZto4lz+qpgpd3sMkZvKFJpJlNLzLLo2M2QjpRPIilCINohY3apx/v1Bkvydhos5mQx9fTdTk=
X-Received: by 2002:a1f:ae11:: with SMTP id
	x17-v6mr6290234vke.52.1525013980858; 
	Sun, 29 Apr 2018 07:59:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.70.130 with HTTP; Sun, 29 Apr 2018 07:59:20 -0700 (PDT)
In-Reply-To: <CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
References: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
	<CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sun, 29 Apr 2018 16:59:20 +0200
Message-ID: <CAC+thW0hX39De-zuRBmE30=BSwE0KxN7s9sE4Mb5BViT0f-HLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] README: contradictory indications?
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
X-List-Received-Date: Sun, 29 Apr 2018 14:59:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 28, 2018 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 26, 2018 at 12:10 AM Andrea Galbusera <gizero@gmail.com> wrote:
>>
>> Hi,
>>
>> I see that README in meta-python contains conflicting information
>> about layer's dependencies. The introductory paragraph states that
>> "modules in this layer need to be independent of openembedded-core and
>> meta-openembedded/meta-oe", then a few lines below both of these
>> layers are listed within meta-python's dependencies.
>>
>> To me, looks like the sentence in the introduction does not hold true
>> and can be removed. If you can help clarify what the correct
>> information is, I can send a patch to fix the documentation bits.
>
>
> Usually it shoudl be just core layer

That's not the case, at least out of the box. Without meta-oe in
bblayers bitbake complains with:

ERROR: Layer 'meta-python' depends on layer 'openembedded-layer', but
this layer is not enabled in your configuration

Then, would be ok to drop 'openembedded-layer' from
LAYERDEPENDS_meta-python in conf/layer.conf? Parsing-wise it seems of
no hurt...

