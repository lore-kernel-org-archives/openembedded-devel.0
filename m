Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kks18-00043C-Ht
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 05:04:46 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id A9A0633434A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 00:00:36 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 1BEDF8C6C83
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 00:00:41 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id E0E9A1E057F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 00:00:40 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 1 Oct 2008 00:00:39 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id D11A8C205
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 00:00:53 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 340BC61012B; Tue, 30 Sep 2008 23:58:24 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <200810010447.44667.zecke@selfish.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 30 Sep 2008 23:58:24 -0300
In-Reply-To: <200810010447.44667.zecke@selfish.org> (Holger Freyther's message
	of "Wed\, 1 Oct 2008 04\:47\:41 +0200")
Message-ID: <87y719nhrj.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: RFC: Making it mandantory to have a checksums.ini entry
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
X-List-Received-Date: Wed, 01 Oct 2008 03:04:47 -0000
Content-Type: text/plain; charset=us-ascii

Holger Freyther <zecke@selfish.org> writes:

> The spend time on copy and pasting a checksums.ini entry is really small and 
> the value is very high. Stuff like macports is forcing one to have checksums 
> as well.

This makes a lot of sense for me since the way it is being used
currently makes no sense.

If people has internal repositories that don't want to use checksum it
can be allowed by recipe basis as you already support in your proposed
patch.

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


