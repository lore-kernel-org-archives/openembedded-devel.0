Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KkKjV-0007ic-LJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 17:32:22 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 518AA33434A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2008 12:28:19 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id F19738DD8DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2008 12:28:19 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id BF71D8DD8DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2008 12:28:19 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 29 Sep 2008 12:28:19 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id C3030C2B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2008 12:28:28 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 53CC5610045; Mon, 29 Sep 2008 12:26:08 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <200809272237.22810.zecke@selfish.org> <48DEA994.2030607@gmx.de>
	<48DEAE43.5090407@balister.org> <200809280259.18588.zecke@selfish.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 29 Sep 2008 12:26:08 -0300
In-Reply-To: <200809280259.18588.zecke@selfish.org> (Holger Freyther's message
	of "Sun\, 28 Sep 2008 02\:59\:18 +0200")
Message-ID: <878wtb6kj3.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Mon, 29 Sep 2008 15:32:22 -0000
Content-Type: text/plain; charset=us-ascii

Holger Freyther <zecke@selfish.org> writes:

> I like Otavio's idea with the deadline. The question is what to do with 
> unknown names (coming from people using --author on mtn ci). Should we use 
> the comitter id and put the name from mtn inside the comment?

This looks like a good idea. This gives the credit to the author while
doesn't block the migration. 

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


