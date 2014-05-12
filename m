Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (unknown [209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC92E65EE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 03:15:39 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so5428260ykr.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 20:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mw4UOJhblWUnZ6citlujG6ADvQBuyYgaWX1RmkiiuCM=;
	b=T4WpVZxsMOGOtivGA6Ht43N/2d+z+8sCPf842g1W56/CG+fhdR05q3YpPFBOiVN6VL
	QwtrZcT2fnLPToHQtVBH2aCFcGDVPMYCO9KRjJdPQFvDmeT8/3Q8HX1S7DZ7h3liPEde
	/JcI/8Myad7ujHM3r2ijkdZjDb/NTBUg32/z5hnF+90wJp79B9dkdXHKgZz+q3NVEIps
	MZKBWDG6JlfkgmdY+deDP4d+hHRQpTOTZbkAo5dSL12ZlEXTGPHoGnpH74gGr2PqllMD
	h7V500yF7ePbJhC408ZQ+2AMyP+3uESKNvZeMhVnHSdnwrJZCP+JC45Q7UxbVevsfZjJ
	xbSQ==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr37128657yhn.87.1399864540513; 
	Sun, 11 May 2014 20:15:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Sun, 11 May 2014 20:15:40 -0700 (PDT)
In-Reply-To: <1399721553-2020-1-git-send-email-fathi.boudra@linaro.org>
References: <1399721553-2020-1-git-send-email-fathi.boudra@linaro.org>
Date: Mon, 12 May 2014 00:15:40 -0300
X-Google-Sender-Auth: Ecziz7KBGXiIQTMrbcHt4YrYQE0
Message-ID: <CAP9ODKqZE8aY+EVq+Db6x0FLjjB=jvAxvmfHOv0vE_T35hC-iw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] pm-qa: update to 0.4.9 release
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
X-List-Received-Date: Mon, 12 May 2014 03:15:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 10, 2014 at 8:32 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> index 4d33975..f6ffcb6 100644
> --- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> @@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test

https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite

The URI is wrong.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

