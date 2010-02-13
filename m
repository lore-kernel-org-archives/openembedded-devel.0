Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgE0U-0003ll-8L
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 10:09:45 +0100
Received: by fxm26 with SMTP id 26so3255681fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 01:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=7NLHvynktntRT/O/OzShxgvW+5fC5HqbF5EMFdk51Dc=;
	b=tTaEwHQuvBk7XaORC97p7wgiyduBKtT5+9KJqpQNWUfRxz1thRWJoY4Uo1L3kIiX2b
	7MIsuvRK5lxHCpWIHp9rJvxX69TtegXl2sRGgSTDV8vxkIgOBLfjeXBzTYzeTn1W7oHl
	WQG5r+jJeY0SVsIi5EyR0dE/w0nzJcDwHwteU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Nt64DG5ZCHcgADNgQJfblreiKMCF19obT70JGP+D6TQf0WvCxv4wAwNM4Dc1RSSb/h
	8yZ7HCks90KVvKMfyhGxQ2Oz0aFz1Lg/nhGb4q6xLltqFJXQzcOKOioMPy/OZkUNN3Mf
	lQk4NkkKRUylfhOU3QQqYyUNuULPKFC+S1WqA=
MIME-Version: 1.0
Received: by 10.223.81.89 with SMTP id w25mr2910435fak.25.1266052026473; Sat, 
	13 Feb 2010 01:07:06 -0800 (PST)
Date: Sat, 13 Feb 2010 10:07:06 +0100
Message-ID: <ade1bdc1002130107q6e83bca2sd57391ca539ef6a4@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: git and ssh and kernel development
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
X-List-Received-Date: Sat, 13 Feb 2010 09:09:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
I have a git mirror of the kernel.
How to fetch from it in ssh .
ssh://user@ipaddress/pathtogit;protocol=git;branch=master
but ssh has password  ..

Second question: if pathtogit is a dir on my pc where I'm developing
what is the syntax?

Thx

-- 
www.opensurf.it


