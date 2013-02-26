Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAOnX-0001pT-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Feb 2013 18:58:40 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so2580755pab.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JPAT/vUr2K+hQK/SzaFYjNd91cnUdz3zjhC+8ybZ6FQ=;
	b=t8nsCAnAWk+sbBhNyfjDhcsLv1cOOz7j83SANAmIEIY7q4zpsFGFjs9Dqw21MvUdFs
	ZDdJy17miO31YCnwF6kwwrKcnfWrFcsYVdp9c1mERGcwQc0JTj93D06fSAQDBrH2nRun
	daBL+Ljk/RJR6v+5WxrtV2uXYdxK/P+4Ml7BtMco1PjcJpG9bNEBixtGJmZiqchId1ka
	LAqeMQOPMSGtpEL19vigOCnAp5PPj4gyJdA/TIvKies6LTpf+d3B3mDVrekE9Wql6mpI
	W+9qhmv4MJ5WqCPteb60rx4pUW6KJLIgUQjKaYswcXKFrBn2z/TFWZsvMsK6MmECyTDs
	S/DQ==
X-Received: by 10.66.146.130 with SMTP id tc2mr2842244pab.95.1361900539156;
	Tue, 26 Feb 2013 09:42:19 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id t4sm2169901pax.0.2013.02.26.09.42.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 09:42:18 -0800 (PST)
Date: Tue, 26 Feb 2013 09:42:08 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130226174206.GA13278@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
	<511B6EA1.5020806@communistcode.co.uk>
	<5124FC05.40403@windriver.com> <5676087.MgqTuTql2e@helios>
	<17062.1361384358@schlepp.honig.net>
	<512CDD44.1010002@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <512CDD44.1010002@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] hiawatha: ennsure C flags are passed to builds.
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
X-List-Received-Date: Tue, 26 Feb 2013 17:58:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> 8.8 has been released if someone wants to pick this up. I would
> myself but I'm currently blocked by a binutils failure.

whats the binutils failure ? have you reported it somewhere ?


