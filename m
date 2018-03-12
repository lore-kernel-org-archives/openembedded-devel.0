Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id C33BB7886F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 17:19:56 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id r66so1468208ywh.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ziMFDmcizVw/HKzX4CFbEQ+0h/nCHY1FKPAaX8g6rfw=;
	b=KE2y1WYXXEkZIYPf7BrQtVOLatWlXnQZyijwjQHpPPQgmBEW/g35gybxiHtaOcZ5kP
	4+CKm78kJ2E31/Dt9VtnaR8fevjQHK/9R/1k6dNqcRMHCT6WTOX+RzqW6VK8Z2RnEopJ
	dUQ63M/FaTtasH/c5wcxgd/BUPc8QUOEUwEISuxBBY55mb0szUKKjNwApyg2OqVVZ646
	GEHc4ZUoDMZxzEXsojn4Nk79+vLCpGgAxNXXUd5Osa44BV8p9JJ+F0Ulm3s4BgqtaChC
	YN9lzd+wyms5L2hQiOsZT6B86O8h/f0T2xtAa4zwngL7vrV6LskRAMq78VS09L/nf+im
	bHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ziMFDmcizVw/HKzX4CFbEQ+0h/nCHY1FKPAaX8g6rfw=;
	b=LU96bCgnWunNIRzYzGUauiWkSHYDiFrDiwOEqfLl/slyFG2hSvm10/SjsP9m+xYca6
	Xl93qNFyalOEwJDt6gMY2AIO2LhCfvv17aL3hVN7swG6Qzz6gMCcbL9TLCuzWACzWpzE
	gg3ELw2+7MsDUVsJxRsrg1a9hCsG20aqSgqsHMeVsQLTOy6BrMwdE7rL4i4n4fCLmb/2
	TT4m+GaLNbfukqXRcTIc91VKYNM8C6NVdmPzUvjZ5DKCWlsTwbGvngeU24VluJ7wFhdP
	gMln+XgHcmp5QeHIQnwkxZ5aRDmqZuUZSl4Zcel0gQq/MxBfAVH0/rP8233pGs478pf2
	SAhw==
X-Gm-Message-State: AElRT7Fa8IPOn2q5yzuMa423liPcSpM7/t5scZt3qDbLlHe7iAJvmKma
	gwxXwlYGl8/uUiT7OUTleIdt922vapQEWzNjQdA=
X-Google-Smtp-Source: AG47ELs/EctA/GV4s77fGfeZfT6t9ppAJt6fzGiMlHfFyaQjPw8Xv2s/QGMRMcqJy/ipX+vuo3rwbjaZCSwkYQ1Vbbs=
X-Received: by 2002:a25:2d48:: with SMTP id s8-v6mr607731ybe.224.1520875197719;
	Mon, 12 Mar 2018 10:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 10:19:57
	-0700 (PDT)
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 12 Mar 2018 18:19:57 +0100
Message-ID: <CALbNGRSZrac1fEjm-=T19_wUHNcAp=n80KY8hcAWfwgV3QDv4g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/12] meta-xfce updates + fix
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
X-List-Received-Date: Mon, 12 Mar 2018 17:19:56 -0000
Content-Type: text/plain; charset="UTF-8"

ping?

