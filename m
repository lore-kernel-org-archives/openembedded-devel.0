Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDC26FD11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 17:50:33 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id lx4so642893iec.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jXBWGAuCxRSJTec+5f7zB77NOdNSncaybCbN2i2QDFw=;
	b=UD7ZCjUnPgOKTuuni76Wb9FtVoro6flX+MOA9r/tgbw1yhHlPy9CikmLufVEYsNuBC
	hy3ckUaoxhst3HwrOr7izIlaE0t+l31P+lP/arHltY7hcSiFpwxS8xdu2FxjY+SvptLy
	vd52giuwP9wW5b3rNGu2q43tWI39IkrzfVG6VGWLNzBr/pWUjSgemxSeJREwGwV9MTNS
	wM47J9Bqk2hjcWvo75Mkhy3CEoSJBDK2Y6F+xRafPpPS4wXwzRVdm3GyEczn2qYQeKBn
	nylE3OpeGIoZZnMzEPIyeGu0E4jiGA/nP1Hj34o+Q1iEgJBgV/2e0/nQP2QWmu5C5sM1
	9zHg==
X-Received: by 10.50.43.136 with SMTP id w8mr12871404igl.20.1401385834746;
	Thu, 29 May 2014 10:50:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Thu, 29 May 2014 10:50:04 -0700 (PDT)
In-Reply-To: <3076920.GIcPHFYYDY@peggleto-mobl5.ger.corp.intel.com>
References: <CABi1daHuRYWXAy629iwuUJfUwsQxDWaS3B8zdUO+sks4_fL8BQ@mail.gmail.com>
	<3076920.GIcPHFYYDY@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2014 10:50:04 -0700
Message-ID: <CAMKF1sq1PqmB+vqdN4CHXZfPG8j-iOBBgW2P4uWxWMA0LS38=w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Issue with x264_git.bb
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
X-List-Received-Date: Thu, 29 May 2014 17:50:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 29, 2014 at 10:01 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> We just noticed this yesterday too. The story with the recipe is that after
> dylan it got moved to the OE-Core repository, but it's just as broken there so
> we'll need to fix it in dylan in meta-oe and in master of OE-Core, and from
> there we can get it backported to daisy/dora branches of OE-Core as well. If
> you could send a patch that would be great.

http://lists.openembedded.org/pipermail/openembedded-core/2014-May/093010.html

