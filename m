Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KnDvf-0007j4-Vb
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 16:52:52 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 6A485334919
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 11:48:12 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 96FE419AB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 11:48:11 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 5A4C419AB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 11:48:10 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 7 Oct 2008 11:48:08 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 33BA6C5A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 11:48:57 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5CD7561018B; Tue,  7 Oct 2008 11:45:50 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<f2596b99780ea3954dc25884bf29704a5584c2f8.1223383759.git.eha@doredevelopment.dk>
	<20081007133502.GA19220@mi.fu-berlin.de>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 07 Oct 2008 11:45:50 -0300
In-Reply-To: <20081007133502.GA19220@mi.fu-berlin.de> (Henning Heinold's
	message of "Tue\, 7 Oct 2008 15\:35\:02 +0200")
Message-ID: <87prmcbh0h.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [PATCH 13/13] canadian-sdk.bb, task-sdk-canadian-host.bb
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
X-List-Received-Date: Tue, 07 Oct 2008 14:52:52 -0000
Content-Type: text/plain; charset=us-ascii

Henning Heinold <heinold@inf.fu-berlin.de> writes:

> Hi,
>
> thanks for the patches, but normaly we prefer to put the patches into the
> bugtracker and mentioned here the bug id.
>
> Bye Henning
>
> PS: If no one is doing something on this bug ping the list from time to time.

It would be much better to open a bug just to point to the git
tree. Otherwise it is really boring to submit a lot of patches to
bugzilla.

Besides that, reviewing the patches here are much easier and easy to
others to spot mistakes too.

My 2c.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


