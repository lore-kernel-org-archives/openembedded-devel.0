Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id ACED1601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 10:46:08 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id i138so258968oig.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bSfYxP8ahNAwgX3fGNkXqJy3NX2wd7pVYaDw+o9rJuE=;
	b=B328N6TneSEtBjslrBU6z5H6Wt8ydjQT8chzTgTjHh/dbNQpJwoQKV9Bv/0S2MjU+c
	zU8wCEFIGhIZXD+gBU2+Yygu//+sFw5XwASvGYw0wXVh3Z5BZy7f1CtFPP14mRN0OnKB
	8s3xKlrlzPfmo+j4eIRako9rQSZKdzoiL+VAvDs2z1LGCXiF66K6bmlA//JG/FTIb7q9
	yL6rTmX34DSXMlB582J22EzfHlYk8Jtx0cA6ck3Yex+2LXlkR7+KmQZBue90taJb80Nu
	4uKQ1pk0WBYamSru+kZFcOkW0zvNj33hRfn8N4AHJGoF9QOQQ1ghwY9+8okh+lEDd4qf
	FAow==
MIME-Version: 1.0
X-Received: by 10.182.245.225 with SMTP id xr1mr2215986obc.13.1414493169399;
	Tue, 28 Oct 2014 03:46:09 -0700 (PDT)
Received: by 10.202.67.84 with HTTP; Tue, 28 Oct 2014 03:46:09 -0700 (PDT)
In-Reply-To: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
References: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
Date: Tue, 28 Oct 2014 11:46:09 +0100
Message-ID: <CALbNGRTzapqQw+spUpN-iJB1Y8K9c2D7A4jo2RH=eNGsoOcQ6g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
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
X-List-Received-Date: Tue, 28 Oct 2014 10:46:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 28, 2014 at 4:27 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Fix the service so that the ntpd daemon is run under ntp:ntp.
What does this fix?

Andreas

