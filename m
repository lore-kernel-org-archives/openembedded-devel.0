Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id BFF0B65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 19:11:41 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so82091791igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=25sUPGVQsjo4MWrcKABWG41UVvAgkNm5pnJFHcuZF3w=;
	b=bwnX9GtuT9PEb4Nw2SpQK5Me4W6hoobouceCNlHfxGJNdSk8bVrDWH5nVcsnftzgTx
	8a4XUKPcauG0KM53tXttzWK32REef2hlNHk9oFc1O4m3bQ2Pk/9mBnXOADiZ6/2b5Eo/
	e6l8wQCHxWNA9J9XUGSauVL2MqHsVndB22QV7SI6o6N8mVBedqp4I1qBVV3gitAtUVs6
	62Q/Puo/JP6fNxErKolCxkWrzLvAGuRurnKPTD93LKPMvDYgkoXXMi07wZPZjAa45JjP
	Hhv9DN+mgUhS6fSuf2f0ct9dDtCtk3CWHe8GLGZSgBHI96JF+UiOp5eyfEybmL7RB9/t
	eAZg==
X-Received: by 10.50.142.40 with SMTP id rt8mr43115077igb.68.1441739502010;
	Tue, 08 Sep 2015 12:11:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Tue, 8 Sep 2015 12:11:21 -0700 (PDT)
In-Reply-To: <1441738446-10033-1-git-send-email-akuster808@gmail.com>
References: <1441738446-10033-1-git-send-email-akuster808@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 8 Sep 2015 12:11:21 -0700
X-Google-Sender-Auth: OqJlxB3wi_khl5cc3lO6ZbK4j_4
Message-ID: <CABcZANmCvMggyaZfB56zFeqV+X8L1+2TLFFYuY-gyLycQ57jhQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH] netmap: fix multiple build issues.
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
X-List-Received-Date: Tue, 08 Sep 2015 19:11:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 8, 2015 at 11:54 AM, Armin Kuster <akuster808@gmail.com> wrote:

> +++
> b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
> @@ -0,0 +1,33 @@
> +upstream Status: pending
>

s/upstream Status: pending/Upstream-Status: Pending/
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

