Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm6km-0004wf-Bd
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 18:14:36 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qm6gh-0003Aa-DU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 09:10:23 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 09:10:23 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 09:10:22 -0700
Message-ID: <4E303868.5030905@mentor.com>
Date: Wed, 27 Jul 2011 09:10:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1311709612-3664-1-git-send-email-tom_rini@mentor.com>	<1311710326.3735.447.camel@mattotaupa>
	<1311777017.18419.20.camel@mattotaupa>
In-Reply-To: <1311777017.18419.20.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 16:10:23.0242 (UTC)
	FILETIME=[B078AEA0:01CC4C77]
Subject: Re: [meta-oe] patch review for meta-oe
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
X-List-Received-Date: Wed, 27 Jul 2011 16:14:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 07/27/2011 07:30 AM, Paul Menzel wrote:
> Dear Koen, dear Tom,
> 
> 
> I am surprised that you applied Tom’s patch without incorporating my
> review.
> 
>         commit 77d31f8d3027f6ef96bff61da4bf22cf9618bf21
>         Author:     Tom Rini <tom_rini@mentor.com>
>         AuthorDate: Wed Jul 27 03:46:52 2011 +0000
>         Commit:     Koen Kooi <koen@dominion.thruhere.net>
>         CommitDate: Tue Jul 26 21:51:39 2011 +0200
>         
>             rp-pppoe: Port from oe.dev
>             
>             The difference between this and oe.dev are:
>             - Reset PR
>             - Add bitfields site variable to the endian site file
>               This was wrong in oe.dev for BE (mips).
>             - Add LIC_FILES_CHKSUM
>             
>             Signed-off-by: Tom Rini <tom_rini@mentor.com>
>             Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> First of all, the dates do not make any sense at all, so it looks like
> you applied it already three minutes after Tom had sent the patch.
> 
> I would suggest, that patches get a little more time for review before
> you apply them, which is of course disadvantageous for people wanted to
> see their patches applied right away.
> 
> But I would like to prevent that “messy” patches get applied to the new
> repositories to get a better quality.
> 
> So Tom, it would be nice if you could sent improvement patches to fix
> the `HOMEPAGE` field, the patch headers and the whitespace. The `PR`
> cannot be fixed now.

Yeah, we were both bad here (I shouldn't have asked Koen and he shoulda
said no).  I'll post an update with your changes incorporated later today.

-- 
Tom Rini
Mentor Graphics Corporation


