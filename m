Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8E43D72732
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 21:00:21 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so3439655ykr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ifLEs9aC37cqfI70O4pWvfwOf+txPZ6mMypj6tIRY7s=;
	b=y2JLJxxJtwTEZNHow+s7YZJQU42VKqlvIjL++gSVSc4xgblqNzTPfvRfhukUnIYezb
	d2lITQu3//dNbsjleXokMhjhAk/sXe5Hi2Q9bjW8n8popVjNmIebA7mkx1gQp0AqAy0b
	c10Nq0Y+ooiUe7nUNLxUPWiHsSsmQMFTOYEaxVXnhQKqJr2s1I1zjW95PwY/RnUYF88s
	nCe9VuMZ/DwRi4zE5fwvWJa+U/jfbw/SzfPL4kxPGM7FrwWEz28MBmlfLoDksI9kJbc/
	GX3pB8DQio8kvyNZwDgYINaQhp6m/8QGk6u4X/hB3p09TQPjZoYISPpI1ctsNGqzmccn
	K5Jg==
MIME-Version: 1.0
X-Received: by 10.170.116.21 with SMTP id i21mr26840634ykb.105.1419368421805; 
	Tue, 23 Dec 2014 13:00:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 23 Dec 2014 13:00:21 -0800 (PST)
In-Reply-To: <BLU436-SMTP2303FC3EF333D565F829F9FC2560@phx.gbl>
References: <BLU436-SMTP2303FC3EF333D565F829F9FC2560@phx.gbl>
Date: Tue, 23 Dec 2014 19:00:21 -0200
X-Google-Sender-Auth: Psm4Febn_ThCFGTtpQ34KCvYAhI
Message-ID: <CAP9ODKoevP3fpJ8RpMEo_KCA3X1RdEYuEz8w94=5Kbc1dfGK_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: Re: [meta-qt5][dizzy][PATCH] adding qttranslations for 5.3.2
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
X-List-Received-Date: Tue, 23 Dec 2014 21:00:24 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Mon, Dec 22, 2014 at 7:08 PM, kkelly87 <kaneda18@hotmail.com> wrote:

There are some guidelines for use when doing commit messages and
patches for inclusion in OpenEmbedded and/or Yocto Project. The
following provides some useful information:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

This commit is completely out of the guidelines. Please take a look on
the link and if you have any doubts please let us know.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

