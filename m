Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6DFF478D9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 22:12:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s16-v6so2635230edq.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2018 15:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uzfJfOFK7MAco/W1feIdatLpaMwv8UUOi8qkUyr0DaI=;
	b=OnW8HYzA7HpDzL2adcmSCdT/f0IvhWoZexHtX/enLq1bTIFlLVCPFhupmgy8JW8WFu
	sEZ5+uCcFVKoBKxZB3+bAXL7JCZlr/9kQ22NzlLGDTEwBYhod0fiiXE4Xm89U9kQEEgu
	rZAINisbDKxz+db382OYiU5GjBloCTByIRMIBOi7o/A8ttiQPMjeNcL9xDoCd+MLQeqP
	GSe9icQa4A4qupXYUVBcyqkAKRtFvKqInlDrcgF5mkaRA66uEVZjxTCQzi+StHhfShrY
	lJxMMjUXhBd79TsrCZR/5S850cMwhv/EZCxCghnm+FSSw2DUd3cfft4mknSqrZBNg3wQ
	5BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uzfJfOFK7MAco/W1feIdatLpaMwv8UUOi8qkUyr0DaI=;
	b=HZKBPId3Me2j3PJSsV8/V3C3pu86/t3kT93qVfpM0IZydSwYRkxuh621Wf2QNKy3zV
	L7Lrt6WtHOA8jitTiPd/Lq8LnLlVCeWH5DQBQqWBBbtkaWc9127QyJ86jY4Rp+CB67C/
	eynjgA6xYkPeFro1pEj2zMwzAMTLcE77V4xv+p0jX9fCptrNDeKTgay93gp6qSamsumm
	lmGAIe5581Hfs8XVdqbsrkI4GMsN/aTQ3HXp1KO8dLl04skl96ZNU9IqGdAjWp7tDqU6
	AmpD0tAEXozmgfEyghtZHlxIywwTs4fwci8HJwzxUeFenHliu44wT73ybqaCB77ex582
	q81w==
X-Gm-Message-State: AOUpUlF2XshVKLhTwiLeQ3ApjFsV2P/ySVs53ZE6tPbWOzqUnXb3wuoI
	D+1fBTkY/PC75FuKWo3bkfY=
X-Google-Smtp-Source: AAOMgpf4Evx/RRWqsJJvYNiU5Mo4QiaS+sD9H463ObJC17N1hyVrpgVbWijh4YbpcesdXV7jV0cI+Q==
X-Received: by 2002:a50:944f:: with SMTP id
	q15-v6mr9054580eda.70.1533334373147; 
	Fri, 03 Aug 2018 15:12:53 -0700 (PDT)
Received: from Saturn.local.all ([195.48.14.138])
	by smtp.gmail.com with ESMTPSA id
	s41-v6sm5214135edd.61.2018.08.03.15.12.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 15:12:52 -0700 (PDT)
Message-ID: <1533334371.30932.14.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: William Delacre <williamdelacre@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 04 Aug 2018 00:12:51 +0200
In-Reply-To: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
References: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Subject: Re: Actually installed packages
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
X-List-Received-Date: Fri, 03 Aug 2018 22:12:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi

> What’s the difference between the build/buildhistory/packages content (all
> the packages found here) and the installed-packages.txt file in
> /buildhistory/images/...... ?
> 
> I can see packages in first one which are not included in
> installed-packages.txt

A recipe can provide several packages, usually one with the same
name as the recipe name, then the -dev, -dbg, -doc ... packages,
but a lot of recipes provide additional packages.

An image recipe defines what packages need to be installed in an
image.

Even if your image requires only a part of the packages that a
recipe provides, all packages will be built and will be visible
in build/buildhistory/packages leading to what you describe above.

On top of that, if you built an image which contains different
packages before or bitbaked single recipes then those would also
be seen in the build/buildhistory/packages tree.

Max


