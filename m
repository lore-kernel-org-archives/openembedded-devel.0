Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1Ow4mu-0006uw-Sh
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 05:06:03 +0200
Received: by pvg6 with SMTP id 6so249888pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 20:04:38 -0700 (PDT)
Received: by 10.142.136.6 with SMTP id j6mr2244844wfd.201.1284606278132; Wed,
	15 Sep 2010 20:04:38 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Wed, 15 Sep 2010 20:04:18 -0700 (PDT)
In-Reply-To: <20100916023755.GA15724@gmail.com>
References: <AANLkTindv19CnnhD_L80Q+RUoQBUDTu_3YXVvxu0MK4p@mail.gmail.com>
	<20100916023755.GA15724@gmail.com>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 16 Sep 2010 12:04:18 +0900
X-Google-Sender-Auth: sOqClh63mptOe8EgCB1ByqJndXg
Message-ID: <AANLkTikpYHwUmZBOKRpiuuxwOMTG3KxpPDSob+UcHQ2X@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2 v2] sh: provide patch of __set_fpscr prototype
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
X-List-Received-Date: Thu, 16 Sep 2010 03:06:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

HI,

2010/9/16 Khem Raj <raj.khem@gmail.com>:
> On (16/09/10 10:01), Nobuhiro Iwamatsu wrote:
>> When we compile a program that used _FPU_SETCW in sh4 in C++,
>> become the error.
>> his provides a patch revising this problem.
>
> I can not apply the patch it says its malformed for both of your patches
> I tried git am as well as applying manually. you can generate the patch
> emails using guidelines here
>
> http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies

Oh, sorry. I didnt check this.
I am going to re-send patch.

Best regards,
  Nobuhiro


