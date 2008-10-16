Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KqWI7-0002w4-5m
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 19:05:39 +0200
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 5D7BA334D37;
	Thu, 16 Oct 2008 14:05:34 -0300 (BRT)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 8D5C5334D1E;
	Thu, 16 Oct 2008 14:05:32 -0300 (BRT)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 16 Oct 2008 14:05:30 -0300
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 93BFE8D1533;
	Thu, 16 Oct 2008 14:05:32 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 549F153683;
	Thu, 16 Oct 2008 14:05:32 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 16 Oct 2008 14:05:32 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 98FA9C1EC;
	Thu, 16 Oct 2008 15:07:04 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 1D441610191; Thu, 16 Oct 2008 14:02:51 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <gd7lda$3bi$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 16 Oct 2008 14:02:51 -0300
In-Reply-To: <gd7lda$3bi$1@ger.gmane.org> (Koen Kooi's message of "Thu\,
	16 Oct 2008 17\:08\:26 +0200")
Message-ID: <871vygv5fo.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Commit policy violations
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
X-List-Received-Date: Thu, 16 Oct 2008 17:05:39 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> Hi,
>
> We have had a commit policy for some years now, so it would be nice if
> people would actually stick to it.
>
> So don't do things like this:
>
> "[PR] Change PR to FILE_PR and intro PR as FILE_PR + DISTRO_PR"
>
> or
>
> "[hal] Add latest hal and hal-info"
>
> or
>
> "add task-fonts-truetype"
>
> Those 3 are all *bad*.

Could you explain which would be the good ones?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


