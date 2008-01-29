Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JJlhS-00085a-Hf
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 09:20:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JJlhS-0003ul-Hg
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 08:20:11 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 08:20:10 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 08:20:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 29 Jan 2008 09:20:01 +0100
Message-ID: <fnmnjf$cpq$1@ger.gmane.org>
References: <200801211408.31701.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <200801211408.31701.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2008 08:20:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz schrieb:
> http://bugs.openembedded.net/show_bug.cgi?id=2430

> 1. There will be /etc/update-fonts.d/ directory where
>    packages/environments will add own scripts for handling fonts
> 2. There will be "update-fonts" package which contain script which calls
>    all those scipts (via "run-parts /etc/update-fonts.d/" command)

58a64bc4f0e9295e4e68eaf15495ee2eb9e6fbd8



