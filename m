Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1959565CF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 07:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45yTCX4bJZz2M;
	Tue, 30 Jul 2019 09:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564472808;
	bh=9QYFZr6OulEcikgT0pP+WEGrCrhWLFHDfe+LGOAyoNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fx88AdzWjo84GW8tgYsnT1rxs4bVRxj+McxBPPGw7weygOesKwz2gc7qWSkSrvPbI
	2bINXdb+9R6J10ztKggf0jwQQygf+nNgK49gv1Fa8DnDItge/lO/A3hJB1omNwMh77
	60ANDuOAQKhJWRgE6pVjGgRRT/SYw7vOw0bKm/1jAymY3MriO9RQEzb6SCYTsL848C
	HZ1qhgkLjk/2yRdK13A8EjLODPabqIL+Wvt7MIeM01klVdr3VHi14YplgYCCNMx9UL
	UamA8bp88fOT8DUmPazoJTUThCQMUnv1+Y4Odc/fnG8uSN2oE8OYYHzI+BqmIvzkz6
	rfoikQNhOHJbexGmwh+bP6IX1Q9he/ue3C4EIFZffXyxHQnVrSMdlI7on8Hmsi4KQK
	Sl4zXI4cGtvR9KiVsHls9iTkPO3VrJMbUOMN8E9zi/MmpXFUqrxyrwEJqaFTS9gg10
	3mWkMmbhcgG9HxxCYSRHdxuAbfXuvh1FWvRl5E2FADnYUbaKy/HGSgyklR6m2N7+14
	XoiBvvuDiei6sTzZ3b+dksdPzVzBXHoAR/HrrFNvWnNEF9rwFTCEJ1BwQanSORjg+l
	Mi8msBKaOtowxz3m2mgOPa6+4sm9XIqoe1dSqYNVXr51wH5/3VjqlLXTArm7uiFGIp
	+7JvbWCISDgiKI1iCMvyH81s=
Date: Tue, 30 Jul 2019 10:46:45 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190730074645.GA11235@localhost>
References: <20190728105220.20595-1-bunk@stusta.de>
	<69940a08-dfb2-cd3b-1e31-af3f69aa5591@gmail.com>
	<20190728162013.GA13799@localhost>
	<CA+chaQcF5WfXW_Ryo9q0Ub2rjMKmPUQVXNA_dAw5Nqr-9dCMWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcF5WfXW_Ryo9q0Ub2rjMKmPUQVXNA_dAw5Nqr-9dCMWA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] gnome-system-monitor: Add DEPENDS on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2019 07:46:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 28, 2019 at 10:08:24PM +0200, Martin Jansa wrote:
> It does tell that there are errors, but we don't want errors in "bitbake
> world" :).
>...

Thanks, now I get it.

v2 sent.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


