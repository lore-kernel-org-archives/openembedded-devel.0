Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P87y8-0005tP-V7
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:54:53 +0200
Received: by iwn2 with SMTP id 2so2275452iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oUva/s/TXkYGwD+LmYVD01tUCYozfCKoE2Kt3finAEE=;
	b=AjGwEtjg3LUHzk72AtaiYc9fsE+ydVpOKrCqgRnnByhnj3/nI43QQFa3XCNpt6WM0O
	QQVHr3XqBAqvgnhGCP5cCojzvBsrZgFUxWER1rARgJJEV58ZUAtEsDJj36+8GqsrKbN1
	CJtxO+RtRUpE8fzgZwya/5feFYK8e7Hmxxw3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VsTTPzkWK9WgI5e+8WXXtokcvnsNOC8Ca8lk1Ze/8QiUbYGkr00AVdSygkHhJR9b7A
	FlmiS6FK9B7hLt6B3u3XgFeC+n49n0BXKnz+SqXtM+jUTVz7Wj3o91x1yzVzjwEZjIPG
	cQM3XfWCWHwnc3xT5NP0OSxqBRkJvQR2XOjhg=
MIME-Version: 1.0
Received: by 10.42.22.69 with SMTP id n5mr3646891icb.477.1287478458371; Tue,
	19 Oct 2010 01:54:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 01:54:18 -0700 (PDT)
In-Reply-To: <20101019084624.GB28423@ibawizard.net>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
	<AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
	<AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
	<AANLkTimiK0YnGdHjvpsKEcHvs+9zzi-UO_yHng5tgFzB@mail.gmail.com>
	<20101019084624.GB28423@ibawizard.net>
Date: Tue, 19 Oct 2010 10:54:18 +0200
Message-ID: <AANLkTimke0raVY0DUtD2ii289Ng4F9ZEwwxRMQ_H9AjP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Tue, 19 Oct 2010 08:54:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/10/19 Petr =C5=A0tetiar <ynezz@true.cz>:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2010-10-17 12:56:32]:
>
>> Yes, checked that, before I acked because I also had that concern.
>> It is done in bitbake.conf see also the grep from Petr.
>
> Can we get this in just before next testing? Thanks.
>
> -- ynezz

I'm happy to push it when there is a 2nd ack.

Frans


