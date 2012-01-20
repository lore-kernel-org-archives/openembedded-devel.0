Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ro5Rm-0004ZL-Av
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 04:47:26 +0100
Received: by lags15 with SMTP id s15so75369lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=nftRLLpBMfsRbeWoj04wVwlVOS622L3ynG1hJ0JBB0E=;
	b=PiII9SBIHjXVUN9setNeW2hHDmIVdU+w1B9aXEs4YTossNc2+gS0albfdBM72hQQeU
	cub4m0E+alQ3N/IvlaVxoHO8NL38EMTM0m91rGE1ezLubZvj+ecYuTR78GluOBuFddsX
	Ui+ie846MGKWi8Rpb4LSutvvKDMHiQB6rkuMc=
MIME-Version: 1.0
Received: by 10.152.136.16 with SMTP id pw16mr8411722lab.12.1327030785928;
	Thu, 19 Jan 2012 19:39:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Thu, 19 Jan 2012 19:39:45 -0800 (PST)
In-Reply-To: <1326978353-5558-2-git-send-email-koen@dominion.thruhere.net>
References: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
	<1326978353-5558-2-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 01:39:45 -0200
X-Google-Sender-Auth: CNJByCwOxm48BCwh3ZgxKBGFFoo
Message-ID: <CAP9ODKoF3dmDXRxtVjnAKTHoXUCXuDS4VWW6xBG4Nit3W3PQ4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] systemd: update to v38+git
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
X-List-Received-Date: Fri, 20 Jan 2012 03:47:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 19, 2012 at 11:05, Koen Kooi <koen@dominion.thruhere.net> wrote:

>  .../0001-docs-fix-build-without-xsltproc.patch     |   38
> ++++++++++++++++++++
>

Please use the Upstream-Status field as it makes easy to spot if it has
been a backport or already send for upstream.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

