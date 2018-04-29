Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB4660237
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 15:40:39 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id m144-v6so3808740vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ogJ/AHci5YRl82JHDkVCt3XPhesAnAEDmgrtjt0zEag=;
	b=d3bVrA4cDLVo4Pp+HlGi3xp19nvaYgq4qIjvNMv1fsahItHh968627KUnArkBdYwUK
	eANo2Y0SC/xotGcyz8TfCxCxpj6GNgHq7ZzrrX/a9pm5BifdpP6m4Uf9dBiTKSffpHyv
	PNgYFgFJk2IuhSh3u5Kh7mpggVdxXtHDvnFWe9C/BxuENvz1Ti/nres6xO0sUnXne/vW
	zJF9ejG+Q4ge4fTr3c1ZN8abzDzMicmC3NRAoAhtR3lRp2ckahtjS+5sQYaIxfdTBBPs
	V/9V1kx5E1U7aUiPmYat+DluTWNVsgurpCaashaW1++i88AUnBIx6MGpX2qEQz93xcpF
	Yheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ogJ/AHci5YRl82JHDkVCt3XPhesAnAEDmgrtjt0zEag=;
	b=filhUxV0hnlHSeTX38lZcCyqvpV1thTV60CfCqQEjQ+/xRRrhkvWjlstwaafmc2bFS
	f/+CqhANhYADYR8gWZQJCNeqEudMMvEWLfPpdRRbMxgHdtZPkd7zaI+VYuekPSiXbH2n
	w+j7nTGWnBRkxi9Y6v+TYmPSe+R9cW1P05TWo015sXBGwzJnBeAhsgBm5X6palWSnV6B
	QJmeVrc7QyvC3eHxeSVq7n2GpZTmbNMXnyx6JeF88LmnWg/7/AMkh9Fh501lDyyezeZR
	ecKJ2DZgvBBbIDo7WNxpw5TwWOBv4vt8W5MaujU2LYrWT2YcogXio/mCylnIMhrY7kQ+
	iL+g==
X-Gm-Message-State: ALQs6tAJ06E2fn1cYUai43aq+omt8SbjC397aYOQByQTA3EROWp2WL5c
	FFN8JLrTBreCa25DpgDHpNo1+Ke1YGBxqaf8dqs=
X-Google-Smtp-Source: AB8JxZqn76RsmY4glCFLN0AvhinKhmILmycglkOIWmSPJmGmjExpngchZFLfPJDl51tNDbPH5OEgpW5gTPtPwksmuQI=
X-Received: by 2002:a1f:ae11:: with SMTP id
	x17-v6mr6378811vke.52.1525016440598; 
	Sun, 29 Apr 2018 08:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.70.130 with HTTP; Sun, 29 Apr 2018 08:40:20 -0700 (PDT)
In-Reply-To: <CAMKF1spYD5R9QoLaZR+TjHx9AzWkoTbrAwxQXURD5SvfNTAQRw@mail.gmail.com>
References: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
	<CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
	<CAC+thW0hX39De-zuRBmE30=BSwE0KxN7s9sE4Mb5BViT0f-HLA@mail.gmail.com>
	<CAMKF1spYD5R9QoLaZR+TjHx9AzWkoTbrAwxQXURD5SvfNTAQRw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sun, 29 Apr 2018 17:40:20 +0200
Message-ID: <CAC+thW3oGaxAeRPqVu5SuryXQXno1CXSf7N1iJ=DA9qR5qZjxg@mail.gmail.com>
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
X-List-Received-Date: Sun, 29 Apr 2018 15:40:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 29, 2018 at 5:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Apr 29, 2018 at 7:59 AM, Andrea Galbusera <gizero@gmail.com> wrote:
>> On Sat, Apr 28, 2018 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Thu, Apr 26, 2018 at 12:10 AM Andrea Galbusera <gizero@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> I see that README in meta-python contains conflicting information
>>>> about layer's dependencies. The introductory paragraph states that
>>>> "modules in this layer need to be independent of openembedded-core and
>>>> meta-openembedded/meta-oe", then a few lines below both of these
>>>> layers are listed within meta-python's dependencies.
>>>>
>>>> To me, looks like the sentence in the introduction does not hold true
>>>> and can be removed. If you can help clarify what the correct
>>>> information is, I can send a patch to fix the documentation bits.
>>>
>>>
>>> Usually it shoudl be just core layer
>>
>> That's not the case, at least out of the box. Without meta-oe in
>> bblayers bitbake complains with:
>>
>> ERROR: Layer 'meta-python' depends on layer 'openembedded-layer', but
>> this layer is not enabled in your configuration
>>
>> Then, would be ok to drop 'openembedded-layer' from
>> LAYERDEPENDS_meta-python in conf/layer.conf? Parsing-wise it seems of
>> no hurt...
>
> I think if there is a dependency on meta-oe that could be beyond
> parsing e.g. compiling
> a recipe might assume another recipe from meta-oe during compile,
> ideally packageconfig
> for such features would be ideal. We can validate the dependencies via
> building each recipe
> from meta-python without meta-oe in layermix.

Yep! Doing exactly that and already found some...

ERROR: Nothing PROVIDES 'libsmi' (but
/home/gizero/work/upstreaming/meta-openembedded/meta-python/recipes-devtools/python/python-snimpy_0.8.12.bb
DEPENDS on or otherwise requires it).
ERROR: Nothing PROVIDES 'zeromq' (but
/home/gizero/work/upstreaming/meta-openembedded/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-pygobject' (but
/home/gizero/work/upstreaming/meta-openembedded/meta-python/recipes-devtools/python/python-pydbus_0.6.0.bb,
/home/gizero/work/upstreaming/meta-openembedded/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
RDEPENDS on or otherwise requires it)

I have no idea if it would be meaningful for some of them to support
disabling deps via PACKAGECONFIG... Would it make any sense building
python-pyzmq without zeromq? That said, recipes with deps outside of
core don't seem to be many: maybe it's still worth considering fixing
them to make their external deps optional. Otherwise, I guess we
should stay with current LAYERDEPENDS_meta-python and just fix the
README.

> It would be better to document whats actually happening in code even
> though it is less
> than ideal.

Could you elaborate? What do you mean exactly with "documenting in code" here?

