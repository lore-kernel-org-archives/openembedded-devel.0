Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeSGN-00070T-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 17:44:41 +0200
Received: by mail-ie0-f180.google.com with SMTP id ar20so13623071iec.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oTAV2c74MeuEzmeBDk1ecm7vZRmdl6MvySE0t5bKnhI=;
	b=izbvR8yysWFr89saBUV56mkqRZvnKeHUCuzWWPi6bzN7jJZUYy/a1LbSP6PTKV87g0
	GROnPFA5iSXutrHBR5oVtu5QO9jrxWjrvDw8Eth65O6zIQp4WzGm8PQQGoAoEac1Uat+
	+o8e8f98y4NEk6iVQlpi/3B6pCRQC7cbGBz2Dy3OhsjdP/6Nw2ZRSjtqbG7vOkxenk8h
	TG+bFNVM0q97pZsGUUygYJW15YlDbew1Xl4fb/6SbrmCzq381mj9BDMFPAasF9tpJObV
	L8B5doBF0pPRXIq040YnpBWHCHxcxmIu5DJpRzrEgvvF3AiwyMPqmwnHqSgyJnUFVdVG
	n5Kw==
X-Received: by 10.50.87.10 with SMTP id t10mr5593070igz.108.1369063578776;
	Mon, 20 May 2013 08:26:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Mon, 20 May 2013 08:25:47 -0700 (PDT)
In-Reply-To: <CAJTo0LYDp-wfrSqkswLdj32keLtyV62oCZm5cuX4QXtUGyEG1A@mail.gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYDp-wfrSqkswLdj32keLtyV62oCZm5cuX4QXtUGyEG1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 08:25:47 -0700
Message-ID: <CAMKF1sre8J9DyME66wKjvoEVB9pqQ4TEjpUQZeaLae6kh+KuRw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
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
X-List-Received-Date: Mon, 20 May 2013 15:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 20, 2013 at 2:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 May 2013 17:39, Khem Raj <raj.khem@gmail.com> wrote:
>> +BBCLASSEXTEND += "native"
>
> Why don't you submit a patch to oe-core's libxi, or even
> xorg-lib-common.inc, to add this?


yeah that should be in OE-Core.


