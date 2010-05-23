Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OGC8f-0001F1-Tl
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 16:27:25 +0200
Received: by qyk31 with SMTP id 31so4490371qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=AWS8WkiKP3CcHKifmTqWRCUWO4XbOMcq4I5Aw6rFFeo=;
	b=NevQ0m9soilGI+AKue4rG6cASya6K98l9AGNlNEAFpMkdBvwukLV9r6JhrlxrLPsNA
	fI98GhPo2XUFsW3XCnqfwuY1QZqpmquE56CLazJlM41ptDqzhad7a0JL1mvKhoBMKBLZ
	hZQJs97UvKSbaNtFeYOqltmxkxlRqHPcugmgw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=FfoT1NR/qESzS7SodY8PWpKJ2uT9nkdPXeFt3ibZp5HIeMhGz/YDdCNbvIBizXNt8Q
	iQ1L/fd+hWe5908nYV97jUvoHO1OMSos+XP6spd2ccZQJ+TAE3VMxByQLrwe4IUSUFVy
	cMAtXDIl1TpQI62mXzI1tL03NWbGkucyI9QGA=
Received: by 10.229.38.148 with SMTP id b20mr857061qce.139.1274624564152; Sun, 
	23 May 2010 07:22:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Sun, 23 May 2010 07:22:24 -0700 (PDT)
In-Reply-To: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 23 May 2010 07:22:24 -0700
X-Google-Sender-Auth: 3InO_VrnDu4hGB5rvt9VFAP57K4
Message-ID: <AANLkTik5dgNt7_vbdwfrZiikmNNhogAnbyuZn-LZoZjc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.193
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] packaged-staging.bbclass: added missing space in find call
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
X-List-Received-Date: Sun, 23 May 2010 14:28:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 23, 2010 at 5:37 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Old find statement failed with something like
>
>  $ find . \( -name XXX\)
>  find: invalid expression; I was expecting to find a ')' somewhere but did
> not see one.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Acked-by: Chris Larson <clarson@kergoth.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

