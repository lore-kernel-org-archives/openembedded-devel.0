Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 81AA465D00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 08:21:50 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so2333986igq.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pjcaWFQuRPH1w8CXEsait0rD/Jbt1dO3ia85tS+wk1Q=;
	b=zeFeWTvqUrg4Y3wYY6JKIgZHBqZfYW9R+2RFjkyqFDU7UZ4CROe4W35G5mbNmJPGFV
	tXQmcf//mqNvGccYGYVyvybERXi6Nn+UiCqr4DojHLvbfNFUDyFN3whrLPS7YZkxISK9
	BaAvamRYsvzbBEc9tIMjMG7kcKILirJcIG2wxmds8/JEVYB//bYAc5dfnWj7e9vWL6qC
	PIh4CafjLka46AGzIKLQy4X4FUp42aUhxUPKgchVsZIxeGW/5az5v6v19j7yGAnbUpI3
	BTZedxATdCQTqTVRDnR3P1/hP3pEvfB1mwm705+wk206Fxb60NW7XH4ZJRTYpkVJIx9d
	sn0Q==
MIME-Version: 1.0
X-Received: by 10.50.66.203 with SMTP id h11mr8214183igt.49.1397377311970;
	Sun, 13 Apr 2014 01:21:51 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Sun, 13 Apr 2014 01:21:51 -0700 (PDT)
Date: Sun, 13 Apr 2014 17:21:51 +0900
Message-ID: <CALYKT1ja5AtU45KxEXqZSvFiwfUDZpT5539zzoWs1=wh7c89Tw@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How can I place gdbserver in my target system?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Apr 2014 08:21:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I want to debug my application on target embedded system using cross gdb.
To do this I learned that I need to place a proper gdbserver in my target
system.

My target system runs by oe-core.
Then how can I prepare gdbserver for my target?

And also I'd like to know how can I get a proper cross toolchain for using
cross gdb for oe-core system.

Now what I have is only general arm cross toolchain. And I believe this
toolchain is not proper for oe-core system.
oe-core uses not a cross build system - It's built under some kind of
sandbox environment. This makes some difficulties for me.

Previously I've asked a question - how can I use gdb in oe?. I raised new
question because this time I need to know about how to install gdbserver.

Thank you Brian Hutchinson, Mats K=E4rrman for the previous answers.
Thank you for someone who might answer me in advance.

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

