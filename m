Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kl1gy-0005Qv-T0
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 15:24:37 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id C389D33434D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 10:20:26 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id B30418DEFB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 10:20:26 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 808028DC4FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 10:20:26 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 1 Oct 2008 10:20:26 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 385C9C1FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 10:20:45 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 8CF7461010F; Wed,  1 Oct 2008 10:18:13 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 01 Oct 2008 10:18:13 -0300
In-Reply-To: <48E3762E.6000203@smartlink.ee> (Kalev Lember's message of "Wed\,
	01 Oct 2008 16\:07\:58 +0300")
Message-ID: <87r670h2sq.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 13:24:37 -0000
Content-Type: text/plain; charset=us-ascii

Kalev Lember <kalev@smartlink.ee> writes:

> Otavio Salvador wrote:
>> Kalev Lember <kalev@smartlink.ee> writes:
>>
>>   
>>> Hello,
>>>
>>> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=summary
>>> The master head of org.openembedded.dev is not updating. I already
>>> spotted two bug reports (4584 and 4590) which reported issues that were
>>> fixed in monotone 4 days ago, but never got into git master.
>>>     
>>
>> org.openembedded.dev branch is up to date. I'm using it.
>>
>>   
> Well yes, but if you just do:
> git clone git://git.openembedded.net/org.openembedded.dev
>
> you'll end up on master branch, which is not updating.

Yes it is indeed a problem however I'd like to let you know that one
branch was being update ... :-)


-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


