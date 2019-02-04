Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 70D707C2DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 16:10:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43tXjy2Hxxz2Q;
	Mon,  4 Feb 2019 17:10:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1549296631;
	bh=U2SoSKDf9ItF8oYH9Jve214cWFtLQdHiKYvjoFybSwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZte7Gr4/iQym9gBkXkjLM9C6D7FpAuQDgedSIS/x9dOOyQiS4e38hj/0HSZ+AQqv
	T1w6IeifVUPTZuRid86pJQHWiiV46+95zGYFDvSc50lE6tBB2vOL2X0tvZUD7mwPez
	P49yLSXGO0sJq1OFs13aXQYAqt5eTQcB1ZOUKwy/puTK6kIHwPFKip95f5das5VasX
	YbWbkuQhChh/4KfYcYlQTp2DdWsnwyAHhN1e3zh5hacgZlElBD2DdC63pp4pdWrvld
	Hn7EbB2RfNYCTf7N2LMEoDN1spmQ/WzrDh+C3zDgfbCB1XygFaiI4DwLjHVDHJ3vr5
	C+dg0NMcWYNP9xuYV6I7csB60SLDFdIqfPw7TREZmcuJ7jRBvvfppRg+FGPALKLhNm
	xOXl9/kxi3j25QxQvDDelUZH0BAxoNBJb9bwUmVgsWzR6TgkZgUISMvBO0kXiegpXi
	hTU3oPsRUBUwIQL6MbiKN2pWfI6X5cRWU7Xu4BamvV053BU2xDwGO/NBCUpqczKlWm
	UHz1/cyUTYE5H+FtTNnbBfvfUm8VCIUAkk7atKYxKBC+2uoRA5+qvVtN9gGG49ZerI
	fhqcRHbd+cGnvyvbNkyZMKMIiSqkAVILESwt38lLF785fp3upcQTFTiTiUTURn0a2K
	GMOnVmvoVLAAAJQV/Oa+Y7HQ=
Date: Mon, 4 Feb 2019 18:10:28 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190204161028.GA17997@localhost>
References: <20190204150204.18007-2-bunk@stusta.de>
	<e8244752-a10d-1ae1-5b9b-2854532e4a24@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e8244752-a10d-1ae1-5b9b-2854532e4a24@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][thud][PATCH] wireless-regdb: update 2018.05.31 -> 2018.10.24
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
X-List-Received-Date: Mon, 04 Feb 2019 16:10:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 04, 2019 at 08:00:18AM -0800, akuster808 wrote:
> 
> This is a big jump. Is this a bug fix only update ?

This is data describing what your wireless device can legally do
in your country.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


