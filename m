Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Mvh9j-00038D-6B
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 02:46:58 +0200
Received: by bwz26 with SMTP id 26so4388971bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2009 17:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=whO6IDKAQbNTSRhgxmC0Cd+Bz9bc8G1cxQzYp5D17Kc=;
	b=hPdOcDQr6S/F9kzeMGsGSlUHQRkQIQTuA34pM9fEFM10fNMiv1+AA8LteY4IcJ7f2b
	lCNLvUyCuB+L4sk0ZPDP+W8S+6WpEaed/kMTXrsBHtAvySSV36oYzdVNIu50D116uZHK
	xxliLUUq4eURLE0DKUDRcKivSkrfpN6Cv3gao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=Holrqqow/S/jnNtk/YZZ/QW00/yNhJ1coZEPc+ZGqhX8JCdm0NExyIR2gXCxETQmTv
	l2Fw5HGwTgMdInivuc8pr21IomcAaApCVw1IRz/f8Yup36cq/lmxoYIpEke0ps9WfDwm
	j9CXXU1OPQsBw2HszSLFeAAjos9amfqtpWVFw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.211 with SMTP id l19mr43847hbe.119.1254962765060; Wed, 
	07 Oct 2009 17:46:05 -0700 (PDT)
In-Reply-To: <1254820563.6107.4.camel@leeloo.somedomain>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
	<1254774335.3947.12.camel@leeloo.somedomain>
	<be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
	<1254820563.6107.4.camel@leeloo.somedomain>
Date: Wed, 7 Oct 2009 21:46:05 -0300
X-Google-Sender-Auth: 7475f883b11bb931
Message-ID: <be7a9f3d0910071746s21cfaa25i158219e4641ec1ae@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
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
X-List-Received-Date: Thu, 08 Oct 2009 00:46:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Oct 6, 2009 at 6:16 AM, Michael Lippautz
<michael.lippautz@gmail.com> wrote:
> Am Montag, den 05.10.2009, 19:59 -0300 schrieb Otavio Salvador:
>> The best way to provide the patch is to commit it locally and use git
>> format-patch to export it. Then send it attached to the mail.
>
> Thx for all the infos. Here's the patch.

In meanwhile it looks to have been fixed in current master; would be
nice if you could test it and provide a updated patch if still needed.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


