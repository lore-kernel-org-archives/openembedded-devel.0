Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RWUOx-0001Dq-4h
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 15:47:47 +0100
Received: by bkbzv15 with SMTP id zv15so3147562bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 06:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4NWNRdscXZOEqngVBf4tKz/lZahyr9lMJJbNk2vRSC0=;
	b=khQOcmDxdnYEWBqIVmmMkKqEKI1A7/gjzsK9aPEBO+jBM4wcRmAiLIIF9ZNbnOEd33
	pYDjUqP/UJ3iR9/HFHe3ir8HQ49Vd9hxjGAQi3ERSsMpIRUe3lDxUwqvp0Y++cMEa6C7
	akV2Xt6Nlabz7jlh1emyu+n7jwZLIpR9q+xm0=
MIME-Version: 1.0
Received: by 10.204.132.89 with SMTP id a25mr10873284bkt.85.1322836863933;
	Fri, 02 Dec 2011 06:41:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Fri, 2 Dec 2011 06:41:03 -0800 (PST)
In-Reply-To: <4ED8E344.6040408@eukrea.com>
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
	<CAP9ODKq9VHPHHV57RakS8NB-xCWt3wxHhX3sr0AHdC=rahjM8A@mail.gmail.com>
	<4ED8E344.6040408@eukrea.com>
Date: Fri, 2 Dec 2011 12:41:03 -0200
X-Google-Sender-Auth: mZbrHq30_xmP6zkdMsF_olkTWA4
Message-ID: <CAP9ODKqBb8TQH3LcXD0qycvAWfV8dboJ1dtxavtpLbp7qG0EwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 1/3] pcsc-lite: handle initscript
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
X-List-Received-Date: Fri, 02 Dec 2011 14:47:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 12:40, Eric B=E9nard <eric@eukrea.com> wrote:

> what do you mean by autoload support ?


Any use of the client library makes the daemon to load and when noone is
using it anymore it dies.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

