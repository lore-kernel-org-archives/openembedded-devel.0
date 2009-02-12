Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXdrl-0001YH-OS
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 16:52:41 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 81E414025B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 11:51:39 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 9CE22740D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 13:51:37 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id ABA9861012F; Thu, 12 Feb 2009 13:51:24 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902121426.26727.roman@khimov.ru> <gn160m$8s4$1@ger.gmane.org>
	<200902121624.02569.jay4mail@gmail.com>
	<200902121656.56180.roman@khimov.ru>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 13:51:24 -0200
In-Reply-To: <200902121656.56180.roman@khimov.ru> (Roman I. Khimov's message
	of "Thu, 12 Feb 2009 16:56:50 +0300")
Message-ID: <87hc2zslfn.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 12 Feb 2009 15:52:42 -0000
Content-Type: text/plain; charset=us-ascii

Roman I Khimov <roman@khimov.ru> writes:

> I don't think we can trust precompiled packages with this situation. And cvs
> checkout for one file... Well, maybe something like this:
<...>

I liked this solution since it is a simple http request, we track the
checksum and also avoid the freebsd packages.

+1

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


