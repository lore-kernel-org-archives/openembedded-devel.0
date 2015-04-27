Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBC965CD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:40:19 +0000 (UTC)
Received: by iecrt8 with SMTP id rt8so4806640iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1JYO14hFLliPYe8Fjt2E8BJA5fUo43beIbJOabPNn2k=;
	b=VyW03gEFa9vu1uMDdkLbTO0gbWTSsUEVzNLJ2SXtV5EES7j40JzdyMRsnvBDw9rfBF
	4QvN9ilLR/5JCioGjb6rRJ5rLss1YW2lmgYM1YwjayStc0rZsxohPoTBo4hbKFBs6fe7
	NDDIqETnzFLAlHNLqlNHDOY53nLbF9K5FUpkp69wwz7WfThiat10cTXTodmeKg9mkkU0
	j+yDcz8YEPFWieXP+hxDgXOvs5gzy3jE5DwYT0hbnYSEIeSDTXxrfEYgjvB+9FrI+cmR
	fEC5+1t6bsG6Qcdl2NHT7arjr1x7pfYDRpaz4TuzymevEAPORwGsuWOSyBhkM+s5N6D7
	UOsA==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr14519482icb.30.1430170821291;
	Mon, 27 Apr 2015 14:40:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 14:40:21 -0700 (PDT)
In-Reply-To: <DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
Date: Mon, 27 Apr 2015 18:40:21 -0300
X-Google-Sender-Auth: 91wITTrSiuiGEP8DP_R_VAYMzF8
Message-ID: <CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 21:40:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Apr 27, 2015, at 1:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Looks like some regressions may have crept back relative previous
>> versions of the patch?
>>
>>  - dubious indent in do_install()
>>  - .pak files being installed as executables
>>  - dev-so INSANE_SKIP shouldn't be requied
>>
>
> Thanks for bringing it up. I will send a followup to fix it incrementally.

Please wait for Carlos comments and send a new pathc revision. This is
not yet merged so fixes are still possible.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

