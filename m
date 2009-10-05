Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MuwXF-000239-EU
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 01:00:08 +0200
Received: by fxm3 with SMTP id 3so3293724fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2009 15:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=Eg7OUuIeF7AOXbe++WgJihWtxb5zHDz3f2BLeozs/do=;
	b=C5Y1TMA5g079xA7kp1X0uCcLDpZuyWywwzdGRhnDTn1+xuh8RwqJf2WQkMoR3075TD
	ekux+HICK3fLhNOXvC2roX3vYtLON/zAdnyNEP9LmO6JM0YzlWx0II52Ogh192gfjfoC
	Y00vSeDkqQ3oFFSJiqNeRVBdzf99FuKE4RH/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=t674odXXJReQSauZBFX3UrnEkyw3hnMdqzUprxvn7krPL/TpXTVfaeqNOMnR3Hr87X
	sg5ddEDRhvAEUvOotXfL0VGmiNeKfjX+38kCa6Y5YubkkM2YcHqY8Ee31UV/uE3ouLyO
	pKpz9zN0TDSV9TRDT2YhTv7RZrnq/Wc4RTraY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.189.81 with SMTP id s17mr61766hbh.213.1254783557100; Mon, 
	05 Oct 2009 15:59:17 -0700 (PDT)
In-Reply-To: <1254774335.3947.12.camel@leeloo.somedomain>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
	<1254774335.3947.12.camel@leeloo.somedomain>
Date: Mon, 5 Oct 2009 19:59:17 -0300
X-Google-Sender-Auth: d2786947d1f479d4
Message-ID: <be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 23:00:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Michael,

On Mon, Oct 5, 2009 at 5:25 PM, Michael Lippautz
<michael.lippautz@gmail.com> wrote:
> After further investigation, I found a document
> (${S}/doc/configuration.txt) that states:

The best way to provide the patch is to commit it locally and use git
format-patch to export it. Then send it attached to the mail.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


