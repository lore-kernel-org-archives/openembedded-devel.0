Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id A101A60C19
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:55:22 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so3124269igd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pXWuuPIsEAHJHwPmQERLXJzMT53OToo0muE8v3q4sF0=;
	b=zNnQjjei+/qXSQOO2zsBMUcrEr8Y6PvVOH13IaPvsGG4UITRCFksKNWaKh2jQTvYpp
	pCzwIrDsVLWmPY5DhyBZazRCGYi+VoMX1R8NKxIUucaL885eF8507EXp0eJB6eD18OU0
	DVZcFxOuOoXRrcnLxlYhszQjRCMcukVENSpHfU2yJFZ19toUCfzBj/gL9xo5K9n8oazz
	7gUCPOLzjkwglQOt3FfFQaUV6XJlNK/1tR5X4ML5oxn4WEAXuzSUq6PFg2bjiszoXRI8
	RduiFq/9RCkNj/+p4015FSuvOD3oz4wI3kF3z8cVqs+xLbMrommEL7+CDcvV3fFbBZNB
	TLjQ==
MIME-Version: 1.0
X-Received: by 10.43.154.145 with SMTP id le17mr4798105icc.20.1406879724113;
	Fri, 01 Aug 2014 00:55:24 -0700 (PDT)
Received: by 10.107.9.214 with HTTP; Fri, 1 Aug 2014 00:55:24 -0700 (PDT)
Date: Fri, 1 Aug 2014 16:55:24 +0900
Message-ID: <CALYKT1jXkq-Ci_gpLs4v4rn50P6UsVRQUL7pO2BrWd9V-==eaA@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [boost]How can I develop a daemon which depends on boost?
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
X-List-Received-Date: Fri, 01 Aug 2014 07:55:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi list,

I just submitted a question about how to include boost. Now I'd like to ask
another question - How can I develop a daemon which depends on boost?

I believe firstly, I need to make boost be included into my binary image.
Secondly I believe that I need to develop a daemon which compiles with
boost library. Then how can I compile this daemon with boost library? The
boost library doesn't exist when the compile is executed.

Thank you very much in advance! *^^*

Journeyer
----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

