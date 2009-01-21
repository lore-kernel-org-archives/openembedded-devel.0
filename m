Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LPdmo-0006Ps-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jan 2009 15:10:31 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 4A92F400E5;
	Wed, 21 Jan 2009 10:04:18 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id A1450740BC;
	Wed, 21 Jan 2009 12:03:21 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 6C3236101B8; Wed, 21 Jan 2009 11:58:06 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <f96d234e0901200840s4f346e3ev5f294ac0445522e8@mail.gmail.com>
	<20090120190022.GD30203@smtp.west.cox.net>
	<f96d234e0901210529q57d4abf1s98295b7160d6d2da@mail.gmail.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 21 Jan 2009 11:58:06 -0200
In-Reply-To: <f96d234e0901210529q57d4abf1s98295b7160d6d2da@mail.gmail.com>
	(Cliff Brake's message of "Wed\, 21 Jan 2009 08\:29\:05 -0500")
Message-ID: <87hc3s2235.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: OE weekly changelog 2009-01-12 to 2009-01-19
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
X-List-Received-Date: Wed, 21 Jan 2009 14:10:31 -0000
Content-Type: text/plain; charset=us-ascii

Cliff Brake <cliff.brake@gmail.com> writes:

> On Tue, Jan 20, 2009 at 2:00 PM, Tom Rini <trini@kernel.crashing.org> wrote:
>> On Tue, Jan 20, 2009 at 11:40:03AM -0500, Cliff Brake wrote:
>>
>>> OE weekly changelog 2009-01-12 to 2009-01-19
>>
>> Hmm, this missed pulling in rpurdie/canadian-sofar into the main branch.
>
> Thanks for pointing that out -- I'll see if I can update the script to
> included merges like that.

Personally I think that it is better to keep --no-merges otherwise it
will be poluted and it won't give you the idea of what was pulled
anyway.

If someone wants to know where something has been introduced, it is
much better to use gitk or similar.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


