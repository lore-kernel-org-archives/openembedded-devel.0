Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1L0eou-0002TL-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 17:13:24 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id E2FCB40364
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 12:12:09 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 234A2C1F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 14:11:20 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A88A061005E; Thu, 13 Nov 2008 14:07:34 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
	<491C1379.2090404@gmx.de>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 13 Nov 2008 14:07:34 -0200
In-Reply-To: <491C1379.2090404@gmx.de> (Thomas Kunze's message of "Thu\,
	13 Nov 2008 12\:46\:01 +0100")
Message-ID: <87hc6b4njt.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Issues with the system startup when the IMAGE_TYPE is squashfs
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
X-List-Received-Date: Thu, 13 Nov 2008 16:13:24 -0000
Content-Type: text/plain; charset=us-ascii

Thomas Kunze <thommycheck@gmx.de> writes:

> I did this some time ago: http://bugs.openembedded.net/show_bug.cgi?id=3714
> I guess you can do something like this with /etc/volatile.cache too.

Are you interested in making the changes that were suggest in the bug
report to allow us to merge it?

 - move it to update-modules-cross
 - make it a distro option; not a requirement

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


