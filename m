Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1PpmLb-0006HF-Cs for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 19:43:31 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id C8FBF1C1D9F0;
	Wed, 16 Feb 2011 19:34:03 +0100 (CET)
X-Auth-Info: IP3i+EzXtutvJJslB7TmjJm7gUvn/Uoq/deCIC9unFY=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id B16811C00144;
	Wed, 16 Feb 2011 19:34:03 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 8E2F93096C20;
	Wed, 16 Feb 2011 19:34:03 +0100 (CET)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 763A31539C5;
	Wed, 16 Feb 2011 19:34:03 +0100 (CET)
To: openembedded-devel@lists.openembedded.org, "Schuknecht,
	Mario" <m.schuknecht@DResearch.de>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
Comments: In-reply-to "Schuknecht, Mario" <m.schuknecht@DResearch.de>
	message dated "Wed, 16 Feb 2011 16:16:16 +0100."
Date: Wed, 16 Feb 2011 19:34:03 +0100
Message-Id: <20110216183403.763A31539C5@gemini.denx.de>
Subject: Re: [PATCH] u-boot-2009.03: Fix sector table direction for AMIC (hipox machine only)
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
X-List-Received-Date: Wed, 16 Feb 2011 18:43:31 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit

Dear "Schuknecht, Mario",

In message <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de> you wrote:
> 
> > Has this fix been applied upstream yet? What uBoot versions are
> > affected?
> 
> Yes, the fix has been applied
> <http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/94465>.

No, it has NOT been applied in mainline yet.
See http://patchwork.ozlabs.org/patch/82763/ - status is still NEW.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Once they go up, who cares where  they  come  down?  That's  not  my
department."                                       - Werner von Braun


