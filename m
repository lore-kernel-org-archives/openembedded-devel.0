Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LKGnA-0001bh-VT
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 19:36:41 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 32C08400CF;
	Tue,  6 Jan 2009 14:30:54 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 048FD2253A;
	Tue,  6 Jan 2009 14:30:35 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 342BA610057; Tue,  6 Jan 2009 16:25:40 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <87r63gseu6.fsf@neumann.lab.ossystems.com.br>
	<gjvu32$7dh$1@ger.gmane.org> <1231260477.5330.21.camel@dax.rpnet.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 06 Jan 2009 16:25:40 -0200
In-Reply-To: <1231260477.5330.21.camel@dax.rpnet.com> (Richard Purdie's
	message of "Tue\, 06 Jan 2009 16\:47\:57 +0000")
Message-ID: <87iqosnvff.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] bitbake git fetcher fix
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
X-List-Received-Date: Tue, 06 Jan 2009 18:36:41 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <rpurdie@rpsys.net> writes:

> How about we adopt Poky's slightly more verbose approach of SRCREV ?=
> "INVALID" in bitbake.conf?
>
> We check for "INVALID" in bitbake and error if we see it.

This would saved my a lot of time ;-)

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


