Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGHoN-0001pQ-JI
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 00:07:04 +0200
Received: by ywm39 with SMTP id 39so1039773ywm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bUQf1t1Wc3WpT2JgwrGLQrHDZ3gIlqui07wFJuNLBOw=;
	b=UNGbxH9D7vhFz1DM4FfQW+TuPjfmeLpvBN0ncKPOdeYVv0W+hLkFnGjGpBufkB1IBE
	fdKNHyMMsDSJEbXSbskx3ZcM5vxf5KYyDHtYfySMHx+LaavKuTwPWrDwAlXm1xjU/mr/
	gxW0WVLPZugDG0moXENGDUV8YkbwxhkwhwtKM=
Received: by 10.68.199.8 with SMTP id jg8mr1622877pbc.45.1318975271988;
	Tue, 18 Oct 2011 15:01:11 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id v7sm12694pbr.10.2011.10.18.15.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 15:01:08 -0700 (PDT)
Date: Tue, 18 Oct 2011 15:02:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018220229.GF27508@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1318971633-1534-1-git-send-email-pespin.shar@gmail.com>
	<20111018211611.GC27508@sakrah.homelinux.org>
	<20111018212425.GF556@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111018212425.GF556@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH][meta-efl]] dummy patch to try if patchwork bug is fixed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 22:07:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 23:24), Martin Jansa wrote:
> On Tue, Oct 18, 2011 at 02:16:11PM -0700, Khem Raj wrote:
> > On (18/10/11 23:00), Pau Espin Pedrol wrote:
> > > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
> > 
> > And it did not work since mailman served it as it is. I guess problem
> > might be in the mailman
> 
> Sorry I don't see the problem in mailman.

It was my web interface.


