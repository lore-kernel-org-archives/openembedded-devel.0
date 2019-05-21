Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3607E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457R4S111lz44;
	Tue, 21 May 2019 08:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558420888;
	bh=gF2Dkhd6kDDGY9UnY/oyuo9GVApXH5gucGJl+OhIotw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPJVojzxy0GIz0nTBf/09B2DCQf9n2wC7L7RjiMH0uZaQkJVtNr8pFqRGmqBU+Vrp
	3BeszjTfx6+24hOL+uDXZ9q+iMe/kOT7FbG+cnSd8s/2e2fEv1nCB+hIeHV8KxKjgA
	EnwUI6NkwsNPHPPFnX8Z9UV3I6jryLYN400m5J28NHZTcGtTPYmvRzSpYuFY/4xB3Z
	YUUIhL0ZBrQ0u671uNNMuXG7HOfHDTxOfImsaGdpdRHRWkIxyCSzb1AusFOmrtIAOx
	YdsRoXzPI+97EM+C3OhWOrPW0qfntMRjQLem0RtaLIsthh92hp0bq6jPDbxcff5h7H
	lrKsm8VSltgu5yoGj8pHEeTnZa6nOlQ8XQChrdtgvf3NcfrStovEiFqtvg8GrAkLbP
	ovXd/qEAVlyMtGehmvSM1l/M4671WmXV2OomhsDR6cIA/xBOwuC0VijZFZyzk9I73E
	6S1MO/Nb6IUDVkw48TXpcG2WKpt27G2276EZw7v6KIadc2SqaLdAjw7fDIzBo3b/I+
	a/u5IrWtxatTYECHnggmSRTFHnXjb7tgGdoRAVpcdvopdCmnfTbuGAojfEmpGPgGz/
	+I/jH+tLJo1o/u5c3/CB9F8SQtpXmaexMOkyUtfEfm7nIde1g0raccEM3Q1pmy/w7p
	GfR5JqCWr5h8IPXXSNNmyQfE=
Date: Tue, 21 May 2019 09:41:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521064126.GE9971@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<07bd2623722cf6743bc112eebbe02a6125823c99.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <07bd2623722cf6743bc112eebbe02a6125823c99.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 03/34] php: upgrade 7.3.2 -> 7.3.4
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
X-List-Received-Date: Tue, 21 May 2019 06:41:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:03PM -0700, Armin Kuster wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>...

No reason is provided why this should be upgraded in a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


