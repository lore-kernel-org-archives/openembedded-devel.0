Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pp1qd-00010u-9i
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:04:27 +0100
Received: by iwn8 with SMTP id 8so4938082iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Vp/i4Wv9dUjcKrjA0UkilGlqkk6e1giG5sLek5Kc7WM=;
	b=Ll73HOeBzuS7WtDoqvdeAZ69fPJItBjtApWkhoAuAj5NCvUxIxjQ0Ktv8PPJkUqNqO
	5kzVgFJPvG53eP0N7aTxeZLocPLgPeT36ulj1k/UM9u8MNxRJutYWjzMHp7YKzboM5BN
	s1e4ExJAxeXOkz2OJqhaMCYC1zPHjYCR6ZnTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tS2+CHZ0XB1od/jjqilKaAw1KwU/gqGTlhO7FHKXxDx5DUCx1IFwEUnvbgbS5rh6XG
	ZOoSQIdtZH1j3iukHomMrQAsznPgG/EGmIU/emdAzZ1vVMFwO/XtrRAPY6nf6lEVM21n
	KnJJS0UJ2Aa5eVLZ4mmZ0rYrWIrXpL3900P0U=
MIME-Version: 1.0
Received: by 10.231.157.211 with SMTP id c19mr3077417ibx.172.1297702672370;
	Mon, 14 Feb 2011 08:57:52 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 08:57:51 -0800 (PST)
In-Reply-To: <4D59543B.50506@mentor.com>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com>
Date: Mon, 14 Feb 2011 17:57:51 +0100
Message-ID: <AANLkTikCsSry215+voCYt4ekMpE_kbM7cE7Jn+zPE3po@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Mon, 14 Feb 2011 17:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Tom, if you are still taking requests.

A collegue asked whether it would also be possible to add
neek/minimal/minimal-image to the test set
(console-image for it failed on a QA issue last time I tried it).

Best regards, Frans


