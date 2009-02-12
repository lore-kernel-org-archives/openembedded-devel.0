Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXbU7-00074G-8i
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 14:20:07 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 528D34025B;
	Thu, 12 Feb 2009 09:19:04 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 45A9F740D9;
	Thu, 12 Feb 2009 11:19:03 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CB4F461006F; Thu, 12 Feb 2009 11:18:50 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<4994132E.2040603@balister.org> <gn152q$5pk$1@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 11:18:50 -0200
In-Reply-To: <gn152q$5pk$1@ger.gmane.org> (Koen Kooi's message of "Thu, 12 Feb
	2009 13:35:37 +0100")
Message-ID: <87eiy3vlmt.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 13:20:07 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

<...>
> commit a7d0813dd5c391183b1356c49bf082a647123985
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Nov 18 12:21:08 2008 -0200
>
>     checksums.ini: fix rpm2cpio checksums
>
> -md5=d4950dc6918ca79a4abab306b6188512
> -sha256=5ec970d34b4e22feea0333dae3b5f5ee0e38295d89e306b4929b910f4a2aae25
> +md5=63f39118ea5ef7cda84a0638002ed6d2
> +sha256=27ffe0392ae193eb04786a2159c099a00fe38ccd
>
> So it seems that freebsd people are replacing their files or that
> their server suffers massive disk corruption.

Indeed :(

Do someone has contact with FreeBSD people to ask about it and get more
information?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


