Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 95C0860034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 11:17:47 +0000 (UTC)
Received: by pdea3 with SMTP id a3so78733074pde.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=3HkQNpxCuP5yggrF0INrJ1lI5yGRrVcS72hf+aQrxpE=;
	b=kBHxlB7EjUAJrEpVCtFK9flA9Fadnh9aStQ2M2DZIAy196XBvrD+qo1QjgXj4ZuE5x
	E2qbIy1dtKIrJ6+XuQZwttxqTzq7iy5U9lXLLrxBEHnZavqfyA3aL9UWgjQO7NQs3U31
	Wgj9bzIpAxa7TJ7HXVnuM3V6SF2CQzdWLrlJ8O9LqFvWJMArUUrcnvQlYp2VLrSUDPKf
	Twl7qv3lm45W/lg93VTzDpclljKchfmFFi9kiQI+H6RBu0oDyy9Osyx3pV9CexB6ncXU
	Nd1WnmK5Uojtz2GrnYqG9lgFqKwSKRp/XAhPXfVBNA4J7+HIw5E6Gu7eT34w/1JpQKIh
	cDvw==
MIME-Version: 1.0
X-Received: by 10.68.226.4 with SMTP id ro4mr5727003pbc.108.1431083852698;
	Fri, 08 May 2015 04:17:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 8 May 2015 04:17:32 -0700 (PDT)
In-Reply-To: <1431052065-17113-1-git-send-email-raj.khem@gmail.com>
References: <1431052065-17113-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 8 May 2015 08:17:32 -0300
X-Google-Sender-Auth: ma2znXUyL6D2QWT8Cupe9lbdLwQ
Message-ID: <CAP9ODKpvJWrOOiP152Rjg_EAygDVjhO0FvuPJhuW4U7JnVuKuA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium/cef: Fix chromium installation regressions
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
X-List-Received-Date: Fri, 08 May 2015 11:17:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 7, 2015 at 11:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
> CEF rework caused few problems where we missed packaging needed resource
> files and misplaced some icu data files
>
> Use loops to install similar files
>
> Tested on x86 emulator making sure google-chrome starts up
> properly
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

