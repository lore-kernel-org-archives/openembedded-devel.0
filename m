Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MfcrA-0001UW-I0
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 18:57:20 +0200
Received: by fxm24 with SMTP id 24so1420510fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7GY8ro0fJAIiBOQ4MLbVRKIP91qdm4JS7Zkal56sdow=;
	b=AMp45UKeZykMfaKUd5iWBrykxkmoPGr+ItZxB/t91FyECp2mtag2eHVsmZ5BVNxjxZ
	kSVRKlIbmSP/XrYWMFxShT+TM86tElxmTboYR9bhRoeBc9xpbeOj7Od+JIaqbBwXPi4e
	XIrtN/TumXWK6xzAecbc6wLF3E+k+mf1nP1fc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AlyX30+77HB5aMBb+XPEJyxmRQ3oulXZFOuM8ZVbq35jBZi165DKOeSNm+2qNajRyB
	1JOeh6Wv35CqHDTPc80A7I0IRph+7HijSntbGzZNhCBUvxpzuU6LaOSPVUI6mCTMpox1
	dxMR8QDS31nVvWI/e51Z1FcVbtgWTS7zKytks=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.168.154 with SMTP id k26mr561706hbe.104.1251131971714; 
	Mon, 24 Aug 2009 09:39:31 -0700 (PDT)
In-Reply-To: <4A8FA32A.4010400@atmel.com>
References: <4A83BD15.7070006@atmel.com> <h61vvo$n4v$1@ger.gmane.org>
	<4A8515F3.3070502@atmel.com>
	<200908202141.07520.marcin@juszkiewicz.com.pl>
	<4A8FA32A.4010400@atmel.com>
Date: Mon, 24 Aug 2009 13:39:31 -0300
X-Google-Sender-Auth: a9afae37e2e4e59a
Message-ID: <be7a9f3d0908240939p1c37e884q2977e36818a2018d@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Ideas for scripts, to save work, when building several 	boards
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
X-List-Received-Date: Mon, 24 Aug 2009 16:57:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Ulf

On Sat, Aug 22, 2009 at 4:50 AM, Ulf Samuelsson<ulf.samuelsson@atmel.com> wrote:
> It takes less than 2 minutes to rebuild the cache on my machine
> so it is less of an issue for me.

Mind to describe your system?

Besides, depending on how many machines you are doing it can be a
problem. If you build 20 machines, you lose 40min for nothing ;-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


