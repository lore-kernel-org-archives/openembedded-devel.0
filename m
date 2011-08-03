Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoiyY-0002wv-2p
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 23:27:38 +0200
Received: by ywe9 with SMTP id 9so760480ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mTSWPHCebf8KbLANmhg7NPP30KvPphuvs8Z8tZY4ovI=;
	b=i7I4yBiXCjBM2CAJNplCxcU7gUTQwi3wxSOseYsa/4yLqyccsNGPobH2Zjohq8cBx5
	oOBmHr/6lJnKJKVQE6qCJn+/GBt4EzeghTestdcIjcp2X7XKp2a9AGS3rTl+1dLwVBny
	yT52OKibiz3C4zWoZQmloowncQH+GEA6Z5S/g=
Received: by 10.42.105.146 with SMTP id v18mr5037467ico.429.1312406594392;
	Wed, 03 Aug 2011 14:23:14 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t14sm795540ibi.6.2011.08.03.14.23.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 14:23:13 -0700 (PDT)
Date: Wed, 3 Aug 2011 14:24:44 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110803212444.GA15084@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<201108032018.51667.schnitzeltony@gmx.de>
	<j1c561$jr5$1@dough.gmane.org>
	<201108032259.47053.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201108032259.47053.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe 00/19] Add xfce48 desktop system to meta-oe
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
X-List-Received-Date: Wed, 03 Aug 2011 21:27:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/11 22:59), Andreas Mueller wrote:
> On Wednesday, August 03, 2011 08:48:33 PM Koen Kooi wrote:
> > Op 03-08-11 20:18, Andreas Mueller schreef:
> > > On Tuesday, August 02, 2011 10:32:19 AM Koen Kooi wrote:
> > >> Do you have a public repo where this can be pulled from?
> > > 
> > > Before pushing to
> > > 
> > > git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git branch
> > > meta-xfce
> > > 
> > > I did
> > > 
> > > * rebase the patches on latest meta-openembedded commits * Add README (
> > > Khem suggested )
> > 
> > small nit: the README doesn't say that it depends on meta-oe for e.g.
> > iceauth
> > 
> OK - but what is the correct git workflow to fix

If commits are not part of upstream or public git repo then I would
recommend rebase and squash it into the relevant commit.

but if the cat is out of hat then add it as a new commit


