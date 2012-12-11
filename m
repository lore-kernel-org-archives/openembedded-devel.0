Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TiNM9-0000Gp-8E
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 11:46:36 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so3415255vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=J4ri4K23ySme9lv3zArGbiQmk0SPWaXjBUFfcFdNkdE=;
	b=oNkFiwwQZBoErQ57oZVnyuGI87/bep20syK7LLIl+O5M1NmUKoEHqUTwZVtxnHjaAM
	77QaVbis2ez6pBz0zAPOFM6mJCJtrElRmsAJqmFGmjxWYMpeE/+N2UCoRu2ymm2Le/hh
	PwAcZ5dPzEN5I1MhXCH74OC00/gV7vbU6pMF7CFy6EssbDs02n+TxnSOp9E1mIUVLABP
	a5v/wP7LHIeqEyfV4ohfxgSJTqO4eFJDswmOm7fd/r3ZACzrd+b4wFBOrMimBUpxkI4D
	oOsEU4OhhSYIF4fmGWogEx0RhF4QyB330CMZLr5wTSdUIVqQ3B2KJHWqMKSjLsx9z4RB
	H+rQ==
Received: by 10.52.26.115 with SMTP id k19mr9413195vdg.67.1355221920770; Tue,
	11 Dec 2012 02:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Tue, 11 Dec 2012 02:31:40 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20121211081930.GA4841@jama.jama.net>
References: <1355137229-16062-1-git-send-email-andrei.gherzan@windriver.com>
	<20121211081930.GA4841@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 11 Dec 2012 12:31:40 +0200
Message-ID: <CAK18fxETshGSdQi2+EeyJ+dyPykVfERdVUKSb-ArepsBKE4khg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnhxgDaDZtcuVIeClw/poFAZt7/7n2bfnbVJpSqFjkKfSP0FTfP1b1PE1fCZKb3DJj4QrTV
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH] lighttpd: Sync bbappend version with the one from oe-core
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
X-List-Received-Date: Tue, 11 Dec 2012 10:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you,

Andrei



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania



On Tue, Dec 11, 2012 at 10:19 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Mon, Dec 10, 2012 at 01:00:29PM +0200, Andrei Gherzan wrote:
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > ---
> >  .../lighttpd/lighttpd_1.4.31.bbappend              |   10 ----------
> >  .../lighttpd/lighttpd_1.4.32.bbappend              |   10 ++++++++++
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >  delete mode 100644
> meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> >  create mode 100644
> meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
>
> Looks the same as
> http://patchwork.openembedded.org/patch/40585/
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

