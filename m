Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KNuxX-0001AD-Si
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jul 2008 21:34:12 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id CD2AA8BC13F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 16:32:33 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 9F3B38BC13B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 16:32:33 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 29 Jul 2008 16:32:33 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 80488C0DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 13:32:28 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A474361006A; Tue, 29 Jul 2008 16:31:38 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com> <488F6B5B.4090400@gmx.de>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 29 Jul 2008 16:31:38 -0300
In-Reply-To: <488F6B5B.4090400@gmx.de> (Thomas Kunze's message of "Tue\,
	29 Jul 2008 21\:11\:23 +0200")
Message-ID: <873als8p2d.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Git Migration Status
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
X-List-Received-Date: Tue, 29 Jul 2008 19:34:12 -0000
Content-Type: text/plain; charset=us-ascii

Thomas Kunze <thommycheck@gmx.de> writes:

> Hi,
>
> just a minor question:
> Can we have the sender for commit messages as it is in monotone?
> e.g. "mickeyl commit" instead of  "OE GIT Trial"
>
> I find it very useful to be able to see who committed sth. with a
> short look
> into my mailbox.

You'll see the merge commit and the mail script could be changed to
post the commiter id too I guess.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


