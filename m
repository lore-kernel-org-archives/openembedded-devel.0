Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E472B6C008
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 09:48:17 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ha12so1044400vcb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=CovPqQdFo8BHheVG1gJifMohnL++rWp54hmsFjUT6j4=;
	b=BwgXa84+Htrumx36b6gJaNi4LPewydJON4C3RZma7U4fC0RmFz3DcBl48OWqpMl7jE
	2ulVx1nvZhiIXuexJFjAREpbKb5d1yIVpu5ZYi497Df1BxJIdr4//dysO73BbSSKJeKU
	z7gHVcdtrE12hrR+Tqt/+fL7ZEWixC/cvNr8v+OM5B0oYp49cjeWIT93wyOgiEdWgQow
	+E2698+3sdyi3xTmd8LjCL+UrUI0IObIHs8Sxzyzo6u+NXittsmjH8aBIXHixUlEHwNK
	sIRds1L7jFd1i7JpY0Q2JwDDcYvIJQcXQhYQ/F37Yo21295eUWGUt4+ufHNsY0CNG1Rg
	9AmA==
MIME-Version: 1.0
X-Received: by 10.52.161.231 with SMTP id xv7mr9219478vdb.1.1379756898995;
	Sat, 21 Sep 2013 02:48:18 -0700 (PDT)
Received: by 10.52.236.129 with HTTP; Sat, 21 Sep 2013 02:48:18 -0700 (PDT)
Date: Sat, 21 Sep 2013 11:48:18 +0200
Message-ID: <CALbNGRQfsVkphr3RCB9taJ1B5V3B88ZYDexMT9zOZ7vdFNrydQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Angstrom mailserver down?
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
X-List-Received-Date: Sat, 21 Sep 2013 09:48:18 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

yesterday I sent two patches to angstrom-devel. Today I get:

This is an automatically generated Delivery Status Notification

THIS IS A WARNING MESSAGE ONLY.

YOU DO NOT NEED TO RESEND YOUR MESSAGE.

Delivery to the following recipient has been delayed:

     angstrom-distro-devel@linuxtogo.org

Message will be retried for 2 more day(s)

Technical details of temporary failure:
The recipient server did not accept our requests to connect. Learn
more at http://support.google.com/mail/bin/answer.py?answer=7720
[(10) mail.linuxtogo.org. [188.40.83.200]:25: Connection refused]

The mail was sent from a newly installed system so I am not quite sure
if it is a problem on my side or on mail server side. Could somebody
please check?

Andreas

