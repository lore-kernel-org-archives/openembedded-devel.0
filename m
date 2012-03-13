Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S7Vzj-0004dK-OL
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 18:58:47 +0100
Received: by yhjj56 with SMTP id j56so844559yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=9LoH00/y/Sex35GzA0BEX7d38+6nhlhLv6M23n2l09U=;
	b=byNrn4JN1krtGY1cDm68/C+Ycqe0BYKluRKyDB1suvFmRRn+UoxFCmNIO36udxkzrJ
	3UYklv7A+stGc1gIOHovupWyPFfWtjfsUuYwsrl3KmgPNYht9+s4jE7YmbhGuYY/Ee5r
	bI+malOqlYhxfEwdScGiaf69rkPBiyb3WVB1AQHuXVJTyWRLb9tJ9GSrDTAgRPZrq1p9
	OTylTNfKTKPJckYG0PCP9W2udiZ5jvlrmopeOQCnDO4nPM+gCWwm3T2PTBgZbwhcvkVd
	+5AEVNsmvmQzvQ4i4EFs3qWu4QsUJ1fzg3cqnpdhrGdNlWOzJz6bVW+JE0ZnWyd3o56v
	NFfw==
Received: by 10.68.221.97 with SMTP id qd1mr10816565pbc.42.1331661002701;
	Tue, 13 Mar 2012 10:50:02 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id 4sm1016323pbp.76.2012.03.13.10.50.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 10:50:02 -0700 (PDT)
Date: Tue, 13 Mar 2012 10:50:09 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120313175009.GA12674@bill-the-cat>
References: <1331273267-17295-1-git-send-email-daniel.zauner@me.com>
	<20120312210046.GC9300@denix.org>
	<CD70E85B-DF24-4844-8DD7-09D893416344@me.com>
MIME-Version: 1.0
In-Reply-To: <CD70E85B-DF24-4844-8DD7-09D893416344@me.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2 [2011.03-maintenance]] Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org
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
X-List-Received-Date: Tue, 13 Mar 2012 17:58:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 12, 2012 at 10:06:45PM +0100, Daniel Zauner wrote:
> Thanks, will do. 
> Do you want me to re-submit the patch?

Yes, please.

-- 
Tom


