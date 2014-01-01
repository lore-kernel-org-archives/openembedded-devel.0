Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id D4D896B7AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 16:04:57 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id k1so13945393oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 08:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=TvumxM7zt+/5sKTMNQmtEOUvpCsCbIclZT6wMtRLedo=;
	b=FaqstUnQ1cjKDNQmQ9jcV0FmgpaXcFoVAsNGByYUG0gNpRbVWTs1fNHUtQbx1K69+p
	+3dl1ui5oeiEGytsvaw8/D1Y+7XgtO1gyjSBpmkxmtheWgw/+CpF2nT/AyQskc2mr8hE
	JKNp97NU+sUEAwHW/zB2hWlULWIi2XWiqUzhrFsdzUEx6TLbJ46vjsPn1dKItnn4TUwc
	FhaWV+5C2D4QgfafBP1N4EzPO1K6rR7aqp982dtgYOJUSalGl3H/9BrSypX9aRslCQuT
	kkydXoE5xvsIKF4KyZgb7er0C0sVkisbk9fyuAx6rmvOiSqKWpQ6R5ncVhkap81su4qy
	ZhWA==
MIME-Version: 1.0
X-Received: by 10.60.52.14 with SMTP id p14mr52477709oeo.28.1388592298423;
	Wed, 01 Jan 2014 08:04:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 1 Jan 2014 08:04:58 -0800 (PST)
Received: by 10.182.232.166 with HTTP; Wed, 1 Jan 2014 08:04:58 -0800 (PST)
In-Reply-To: <20140101123757.GD11840@jama>
References: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
	<20140101123757.GD11840@jama>
Date: Wed, 1 Jan 2014 14:04:58 -0200
X-Google-Sender-Auth: 6RJHgglwz2XD2IC0z4Rl_FZ-BP8
Message-ID: <CAP9ODKrkmJfSCRJE_Dv_9eeC00y90Ub_aieksmqdWGsjB2JgmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] tearofsteel-1080p: Add recipe
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
X-List-Received-Date: Wed, 01 Jan 2014 16:04:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Em 01/01/2014 07:37, "Martin Jansa" <martin.jansa@gmail.com> escreveu:
>
> On Tue, Dec 31, 2013 at 12:08:31AM -0200, Otavio Salvador wrote:
> > This adds the Tears of Steel movie in 1080P as a sample content for
> > easy addition in images.
>
> ERROR: No checksum specified for
/home/jenkins/oe/shr-core-branches/shr-core/downloads/ToS-4k-1920.mov,
please add at least one to the recipe:
> SRC_URI[md5sum] = "e3fee55b1779c553e37b1d3988e6fad6"
> SRC_URI[sha256sum] =
"bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b0b23b0"
> ERROR: Function failed: Fetcher failure for URL: '
http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov'.
Missing SRC_URI checksum
>
> I'll fix, but please be more careful next time.

Sorry for missing it, I noticed this patch in a branch I had in my laptop
and preferred to send it instead of losing it.

You know I usually send good patches so I'm sorry for this one.

