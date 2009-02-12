Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXbVT-0003zT-VP
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 14:21:32 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id BE69C4025B;
	Thu, 12 Feb 2009 09:20:27 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id B09EF740D9;
	Thu, 12 Feb 2009 11:20:26 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 36AE561006F; Thu, 12 Feb 2009 11:20:14 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<200902121541.09495.roman@khimov.ru> <gn160m$8s4$1@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 11:20:14 -0200
In-Reply-To: <gn160m$8s4$1@ger.gmane.org> (Koen Kooi's message of "Thu, 12 Feb
	2009 13:51:34 +0100")
Message-ID: <87ab8rvlkh.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Thu, 12 Feb 2009 13:21:39 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

<...>
>> Now another question is why OE package uses such tarball as source at all.
>> So, probably we can change the source to something like
>>
>> http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cpio/files/rpm2cpio?rev=1.2;content-type=text%2Fplain;only_with_tag=RELEASE_7_1_0
>>
>> which is the only file we need and it's rev'd tagged should-be-non-volatile.
>
> Seeing the current sitation with the freebsd people this would get my vote.
<...>

I support this one too :(

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


