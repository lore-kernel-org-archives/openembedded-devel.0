Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOPK7-0008GE-L0
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:49:55 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so11308066ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OKwD1WeurbDRZ/fLI3RcJ0Bce1w7ySXN9Azof7Ixph8=;
	b=CZ03KgFFJw1KQmuPD9vGX1Uxwuq6fQzg5rKlhkDV9utVgXAoqbewDSxEjdo3/jHFfp
	No2Olm2TPPloFFxy0dzKU4oqviM7O7XFYkssbAwCuOu89fEGSxfcILoq0JxsQ5VhHmut
	6ZN9rBY6M6g5suwdhUjAR/NLTYMZoaGt1oTDB6VyoPwM/+kkB2+hCzayJEPkPJfH4mIX
	vyWEkH51S+1ZymOBGsnvInkdwxzPqps77fiv13vv6VfRTZIoZErSa1Ndichdaf8vIrVV
	LizzXYMevtqwYbx1QAbBtWczqIM0sW8wu4Ho6ywV2qvmq3Syv2DHeqPXJHOsngIT1LFb
	lW6w==
MIME-Version: 1.0
Received: by 10.50.135.38 with SMTP id pp6mr838914igb.36.1350462997422; Wed,
	17 Oct 2012 01:36:37 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 01:36:37 -0700 (PDT)
In-Reply-To: <1350462767-3772-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350462767-3772-1-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 17 Oct 2012 10:36:37 +0200
Message-ID: <CAGiJk9dEMv0bUAm2SpjWscpsGV6j1C+q9UzwQ5bdiha2oCoKFg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Maliit: Add initial recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 08:49:55 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/17 Samuel Stirtzel <s.stirtzel@googlemail.com>:

Strange, I've sent it with
git send-email --to openembedded-devel@lists.openembedded.org
--subject-prefix=meta-oe][PATCH 0001-Maliit-Add-initial-recipes.patch

But it still lacks the prefix on patchwork ->
http://patches.openembedded.org/patch/38195/



-- 
Regards
Samuel


