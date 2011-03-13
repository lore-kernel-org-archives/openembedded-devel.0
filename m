Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PyZ8h-0003Zb-PX
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 01:26:32 +0100
Received: by vxd7 with SMTP id 7so3515801vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 16:24:52 -0800 (PST)
Received: by 10.52.66.74 with SMTP id d10mr9841266vdt.25.1299975891808; Sat,
	12 Mar 2011 16:24:51 -0800 (PST)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.220.43.206 with HTTP; Sat, 12 Mar 2011 16:24:30 -0800 (PST)
X-Originating-IP: [93.81.194.222]
In-Reply-To: <1299891988-15661-1-git-send-email-raj.khem@gmail.com>
References: <1299891988-15661-1-git-send-email-raj.khem@gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sun, 13 Mar 2011 03:24:30 +0300
X-Google-Sender-Auth: qY4pRLn_m3Mt5vuE1DlapXj462o
Message-ID: <AANLkTi=Bs-iPzm4R=16ioLnZZ5V2q8oWkVDKn_zZpaUg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.5: Fix ICE on i586
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
X-List-Received-Date: Sun, 13 Mar 2011 00:26:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/12 Khem Raj <raj.khem@gmail.com>:
> Upgrade to latest svnrev
> Get new linaro patches
> Delete patches that are not applied
>
> Please test it in your environments and report if you see any issues or not
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Build-tested on Angstrom-2010.x/{qemux86,i586-generic}
Tested-by: Yuri Bushmelev <jay4mail@gmail.com>

-- 
Yury Bushmelev


