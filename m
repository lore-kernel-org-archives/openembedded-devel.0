Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id C61826FE0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 20:29:14 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id a41so2027630yho.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=mQnDvkQ7YyD3kbHcsWdZzxAAOCf7UA66zmV+pJMrOm4=;
	b=cF/VuRdUJEdv+7eQa/NpLyKfj1FVDAl00Zkd4sZ+LNqOqFNSG7b0SiHo8TIesngoN8
	tpavQ99s2JurJqCHWiRelGLyJef8ZnFO46GlgvXGoU7pfq110VSmBs3dttEwBYSL39x5
	Z1LhvQtkMcYjwU0uYMiK2LRq6cSztE+q9MvH78KyZUWnIiPGOzh1SkijHWDvvN07MahG
	6o731YIu7CGviTxD9Rlyg5VGvm2mKE0vq3s5oz2Q3Vejk2EZuVk7ybxx8M07ETHXdP2T
	M6NzstLCbOH6DepH4BIBZBk7NTPvNjfiC+qw4dOL1wYQrzmt4z+TSf2ssiG1P1SnMdVo
	HnVw==
MIME-Version: 1.0
X-Received: by 10.236.35.4 with SMTP id t4mr24096340yha.155.1401481755064;
	Fri, 30 May 2014 13:29:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Fri, 30 May 2014 13:29:14 -0700 (PDT)
In-Reply-To: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
Date: Fri, 30 May 2014 17:29:14 -0300
X-Google-Sender-Auth: iCDHM-VYC4fG8xPGXu-Kw9GFNQo
Message-ID: <CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Fri, 30 May 2014 20:29:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 2:14 PM, Chris Morgan <chmorgan@gmail.com> wrote:
> Add a recipe for building 0.7, remove old 0.1 recipe.

I'd prefer this in a single commit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

