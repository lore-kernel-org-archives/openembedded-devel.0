Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kwzu6-00079L-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Nov 2008 14:55:39 +0100
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 3E39633700D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2008 11:32:25 -0200 (BRST)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 2714033688E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2008 11:32:23 -0200 (BRST)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 3 Nov 2008 11:32:22 -0200
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 9C9118E30AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2008 11:32:23 -0200 (BRST)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 449F08CE28E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2008 11:32:23 -0200 (BRST)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 3 Nov 2008 11:32:22 -0200
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 03E77C1F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2008 11:32:22 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E346CC48CBC; Mon,  3 Nov 2008 11:28:54 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <490BF303.1030701@dls.net> <490E5FAA.9070206@dls.net>
	<200811031347.08952.zecke@selfish.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 03 Nov 2008 11:28:54 -0200
In-Reply-To: <200811031347.08952.zecke@selfish.org> (Holger Freyther's message
	of "Mon\, 3 Nov 2008 13\:47\:08 +0100")
Message-ID: <87ljw1ey5l.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [RFC] Re: DISTRO_PR, ipkg dependencies, and meta toolchains...
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
X-List-Received-Date: Mon, 03 Nov 2008 13:55:44 -0000
Content-Type: text/plain; charset=us-ascii

Holger Freyther <zecke@selfish.org> writes:

> On Monday 03 November 2008 03:19:22 Mike (mwester) wrote:
>> Mike (mwester) wrote:
>>
>> (Replying to my own email, and what's worse -- I'm top-posting!)
>> (And I changed the subject line to add [RFC] to get your attention.)
>>
>> I found the problem.  Here's a fix:
>
> eek, otavios and richard went over it. could you please comment?

It is fixed in current GIT and works fine for me since then... 

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


