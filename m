Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id D51FD60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:22:13 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id i4so491824oah.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=yI+LbBTFrbCPs/J0U4BsWSatgkHsde+onIC/4qXF4oU=;
	b=bQfi6lqchxT1L2n2ZIyQB38J7HyqG3fPpoexJOb2N426p29DvrWcT5lnd7eTTYfNWx
	Iqa2P6mrWi0g8+cYMSrVJFjoIRrVJcqdooWf6yFesl0WkkDOQX4z+pfRZc/S1qzmoa9L
	h1jWboMuCdaZ28u3ulcDDZZdnzZh4/huMtXTVNQKMAjUg4HVO+dtbfOZsrZiSgAIiJ89
	mEkyVZBdNypZDg8/dL/I0AJtQ4Cv2Bz7zr6OeTB7u3fR89Hfb6hNtFQu7m/93CEp/0pK
	xbHDg2Gj3+xCRyyLQAewPWCkMnqupxJs4PT/M58NFFe1usQjnohMFOSid0w5+gjMZFFv
	8rvw==
MIME-Version: 1.0
X-Received: by 10.182.233.77 with SMTP id tu13mr1499858obc.58.1390400534810;
	Wed, 22 Jan 2014 06:22:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:22:14 -0800 (PST)
In-Reply-To: <1390230447-20844-1-git-send-email-obi@opendreambox.org>
References: <1390230447-20844-1-git-send-email-obi@opendreambox.org>
Date: Wed, 22 Jan 2014 12:22:14 -0200
X-Google-Sender-Auth: _7qMb6atP9HzKo6iZmxmkZ2KZP0
Message-ID: <CAP9ODKrLOdEdTFpaPYXDaOwq0r3XYH3fDuPUjAsDDLQyqKjLjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dietsplash: bump SRCREV
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
X-List-Received-Date: Wed, 22 Jan 2014 14:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 1:07 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Includes a fix to use /sbin/init instead of an obsolete path to systemd.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

