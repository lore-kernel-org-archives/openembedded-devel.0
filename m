Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RnFvh-0007Mc-Hy
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 21:46:53 +0100
Received: by qcsp14 with SMTP id p14so2159658qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2012 12:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RtTOHcVqWLPvr6k2tU/HotpyYxtoILyGDB3VW1XDouY=;
	b=rf17SCto8jG24m6gqjV4Egx/ASzAOxly0V+7F15mKToXDwbrjZR1rgMnFmZKypcY3d
	mDaCFFKwV5RZZIP2yjn8T4WF7Pf9ZfoPA7hOTwwtayH2guiHteYx0oVAto43hobxxZ0Z
	uK3OICbZ7BIIbvt8SKaYBKvOzeY/2prJnTpPQ=
MIME-Version: 1.0
Received: by 10.229.115.25 with SMTP id g25mr6940735qcq.44.1326832755849; Tue,
	17 Jan 2012 12:39:15 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Tue, 17 Jan 2012 12:39:15 -0800 (PST)
In-Reply-To: <1325328013-23217-1-git-send-email-adriano.pallavicino@gmail.com>
References: <1325328013-23217-1-git-send-email-adriano.pallavicino@gmail.com>
Date: Tue, 17 Jan 2012 13:39:15 -0700
Message-ID: <CA+M6bXme89GrLVxXwtvwJ_EZ3os+fK2v0bedxyEqS+Es6GoOQQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: Re: [PATCHv1] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Tue, 17 Jan 2012 20:46:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 31, 2011 at 3:40 AM, Adriano Pallavicino
<adrianopallavicino@gmail.com> wrote:
> Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>
>
> Fixed md5sum and sha256sum

Sorry for the late reply but what machine and distro are you compiling
for?  Thanks.

-- 
Tom


