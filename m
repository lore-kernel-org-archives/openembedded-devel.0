Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QuAaC-0000Az-3j
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 23:57:00 +0200
Received: by vxj14 with SMTP id 14so2293488vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=np5XqOUmurxujoo5QwWQ3ZP9tRP5gF1MrTE6bS/LWME=;
	b=QrKrOY3dh7xqZ0VvMktwvtxXGVGD5acPs/SsGdVqGwV94MRRTTWtAaV0Gj8k9s0n0K
	KnwpUf4x8ApPgTMDLaFa30nhpKgYyuxx9BNuT9ZsV3mrJnvaxcVhcxKPd/9JrZ/ctCl7
	u6DBrOJpVdefiF/YIXLZ/zrPzf0IWe5ryTSPY=
MIME-Version: 1.0
Received: by 10.52.70.14 with SMTP id i14mr1353088vdu.420.1313704339805; Thu,
	18 Aug 2011 14:52:19 -0700 (PDT)
Received: by 10.52.112.161 with HTTP; Thu, 18 Aug 2011 14:52:19 -0700 (PDT)
In-Reply-To: <CAGDS+n=3CWBVVD2R5uxAz1vOSfuz1GVUEY0Ky5h=1KSsDCrXjw@mail.gmail.com>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E3B9812.9010002@dresearch-fe.de>
	<4E3ECD6E.7000201@dresearch-fe.de>
	<CA+M6bXkrQyqiSFFxsyZv4mRPUmk82EbdUzSygrBaoyp5zeQ9zA@mail.gmail.com>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de>
	<CAGDS+n=3CWBVVD2R5uxAz1vOSfuz1GVUEY0Ky5h=1KSsDCrXjw@mail.gmail.com>
Date: Thu, 18 Aug 2011 14:52:19 -0700
Message-ID: <CAGDS+n=EE9zRenTXOQvMCO=Vha_cCpa_avcXVhjBirCDTdBBSg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@opensdr.com>
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Thu, 18 Aug 2011 21:57:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 18, 2011 at 2:44 PM, Steve Sakoman <sakoman@gmail.com> wrote:

> In looking through the packages in my deploy directory I see a split
> between packages that depend on libgcc-dev and libgcc-s-dev.

A typo above -- it is a "recommends" for libgcc-dev and libgcc-s-dev
in the packages, not a "depends".

> Any ideas on how to fix this issue?
>
> Steve
>


