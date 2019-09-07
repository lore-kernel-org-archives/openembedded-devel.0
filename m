Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A4AC47D69D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 10:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46QVnc4Z0Mz4q;
	Sat,  7 Sep 2019 12:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567851669;
	bh=qxDBS0IY1bLis8aJ/i1HCFklLko7xyC5Ro4brzVZceg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0YobBrAmvh4CHcEiHQ/iLhIt8Gbr5pPE6t6F78Vt89TqlCbOAaTAptjKFhxnbdwK
	yGNUkhgK5dxhLJrG4bywiK+ZyHEv+ZQyVO3TkBqTnBs2F3kMx6wuh+bvJbxuYoXWPM
	2hkmE/BmgAR67mnufjlCVtjEqerOSFHge2NKTM2YLr1KxqqhYhAWr090JUqKrI71Sa
	QbEPFj8mljwQFg0qvrtn4UQCRy8PB5hSkOa2v737OyEzxoavXoxCcY+E/P4gGpWGie
	ff9BSqDhl5QN7YbZ+mLoZmUn8J/8I3xMbiXXsmedT+YhQojjvIkb5kpdbz9zvoZ96W
	17dPEsJjStAr21ToTz2h96k5/D5lSH1zwp8f6WilTOGrmho9IAXk0a3BJ2AdKg9hta
	igUvhtd1DgM5/q43S1ZhIr79yg1ZrznFETvrKTlhM5513G3bEXe6pcDHBlW3CCYNry
	nFPGSSh9mJ8/y24Rf7F/Q6TVMg/5Mk55VAq++euUcgJWmAj/RhVLNziIbLZwwb54sg
	zMRo4wRhOTVRL2dauOtLuyGc8SgRvyCDdhAOokyYA9S4dCpYYJhT+ADbpozNaBIjjW
	sA4tu77ILEQ6SQgVv7NPYBcdPMhaDBa5S0dhskAj95oIksYtCe8YbWl8eAJeulitWy
	bbDEcu0+Vnc/g98v8VX+3xe8=
Date: Sat, 7 Sep 2019 13:21:06 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190907102106.GA26201@localhost>
References: <20190906212513.16415-1-raj.khem@gmail.com>
	<c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Sat, 07 Sep 2019 10:21:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 06, 2019 at 05:12:24PM -0700, akuster808 wrote:
> On 9/6/19 2:25 PM, Khem Raj wrote:
> > Newer kernel UAPI headers for mips have moved these needed defines
> > around
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> warrior too?
>...

No, this is not a problem with the UAPI headers in warrior.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


