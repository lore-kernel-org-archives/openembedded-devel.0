Received: from mail-yx0-f179.google.com ([209.85.210.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NgDk6-00017x-H3
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 09:52:50 +0100
Received: by yxe9 with SMTP id 9so254136yxe.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=v+4p5XHfTdmqvnJiOgmchZUmgw3HLx9w2/JHF3sKUtg=;
	b=xVmbLOw69/TOk+rL4xUJhsAVKWkBAjBlAgZAblrScAkarQBL1SG5kkIMsbuCcW3SeP
	XSvOtbTsp5xPFCxbBCvMf8TNUFI1YxBGmTt5EfhunmxGgfd19qVncynN7nnWrAm7i7dR
	4MSEbEFF+6zqumevPyTLLOCyMGCVtVCc+GB8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KpBzuxUKQ/I6WKKVtfxqW4s5il7NzZWDDFlLQEJLD7Hqx9ybmW3JqJOL+noRvVFBHx
	G0PreWo8dlu5TVovYeot1Nvs/lzFDDSYt40XB/i0WjS9QeoCUduJVYzcKfWm+/rR2eyb
	S50nat6qPl+owURZaSIAw1aBK0JB1foKRiEU0=
MIME-Version: 1.0
Received: by 10.150.63.15 with SMTP id l15mr921382yba.250.1266051010004; Sat, 
	13 Feb 2010 00:50:10 -0800 (PST)
In-Reply-To: <1266016196.4593.0.camel@gnutoo-desktop>
References: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
	<1266002916-32059-2-git-send-email-GNUtoo@no-log.org>
	<ac9c93b11002121353p3aeb67dbofddccc27e3368408@mail.gmail.com>
	<1266016196.4593.0.camel@gnutoo-desktop>
Date: Sat, 13 Feb 2010 09:50:09 +0100
Message-ID: <ac9c93b11002130050v4d8ef6efmece5b99d7f11c79f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.179
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] autotools.bbclass fix issue with native
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
X-List-Received-Date: Sat, 13 Feb 2010 08:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/13 GNUtoo <GNUtoo@no-log.org>:
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#TODO: needs better handling of nativ=
e
>> The hesitation mainly concerns the #TODO comment. I don't really find
>> it explanatory, personally I'd say remove the whole comment.
> Ok I'll remove the comment.

Well perhaps others have a different meaning on it :-)
another option is to make the comment somewhat more explanatory.

Frans.

PS: thanks for the eeepc patch, will be trying it this weekend.


