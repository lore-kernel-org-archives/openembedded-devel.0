Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXbSC-0006z9-DG
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 14:18:08 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 70F834025B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 09:17:04 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id BBB8C740D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 11:16:58 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AB88061006F; Thu, 12 Feb 2009 11:16:45 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<4994132E.2040603@balister.org> <4994168C.6010603@balister.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 11:16:45 -0200
In-Reply-To: <4994168C.6010603@balister.org> (Philip Balister's message of
	"Thu, 12 Feb 2009 07:31:08 -0500")
Message-ID: <87iqnfvlqa.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Thu, 12 Feb 2009 13:18:08 -0000
Content-Type: text/plain; charset=us-ascii

Philip Balister <philip@balister.org> writes:

> Philip Balister wrote:
>> Koen Kooi wrote:
>>> On 12-02-09 12:26, Roman I Khimov wrote:
>>>> Hello all.
>>>>
>>>> Don't know why, but rpm2cpio tarball checksums are wrong, so here
>>>> is the fix:
>>>
>>> If they are wrong we want to see the diff between the old and new
>>> tarballs, replacing checksums as soon as upstream changes defeats
>>> the purpose of us adding them.
>>
>> How can we find a copy of the tarball with the original checksum? I
>> do not have it in my local source cache. The file date on the ftp
>> server is March 1 2008. I'm surprised the FreeBSD crowd would change
>> a tarball, without changing the version.
>
> I checked a couple of the files from this list:
>
> http://dir.filewatcher.com/d/FreeBSD/5.4-release/alpha/rpm2cpio-1.2_2.tbz.3919.html
>
> and the md5sum is 6759b9c029d0c20c657b88d60bc2e277
>
> And yes, I am sort of testing patchwork :) [1]
>
> Philip
>
> [1] http://patchwork.openembedded.org/patch/6/

I'm also using this rpm2cpio since previous one couldn't be located by
me and this works quite fine. I personally support this patch.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


