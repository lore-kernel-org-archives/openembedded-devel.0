Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K7E8g-0001D0-4T
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 20:37:01 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id C215C16D858;
	Fri, 13 Jun 2008 15:36:28 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 8DA58F7749;
	Fri, 13 Jun 2008 15:36:28 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 13 Jun 2008 15:36:28 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 1C161C1F2;
	Fri, 13 Jun 2008 12:37:25 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E4A30C4857A; Fri, 13 Jun 2008 15:38:23 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<g2tv3m$t5l$1@ger.gmane.org>
	<74d0deb30806130925u7ec0c1e4sfdf2144e703f2b9a@mail.gmail.com>
	<g2ubb9$a55$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Jun 2008 15:38:23 -0300
In-Reply-To: <g2ubb9$a55$1@ger.gmane.org> (Koen Kooi's message of "Fri\,
	13 Jun 2008 19\:38\:50 +0200")
Message-ID: <87od65rxi8.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 18:37:49 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> pHilipp Zabel wrote:
>
>>>> Personally, I'd like to see every patch to OE being sent to and
>>>> reviewed on the mailing list.
>>> I'd like to see that every commit has at least 2 SOBs, I care less on how
>>> they get there. Having the review out in the open should be the end goal,
>>> though.
>>
>>  From Documentation/SubmittingPatches:
>> "The Signed-off-by: tag indicates that the signer was involved in the
>> development of the patch, or that he/she was in the patch's delivery path."
>>
>> In the kernel Signed-off-by is primarily used to mark the way a patch
>> took into the kernel. If we do this, maybe we should use the same
>> nomenclature and have Acked-by for statements of approval. (And
>> eventually Tested-by/Reviewed-by, too?)
>
> That is probably a good idea.

I don't know how kernel people do to amend the patch to add the
acked-by/whatever data into each patch. It can be a big amount of work
to do an iteractive rebase for every ack given on ml for each patch
and with a high risk of human mistake while doing it.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


