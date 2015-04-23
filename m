Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0B92E605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:01:55 +0000 (UTC)
Received: by iejt8 with SMTP id t8so68056029iej.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SASN2YT0TGCF/FMSl4vHRzaY6TDETISbo8VUNIbD7Ss=;
	b=Z0rVavUQg8DopVbcNWBb61Si70G6FLZwjhIS9znbQsAWfb1NLXZxQNAp3zyfTp24JF
	ccU+SxrGJibRN+NeIX5uFTTdwEZu94NTKo2G+FFjHXUFUadLrcTsas49ktc5DLRSrJfF
	Q9arDohHot8G/tiOpjrzxN+ED4o0vFsh2ohAdnLElFZLZOy/HvCcqoBSZHGlhWlnL5H7
	iGtA/k13e5potTcT880K9tC2jctIfk/cu79xtL0HFd8iZLIwUWDkJEkgXxX3HD1DIK2f
	9K0X6N/BiQhKhVAkmGquOkIKJPua3xjCRQfMyQS50erMuxbtNeSDdeyw36W24SU8GIXu
	v34A==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr14207355igj.11.1429815716377;
	Thu, 23 Apr 2015 12:01:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Thu, 23 Apr 2015 12:01:56 -0700 (PDT)
In-Reply-To: <87pp6u4qp6.fsf@email.parenteses.org>
References: <87pp6u4qp6.fsf@email.parenteses.org>
Date: Thu, 23 Apr 2015 16:01:56 -0300
X-Google-Sender-Auth: r3DmW1iN-tcY6rzTgz8LEnZlNfE
Message-ID: <CAP9ODKoZmUHFPE8RyQ53a2c5ANz3-hB+oNc=R3b=ukoVCpUngg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Building openjdk without X11 dependencies
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
X-List-Received-Date: Thu, 23 Apr 2015 19:01:56 -0000
Content-Type: text/plain; charset=UTF-8

Hello Mario,

I am adding Max and Sven on Cc as they've been active on the packaging.

On Thu, Apr 23, 2015 at 3:58 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> I'm under the impression building openjdk without X11 is not feasible.
> As far as I understand, the headless package is (or should be) generated
> by building openjdk with the X11 dependencies, then selecting the
> components which are not linked against X11 libraries and putthing them
> into a separate package.  Does that sound correct?
>
> Is it possible to build openjdk without X11 dependencies?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

