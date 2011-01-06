Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PazAv-0003sy-9Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 00:23:21 +0100
Received: by wwi18 with SMTP id 18so17632470wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 15:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vPm1i3TdQR5wH+3PtlXK0dEp5suN8bFLiCshJL9wZMc=;
	b=qoUytJZ3IqtXSUoiz0EXSRZU0imqCN3UD1CLkTUjt6lNB5nqvYG1L+d2cd3loXTEuv
	LkOX+4mFh7AbPv8wspAo/tDy9ded+EH9EipvPKW5GEsxxrhDcXLT17UBSC54gWIwukyU
	wfez6RPghXbOZTSYxK9fg15ivbYMqAazeNNn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JQ/4JrowuaVa/IpOg3kjzJ8GOF2REfagGm33s7jHsmmaWSd6Xs6PLDPkQPMCIbdgKr
	Qr3JzjfIUaTSj+CgPCl33DlDbghJyGK7vW8SpaGpSamgXJvAPF40NXyKvSchRB+f6d53
	4BFJLaBkFfoJ8r7jD+4vBovSz8Ye15bIDSRlY=
MIME-Version: 1.0
Received: by 10.216.177.9 with SMTP id c9mr24885393wem.34.1294356175726; Thu,
	06 Jan 2011 15:22:55 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 6 Jan 2011 15:22:55 -0800 (PST)
Date: Thu, 6 Jan 2011 18:22:55 -0500
Message-ID: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: testing branch 2011-01-06
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
X-List-Received-Date: Thu, 06 Jan 2011 23:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

master has been merged to testing-next and is ready for clean builds.

There are only 7 combinations listed as passing.  If anyone has data
that is not entered, I'll check back tomorrow morning before I create
the tag.

For more information on OpenEmbedded testing, see:

http://www.openembedded.org/index.php/Testing

We have lost some momentum with testing, so it would be nice to pick
up this effort again (speaking to myself first).  I just ordered a 2TB
drive, so hopefully that will give me the capacity to do some more
builds.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


