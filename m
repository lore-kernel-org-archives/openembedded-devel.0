Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 693B062252
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 07:14:34 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id fp1so19522656pdb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=149zJSKIQjE+TvmHHswsqRl2mj1duWuo+THGS7/xA7g=;
	b=EZf9pQQ6o/fVXSI4dENjRvoSf3U1JC5IjvCHGXxieKpDcmy7bduImq4EO+W/EoPYvq
	GvJvejAD2ZNt0BQiN214Q5e2eZlYGBwkqK52R4XyIYIvAmAM1OLmu3ByBiyZ4Wevxxwx
	QeoLMlfMS9WzO5xxF57V/5YYP1k8IhQTcyAvM/LGzbOo+Vr9qT2r8pPLUhttmrBheDLw
	IAUC7P65W/4ba5zjUfJLHU7bvOWG7Bjqei05YDA+aP+qPGIfMAzvtMm854XNBZheNSnG
	15JD2gYkLcRRUWLp3dI8Auy9ErTnQ8CHld9TK1kYxj+1f6EduOnyYeQFzpeCARfEKAdj
	CC7Q==
X-Received: by 10.70.49.166 with SMTP id v6mr8542023pdn.142.1408950872026;
	Mon, 25 Aug 2014 00:14:32 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id t7sm55963173pdj.94.2014.08.25.00.14.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 00:14:31 -0700 (PDT)
Date: Mon, 25 Aug 2014 00:18:17 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140825071817.GH1014@haswell>
References: <CAHQecY4aMx0ytkLRf_0wjwO2uGvt6H8=sCaebzCAWL5FDR4-AQ@mail.gmail.com>
	<20140819133612.GS3660@jama>
MIME-Version: 1.0
In-Reply-To: <20140819133612.GS3660@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][Patch 1/1 v2] gypsy: fix QA issue by removing EXTRA_OECONF
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
X-List-Received-Date: Mon, 25 Aug 2014 07:14:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-19 15:36:12, Martin Jansa wrote:
> On Mon, Aug 18, 2014 at 01:26:45PM -0700, Tom King wrote:
> > Addresses QA issue in:
> > 
> > http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095778.html
> > 
> > "4 gypsy-0.9: gypsy: configure was passed unrecognised options:
> > --with-distro [unknown-configure-option]"
> 
> For some reason patchwork changes author to "root root"
> http://patchwork.openembedded.org/patch/78537/

Thats because Tom's email ID is associated with root user. I guess we
need to change that.

