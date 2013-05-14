Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcEm6-0002Hi-Vh
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 14:56:17 +0200
Received: by mail-ve0-f177.google.com with SMTP id ox1so489601veb.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 05:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=6R+HDLk2LModmMyenEu+BpQ2EEJ9K+dbGjwzg6reDXE=;
	b=Pdia9GRtaut6er0iYt08iZvjiX/QjdgwbASopbCA6Qt+sRSyoj1T8f7Z58GV5+AXpL
	j6kZYHyITxs4yXrxkU6WYB5sSDIUnLc0QGlfjizHDcMiwsZrX/mmmIzDzCS4lESYxCiG
	Ilm5AgpkKF4sIemuZUxIMv7b2lyP18VEv55sX9n9lZMeAIReBdTjsncs0TVicPConcgu
	Qb0rLxzsnn+ZfgZaT5lVxBuQH6v5p6wA7Xro9EZb+tuFT0md9mFv4Yce3hbPkJpWOHfT
	EeHRrO10ICieukphOMY2hW7EoMdyVR/Mxz/1eMQKVGnFwqpu2YvRSnt+MKD4ZSIzRGes
	p4LA==
X-Received: by 10.58.15.193 with SMTP id z1mr21581126vec.40.1368535083553;
	Tue, 14 May 2013 05:38:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 14 May 2013 05:37:43 -0700 (PDT)
In-Reply-To: <CAP9ODKrKMLrCNhWbO9GMvR9UsN4871gJFQTjsVjZ8thcTr9boQ@mail.gmail.com>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
	<CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
	<CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
	<CAP9ODKrKMLrCNhWbO9GMvR9UsN4871gJFQTjsVjZ8thcTr9boQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2013 13:37:43 +0100
Message-ID: <CAJTo0LbtaJUfc0j5hcw2H_Xoz8RBS5a=2594E3WCpu2yKSFVmg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlW/KLNs3/5f5n0SHvLIURe+Kj5oBAyofrm9QdidMMx7Evae/57EjF145RcJG+FhHcyLsYD
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Tue, 14 May 2013 12:56:45 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2013 12:13, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Tue, May 14, 2013 at 6:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 13 May 2013 22:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> I pondered about it but I think it is of generic use. I don't think we
>>> need to have meta-multimedia to be able to use it.
> We can add it as well. What about we have these all in:
>
> meta-multimedia/recipes-support/media-samples/*?
>
> So we can have Big Buck Bunny, Sintel and others here.

Sure.  Have a look at Guacamayo, that has recipes for Sintel and some
freely distributable music.

Ross


