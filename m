Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rigey-0000nI-AA
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 07:18:44 +0100
Received: by lami14 with SMTP id i14so53091lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 22:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aj4SgmGfb7RRdBIz+8VneJy9y0755ffsbMdY/7c+kRE=;
	b=RQz0GjhwKSGwjWVvB/xl5ePvk/qKdRGUSO0OLfQQ8xqB/cLshM8CWw9vwmOOi3jL63
	7MrqzrcD1BCVJYkBEAAOk2L9NlDUBOnRJsv01AVuj1UwweqQ9zf8xfbsNl/qZUtDYdn1
	nwHTkkPTT6UXkvCZPcZGLCusrf/wTDCfKZd/c=
Received: by 10.112.43.41 with SMTP id t9mr102323lbl.93.1325743880345; Wed, 04
	Jan 2012 22:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Wed, 4 Jan 2012 22:10:49 -0800 (PST)
In-Reply-To: <CACj0d1irS71X99mBn+od5fbFoO_JhTWiuB5EAAcUc63KXjPk7w@mail.gmail.com>
References: <CACj0d1irS71X99mBn+od5fbFoO_JhTWiuB5EAAcUc63KXjPk7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 22:10:49 -0800
Message-ID: <CAMKF1spQTuzjf=vawoG3MS=pcXfnECceQG6L3fm58eoZLnsceg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't download linux-davinci
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
X-List-Received-Date: Thu, 05 Jan 2012 06:18:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 4:12 PM, Neil Gruending <neil@gruending.net> wrote:
> Is there another source for
> linux-davinci_2.6.31+2.6.32-rc2-psp03.01.00.37 besides
> http://www.angstrom-distribution.org/unstable/sources/git_arago-project.org.git.projects.linux-davinci.git_DEV.DaVinciPSP.03.XX.00.37.tar.gz?
> I've been trying to download it now for almost 24 hours now with no
> success. I get a download rate of about 2KB/s and then at around 20%
> complete bitbake times out. I'm trying compile openembedded
> 2011.03-maintenance for a dm365-evm.

i guess angstrom mirrors are throttled. ask angstrom ml
>
> Thanks,
> Neil
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


