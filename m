Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 53DE8610E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2013 20:44:00 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o17so26724oag.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2013 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Obq1VUl5GMIV9ZN52uPtcbx+kraDPJo5u2tjrKrhCw4=;
	b=fC5agt17MyVT4N8h30X7s/jgkpJQ3lTfAt9Jnfjj/sGg1hH4gXpi94jn70V2ttSD9S
	g82WCq/LOfeGmapxJVVL2siXbWmKBjuMzydTG8AsT0+aILrh4PYErSOrMKdlu/LOWjaW
	HN7P8JjCRVh0YuKm5tWzF5qse8T5qnvXYXAP+lYI+t4bDG/6oPNggSll6pNTHumoOLMn
	ih37nM0noA6OhIZiZHXFRxkgIrV1xuR3XDsaSrhMXFgZy6BGXfAJRlEvhDot+4SwD/a2
	ll8HIxU9vWi1mLUcATKAP+sivLSo1SbVLMuYmmwrqFe+gM2cmRSGuhkSYOE9IpAvv5iK
	2+BA==
MIME-Version: 1.0
X-Received: by 10.182.121.137 with SMTP id lk9mr2435575obb.32.1379882641504;
	Sun, 22 Sep 2013 13:44:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sun, 22 Sep 2013 13:44:01 -0700 (PDT)
In-Reply-To: <1379841765-16349-1-git-send-email-b40290@freescale.com>
References: <1379841765-16349-1-git-send-email-b40290@freescale.com>
Date: Sun, 22 Sep 2013 17:44:01 -0300
X-Google-Sender-Auth: O4O3AnvkGbBygSalozIPNwKju18
Message-ID: <CAP9ODKoU0wCzK9jF12YOAZpUm9VwGOypLXcKNoPCC-WDnB1iFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 ] libhugetlbfs: add recipe
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
X-List-Received-Date: Sun, 22 Sep 2013 20:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Sep 22, 2013 at 6:22 AM,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

It seems some of patches has been applied upstream so it makes more
sense to use a newer snapshot and drop these patches.

Another thing which needs fix is to avoid dependency of -tests against
the -dev package. Did you look at it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

