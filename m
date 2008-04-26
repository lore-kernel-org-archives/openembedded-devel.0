Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jpll9-0003Yf-T0
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Apr 2008 16:52:16 +0200
Received: by an-out-0708.google.com with SMTP id b33so998143ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2008 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=qoE8P4jxecQN+58spIcY09f+zMtM76xmwTGQJw29eqo=;
	b=As+7hc2LRB1Wk8BafByE/KP9h+FF5o26nwoQBKus35vWjOZq11jxRZRsEAgNzGCMwpsaQ4Lw7/jw2JD0UzWA9UFGQ49ogRONeDOGIa6M/5S5X/JIovsFGQM1F71Nz8zZJLRhmA+vwxPJuqS1xBhD1SvHt4FF82SNKS0yI0lZp2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=VfQVyp6ig58bpIwUtOl/1jkhgE8hjfPDAP3JIICx8uf8SRYTBbwRVyEvKuWZwD0qeHxki0KaHY8NUx17V0O/iD+JUIhi5tAjesX4dYdFaoEDCbIxIcRTWK5KP7aR/1ZcV7TX0NztLNrP7R8JJolMvL2AZZPFvT8YE8W/tHXa3ow=
Received: by 10.101.68.19 with SMTP id v19mr9367848ank.75.1209221509047;
	Sat, 26 Apr 2008 07:51:49 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sat, 26 Apr 2008 07:51:48 -0700 (PDT)
Message-ID: <c384c5ea0804260751o12ee60des921c17f6ba8e6f24@mail.gmail.com>
Date: Sat, 26 Apr 2008 16:51:48 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804261508.00101.mickey@vanille-media.de>
MIME-Version: 1.0
References: <200804261508.00101.mickey@vanille-media.de>
Subject: Re: (admin) infrastructure status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 26 Apr 2008 14:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello Michael,

On Sat, Apr 26, 2008 at 3:08 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
>  We went through a series of hardware problems lately. First, our =FCbers=
erver
>  linuxtogo.org was completely unresponsive for more than 24h. In an attem=
pt to
>
First, thanks for explaining the situation and resolving it.

Can we improve on the server situation somehow to have a much more
reliable infrastructure?

Having full control of the server (even physically) seems to be a
requirement, as well as more than a few admins that can unbreak stuff.

I.e. what would we need in the ideal world?

Regards,
--=20
Leon


