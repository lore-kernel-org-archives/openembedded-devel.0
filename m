Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rq78Z-000475-8B
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:59:59 +0100
Received: by lags15 with SMTP id s15so3170759lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 09:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Gm3zu20+I7yQkOR9SuI3Lj/QenG7uLiaFQNCs6dydCM=;
	b=sdO9G7fmQvBAkXx9hzXOspFhubdtWyj6o6ygEB1UEIbdqFWICt72fYZYo30mFip1Kd
	9mDy3rIF1sE41eRt0jalMmM3mVIrCsXo5uS1PGwLzqblasjuzcwXReuRgeP3WOtLdbdQ
	VNUlzBrPjgS5L9ytss2vpxAbpK/bomU8homaA=
Received: by 10.112.86.67 with SMTP id n3mr4546330lbz.29.1327513932519; Wed,
	25 Jan 2012 09:52:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 09:51:41 -0800 (PST)
In-Reply-To: <CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 09:51:41 -0800
Message-ID: <CAMKF1soJ1ZA=zgJDLxydt_w7whaxmT6Gtkbt3SNG5qCHJ5XSSw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 17:59:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 25, 2012 at 9:33 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>
> Wrt DP = -1:
> I feel if a recipe needs DP = -1 it is not good enough to be added to
> meta-oe. Probably it is more something for an unstable layer.
> (and DP = -1 encourages the growth of deadwood; I still recall in OE that
> there were some recipes that had the last 3 or 4 versions all with DP = -1;
> let's try to avoid this in oe-core/meta-oe)

yes no DP = -1 in published layers thats almost useless.


