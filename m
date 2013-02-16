Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6epj-0006ME-ON
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 11:17:29 +0100
Received: by mail-ve0-f170.google.com with SMTP id 14so3715265vea.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 02:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=gNgJJnTPSw/vpMwvoT1gscnJEFbwDpWhyVBKudAWWko=;
	b=OqSFm7pVxWwaY0j/YNLL5i3Lz5OA3JUGobCY0gqElLL0D0rT0EBscfTw6OMHNcyS8B
	zdu08BbhOgX2JqSt0PhZZhoSsOoAK+qfP14djkdvEM/WL9/lkvAuXUOIJD9XIYFopAeR
	UqxpYDcW7tF+K9I8j3FOMcC9aB53Wi0ZA8wLAl5OT0It/+s2KNDntsYSZDmigjdMs082
	4Nrh9n6akLbwPcUOVMMyjPq+Fg+tpB4qp/tQ+SotnT//YmArpnZVNjriT0pBLQmHDqxm
	gMDyFBmo8G2WyGl5/T9s+B985HXl/QBYyz7bX2XweM1EyfOXRBdQirtEYwXDUQGukhw0
	LBng==
X-Received: by 10.58.244.38 with SMTP id xd6mr7296945vec.29.1361008882498;
	Sat, 16 Feb 2013 02:01:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.178.8 with HTTP; Sat, 16 Feb 2013 02:01:02 -0800 (PST)
In-Reply-To: <CAKSKmM061jii+YZzn-uBFuMoGW8eeR0y6OCoDkNxDwpTSr=gDA@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
	<511E200D.3000907@communistcode.co.uk>
	<CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
	<CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
	<CAJTo0LZbQ2YSR5+1vSqChMDq85Rnj+WgMr=U4=rdrePBsp27KA@mail.gmail.com>
	<CAKSKmM061jii+YZzn-uBFuMoGW8eeR0y6OCoDkNxDwpTSr=gDA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Feb 2013 10:01:02 +0000
Message-ID: <CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmVbfGWGV8DZiMKNDNLN1kK2ba8/43F5shDfliaN0H+uXZCh4dYeAnBHo+aaNnUS0x+s0o/
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Sat, 16 Feb 2013 10:17:30 -0000
Content-Type: text/plain; charset=UTF-8

On 16 February 2013 05:47, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
> I just followed the instructions given in that toradex website.. Its what
> giving me the following error..
>
> /home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES
>
> What I'm doing wrong here.. What should I do to overcome this.. ?

You're not using the oe-core revision specified on the web site.  You
need to checkout a specific revision, and not use oe-core master.

Ross


