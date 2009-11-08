Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1N7FkW-00077r-MY
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 22:56:43 +0100
Received: by pwj11 with SMTP id 11so647598pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 13:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=W6bx9Stf9CqkUjwWjzYfMGlPhDkZd5z5k1qFYdSsw0o=;
	b=RPm736vbhGuhEz5ockjXZOp+TYsR6ES0S/yqIOMYhBIwb9ikapGwXWIoX1UswUZCJG
	Q336yTfybcyV3TN1XFlvZ5KoPWYsZTkDdGshL4erVOCUWCppjffXDtJWCYF8N6DRi3Ex
	TPmDcOnIxH8547yLqSs1Fruscx9UdP38sfBm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WaCUitq+N9Rr5KqRpA/nxf2PjAfjFRsEaf8PW28DzpkKucxHKu3yy1CBdP8gDtBSZf
	sdFSdIz61CJ8WJ9M4s6ph8TpOMbtmJ2uyKGqyL06CxRm5Ih/gIJxdIbMeH2HUfDBLUsj
	NslUMsGBP4Wdlo2zCHUPUprpTzh+pd8xfoFXE=
MIME-Version: 1.0
Received: by 10.142.202.9 with SMTP id z9mr722077wff.34.1257715906582; Sun, 08 
	Nov 2009 13:31:46 -0800 (PST)
In-Reply-To: <hd6opq$ke8$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org> <1257682982.26962.14.camel@opal>
	<hd6ggj$tf3$1@ger.gmane.org>
	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
	<be7a9f3d0911080655o4eff671cnaf59a134e7a97ac5@mail.gmail.com>
	<hd6opq$ke8$1@ger.gmane.org>
Date: Mon, 9 Nov 2009 08:01:46 +1030
Message-ID: <6ec4247d0911081331h5bc3d7bcg881ab92d4b4c2136@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 21:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm with you on this one, Koen. Changing a versioned tarball is just
dumb - it goes against common sense and long standing convention in
release engineering.

As for choosing the 3.32 version, who's to say they won't add a bugfix
and update that tarball too?

-Graham


