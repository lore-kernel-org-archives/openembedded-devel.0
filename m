Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SAMuI-000161-Tn
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 15:52:59 +0100
Received: by yenm3 with SMTP id m3so988491yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iyDIQlhktNV82vBZvJdJgiRTKbESqJZ3xRmDuC7hieo=;
	b=O0UCj9GYW4qeEYOh6Zov4ULD4BXmdgS07TSqLhA69SK7htBGSPSBmOze2/UJJOvgaw
	fcCT2gI/aNaQ5vwVUAYqCitjJOh1vIwaPNppF3Jv16mtngZ26bnLv+pHWRKbIeLKgjNE
	H74VNW693h6nsVQMXSNNKuVRTeAIpF0RycKJieq6dj/UcedDm0CObnuon5KdIcotyEH5
	+Np5x1nHURY3bBYbZu1VfNCbHTBHrip37pUuxhlDrt9TR9s/TVKT9KuGbQaOL0JC3jXG
	1Q93DOGsPgBzsVHaeztgYmIVRToAKEMO8HPB8KowyQF36xQxfXScDbDGIb2/4y9uJRyI
	iVlw==
MIME-Version: 1.0
Received: by 10.68.217.97 with SMTP id ox1mr11830962pbc.81.1332341044290; Wed,
	21 Mar 2012 07:44:04 -0700 (PDT)
Received: by 10.142.241.4 with HTTP; Wed, 21 Mar 2012 07:44:04 -0700 (PDT)
In-Reply-To: <1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
Date: Wed, 21 Mar 2012 07:44:04 -0700
Message-ID: <CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Wed, 21 Mar 2012 14:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> libmatthew-java-0.7.1.tar.gz is no longer available at the original
> location.
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>

NAK, please switch it to the snapshot.debian.org URL I provided so we
don't have to change this recipe at some point in the future again.

-- 
Tom


