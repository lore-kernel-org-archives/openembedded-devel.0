Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 862426C765
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:00:23 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wp4so6409159obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=MN4F6wImQ+gV6UH8BF9Hc3UvVlivYgE5rpOyXNTW2sQ=;
	b=AVPpbpa0ZRvStw/l7efVYmfwwW18FS6OsJAa3ODTEUyfGeFAaBinG0J/Vloc1W8aW6
	MsXv4eNn4MubxqIUi8er+7egs2uB21hxdTdPjIQ3riAvrBVoIjahbBKGaZSrAO1OuQMc
	GxeGNbYhDCxBxR9UXbj6Rz5jS8WE8mC7pfaqFATVRUxgWsNsqL5D+N0jpKZjJ2d64U27
	/AsFAlU+SwDANbkMbJ4VopZvrAzFQv8Vzm2qmJUar3niGUUmnvxQPAOgBbJEGVeXnwbW
	K4rX8YGEj+RmjqDzHStBkitlDki9MOApP8HkLZAcqeOUaZzeEMoh9QhvQIxKX3hvUEHU
	Cjtw==
MIME-Version: 1.0
X-Received: by 10.60.137.201 with SMTP id qk9mr5584198oeb.41.1390831224185;
	Mon, 27 Jan 2014 06:00:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 27 Jan 2014 06:00:24 -0800 (PST)
In-Reply-To: <1390730191-4994-1-git-send-email-raj.khem@gmail.com>
References: <1390730191-4994-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Jan 2014 12:00:24 -0200
X-Google-Sender-Auth: BojHD-dSaxYXC9n8tmYFOPEygJI
Message-ID: <CAP9ODKoghpRKrKfYk9wS_OW4XxL7D32dM6b1LMV+GQ43+V89wQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][dora/master][PATCH] nss: Remove in favor of OE-Core
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
X-List-Received-Date: Mon, 27 Jan 2014 14:00:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 26, 2014 at 7:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
> OE-Core also provides NSS, lets use that one instead
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

