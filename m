Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id F31766EAF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:41:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BGfKUa021551;
	Tue, 11 Feb 2014 10:41:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BGfKhU005449;
	Tue, 11 Feb 2014 10:41:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Feb 2014 10:41:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BGfJLl026038;
	Tue, 11 Feb 2014 10:41:19 -0600
Date: Tue, 11 Feb 2014 11:41:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140211164119.GM3131@edge>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
	<1392067015-16328-2-git-send-email-denis@denix.org>
	<CAP9ODKpyPBJMu+ieCKBZarnGaJTTpq+4w_3zHJxPEuTrSi=g7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpyPBJMu+ieCKBZarnGaJTTpq+4w_3zHJxPEuTrSi=g7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/3] packagegroup-qt5-toolchain-target: add Qt5 SDK target packages
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
X-List-Received-Date: Tue, 11 Feb 2014 16:41:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2014 at 12:20:09PM -0200, Otavio Salvador wrote:
> On Mon, Feb 10, 2014 at 7:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> This includes some new package we were not installing. Those are:
> 
> +    libsqlite3-dev \
> +    qtscript-mkspecs \
> +    qtxmlpatterns-mkspecs \
> +    qtsensors-mkspecs \
> +    qt3d-mkspecs \
> +    qtlocation-mkspecs \
> +    qtsvg-mkspecs \
> +    qtdeclarative-dev \
> +    qtscript-dev \
> +    qt3d-dev \
> +    qtlocation-dev \
> +    qtsensors-dev \
> 
> Do you want to do a commit on top of mine or should I just squash it
> into my previous commit and put a note in the commit log thanking you
> for the contribution?

Otavio,

As I mentioned in the cover letter, I was already rebaing this on top of your 
WIP branch and should have the patch ready with the above differences - you 
can apply it on top.

-- 
Denys

