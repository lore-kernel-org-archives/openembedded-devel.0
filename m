Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5A27565E1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 13:07:54 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so2286232yhz.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2014 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=GPXZlRnTQkXD4WcySvV9vcDun7+l0VEjAVonITaw1eU=;
	b=EkAUOIFcL2zMXUKlSmbABSE6ZekHl6jIGQoGls2JBIUESagG51EamGSjLPNEi+FugP
	cberf0WHLOW/jMw2rGPwesfG6Worvnn2D5PgAzPR2lhhif56RF/RzFGXtcl2e7Cl7wPh
	fPCQDicplVYuRKEsEM6MpEWvysWyBJPLY7m0ACOenl/nTvEwSQPP5UAr1ly3lJVTQIf5
	JK9SkKaleY573oQNRS9aQTR6LwRCj5+SIZbKcgBbfWVc/COSoFzB7VoWVBMu2V0Ezd77
	gFEbOeJmQ6PMdxliCtewvPoQyL3yGKOEOCpMofAuZXZQ95LYpQYkP/VKwifZPYn5nY/7
	IWfg==
MIME-Version: 1.0
X-Received: by 10.236.39.139 with SMTP id d11mr30872068yhb.90.1418044075169;
	Mon, 08 Dec 2014 05:07:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 8 Dec 2014 05:07:55 -0800 (PST)
In-Reply-To: <1418001796-7522-1-git-send-email-rapphil@gmail.com>
References: <1418001796-7522-1-git-send-email-rapphil@gmail.com>
Date: Mon, 8 Dec 2014 11:07:55 -0200
X-Google-Sender-Auth: eirO9buU-hIH0IbtRByUX1C1CeA
Message-ID: <CAP9ODKqgGXJ29xbgurb4Bf9NeY6ozMEC2owXVs=quq3H=O-+SQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libftdi: update to 1.1
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
X-List-Received-Date: Mon, 08 Dec 2014 13:07:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 7, 2014 at 11:23 PM, Raphael Silva <rapphil@gmail.com> wrote:
> Previous version was 0.19 but it had a failing recipe due to
> the fact that libusb was not detect during do_configure.
> This problem does not happen in version 1.1.
>
> Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
> Signed-off-by: Raphael Silva <rapphil@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

