Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0B665C9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:25:36 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so54620783wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=rqrmv3/pjBVa75JQwGs3tL9n+3rAugqvsfIRTzZ6SVo=;
	b=L15SeGXSiqUozaoYWvGp7kSPJmaWQ8k+wJIYEXXLSxah1kLMBns9inMnAcUZqJ/3oG
	go3aHcCdqP6gbQ8CswQKAywLdtmDqTmWo4qVhdNprD8X+e94QwZ1WmqqaIeOZaUVM4EA
	VjOVBH9mwL3cB64G06G2F5bgAWXmb0T9seIPSmkEAuiMCNm5e1wnylIGYvIKQyAYLwFJ
	xRoxCQI3Ww7quZnYm2g3WPV0HBlSqtTzqqIoXEBPOzYVnZaji2Mlm+dFQ86ie2RmuGn4
	7i5TZA3P6Jva8C1C7YOeaKdGXP+umtdwk3I/eX71z5VEF17sWuP7P/8GNdL7tnvoHdtO
	ravw==
X-Received: by 10.194.60.43 with SMTP id e11mr53306027wjr.36.1429118737208;
	Wed, 15 Apr 2015 10:25:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bi3sm12789789wib.5.2015.04.15.10.25.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Apr 2015 10:25:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Apr 2015 19:25:48 +0200
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20150415172548.GC2338@jama>
References: <20150415182413.4eb934a3@e6520eb.localdomain>
MIME-Version: 1.0
In-Reply-To: <20150415182413.4eb934a3@e6520eb.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [dora] request to cherry-pick
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
X-List-Received-Date: Wed, 15 Apr 2015 17:25:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2015 at 06:24:13PM +0200, Eric B=E9nard wrote:
> Hi Martin and Koen,
>=20
> is it please possible to cherry-pick
> 9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d
> "evtest: Stop using Cgit based archive"
> into dora to fix evtest fetch issue ?

Pushed to dora-next, ping me if I forgot to merge it into dora in next
couple days.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

