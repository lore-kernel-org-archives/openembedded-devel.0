Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LahTx-0007WS-9t
	for openembedded-devel@openembedded.org; Sat, 21 Feb 2009 03:20:45 +0100
Received: by wf-out-1314.google.com with SMTP id 25so1220426wfc.6
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Feb 2009 18:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=dlekWnUpMixDfciuoXCemKSLpUXcB8dcgIZIulRzt1Y=;
	b=AQct8/zOAnvAyRbfoM79bLPDvfqEpXUw+cpjaDaRzVxr4x0bf+vBqX7bVidA03Mm8z
	j1/GZAQdu/O9i3P2Q+YoRZZD0p0h2wnCr2ciCjf+64ZAXfFmz0be7YFX8q2pPH/GPADs
	gUZc8XKmgj8LoMB9XhJKivM4cS7AkzKJnMUHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=tsoxHGkBUt7zBDX2zE2IjXxXqjNYgDM+fErSh1dzcHTlXQ32b9itrKHO+Vq4b6/H5E
	d9N8u8QDVrvcdDPeR0ff2QwoK6J7zIdFG0gPTW15txvBuENYb9L/QcZQnY+C9RTHd/U9
	+Z7VQrpaKaA8qeivnrVXncewvnQz6kJ4NbAD4=
MIME-Version: 1.0
Received: by 10.142.180.20 with SMTP id c20mr707625wff.129.1235182693688; Fri, 
	20 Feb 2009 18:18:13 -0800 (PST)
Date: Fri, 20 Feb 2009 18:18:13 -0800
Message-ID: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Subject: Documentation/User Manual questions
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
X-List-Received-Date: Sat, 21 Feb 2009 02:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

In my quest to learn how OE works, I've been reading the Wiki and the
User Manual a lot. I have a few questions to ask.

1: Why is the user manual on a separate branch instead of simply being
part of the org.openembedded.dev branch?

Speaking as a newbie, it would have been nice to have gotten the user
manual automagically when I cloned the git repo. It took me a couple
of weeks to discover where it's source was located since I am also
learning git at the same time. Speaking as developer, having the
documentation as close to the source as possible gives it more
visibility and tends to increase the likelihood of it being kept up to
date.

2: Was the documentation branch really last updated on May 9, 2008? Is
there a newer branch I have not yet discovered?

3: There is a ton of information in the Wiki, but finding what one
needs can be rather tedious if not difficult. Is there any chance of
pulling information from the Wiki into the user manual?

The format of a user manual can make finding information so much more
efficient. A table of contents and a good index can make a newbies
life so much easier.

I would love to step up and take on some of this. My knowledge of OE
is quite limited at the moment, but with some review from the gurus
out there, I think I can remedy that.

Thanks for your time.

Ted Roth


