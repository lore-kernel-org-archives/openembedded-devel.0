Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OzpNn-0008VO-Ay
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 13:27:04 +0200
Received: by bwz2 with SMTP id 2so2861923bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6TvFOelH4dmMkK+t0v5mYYsHqRAYxDsYRSwuIGOwf+8=;
	b=MACfSnvz4PFzEA6S11o4fpyAidqXw5ARbHPSNZ8SkzSZVj72F/1ijDo/d42H3unRHH
	xbZ8XLgMfWkLKAG38yvxxf+0RnVMjO5K8NtJAL3XBpLKw0o17+opzyt1wnXOQYad0mRA
	piU67mKs+UxIhoPRvv2b1O0fVpCk3/gxqX/rU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=b0af9LCT3Exa+mo2xLtrpiQzDD0vt8EXiwcu8vU/Wa7/qq5+moh1l2blGjb/H0/j3G
	tBW0ta45CIMt9WDLtZrjNPSGpLsx95IUQNd0lQIOU4ptmpB+nuScmGA8bGoAPx6fGbty
	IeUeCjERB2DcSqFHlMHmCD+sc1QFcnM8cfTbo=
Received: by 10.204.127.71 with SMTP id f7mr4013204bks.139.1285500412856;
	Sun, 26 Sep 2010 04:26:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 24sm3325341bkr.19.2010.09.26.04.26.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 26 Sep 2010 04:26:52 -0700 (PDT)
Date: Sun, 26 Sep 2010 13:27:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100926112659.GB6483@jama>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Sun, 26 Sep 2010 11:27:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 26, 2010 at 12:21:36PM +0200, Frans Meulenbroeks wrote:
> Apart from the opensync and uclibc recipes that did not fetch and were
> reported before, I did get fetch issues for the files below.
> Haven't had time to dig into these, so some of these might be false alarms.
> If anyone feels attached to a recipe or can say something about it,
> please take action.

There was about ~1000 recipes failing to fetch few months ago, I don't
think this number is that much lower as I haven't seen any changes in
most of them.

See my download status:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019206.html
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019234.html

but I was testing not only latest version, but all versions and for all
ARCHs.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


