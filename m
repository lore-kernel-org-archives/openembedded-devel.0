Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id BF37D733DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 12:02:45 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 20so7404544yks.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=l3dQMG39fz7/jd37RFQ0zoR6y4epuJM0ISoQc/0Zpbo=;
	b=iu+YcOO3pbW1cfvd1ScNCyJaNNoC8R7TCLC8D1gr+Y/7T/bUftbBjls2Us9lluZe0X
	rM2dIGdqas+y/5wQlT32AVewdRkGMDlyU6mbBzEkotOGqSuOqjwnCE1cMpaewXWmms06
	2NUMbCxPj1GEmc1FK7XpJO6ISQK4EHcxkilUddKEd1WFVnRueP4KlMRLVBmqYJWnoOOj
	+ElvP1y2upiLTEsUKKo/TKIefAILICeHg0FgfSs5zB6n1sDPDr31vwdiJQbbCUgWHa2V
	OIiCMd5WokSpT+DjGoPyPRPBBkWg96huswe7Qa7y8AyLmtInJ6u27mvh8vY35/9G8r3X
	D+bA==
MIME-Version: 1.0
X-Received: by 10.170.209.85 with SMTP id a82mr8989736ykf.99.1423828966239;
	Fri, 13 Feb 2015 04:02:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Fri, 13 Feb 2015 04:02:46 -0800 (PST)
In-Reply-To: <1423619019-17403-6-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
	<1423619019-17403-6-git-send-email-otavio@ossystems.com.br>
Date: Fri, 13 Feb 2015 10:02:46 -0200
X-Google-Sender-Auth: -iVHRuAI3fhlvFiDnd2pQZZabdI
Message-ID: <CAP9ODKr_cnQ+RWUC_qQ+ogKHGUvs97i_HewD5ojU6efFh4Jy0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH v2 6/8] qtmultimedia: Update the GStreamer 1.0 support patch
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
X-List-Received-Date: Fri, 13 Feb 2015 12:02:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 10, 2015 at 11:43 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This updates the patch which adds support for GStreamer 1.0 to the one
> merged in the 5.5 development branch. For instance it fixes a color
> mismatch in one of our devices.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


Please hold on merging this one. I will prepare a v3.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

