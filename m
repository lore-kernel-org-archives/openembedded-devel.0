Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 881D97DFDB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:49:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t5so16073494wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=OD2encPwFwwJckB4fyCLK/by6lQDSspU3gsIBYqwgCU=;
	b=msDyRQBct/bzumcV7YHgNULsj6cR/GNoczT332UF2KsfYEc2LROLMyvyH7nd9oN4jn
	/mv9dTJPsygVkw/NVJl/lhLgj3XooFW1x2tuOJWAWu/V/ql/lks90HpL/y5wzVmAIbyc
	Lzt0QmyoevGAAqGxDwtgAaH1YlqmshNSLqMr3vEYZM8tmSqROFbz6sdTxgzyx6J7+Exe
	9Nlq6//OjS8unGVWdvsDVwNMjEzN7/1pnmYgXIzPNqoiwaho4zCKUvi/l9FdW0xIRMOb
	A8DmWz0MBzbmY77WKqXoC+IpKEHkcyMmOGtSOIrUqmALcKMUrA3IyIKrSMMO+eGGhcox
	hvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=OD2encPwFwwJckB4fyCLK/by6lQDSspU3gsIBYqwgCU=;
	b=SLpnzz8eUoBZNZ7oQmCcaKmWBYeEk/ZHi47xQV82vYq7pBohZGMxYyA5w/K6yeNN7K
	lhKeUFqXIr3+ODjiKlFEAhlkADs+n6qVMpyeoS9mbKP/mf4NZHyc194ITmjEFzc34M5p
	5e8iO5yI9ZvAD0qigc8cLNwCtkrNa4I5C9C/IplKiu7/SjW0rizGJI26EY+NuKwoOn5s
	3KtGQL7/EdA4HMv1PCa1VEZ9EiATOALhcoZL2urG7rvyL5wWK5NFd1yKeZ+uX9Hv2wkj
	Tvd/4N0Cg37uP7CElH1oJI09B4AV1G1Dt/cR6whqX4pJlCCkIG/zlw8bus/MQw58jkUB
	IE1A==
X-Gm-Message-State: APjAAAU/YvcGolci309UJB2aNp1ndjce5DyjLW1YKuA9jYMg91WIWpnl
	Bn6a4TyU6LonUuIB+cXTU4zwb+HcFmaT6aoervQ=
X-Google-Smtp-Source: APXvYqxv9QpYHs7w9ocL7KgxQ/mxnQhDrVaxifBkW4nt3894xsZvvu9CvuwlGiytHhUqyh0iqVxJ92bIEItuXMXmCro=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr1943031wmg.71.1558968593171; 
	Mon, 27 May 2019 07:49:53 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 27 May 2019 16:49:41 +0200
Message-ID: <CAAfyv34HAOaAaO1cyiQbR8P6mQPp8p3gCT2jM=UyQDGfvV-fYw@mail.gmail.com>
To: yocto <yocto@yoctoproject.org>, OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Cc: Enrico <ebutera@users.sourceforge.net>, slapin@ossfans.org,
	aguirre.nicolas@gmail.com
Subject: meta-sunxi maintained?
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
X-List-Received-Date: Mon, 27 May 2019 14:49:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm just curious if meta-sunxi is still maintained? I was contributed
to layer back while and when look now thud branch is un-compilable
(dri2proto not replaced) and warrior branch not created yet. There is
14 issues + 6 pending pull requests. Added maintainers also in CC. I
think it would be good to have sunxi properly maintained as boards
with sunxi processors are popular. I can give a hand as co-maintainer
if necessary. Thanks a lot.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

