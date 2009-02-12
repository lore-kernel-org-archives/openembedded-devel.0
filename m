Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXlNW-00053Z-3E
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 00:53:58 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 48AA74025B;
	Thu, 12 Feb 2009 19:52:54 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id A3CB3740D9;
	Thu, 12 Feb 2009 21:52:52 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 81DA16101F6; Thu, 12 Feb 2009 21:52:40 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<gn1m1n$5tl$3@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 21:52:40 -0200
In-Reply-To: <gn1m1n$5tl$3@ger.gmane.org> (Koen Kooi's message of "Thu, 12 Feb
	2009 18:25:10 +0100")
Message-ID: <87ljsbmcvr.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 23:54:00 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 12-02-09 17:38, Otavio Salvador wrote:
>> ---
>>   classes/package.bbclass     |   10 ----------
>>   classes/package_ipk.bbclass |    4 ++++
>>   2 files changed, 4 insertions(+), 10 deletions(-)
>
> I'd like a bigger explanation what does wants to do and what the
> impact of it is.

It adds dependencies on locales packages for the included languages.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


