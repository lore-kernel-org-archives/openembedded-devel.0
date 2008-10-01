Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kl6D4-00037A-8W
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 20:14:02 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 7279A33434D;
	Wed,  1 Oct 2008 15:09:50 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 41BDB8DF4F8;
	Wed,  1 Oct 2008 15:09:52 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 0216F8DF4E3;
	Wed,  1 Oct 2008 15:09:51 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 1 Oct 2008 15:09:51 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 35E12C1FB;
	Wed,  1 Oct 2008 15:10:11 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 26F3E610159; Wed,  1 Oct 2008 15:07:38 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <87myhocttc.fsf@neumann.lab.ossystems.com.br>
	<gc0baa$o9o$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 01 Oct 2008 15:07:38 -0300
In-Reply-To: <gc0baa$o9o$1@ger.gmane.org> (Koen Kooi's message of "Wed\,
	01 Oct 2008 19\:16\:58 +0200")
Message-ID: <87prmk89zp.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: firefox 3.0.1 issues
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
X-List-Received-Date: Wed, 01 Oct 2008 18:14:02 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 01-10-2008 15:45, Otavio Salvador wrote:
>> Hello,
>>
>> I've found few issues with Firefox 3.0.1. Those are:
>>
>>   - lack of theme icons (arrows and like)
>
> Those seem to work over here (beagleboard, angstrom).

Do you have any idea where it might be failing? I'm building it for
i586 and it fails.

>>   - it is presented as mineshield instead of firefox
>
> You can't legally ship it as 'firefox'.

Due the patches we apply on it?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


