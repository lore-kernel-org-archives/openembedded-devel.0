Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K4lSy-0005wU-9G
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 01:35:28 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 0FFDA8ADD09
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 20:30:36 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id C26218ADD07
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 20:30:35 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 6 Jun 2008 20:30:35 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 2B8C9C1F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 17:30:44 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AD728610055; Fri,  6 Jun 2008 20:32:29 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <48486D5B.4060000@nospam.arcornews.de>
	<200806061502.02821.mickey@vanille-media.de>
	<1212789415.6840.30.camel@dax.rpnet.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 06 Jun 2008 20:32:29 -0300
In-Reply-To: <1212789415.6840.30.camel@dax.rpnet.com> (Richard Purdie's
	message of "Fri\, 06 Jun 2008 22\:56\:55 +0100")
Message-ID: <878wxib0mq.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: RFC: RW for otavio
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
X-List-Received-Date: Fri, 06 Jun 2008 23:35:28 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <rpurdie@rpsys.net> writes:

> The point here is to let people build up gradually. Changing the core
> infrastructure can influence a lot of people and whilst I don't want to
> discourage people hacking on it, we do need to take more care on those
> changes than ones in "lower" level recipes. I'm fairly sure most of the
> devs know and respect this, I just wonder if having some kind of more
> formal policy written down would be a good idea so people know where
> they stand?

This is usual in most projects.

I fully agree that this should be a policy and would be nice to have a
cannonical place to look for maintainers. That avoids mistakes from
begginers (like me).

I also believe this makes easier and avoid stupid mistakes to get in
SCM. More people checking is always good and I see no problem in
requiring it.

Cheers,

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


