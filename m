Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 59D0F601A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 19:24:04 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id ij19so4028155vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5k9cjd0r775c/ciBOIKsEZ3LYjQqf21A1w2+yEbtcpU=;
	b=NeEcFfNyh/QVqdm5gEmTOTNBby9BdGPoXZOgjIXLxm6W61sB0pBp3mGXZdoYv4tH+8
	INW9kCP9Wk0TRLVz8yCcssiAbAIdT6KaIWSDVsUoUUmkoLZ1IaVQTDmnC6NvRIq8Icvw
	Fn0pbt320H0pZHg/JTv87lDDLy0kB57l9LeZMqod/BpIxaLxDc7iLrQYrg3f8SoJTV92
	aF8oQ0mr3vVpb8HjZtZhhTk14AU4UICzcqbjMbcDczusYcdKnMPfsD8ItQZTLonYkWuS
	w7cD4AlDNCqOyCmTMq541h+qMbjpvCmxv0oyl81u9wUrvRiM2k3R5BV1ekEk+Ax7Sb/8
	Y/RA==
X-Received: by 10.220.95.2 with SMTP id b2mr2809386vcn.61.1403810645364; Thu,
	26 Jun 2014 12:24:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Thu, 26 Jun 2014 12:23:35 -0700 (PDT)
In-Reply-To: <20140626180954.GG1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 26 Jun 2014 12:23:35 -0700
Message-ID: <CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 19:24:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 26, 2014 at 11:09 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> "CHS business", as Philip called it, was only partially required in the early
> days of OMAP3 SoCs few years ago, due to some "specific" FAT implementation of
> the BootROM. These days it's not required on modern Sitara SoCs.
Which OMAP3 SOCs need the CHS business?

--Ash

