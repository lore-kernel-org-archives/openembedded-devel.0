Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nbr0K-00071x-4s
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 08:47:31 +0100
Received: by ywh6 with SMTP id 6so3202663ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 23:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=EU9uqr3N0KoSYE40VCzIC5y5Ygua/9iFXYJy6RWp1Bk=;
	b=dTQ8gtkV2IIzM2ZPHqB1i+QVrhqz6jhnaARMf8altlDSy9vuoRxu/GHoHHX6x8L6J4
	Aykp0u4KpfMdUtm83fthjj95BGoknTE+YyBDBYt0NOoyo/6Qn9V/9iOelOlgsYW2ill1
	Opid21+lPoQG4/KBZGOvz7JcvQZHwHe/JVwko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=wi+19eaaiawTNPRd2wP+ZvizTQxnU3Bef1LspwEt1+jxVZtqw3hxFqVlTGxypJJznv
	XVRS+hLjIpioeyzTS6DuDAr93r3WeRTBde+52u3ARSV2VMB3YJAvuXgqA/R79srHBBHs
	xEcfv+jCxU/nosfmznrXS7kOudnPXCIG1DluE=
MIME-Version: 1.0
Received: by 10.101.168.12 with SMTP id v12mr4687750ano.122.1265010301771; 
	Sun, 31 Jan 2010 23:45:01 -0800 (PST)
Date: Mon, 1 Feb 2010 08:45:01 +0100
Message-ID: <ac9c93b11001312345k7cbf864fte67fce2c5b8fcdba@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: kernel build: modules.order and modules.builtin
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
X-List-Received-Date: Mon, 01 Feb 2010 07:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Should modules.order and modules.builtin be shipped in a package when
a kernel is build? currently I get a note that they are installed but
not shipped.
I've seen this both for beagleboard and openrd.

Frans


