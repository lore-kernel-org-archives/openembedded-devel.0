Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA32605BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 20:32:23 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 9so2436670ykp.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=mE9bHk6XdcaZy5tyBm856ugUKf4ePnQuXO0Lj6HSTEs=;
	b=sM7/i4Hsv3ATYVuA4wBHy5YOyplccRlbbzDeYpQeZJZSM2RnNkOqogTd48bhMdBYiq
	/5sZpu0tv0I6VVOX73h+jRCs/knbS+6uKZ9YfmCgzf1b9Wqokg/91IZTBjxVWqO6EZ2p
	/LRSPuM/+Srfe25fHB3IXC6atszBQwFBalyLr6x/713gaiNX3+Th9GXu9lZGOGDSYZXv
	zilhiUH5Phd7/Z352d37OSAdIrR96lYrHF0ry4xGsHYMaE1FC87aRgAZ9zLrTH3Apuq+
	0y3Mpt4BL1QH7mMtseGVQy0PPa4BMzs3bE3ENrORQzgD08aR6N6JHM43D1rlqNBbyBzD
	0eUA==
MIME-Version: 1.0
X-Received: by 10.236.13.38 with SMTP id a26mr4095721yha.23.1410467544360;
	Thu, 11 Sep 2014 13:32:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Thu, 11 Sep 2014 13:32:24 -0700 (PDT)
In-Reply-To: <54107627.9060100@phoenixsoftware.it>
References: <54107627.9060100@phoenixsoftware.it>
Date: Thu, 11 Sep 2014 17:32:24 -0300
X-Google-Sender-Auth: r9cOwxOxEzev6LBbmqX1dalNDHQ
Message-ID: <CAP9ODKqdRy6_uoebjWjZPSDQCUOPTTpz+D1se0MmN=pRtmwirQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [daisy] qtwayland fetch fail
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
X-List-Received-Date: Thu, 11 Sep 2014 20:32:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 10, 2014 at 1:02 PM, Pierluigi Passaro
<pierluigi.passaro@phoenixsoftware.it> wrote:
> Hi all,
> working on daisy, it looks like the fetching url of qtwayland is no longer
> available.
>
> The following patch helped me to solve the problem, hope it will help...

I did a patch using 5.4 as branch, for master. Can you test if it also
works for you?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

