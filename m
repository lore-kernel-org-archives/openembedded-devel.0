Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC37772C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0603431C2F6B;
	Sat, 17 Dec 2016 14:43:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DisULvXGnbju; Sat, 17 Dec 2016 14:43:06 +0100 (CET)
Received: from [172.22.22.61] (55d4656a.access.ecotel.net [85.212.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DD77C31C2F29;
	Sat, 17 Dec 2016 14:43:05 +0100 (CET)
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-devel@lists.openembedded.org
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <0e3d9af2-5840-1775-1cfd-c9e44dfa0f7c@opendreambox.org>
Date: Sat, 17 Dec 2016 14:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH 00/11] samba: refresh pending patches
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
X-List-Received-Date: Sat, 17 Dec 2016 13:43:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 17.12.2016 03:15, Joe MacDonald wrote:
> As I mentioned earlier this week, I'm taking a stab at updating the samba
> patches from Andreas Oberritter that now have conflicts due to other
> changes queued up for samba.  Quite a few of them actually applied cleanly
> after resolving earlier conflicts and the basic smoke tests seem to pass
> for me, but this definitely needs a bit of soak time in master-next and if
> you're around, Andreas, and can double-check my work on your patches,
> that'd be much appreciated.
> 

Joe, apart from my comment to patch 4, your rebase looks good to me. I
hope that patch 7 doesn't introduce a regression for multilib, but I
guess someone using multilib has to find out.

Regards,
Andreas


