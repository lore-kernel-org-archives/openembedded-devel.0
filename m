Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id CFADD73179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:54:17 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 7DDA868A01C; Wed, 10 Feb 2016 12:54:17 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id D809F68A019;
	Wed, 10 Feb 2016 12:54:16 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 50AEF6740245;
	Wed, 10 Feb 2016 13:54:16 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56BB32F8.5000201@mlbassoc.com>
Date: Wed, 10 Feb 2016 13:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>
Subject: Re: mplayer2 : focus deficiency?
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
X-List-Received-Date: Wed, 10 Feb 2016 12:54:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-10 12:02, Belal, Awais wrote:
> Hi,
>
> The version of mplayer2 available in meta-oe is almost 2.5 years old while there seems to be active development around it. Is there a reason OE never moved to a newer version?
>
> The mplayer team officially releases tarballs from its website https://www.mplayerhq.hu/design7/dload.html while they also provide svn access through svn://svn.mplayerhq.hu/mplayer/trunk. I believe it would be a good idea to move to one of these sources (I would prefer tar downloads myself) and use a newer more robust (probably) version of mplayer2.
>

I didn't think to look anywhere other than their git tree which seems
to be abandoned (the version we are using is the latest out there)

> I will be working on a new recipe to cater this if there are no objections but I would really like to have some feedback before I do so.

I've been trying to fix up what we have now that OE-core has
abandoned libav, replacing it with a newer ffmpeg.  Maybe I'll
give this a go myself if you'd like to wait a short while (perhaps
by tomorrow)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

