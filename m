Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U7gci-00062f-UT
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 07:24:21 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so4376983wid.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 22:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=hXgEoGnX6EQXASyLt7kYzbmu2sRGmtP44FriXGNZpAo=;
	b=N9EdIH4CYVFWlGelXxqlv/KpHQBswBTfPPAjaEXIc/P5JZmlBQ7JxyYDH46ZlDx0Sj
	OqM1LrN2vTzm9wdBIkwUavlR1EYiOyWiwgZVg7J7RJx8WEJGVJ78LczjKwejx8tzuJkc
	vdnP0BZEJWnoXZKKo+cc927TGOTDx0KlwABLKUv5Nzl1+XdJKrl2cPVEwU1DpnRs4+og
	TCqjEpwt4Z/Vmbd9A61K8BSy38V43AUzjVDi6IcTUYym95IrIvpX6wop3U+Ndhl1ugjX
	U6HceCGPynTu6ZliybM6jidCFcqt7GeL077EQNyE4zBXhdrlt+vj11fguoidWLaUOiki
	ogfw==
MIME-Version: 1.0
X-Received: by 10.194.81.40 with SMTP id w8mr12241562wjx.14.1361254088009;
	Mon, 18 Feb 2013 22:08:08 -0800 (PST)
Received: by 10.216.32.133 with HTTP; Mon, 18 Feb 2013 22:08:07 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
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
	<CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
Date: Tue, 19 Feb 2013 11:38:07 +0530
Message-ID: <CAKSKmM3H802XUptfN39vDYsN0EcpdD8GWYftKRnGf5R7AzNHrg@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQniUSm+hDMpYSDPB34FHBneQEdxqDzIXc9CJiXdnzDS6UcrQbdhHkZjqkDJqboU8sqD1uv3
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Tue, 19 Feb 2013 06:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

With all your help and support I have built the image successfully and its
running on my colibri module...

thanks for your help..

On Sat, Feb 16, 2013 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 February 2013 05:47, Sankar H Malarmani <sankar.m@hardcube.in>
> wrote:
> > I just followed the instructions given in that toradex website.. Its what
> > giving me the following error..
> >
> >
> /home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
> > wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES
> >
> > What I'm doing wrong here.. What should I do to overcome this.. ?
>
> You're not using the oe-core revision specified on the web site.  You
> need to checkout a specific revision, and not use oe-core master.
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Thanks & Regards
*Sankar*

