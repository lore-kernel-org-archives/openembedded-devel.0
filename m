Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE3260167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 10:19:03 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so13475868wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ea5QPNQnIcOesnJH6cQmAMzMc4SvwKdkXWG6R3iO65k=;
	b=bQnvNE7fA7uVEVE/OBmDCLtiLQkW3tKhcEg/dB0HG6eDer7dUGIAe9p62/AiTjcqeE
	jaCJoEc6CsiXgWpY7PfFdFllSu937m4WttXsEhGe6r+p7Eg6+nIfVFHHkBxdRVZvGO34
	VBkiR/ARNnLrtaQl0fWEmBWOcfkmzFE+NzaXR1rxVzI8Xv0Muzxw6opnpB/R+k7nM8Gu
	paYBc/qc+yxysJko42Yvl5qFE6/478+ihouZMaL7ybyQwW2DVV8qVUCNLF1lT96mYoG8
	w7Uq3Rn4mZCf/ERz/PJ4r6gvptn2OZo9ozGr0GmbvHzaTOJ0+/Vsbjcdm6v/LcEiC9Jv
	I0qg==
MIME-Version: 1.0
X-Received: by 10.180.218.227 with SMTP id pj3mr3483590wic.59.1435313944016;
	Fri, 26 Jun 2015 03:19:04 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Fri, 26 Jun 2015 03:19:03 -0700 (PDT)
In-Reply-To: <CAHvQdo0+mDR0Gq8DuuMgCp3j40ALA3T5xOd=6E=85uXUWZtaaQ@mail.gmail.com>
References: <CAHvQdo0+mDR0Gq8DuuMgCp3j40ALA3T5xOd=6E=85uXUWZtaaQ@mail.gmail.com>
Date: Fri, 26 Jun 2015 12:19:03 +0200
Message-ID: <CA+chaQdXT-dmhjoi+UtwKvjFnzAUpjGo2YwW3yGJixu8PEy7GQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qt5.5 test with branch jansa/master-5.5
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
X-List-Received-Date: Fri, 26 Jun 2015 10:19:04 -0000
Content-Type: text/plain; charset=UTF-8

Not yet, it's just WIP (I've sent the same patch to ML a while ago, but
didn't have time to finish it yet).

On Fri, Jun 26, 2015 at 10:55 AM, Johannes Pointner <h4nn35.work@gmail.com>
wrote:

> Hello Martin,
>
> I discovered our qt5.5 branch and I am curious if it's useable to test
> qt 5.5 rc?
>
> Thx,
> Hannes
>

