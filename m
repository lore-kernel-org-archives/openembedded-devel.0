Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 76E3C73D5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 12:27:52 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so42266824igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IitmzrTv28izs1ZqCsi94+hWBrrpQoWbmXadhEZX74U=;
	b=dmAepHQ1h9xMYdTVEeUTjlvgEHYFMQMqMYKW5b6IRXKK/t+dW7N9aLLuUB2J1Gumvy
	vOLZufTwZ/QIPp397CZ6z0ljEdYcFiYHR81hg4bCP/swYCRht0egmoEjyPcuaNjIoi4u
	6U4vFOXH0kpHiB3m7xyb9/5KfwsJRAyPSZbEKIAfecO+pHy1GHxrKS6h2xr11eJtvTf9
	3XtgRwK3PL4DuEL1+zPJxm7iDzghwLB4jVrlkpw26xpzlzPjWZ184hlvMLqa0nJJatY5
	3NIM08LbY9qmxdUQvn7XP6d+TLIdCi2IAnLX2/94LHKChC2ATwnBOHa8msvqFoU5QHNw
	vXZw==
MIME-Version: 1.0
X-Received: by 10.50.79.195 with SMTP id l3mr16037423igx.30.1428928073226;
	Mon, 13 Apr 2015 05:27:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 13 Apr 2015 05:27:53 -0700 (PDT)
In-Reply-To: <CAD0=qkJNOMx5Ubn25Ugrn3fg02cq3kLjNbeV5ZBKsfWtuUXbgA@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
	<CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
	<CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
	<CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
	<CAD0=qkJNOMx5Ubn25Ugrn3fg02cq3kLjNbeV5ZBKsfWtuUXbgA@mail.gmail.com>
Date: Mon, 13 Apr 2015 09:27:53 -0300
X-Google-Sender-Auth: 1xlRDCFufzTzOY7SQzxT26LEqCk
Message-ID: <CAP9ODKpSHPyybmcGgm36-d_s88_vuzPzWqErrLknPEFFw2Mu_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Mon, 13 Apr 2015 12:27:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello Sven,

I really appreciate your work. Thanks for all the hard work on this :)

On Mon, Apr 13, 2015 at 4:38 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> After a week of testing these recipes, I fixed some issues in the new
> recipes. Therefore I just submitted new versions of the patchset.
> I removed the patches for uclibc as I'm unable to test it at the
> moment. While trying to build it with uclibc, I always got errors with
> compiling curl. Unfortunately I don't have the time to fix these
> errors at the moment as we use glibc. If one uses uclibc, it may not
> work atm.

Khem, I have put those patches into master-next branch. Is it possible
for you to take a look on the uClibC thing?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

