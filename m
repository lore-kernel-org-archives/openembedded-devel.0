Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4469D60125
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 02:32:22 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id k4so23425000vki.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 19:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r1NE4Zzkg+E5Obhlhq+mZHv8Sc7dO1+Eibw9IRw5EXs=;
	b=VArFAFrwpc2qy2EHp+P026pXT6iVieYqoXOqtP8Fx+jWWYw+YVAZsIuKQxDLMpY/84
	LtETniSO6Ufo95QjeBmt3WD/00kzPEJuHU1SlxG6A6Qw47rdH852W6sNQutQiAQZ5R6E
	7X+zbI1RFxAdSLy/SAyz597LCPmRG4Pyfk5yapYC+ZHGlAUfDnZ7/nbSQP09S9hjLBz6
	EVy312hny2dTqJcZ3NCYn1FY8A4dbfB9FoY2rP7MqDyvisONa7WMhA8xqShI83+CNqiA
	iLLlThWWwf6vR1w6ObBcwTsn/wmxX2k3uQ85uEIMaLlkAhBw1XJbzLi8ITpOQKwFWKLg
	xsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r1NE4Zzkg+E5Obhlhq+mZHv8Sc7dO1+Eibw9IRw5EXs=;
	b=Xg9fYWtnoTv3pendLBH991DFLUS/2LHiROHsGTNzlt4qjTn7OTxq/MjL0oT2EV2+Ke
	XTJyjwSwZjkQ9ooOrsqb3c79nyr8mh6i+9YyddUDB9UCNC8qL1AKSekJoNue9pBkfjuV
	iSVZewMC+GNpeZHl6+/M8OiaZNoi0HxnBfaTopDXG38dzlLUVnuyR7LiqtwpgwGkjuUI
	Ntt4mxMlNEeG11yU5487y0M9mLDrZMnQXjuZ6y4ATkAScJHEvA5coE8JfqPErExvYVbf
	uMkwGDAWlvbzzqo3OBOK2iYA+5wjZm/5n254GEyGQTJ5+TN1MFFZszBBTocNRIs0Krvk
	UYTA==
X-Gm-Message-State: AN3rC/4xjWFdV3hEAN9P5WWCUMvJN3zJknOSgifcnyIlBCh9cxVahhlM
	wc4XbesLmASxumWhbZTcHd2xWW5Paw==
X-Received: by 10.31.235.198 with SMTP id j189mr11164vkh.75.1492914743971;
	Sat, 22 Apr 2017 19:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Sat, 22 Apr 2017 19:32:23 -0700 (PDT)
In-Reply-To: <20170422211821.6015-1-schnitzeltony@googlemail.com>
References: <20170422211821.6015-1-schnitzeltony@googlemail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 22 Apr 2017 22:32:23 -0400
Message-ID: <CAHUNapSfyH++CAThH7Yb69=xe-Btf8-eNJbBHnkn1-_H2W2-nw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: show progress for do_compile
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
X-List-Received-Date: Sun, 23 Apr 2017 02:32:23 -0000
Content-Type: text/plain; charset=UTF-8

Sweet!

