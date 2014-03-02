Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 35A0D6E85E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 03:27:19 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so2397507pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 19:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=VIsAZxYkKXik6L+GWUalW+YzVX7plLhfFMYKgr2uamI=;
	b=zOp/918ifW7kBuHY8rkj2q/m0rqa/Ya1cKv2XNSvyppNH+KP6/6zDDiDMZaqrPNm5A
	Hb+IheZ9Rfk+VsDubLhCoQly089ZwRWcf80papK2XRa+FKm7HbZeB0BctMucuFCAjwu2
	vQ6mkUOalBZL/EN6SppWwQAKwlDwclLVTB0T/SlDSVf/yC4ykG3B01Rq5VMdZk+cpfZA
	QjUrrbt1DIUuPKIP3zlIFKyH1gmtLXWeXwgL6cTQwVPN2IvTUDNwo/SplvxzmI3ORT8K
	S6QVgjgZ0vcEiM76kNuJzbla89TFFsnImiSSmVXZ03WhrxyXBwgeqZbkAR2ftmIhgCfR
	G4Bw==
X-Received: by 10.67.1.202 with SMTP id bi10mr12340324pad.68.1393730840882;
	Sat, 01 Mar 2014 19:27:20 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id n6sm21211102pbj.22.2014.03.01.19.27.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Mar 2014 19:27:20 -0800 (PST)
Message-ID: <5312A511.6040001@gmail.com>
Date: Sun, 02 Mar 2014 14:27:13 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393729188-12904-1-git-send-email-net147@gmail.com>
	<1393729188-12904-2-git-send-email-net147@gmail.com>
In-Reply-To: <1393729188-12904-2-git-send-email-net147@gmail.com>
Subject: Re: [meta-qt5][PATCH v2 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 03:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/03/2014 1:59 PM, Jonathan Liu wrote:
> This adds the necessary target packages for development with all of the
> Qt 5 modules.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../packagegroup-qt5-toolchain-target.bb           | 60 +++++++++++++++++-----
>   1 file changed, 46 insertions(+), 14 deletions(-)
Looks like I forgot to include qttools. I will follow up with v3 patch.

Regards,
Jonathan

