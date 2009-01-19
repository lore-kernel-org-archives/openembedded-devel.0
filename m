Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LOiv6-0000yO-TB
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jan 2009 02:27:17 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 3A36840A7E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 21:02:55 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 9D33C740BD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 23:02:02 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 7A21F610047; Sun, 18 Jan 2009 22:56:47 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <20090115061418.GA13352@denix.org>
	<20090115073709.GB7020@gmail.com> <20090115155159.GB15943@denix.org>
	<20090118041800.GA852@denix.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sun, 18 Jan 2009 22:56:47 -0200
In-Reply-To: <20090118041800.GA852@denix.org> (Denys Dmytriyenko's message of
	"Sat\, 17 Jan 2009 23\:18\:00 -0500")
Message-ID: <87zlhoglkg.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Mon, 19 Jan 2009 01:27:17 -0000
Content-Type: text/plain; charset=us-ascii

Denys Dmytriyenko <denis@denix.org> writes:

>> I guess we need more Core devs to look into this issue to verify the safety of 
>> this patch.
>
> Otavio was using patched package.bbclass (as mentioned above) for a few days 
> and found it working fine and fixing udev issue for him.
>
> Khem, please let me know if you still disagree with the proposed fix. Or if 
> anybody else has any objections, please speak up. Otherwise I'd like to check 
> in the fix for the package.bbclass in a day or two. Thanks.

Yes, I support this patch since it does solve the issue for me.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


