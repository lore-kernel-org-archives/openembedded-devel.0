Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NB7Id-0006Mn-7I
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:43:54 +0100
Received: by bwz9 with SMTP id 9so2290257bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=P6HlWM9WUGUhB88nlgzGU3CE6YUZpZYE0qVJiSCscSE=;
	b=Av4bskQ8g9n6hyz+z9DTACSbokCFIRITRZduPtt6lgJyjfs280xHH+dJcxjC/EWjGl
	FOmzvdfQEZLmGhNEFHED/VaXHzqkzQ7CO/pWLYFC34cRz/UywpXagqWfqELKvHuDKx7Q
	S+76YENCIDWhhiNB3ApdFk/mu81Hhew3b47j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=ibR75asLJA5/SDWnRo7hWZ+buOwMUCF0NZ37TR+XnRpyvsL3ZGyq724XbLuDNMFgyR
	0gspouB6n8B4gbNd2OqF/qQXfmVkifiymw4ihPu/VaQx26p7zh2afM5U1U53/7Fr0Qsz
	bSL65QeKstRAkAMmJvEBeMx4VTafsl5dI4kiw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.141.155 with SMTP id c27mr311hba.48.1258638146299; Thu, 19 
	Nov 2009 05:42:26 -0800 (PST)
In-Reply-To: <1258631715.23826.63.camel@mill.internal.reciva.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
Date: Thu, 19 Nov 2009 11:42:26 -0200
X-Google-Sender-Auth: bad673aea38cd633
Message-ID: <be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 13:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Nov 19, 2009 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
> Right, but I think these conflicts are a result of attempting what seems
> like a nonsensical merge.
>
> Which specific changesets from stable/2009 do you feel are missing
> in .dev?

Ok but what is the planned migration path from users that used
stable/2009 to stable/2010?

I mean, when we start stable/2010 we expect that users that based
their distros in stable/2009 need to redo all work to move to
stable/2010? If we merge stable/2009 into .dev then this is going to
be much easier.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


