Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id E585460017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:16:25 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so479655oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dsE4Q2EfFvTzHBwlEbMmnKKdO3mQ5hqxPRE2I+TmUkE=;
	b=vHAvwNxQKrfQbENiCoIJP7x73GuWCQRzm4Uvf9JjKgTXmo3ePFLiHOeOq3ohfVsndP
	qWdp3V8TU9IMpq8KYi0I8kmH87xsWod0MOxwyie80eN8kYRmBs68FHM/j6cJMDrVORFT
	j47rA6/mQrnmNlP2SmUBSEupQEez4x5KM7XEpEnZAWd/2H2YqOa77Q5ThzTWqutQfrrF
	Q+0f21ZLSeUib3q61x8Rx4y32H0PiLQQl87n9sitXB7kJChO3h7c3EnO8vlORWbWBu02
	O37lbKwxgL6AI76E+ulkMSumEncCEGEGUdQmqYbEz3cpcdHeQZnTasi8uLSsN/uM3nip
	gT8g==
MIME-Version: 1.0
X-Received: by 10.60.98.40 with SMTP id ef8mr1438697oeb.13.1390400186731; Wed,
	22 Jan 2014 06:16:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:16:26 -0800 (PST)
In-Reply-To: <1389965698-5352-1-git-send-email-ml@communistcode.co.uk>
References: <1389965698-5352-1-git-send-email-ml@communistcode.co.uk>
Date: Wed, 22 Jan 2014 12:16:26 -0200
X-Google-Sender-Auth: 26gJOv6i_6LpRCC7x7m95BWqUJQ
Message-ID: <CAP9ODKr63fqJWSAV8DxGySTD+ctjr=yfRbsUDA5H2Ui820AV5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Koen Kooi <koen.kooi@linaro.org>, Martin Jansa <martin.jansa@gmail.com>
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCHv3] libsoc: update to 0.5
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
X-List-Received-Date: Wed, 22 Jan 2014 14:16:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 17, 2014 at 11:34 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

Could this be backported to Dora branch as well?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

