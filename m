Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.6293.1589292368047895145
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 07:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=pYfVfZtV;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M02k2727z4y
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 16:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292366;
	bh=iyhXsl16mOrdqVSOmaeAQUsZsIEcAgiDsHw70UMDuZA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=pYfVfZtVYOsf+dtJBpGOBjWhGr+OLaGrOrz5KETJDJPEch9DbgwbRj4ydXib1j0qX
	 rTenamz9+eTaMQcy+1f54N1Ey6KvpNDmSd7darAbHS7qpKlE4K2aMRdHTczJgbidHx
	 xYk/FMjPlB0NDNzdNBzw9gtY91oNfyy6ocLttN3DFh4LoaKX7jr8rQw91VR+bFlByw
	 NqPjPJs8BMWeahNCTZBsIhiZfCgarWzsF9/NS1WR2d4lpJUGftx0CE8XW9dMzBUv3Y
	 4lwDMrwdnh+X6Xg7s+v9swtvpCvvUOnKi7HB9jXwGCMhPScMWT2tRMgyZ9xzK23rRz
	 m3VTgcwdKXrmAmOo4qzepmR5983GA4Ncobcjo0YuVFfC9AELKjQaljFDOjFtnAz/j8
	 t0GWfhRkfWjPUNESRkfxVTbbZqkHpLzM1JACZHON3hwqbwRFoQKnTvQtKk+vQTvVgU
	 FBBmYxfnedlvdZDiTea2v6UyaMUhmLgauzi/OJzFsZJRcdn6reZxA8PhsaMj61iC9+
	 nEvyZbgTBc7ewagbeUggfHRE7vdImXdukLUBUt30ubGfbumlwSILOWFGObhs/GYBNg
	 rJXv7LfyT5fvPMIRKvCjlsuqLhl5lkEus1S3fP5USu7dx+UiQ1HkEAebLxTmBBPZO+
	 38LXbRRZOBvrRP/9D8lYgCgc=
Date: Tue, 12 May 2020 17:05:59 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [OE-core][PATCH] iproute2: Remove -fcommon
Message-ID: <20200512140559.GB11943@localhost>
References: <160E4C67E260FD9C.10721@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <160E4C67E260FD9C.10721@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Sorry, wrong list for these patches.

cu
Adrian
