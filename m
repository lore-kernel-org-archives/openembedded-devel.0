Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U6N0p-0006Tn-K1
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 16:15:44 +0100
Received: by mail-wi0-f170.google.com with SMTP id hm11so1452841wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 06:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=tyNWnI03JS8KmDqEfxY8UPRr+vymhbYjMk+tvt7GbuM=;
	b=WmAW7Evm54L7vkZP8PqLZWPtIZw8vsc7iq8lmlpe9yFKiO7McYtrU87UhmCNq2YRrc
	IybAaZrpJZbY0cPs6aZO4hlvmhrp9xbVkJdTLBTIYq+jHXooE9DpAfpPOdYWWcSOiyjt
	xQNZkvAca5t+erePL4LNeuuPucmvHfSjoq0IEcNxtYrPg1f8rOEG7zxbNyuOSPuNTr/u
	79VWdd63ecDE73s7tPlCY30ajYhlywGDx3nTC3UeyXPEsJDN78iVy/Vu63fgMB8PGyoM
	tTvzboqP+GYa2SYBB9H62etYP+RsNs7/Ea5U+KH1kwYBvRxvred2LWc5mkRgIafQDqOv
	zoCg==
MIME-Version: 1.0
X-Received: by 10.194.242.69 with SMTP id wo5mr4940001wjc.10.1360940379749;
	Fri, 15 Feb 2013 06:59:39 -0800 (PST)
Received: by 10.216.32.133 with HTTP; Fri, 15 Feb 2013 06:59:39 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
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
Date: Fri, 15 Feb 2013 20:29:39 +0530
Message-ID: <CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnis5IRhTtH4mJP744jqwe9v9P+Hjc9VwkoC02Vw1TFgU/3ObBlIeiXIeZYoS2T0ZSqWxpK
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
X-List-Received-Date: Fri, 15 Feb 2013 15:15:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

As I mentioned earlier I'm new this openembedded stuffs.. So, can you
please guide me to build an image without hitting on any errors. Steps I
should follow to get it..
Your help is much appreciated..



On Fri, Feb 15, 2013 at 5:22 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 15 February 2013 11:46, Jack Mitchell <ml@communistcode.co.uk> wrote:
> > Or as I mentioned above, use the git commits that the meta-toradex wiki
> > pages recommends.
>
> Just actually looked at that page.  It's almost like their writing a
> case study for the reasons to use git submodules...
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

