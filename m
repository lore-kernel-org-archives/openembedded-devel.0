Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NDyUU-0002KS-Q0
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 11:55:57 +0100
Received: by fxm8 with SMTP id 8so1285248fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=9IO7I80ezszT8hfL8egeBwbPLpsAdlME16EPaL2WgiM=;
	b=nz2vqSRsMFt5bgd2htyn+sDqgJ78az8Y90hSj3WZJ1OCDb67HW8bz2P61cQLvX+77c
	CVf80PoAj/FrC8cqqOq6EDwfLnetrPF88Bpq1lOUwNLPFJh30cA5APtb7UVqsTv+YSz5
	iohb0o/PDLmoyAR4IWpOvIEvH3UQ2pSzXizdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=nYlf6TjmVwndfl1MWMjXy4D/1BQkRL2O4hCTCQfTnsN2z0YI+Hi5v+7ACDgQ2B1TeW
	OAjS6jAuclXaab4tsYRUi0y6kkczIMn2XD9wYNs0IAfv74BrHHcF8ik5CDJwlOFd0ebl
	Zes7SqJudfE+I8pVDLOIfsG5t5EYnZXdrgPug=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.145.13 with SMTP id q13mr94441hba.125.1259319263413; Fri, 
	27 Nov 2009 02:54:23 -0800 (PST)
In-Reply-To: <ae9c9a1c0911261808v3dec996fqd83d164f6c960798@mail.gmail.com>
References: <E1NDcWJ-0005Ee-Np@melo.openembedded.org>
	<ae9c9a1c0911261808v3dec996fqd83d164f6c960798@mail.gmail.com>
Date: Fri, 27 Nov 2009 08:54:23 -0200
X-Google-Sender-Auth: d893556f0a08da57
Message-ID: <be7a9f3d0911270254o516192e3wd01d78b0b2005d16@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Thomas Zimmermann : obexd: add version 0.19
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
X-List-Received-Date: Fri, 27 Nov 2009 10:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Ricardo,

On Fri, Nov 27, 2009 at 12:08 AM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> Hi,
>
> I actually sent a similar patch to the list, but also moving the
> content to a .inc file, 4 days ago.
>
> Was this patch available anywhere else or simply no one is paying much
> attention to patchwork?
>
> Just to understand better how the patch process is actually being handled in OE.

Most people look at OE mailing list and patchwork from time to time
and then this happens sometimes when someone commit a change in
meanwhile.

It would be nice if you could put you .inc improvement in the next patch set :-)

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


