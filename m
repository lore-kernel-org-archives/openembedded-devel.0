Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NX8SS-0005bB-Tb
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 08:25:04 +0100
Received: by gxk27 with SMTP id 27so3340385gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 23:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=eDVBUoCjNqs0DHsanPj+scsl3o0qxqQnVZ9sKnXb4Rw=;
	b=lpoRe57RYQqgxAbfr11NZJNmVPUOKZ9XaGwLCK5J96pcIsjz+Ui9zZeBSVPn9UJt6e
	E5bV3mf5RTAJHR+ZBbDq88G9/0v3d8/0PS5h2XzdfSmnJTu/VzP9OytMgAPsZkO2rVQq
	N8lCStgXy3qCkknPS8JI1uTJSKYdxaj0CU/1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=T09g2XAUDOv1hbx4eGZrYlmvuZhUYog+DT3gva03dMe0UDUmkX+lm9akMaDmgdmjVn
	Aw4OvaJbm4a9zxy4CXsOeF71Bqi6pQ7/IZYka6IcUCzAiSI0TDtoCet+nBUSjktj4J1r
	Azp9kNojSWZXG/YtmCldyucDKnUBMPgmFP1tQ=
MIME-Version: 1.0
Received: by 10.100.220.6 with SMTP id s6mr10904993ang.140.1263885765324; Mon, 
	18 Jan 2010 23:22:45 -0800 (PST)
In-Reply-To: <4B54F75F.9030005@atmel.com>
References: <4B54F75F.9030005@atmel.com>
Date: Tue, 19 Jan 2010 08:22:45 +0100
Message-ID: <ac9c93b11001182322s22a265b8xe206298af0c387c4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting a cursor
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
X-List-Received-Date: Tue, 19 Jan 2010 07:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/19 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> Anyone got an idea how to get a cursor as default?
> Googling, I have seen that /usr/share/icons/xcursor-transparent/cursors
> all point at a transparent cursor abd that I can generate new cursors
> using xcursorgen.
> I guess I can also copy some cursors from a desktop, but If
> I want to have cursor on by default, is there a magic setting somewhere?

I suggest you take your question to e.g. an X11 mailing list.
This is not OE development related.

Thank you.

Frans


