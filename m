Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TySLK-0002HY-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jan 2013 20:20:13 +0100
Received: by mail-vc0-f171.google.com with SMTP id p1so3137140vcq.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2013 11:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:content-type:x-gm-message-state;
	bh=BbDuB9M5VV5M5hb4BNJnPecSeY4cfkyX/uahxDSZV2Y=;
	b=XZ4G7xPF69jkFapZ32bqrXNB2rPCJAxvQEZZhZTGGz4nCSwG4sB0s96/1ktM1jeFD0
	hIkYXzUjB6s+k/+FqvrN+bqtROEQAZwqW2pG2EyoYvaWIhwEONYTFmae8VOHyL8PoARw
	R+H2zJNT20RHP5zs6j6jHyrZLWi61a9kp4TIMXuUdng+yr9h/n96pRdbnQ/4rd4b6wYM
	l4MC8pprLAC2HjAMxI3pURv2d5aFc7HEUFcjRFDfRrZuPBAytaNC0/1WNwY99fjdGORD
	MK0Psh9Q/4k7JaCFz4yRSm7dUDH3wbwDRm2sMblJkOTaOug3pG+CvY5zK3OkOfHiKLeU
	ZN2A==
X-Received: by 10.52.76.7 with SMTP id g7mr2732558vdw.95.1359054277316; Thu,
	24 Jan 2013 11:04:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.153.163 with HTTP; Thu, 24 Jan 2013 11:04:17 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20130115061109.GI2992@jama>
References: <1358094394-25613-1-git-send-email-andrei@gherzan.ro>
	<20130115061109.GI2992@jama>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 24 Jan 2013 21:04:17 +0200
Message-ID: <CAK18fxF-RoFnrQBTwq8wVU+cLsLE87X6AQxDfgKzu1JuXXXERg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkYBAXbY9ys3g6dwT1T3n5vDmmY6WSf9LJdccvP3wft8f0R1kysC8/M8jluBKo+6LvmzXEF
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-multimedia][PATCH] libpostproc: Remove -disable-yasm as this is a nonexistent flag
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
X-List-Received-Date: Thu, 24 Jan 2013 19:20:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 8:11 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Sun, Jan 13, 2013 at 06:26:34PM +0200, Andrei Gherzan wrote:
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb |    5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
>
> Looks good, but [meta-multimedia] tag is for meta-multimedia layer not
> recipes-multimedia.
>
> Sorry for this. Anyway seems merged. Thanks.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

