Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDco4-0000jf-BK
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:32:34 +0100
Received: by mail-vc0-f170.google.com with SMTP id p16so327823vcq.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=DCt1weWZlpSnaM0RsRBke70erShHLlkpghsIk2EljVk=;
	b=n1I5Wc3IRkDPF1YZSlba4URC/SOFCoToK0e4AxqWQM4UdLlbes3dwp26n7lWth12Um
	vsXjnGU+JEChg1fU5VdN3tsT7aHNorjXVt5qATVYl5vzY5himOn8Qpclm7roiHd62sGm
	PLlN83QNTmLc8oyTx+IKsqObqKCBMX4tkQDVCgbu65xMPJxvZACNjAY0/0hRMe8XPpsK
	6ptVBJ9qp8ukW3GKAcRdeZzGcgrhuctBCwKXL95VlFGPuBn/FwA4qqEPfBInIZjFn+wE
	ZkK/RqQ1BOnKkw/AFtIn6sbPMfEBkR5kyLzS5LBN1rb5tIi7AJ0jXs01oiOfI9Vz7YyO
	+ZEA==
X-Received: by 10.52.69.74 with SMTP id c10mr11466767vdu.3.1362669359841; Thu,
	07 Mar 2013 07:15:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 7 Mar 2013 07:15:39 -0800 (PST)
In-Reply-To: <CAJTo0LbnE7DjdJL=9=LDA3kpxhAADJONAu-4Xdwohcno__xXcA@mail.gmail.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
	<9088096.rvOOlWx1VE@helios>
	<CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
	<5138A92D.5030809@balister.org>
	<CAJTo0LbnE7DjdJL=9=LDA3kpxhAADJONAu-4Xdwohcno__xXcA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2013 15:15:39 +0000
Message-ID: <CAJTo0LbAF+Fm8HTRFQbSCh0YVXYR_rkvwA1oP-4z9QdLo_ayJg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmTOWAKqfmTfvYCxTt9KAGXoEsB4hayp1agpsFl3o7Gc7FIJqIIQBtqKTbuG33EIgzu/oFu
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:32:39 -0000
Content-Type: text/plain; charset=UTF-8

On 7 March 2013 15:05, Burton, Ross <ross.burton@intel.com> wrote:
> We really need a table on the wiki page listing all of them - I can
> easily remember the current/previous/next names but after that I don't
> remember them.

JFDI.

https://wiki.yoctoproject.org/wiki/Releases

Only goes back to Poky 4/oe-core 0.9 at the moment, I'll fill in the
pre-Yocto names later.

Ross


